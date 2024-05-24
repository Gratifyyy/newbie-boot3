package com.newbie.controller.system;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.newbie.common.domain.entity.SysLogLogin;
import com.newbie.common.util.R;
import com.newbie.common.util.SecurityUtils;
import com.newbie.system.service.SysLogLoginService;
import lombok.RequiredArgsConstructor;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Email 398698424@qq.com
 * @Date: 2024/5/24 上午10:36
 * @Descriptions: 登录日志控制器
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/system/log/login")
public class SysLogLoginController {
    private final SysLogLoginService sysLogLoginService;

    @SaCheckPermission("sys.log.login")
    @GetMapping("/paging")
    public R<IPage<SysLogLogin>> paging(Page<SysLogLogin> page, SysLogLogin sysLogLogin) {
        String username = sysLogLogin.getUsername();
        String status = sysLogLogin.getStatus();
        Page<SysLogLogin> pageData = sysLogLoginService.lambdaQuery()
                .like(StringUtils.hasLength(username),SysLogLogin::getUsername,username)
                .eq(StringUtils.hasLength(status),SysLogLogin::getStatus,status)
                .orderByDesc(SysLogLogin::getCreateTime)
                .page(page);
        return R.ok(pageData);
    }

    @GetMapping("/pagingByCurrUser")
    public R<IPage<SysLogLogin>> pagingByCurrUser(Page<SysLogLogin> page, SysLogLogin sysLogLogin) {
        String username = SecurityUtils.getCurrentLoginUser().getUsername();
        String status = sysLogLogin.getStatus();
        Page<SysLogLogin> pageData = sysLogLoginService.lambdaQuery()
                .eq(StringUtils.hasLength(username),SysLogLogin::getUsername,username)
                .eq(StringUtils.hasLength(status),SysLogLogin::getStatus,status)
                .orderByDesc(SysLogLogin::getCreateTime)
                .page(page);
        return R.ok(pageData);
    }


    @SaCheckPermission("sys.log.login.del")
    @PostMapping("/deleteBatch")
    public R<Object> deleteBatch(@RequestBody Long[] ids) {
        if (ids == null || ids.length == 0) return R.error("日志ID为空");
        sysLogLoginService.removeBatchByIds(Arrays.asList(ids));
        return R.ok().setMsg("删除成功");
    }

    @SaCheckPermission("sys.log.login.del")
    @GetMapping("/deleteBeforeData")
    public R<Object> deleteBeforeData(Integer i) {

        long l = System.currentTimeMillis();
        long j = 1000L * 60 * 60 * 24 * i;

        LambdaQueryWrapper<SysLogLogin> wrapper = new LambdaQueryWrapper<SysLogLogin>()
                .lt(SysLogLogin::getCreateTime, new Date(l-j));
        sysLogLoginService.remove(wrapper);
        return R.ok().setMsg("清除成功");
    }

}
