package com.dingyun.model;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import java.util.Date;

@Aspect
@Component
public class Service {

    @Pointcut("execution(* com.dingyun.service.*.*(..))")
    public void xx() {
    }

    @Around("xx()")
    public Object log(ProceedingJoinPoint joinPoint){
        Object result = null;
        try {
            System.out.println("--------------------前置增强-----------------------------");
            System.out.println("---------------------------------------------------------");
            System.out.println(new Date()+ joinPoint.getSignature().getName()+"       is do");
            result = joinPoint.proceed();
            System.out.println("------------------------后置增强---------------------------");
            System.out.println("---------------------------------------------------------");

        }catch (Throwable e){
            System.out.println("-------------------------出现异常--------------------------------");
            System.out.println("---------------------------------------------------------");
        }finally {
            System.out.println("---------------------------------------------------------");
            System.out.println("-------------执行完毕，关闭资源---------------------------");
            return result;
        }



    }

}
