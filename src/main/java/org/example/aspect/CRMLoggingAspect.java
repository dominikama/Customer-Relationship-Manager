package org.example.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

import java.util.logging.Logger;

@Aspect
@Component
public class CRMLoggingAspect {

    //setup logger
    private Logger myLogger = Logger.getLogger(getClass().getName());

    //setup pointcut
    @Pointcut("execution(* org.example.controller.*.*(..))")
    private  void  forControllerPackage() {}

    @Pointcut("execution(* org.example.service.*.*(..))")
    private  void  forServicePackage() {}

    @Pointcut("execution(* org.example.dao.*.*(..))")
    private  void  forDAOPackage() {}

    @Pointcut("forControllerPackage() || forServicePackage()" +
            "|| forDAOPackage()")
    private void appFlow(){}

    //add @Before
    @Before("appFlow()")
    public void before(JoinPoint joinPoint) {
        //display the method
        myLogger.info("Before calling: " + joinPoint.getSignature().toShortString());

        //display the arguments to the method
        Object[] args = joinPoint.getArgs();

        for (Object o : args) {
            myLogger.info("Value: " + args.toString());
        }
    }

    //add @AfterReturning

    @AfterReturning(pointcut = "appFlow()",
            returning="result")
    public  void after(JoinPoint joinPoint, Object result) {
        myLogger.info("IN AFTER: " + joinPoint.getSignature().toShortString());
        myLogger.info("VALUE: " + result);
    }
}
