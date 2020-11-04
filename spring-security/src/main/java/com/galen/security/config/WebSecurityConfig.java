package com.galen.security.config;

import com.galen.security.interceptor.MyAccessDecisionManager;
import com.galen.security.interceptor.MyFilterInvocationSecurityMetadataSource;
import com.galen.security.interceptor.handler.*;
import com.galen.security.service.impl.UserSecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.ObjectPostProcessor;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsUtils;


/**
 * @Author: Galen
 * @Date: 2019/3/27-14:43
 * @Description: spring-security权限管理的核心配置
 **/
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserSecurityService userSecurityService;
    @Autowired
    private MyFilterInvocationSecurityMetadataSource filterMetadataSource; //权限过滤器
    @Autowired
    private MyAccessDecisionManager myAccessDecisionManager;//权限决策器
    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /**
     * @Author: Galen
     * @Description: 配置userDetails的数据源，密码加密格式
     * @Date: 2019/3/28-9:24
     * @Param: [auth]
     * @return: void
     **/
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userSecurityService)
                .passwordEncoder(passwordEncoder());// 实现自定义登录校验
    }

    /**
     * @Author: Galen
     * @Description: 配置放行的资源
     * @Date: 2019/3/28-9:23
     * @Param: [web]
     * @return: void
     **/
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers( "/index.html", "/static/**", "/login", "/login_p", "/favicon.ico")
                .antMatchers("/**").access("hasRole('ROLE_USER')")
                // 给 swagger 放行；不需要权限能访问的资源
                .antMatchers("/swagger-ui.html", "/swagger-resources/**", "/images/**", "/webjars/**", "/v2/api-docs", "/configuration/ui", "/configuration/security");
    }

    /**
     * @Author: Galen
     * @Description: 拦截配置
     * @Date: 2019/4/4-10:44
     * @Param: [http]
     * @return: void
     **/
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                // 使其支持跨域
                .requestMatchers(CorsUtils :: isPreFlightRequest).permitAll()
                // 其他路径需要授权访问
                .anyRequest().authenticated()
                .withObjectPostProcessor(new ObjectPostProcessor<FilterSecurityInterceptor>() {
                    @Override
                    public <O extends FilterSecurityInterceptor> O postProcess(O o) {
                        o.setSecurityMetadataSource(filterMetadataSource);
                        o.setAccessDecisionManager(myAccessDecisionManager);
                        return o;
                    }
                })
                .and()
                .formLogin().loginPage("/login").loginProcessingUrl("/login")
                .usernameParameter("username").passwordParameter("password")
                .failureHandler(new MyAuthenticationFailureHandler())
                .successHandler(new MyAuthenticationSuccessHandler())
                .permitAll()
                .and()
                // 退出登录后的默认路径
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessHandler(new MyLogoutSuccessHandler())
                .permitAll()
                .and()
                .csrf().disable() //关闭csrf
                //添加自定义未授权和未登录结果返回
                .exceptionHandling()//.accessDeniedHandler(new MyAccessDeniedHandler())
                .authenticationEntryPoint(new MyAuthenticationEntryPoint());

        // 禁用缓存
        http.headers().cacheControl();
        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
    }
}