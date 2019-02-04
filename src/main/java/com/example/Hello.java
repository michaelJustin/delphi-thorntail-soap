package com.example;

import javax.jws.WebService;
import javax.jws.WebMethod;

@WebService(
   portName="helloPort",
   serviceName="helloService",
   targetNamespace = "http://hello.example.com/")
public class Hello {
    private final String message = "Hello, ";

    @WebMethod
    public String sayHello(String name) {
        return message + name + ".";
    }
}