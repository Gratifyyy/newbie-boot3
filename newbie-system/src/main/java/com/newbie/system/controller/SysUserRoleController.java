package com.newbie.system.controller;


import com.newbie.common.entity.SysUserRole;
import com.newbie.common.util.R;
import com.newbie.system.domain.body.SysUserRoleBody;
import com.newbie.system.service.SysUserRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/system/user_role")
@RequiredArgsConstructor
public class SysUserRoleController {
    private final SysUserRoleService sysUserRoleService;

    /**
     * 增量关联
     */
    @PostMapping("/append")
    public R<Object> append(@RequestBody SysUserRoleBody sysUserRoleBody) {
        List<SysUserRole> list = this.bodyToSysUserRole(sysUserRoleBody);
        sysUserRoleService.saveBatch(list);
        return R.ok().setMsg("关联成功");
    }

    /**
     * 批量清楚关联
     */
    @PostMapping("/cancelBatch")
    public R<Object> batchDel(@RequestBody SysUserRoleBody sysUserRoleBody) {
        List<Long> userIds = sysUserRoleBody.getUserIds();
        List<Long> roleIds = sysUserRoleBody.getRoleIds();
        if (CollectionUtils.isEmpty(roleIds) || CollectionUtils.isEmpty(userIds)) {
            return R.error("用户ID或角色ID不能为空");

        }

        if(userIds.size() == 1){
            sysUserRoleService.removeByUserIdAndRoleIds(userIds.getFirst(), roleIds);
        }else if(roleIds.size() == 1){
            sysUserRoleService.removeByRoleIdAndUserIds(roleIds.getFirst(), userIds);
        }else{
            return R.error("用户ID或角色ID不能同时大于1");
        }

        return R.ok().setMsg("取消关联成功");
    }

    private List<SysUserRole> bodyToSysUserRole(SysUserRoleBody sysUserRoleBody) {
        List<Long> userIds = sysUserRoleBody.getUserIds();
        List<Long> roleIds = sysUserRoleBody.getRoleIds();
        if (CollectionUtils.isEmpty(roleIds) || CollectionUtils.isEmpty(userIds)) {
            throw new RuntimeException("用户ID或角色ID不能为空");
        }
        if (userIds.size() > 1 && roleIds.size() > 1) {
            throw new RuntimeException("用户ID或角色ID不能同时大于1");
        }

        List<SysUserRole> list = new ArrayList<>();
        userIds.forEach(uid -> {
            roleIds.forEach(rid -> {
                SysUserRole sysUserRole = new SysUserRole();
                sysUserRole.setUserId(uid);
                sysUserRole.setRoleId(rid);
                list.add(sysUserRole);
            });
        });
        return list;
    }
}