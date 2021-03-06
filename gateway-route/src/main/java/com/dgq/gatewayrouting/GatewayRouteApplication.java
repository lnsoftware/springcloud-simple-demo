package com.dgq.gatewayrouting;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpMethod;

import com.netflix.hystrix.HystrixCollapserProperties.Setter;
import com.netflix.hystrix.HystrixCommandProperties;

import reactor.core.publisher.Mono;

@SpringBootApplication
@EnableDiscoveryClient
public class GatewayRouteApplication {

	public static void main(String[] args) {
		SpringApplication.run(GatewayRouteApplication.class, args);
	}
	
	
	/**
	 * @Description: 编程的方式配置route
	 * @param @param rlBuilder
	 * @param @return    参数
	 * @return RouteLocator    返回类型
	 * @throws
	 */
//	@Bean
	public RouteLocator  customRouteLocator(RouteLocatorBuilder rlBuilder) {
		
		ZonedDateTime starTime = ZonedDateTime.of(LocalDateTime.now(), ZoneId.systemDefault());
		ZonedDateTime endTime =ZonedDateTime.of(LocalDateTime.now().plusMinutes(1L), ZoneId.systemDefault());
		return rlBuilder.routes()
				/**
				 * 1、将这种path：/user-api/** 的请求都路由到: user-manager
				 * 2、比如请求地址是：/user-api/user/list 会被路由到：/user/list
				 * 3、starTime - endTime时间段内才会路由，其他时间不路由
				 */
				.route("user-manager-route", 
					r->r.order(2)
//					.before(ZonedDateTime.of(LocalDateTime.now().plusMinutes(2l), ZoneId.systemDefault())).and()
//					.after(ZonedDateTime.of(LocalDateTime.now().plusMinutes(3l), ZoneId.systemDefault())).and()
//					.between(starTime, endTime).and() //Between Route
					.header("brain", "dgq").and() //Header Route
					.cookie("jsession", "1234567").and() //Cookie Route
					.method(HttpMethod.GET).and() //Method Route
					.query("name").and() //Query Route
//					.remoteAddr(resolver, addrs) //在gateway位于一些代理层后面时，可以自定义RemoteAddressResolver来实现对remote的路由
//					.path("/userapi/{a}/{b}") //Path Route
					.path("/userapi/**") //Path Route
					.filters(f->f.stripPrefix(1)
//								.setPath("/{a}/{b}")
//								.setStatus(HttpStatus.BAD_GATEWAY)
//								.addRequestParameter("name", "dgq")
								.addResponseHeader("rude", "Yes")
//								.hystrix(c-> c.setName("Hystrix")
//										.setFallbackUri("forward:/fallback"))
//								.rewritePath("/**", "/user/getSearchPathsList")
							)
					.uri("lb://user-manager")
				)
				.build();
	}
	
	@Bean
	@Order(-1)
	public GlobalFilter globalFilter1() {
		System.out.println("first pre filter----------------------------------");
		return (exchange, chain) ->{
			return chain.filter(exchange).then(Mono.fromRunnable(()->{
				System.out.println("first post filter--------------------------------------------");
			}));
		};
	}
	
	@Bean
	@Order(0)
	public GlobalFilter globalFilter2() {
		System.out.println("second pre filter----------------------------------");
		return (exchange, chain) ->{
			return chain.filter(exchange).then(Mono.fromRunnable(()->{
				System.out.println("second post filter--------------------------------------------");
			}));
		};
	}
	
	@Bean
	@Order(1)
	public GlobalFilter globalFilter3() {
		System.out.println("third pre filter----------------------------------");
		return (exchange, chain) ->{
			return chain.filter(exchange).then(Mono.fromRunnable(()->{
				System.out.println("third post filter--------------------------------------------");
			}));
		};
	}
}
