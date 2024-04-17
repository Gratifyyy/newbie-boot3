package com.newbie.security.controller;

import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.newbie.common.util.R;
import com.newbie.security.domain.Route;
import com.newbie.security.domain.body.LoginBody;
import com.newbie.security.domain.body.PasswordBody;
import com.newbie.security.domain.vo.LoginUserVO;
import com.newbie.security.service.SecurityService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @Author: ZhangYuGe
 * @Date: 2024/4/16 11:30
 * @Descriptions: 安全控制
 */
@RestController
@RequestMapping("/security")
@RequiredArgsConstructor
public class SecurityController {

    private final SecurityService securityService;

    @PostMapping("/initAdmin")
    public R<Object> initAdmin(@RequestBody PasswordBody passwordBody) {
        securityService.initAdmin(passwordBody);
        return R.ok();
    }

    @PostMapping("/login")
    public R<SaTokenInfo> login(@RequestBody LoginBody loginBody) {
        return R.ok(securityService.login(loginBody));
    }

    @PostMapping("/logout")
    public R<Object> logout() {
        StpUtil.logout();
        return R.ok();
    }

    @GetMapping("/userInfo")
    public R<Object> userInfo() {
        JSONObject jsonObject = (JSONObject) StpUtil.getExtra("user");
        return R.ok(JSONUtil.toBean(jsonObject,LoginUserVO.class));
    }

    @PostMapping("/updatePassword")
    public R<Object> updatePassword(@RequestBody PasswordBody passwordBody) {
        securityService.updatePassword(passwordBody);
        return R.ok();
    }

    @GetMapping("/menus")
    public R<List<Route>> menus() {
        return R.ok(securityService.getMenuList());
    }

}
