package com.newbie.security.service.impl;

import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import com.newbie.common.constant.SecurityConstant;
import com.newbie.common.domain.LoginUser;
import com.newbie.common.domain.entity.SysDept;
import com.newbie.common.domain.entity.SysMenu;
import com.newbie.common.domain.entity.SysRole;
import com.newbie.common.domain.entity.SysUser;
import com.newbie.common.enums.CommonStatusEnum;
import com.newbie.common.exception.NewbieException;
import com.newbie.common.util.SecurityUtils;
import com.newbie.common.util.TreeUtils;
import com.newbie.security.domain.Route;
import com.newbie.security.domain.RouteMeta;
import com.newbie.security.domain.body.LoginBody;
import com.newbie.security.domain.body.PasswordBody;
import com.newbie.security.mapper.SecurityMapper;
import com.newbie.security.service.CaptchaService;
import com.newbie.security.service.SecurityService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/4/16 15:35
 * @Descriptions: unknown
 */
@Service
@RequiredArgsConstructor
public class SecurityServiceImpl implements SecurityService {
    private final SecurityMapper securityMapper;
    private final CaptchaService captchaService;


    @Override
    public SaTokenInfo login(LoginBody loginBody) {
        // 校验参数
        this.verifyLoginBody(loginBody);

        // 解码
        loginBody.setUtext(new String(Base64.getDecoder().decode(loginBody.getUtext())));
        loginBody.setPtext(new String(Base64.getDecoder().decode(loginBody.getPtext())));

        // 检验验证码
        if (!captchaService.verify(loginBody.getCheckCodeKey(), loginBody.getCheckCode()))
            throw new NewbieException("验证码不正确");

        // 根据username查询用户
        SysUser sysUser = securityMapper.selectUserByUsername(loginBody.getUtext());

        if (sysUser == null) throw new NewbieException("用户不存在");

        // 验证密码
        if (!SecurityUtils.checkPassword(loginBody.getPtext(), sysUser.getPassword()))
            throw new NewbieException("密码错误");

        // 是否禁用
        if (CommonStatusEnum.isDisabled(sysUser.getStatus())) {
            throw new NewbieException("用户被禁用，请联系管理员");
        }

        // 密码隐藏
        sysUser.setPassword(null);

        // 构建登录数据
        LoginUser loginUser = this.builderLoginUser(sysUser);
        // 登录
        return SecurityUtils.login(loginUser, loginBody.getTokenTimeout());
    }

    private LoginUser builderLoginUser(SysUser sysUser) {
        LoginUser loginUser = new LoginUser();
        BeanUtils.copyProperties(sysUser, loginUser);

        // 根据用户ID查询角色列表
        List<SysRole> roleList = securityMapper.selectRoleListByUserId(loginUser.getId());
        loginUser.setRoleList(roleList);
        // 根据部门ID获取部门信息
        if (loginUser.getDeptId() != null) {
            SysDept sysDept = securityMapper.selectDeptByDeptId(loginUser.getDeptId());
            loginUser.setDept(sysDept);
        }


        // 角色代码列表和权限标识列表
        if (SecurityConstant.ADMIN_USER_NAME.equals(loginUser.getUsername())) {
            List<String> all = new ArrayList<>();
            all.add("*");
            loginUser.setRoles(all);
            loginUser.setPerms(all);
        } else {
            loginUser.setRoles(roleList.stream().map(SysRole::getRoleCode).toList());
            loginUser.setPerms(this.getPermissions(loginUser.getId()));
        }

        return loginUser;
    }

    private List<String> getPermissions(String userId) {
        List<SysMenu> menuList = securityMapper.selectMenuListByUserId(userId, null);
        return menuList.stream()
                .map(SysMenu::getPerm)
                .filter(StringUtils::hasLength)
                .toList();
    }

    private List<String> getRoleCodes(String userId) {
        List<SysRole> roleList = securityMapper.selectRoleListByUserId(userId);
        return roleList.stream().map(SysRole::getRoleCode).toList();
    }


