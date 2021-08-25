package org.example.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        //add users for in memory authentication
        User.UserBuilder user = User.withDefaultPasswordEncoder();

        auth.inMemoryAuthentication()
                .withUser(user.username("john").password("test123").roles("EMPLOYEE"))
                .withUser(user.username("mary").password("test123").roles("EMPLOYEE", "MANAGER"))
                .withUser(user.username("susan").password("test123").roles("EMPLOYEE", "ADMIN"));

    }

}
