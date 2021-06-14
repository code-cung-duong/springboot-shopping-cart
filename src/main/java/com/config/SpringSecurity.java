package com.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.InMemoryTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.service.impl.CustomUserDetailService;

@Configuration
@EnableWebSecurity
public class SpringSecurity extends WebSecurityConfigurerAdapter {
	@Autowired
	private CustomUserDetailService userDetailService;

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		return bCryptPasswordEncoder;
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailService).passwordEncoder(passwordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests().antMatchers("/admin/**").hasAnyRole("ADMIN")
				.antMatchers("/cart**", "/checkout**").authenticated().anyRequest().permitAll();
		http.authorizeRequests().and().formLogin().loginProcessingUrl("/j_spring_security_check").loginPage("/login")
				.defaultSuccessUrl("/home").failureUrl("/login?error=true").usernameParameter("j_username")
				.passwordParameter("j_password").and().logout().logoutUrl("/logout").logoutSuccessUrl("/login");
		http.exceptionHandling().accessDeniedPage("/error_access");
		http.formLogin().successHandler(new AuthenticationSuccessHandler() {

			@Override
			public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
					Authentication authentication) throws IOException, ServletException {
				if (authentication.getAuthorities().toString().contains("ROLE_ADMIN")) {
					response.sendRedirect("/admin/home");
				} else {
					response.sendRedirect("/home");
				}

			}
		});

		http.authorizeRequests().and().rememberMe().tokenRepository(this.persistentTokenRepository())
				.tokenValiditySeconds(10 * 60);

	}

	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		InMemoryTokenRepositoryImpl inMemoryTokenRepositoryImpl = new InMemoryTokenRepositoryImpl();
		return inMemoryTokenRepositoryImpl;
	}
}