    @Override
    @Transactional
    public void initAdmin(PasswordBody passwordBody) {
        // 校验参数
        this.verifyPasswordBogy(passwordBody);

        if (securityMapper.selectUserByUsername(SecurityConstant.ADMIN_USER_NAME) != null)
            throw new NewbieException("系统管理员已存在");

        SysUser sysUser = new SysUser();
        sysUser.setUsername(SecurityConstant.ADMIN_USER_NAME);
        sysUser.setNickName("系统管理员");
        String password = new String(Base64.getDecoder().decode(passwordBody.getNtext()));
        sysUser.setPassword(SecurityUtils.encodePassword(password));
        if (securityMapper.insertAdminUser(sysUser) != 1) throw new NewbieException("初始化系统管理员失败");
    }

    @Override
    public List<Route> getMenuList() {
        LoginUser loginUser = SecurityUtils.getCurrentLoginUser();
        List<SysMenu> menuList;
        if (loginUser.isAdmin()) {
            // 获取所有菜单
            menuList = securityMapper.selectMenuAll();
        } else {
            // 根据用户id获取菜单
            menuList = securityMapper.selectMenuListByUserId(loginUser.getId(), "1");
        }
        if (CollectionUtils.isEmpty(menuList)) {
            return new ArrayList<>();
        }
        return this.routeBuilder(menuList);
    }

    @Override
    @Transactional
    public void updatePassword(PasswordBody passwordBody) {
        if (!StringUtils.hasLength(passwordBody.getOtext())) throw new NewbieException("旧密码不能为空");
        this.verifyPasswordBogy(passwordBody);
        String userId = StpUtil.getLoginIdAsString();
        SysUser sysUser = securityMapper.selectUserByUserId(userId);

        String oText = new String(Base64.getDecoder().decode(passwordBody.getOtext()));
        String nText = new String(Base64.getDecoder().decode(passwordBody.getNtext()));

        if (!SecurityUtils.checkPassword(oText, sysUser.getPassword()))
            throw new NewbieException("旧密码不正确");
        String newPassword = SecurityUtils.encodePassword(nText);
        sysUser.setPassword(newPassword);
        int i = securityMapper.updateUserPasswordByUserId(sysUser);
        if (i != 1) throw new NewbieException("修改密码失败");
    }


    /**
     * 构建路由
     *
     * @param menuList 菜单列表
     * @return 路由列表
     */
    private List<Route> routeBuilder(List<SysMenu> menuList) {
        List<Route> routeList = new ArrayList<>();
        menuList.forEach(m ->
                routeList.add(
                        Route
                                .builder()
                                .id(m.getId())
                                .pid(m.getParentId())
                                .path(m.getRoutePath())
                                .name(m.getRouteName())
                                .component(m.getComponent())
                                .meta(metaBuilder(m))
                                .redirect(m.getRouteRedirect())
                                .build()
                ));

        return TreeUtils.listToTree(routeList, Route::getId, Route::getPid, Route::getChildren, Route::setChildren);
    }

    /**
     * 构建路由元数据
     *
     * @param m 菜单
     * @return 路由元数据
     */
    private RouteMeta metaBuilder(SysMenu m) {
        return RouteMeta
                .builder()
                .title(m.getTitle())
                .icon(m.getIcon())
                .isHide("1".equals(m.getIsHide()))
                .hideChildren("1".equals(m.getHideChildren()))
                .iframeLink(m.getIframeLink())
                .isOuter("1".equals(m.getIsOuter()))
                .sortNo(m.getSort())
                .isKeep("1".equals(m.getIsKeep()))
                .transition(m.getTransition())
                .fixedTab("1".equals(m.getFixedTab()))
                .build();
    }

    /**
     * 校验密码参数
     *
     * @param passwordBody 密码参数
     */
    private void verifyPasswordBogy(PasswordBody passwordBody) {
        String newPassword = passwordBody.getNtext();
        String confirmPassword = passwordBody.getCtext();
        if (!StringUtils.hasLength(newPassword)) throw new NewbieException("新密码不能为空");
        if (!StringUtils.hasLength(confirmPassword)) throw new NewbieException("确认密码不能为空");
        if (!newPassword.equals(confirmPassword)) throw new NewbieException("两次密码不一致");
    }

    /**
     * 校验登录参数
     *
     * @param loginBody 登录参数
     */
    private void verifyLoginBody(LoginBody loginBody) {
        if (!StringUtils.hasLength(loginBody.getUtext())) throw new NewbieException("用户名不能为空");
        if (!StringUtils.hasLength(loginBody.getPtext())) throw new NewbieException("密码不能为空");
    }
}
