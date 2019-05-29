package com.dgq.register;

import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class RegisterCenterApplication {
	
	public static void main(String[] args) {
//		SpringApplication.run(RegisterCenterApplication.class, args);
		new SpringApplicationBuilder(RegisterCenterApplication.class)
		.web(WebApplicationType.SERVLET)
		.run(args);
	}
}
