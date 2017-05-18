package dao;

import me.lcz.zhier.dao.AnswerCommentDao;
import me.lcz.zhier.entity.AnswerComment;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lcz on 2017/5/18.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class AnswerCommentDaoTest {
@Resource
private AnswerCommentDao answerCommentDao;
    @Test
    public void queryAllComment(){
        List<AnswerComment> comments = answerCommentDao.queryAllCommentByanswerId(1);
    for(AnswerComment a : comments){
        System.out.println(a.toString());
    }
    }

}
