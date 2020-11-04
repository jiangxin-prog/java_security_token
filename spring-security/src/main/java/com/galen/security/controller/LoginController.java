package com.galen.security.controller;

import com.galen.security.pojo.GalenResponse;
import com.galen.security.pojo.RespBean;
import com.galen.security.pojo.SecuritySysUser;

import com.galen.security.utils.ResponseUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import com.galen.security.service.impl.UserSecurityService;

import com.galen.security.utils.JwtTokenUtils;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.annotation.security.RolesAllowed;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by sang on 2017/12/29.
 */
@Api(value = "登录", tags = "登录，注销等操作")
@RestController
public class LoginController {
    @Autowired
    private UserSecurityService userSecurityService;
    @Autowired
    private JwtTokenUtils jwtTokenUtils;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @ApiOperation(value = "swagger端测试登录入口")
    @PostMapping("/login")
    public RespBean login(String username, String password) {
        SecuritySysUser userDetails = (SecuritySysUser) userSecurityService.loadUserByUsername(username);
        if (userDetails == null) {
            throw new BadCredentialsException("用户不存在");
        }
        if (!passwordEncoder.matches(password, userDetails.getPassword())) {
            throw new BadCredentialsException("密码不正确");
        }
        String token = jwtTokenUtils.createToken(userDetails.getUsername(),userDetails.getRoles().get(0).getNameEn(), false);
        System.out.println("token"+token);
        Map m1 = new HashMap();
        m1.put("token", token);
        return RespBean.ok("登录成功", m1);
    }

    @ApiOperation(value = "swagger端测试注销入口")
    @PostMapping("/logout")
    public GalenResponse logout() {
        System.out.println("注销成功!");
        return ResponseUtils.SUCCESS("注销成功!");
    }

    @ApiOperation(value = "提示跳转到登录页面")
    @GetMapping("/login_p")
    public GalenResponse loginP() {
        return ResponseUtils.invalid();
    }

    @PreAuthorize("hasAuthority('/test')")
    @GetMapping("/test")
    public GalenResponse test() {

        return ResponseUtils.build(502, "test！");
    }
}
