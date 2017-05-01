package dao;

import me.lcz.zhier.dao.ZhierQuestionDao;
import me.lcz.zhier.entity.ZhierAnswer;
import me.lcz.zhier.entity.ZhierQuestion;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lcz on 2017/4/22.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class ZhierQuestionDaoTest {
@Resource
private ZhierQuestionDao zhierQuestionDao;

    @Test
    public void raiseQuestion(){
       int a = zhierQuestionDao.createQuestion(1,"123","火焰","什么是火焰？");
        System.out.println(a);
   }
    @Test
    public void search(){
        List<ZhierQuestion> zhierQuestion = zhierQuestionDao.queryByKeyword("天王星");
        System.out.println(zhierQuestion == null);
        for (ZhierQuestion a : zhierQuestion){
            System.out.println(a.getQuestionText());
        }
    }
}
