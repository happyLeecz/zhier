package dao;

import me.lcz.zhier.dao.ZhierUserDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by lcz on 2017/4/21.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class ZhierUserDaoTest {
@Resource
    private ZhierUserDao zhierUserDao;
   @Test
    public void addUser(){
       int result= zhierUserDao.addUser("1234","1234","18698941912@163.com",1);
       System.out.println(result);
   }
}
