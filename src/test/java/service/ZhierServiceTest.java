package service;

import me.lcz.zhier.service.ZhierService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by lcz on 2017/4/26.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml"})
public class ZhierServiceTest {
    @Autowired
    private ZhierService zhierService;

    @Test
    public void registUser(){
        boolean result = zhierService.registUser("1","1","sadsa",1);
        System.out.println(result);
    }


}
