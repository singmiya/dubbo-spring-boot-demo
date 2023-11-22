package com.singsmiya.provider;

import com.singsmiya.interfaca.DemoService;
import org.apache.dubbo.config.annotation.DubboService;

/**
 * @author singsmiya
 * @date 2023/11/13 22:54
 */
@DubboService
public class DemoServiceImpl implements DemoService {
    @Override
    public String sayHello(String name) {
        return "Hello " + name;
    }
}
