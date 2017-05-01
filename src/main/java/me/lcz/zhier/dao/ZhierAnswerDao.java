package me.lcz.zhier.dao;

import me.lcz.zhier.entity.QuestionAndaAnswer;
import me.lcz.zhier.entity.ZhierAnswer;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by lcz on 2017/4/8.
 */
public interface ZhierAnswerDao {

    /**
     * 添加回答
     * @param questionId
     * @param userId
     * @param userName
     * @param answerText
     * @return
     */
    int addAnswer(@Param("questionId") long questionId,
                  @Param("userId") long userId,
                  @Param("userName")String userName,
                  @Param("answerText") String answerText);

    /**
     * 删除问题回答
     * @param answerId
     */
    int deleteAnswer(long answerId);

    /**
     * 更新问题回答
     * @param answerId
     * @param newAnswerText
     */
    int updateAnswer(@Param("answerId") long answerId,
                     @Param("newAnswerText") String newAnswerText,
                     @Param("updateTime") Date updateTime);

    /**
     * 列出该问题所有的回答
     * @param questionId
     * @return
     */
    List<ZhierAnswer> queryAllByQuestion(long questionId);

    /**
     * 列出该用户所有回答
     * @param userId
     * @return
     */
    List<QuestionAndaAnswer> queryAllByUser(long userId);

    /**
     * 根据回答Id查出回答
     * @param answerId
     * @return
     */
    ZhierAnswer queryByAnswerId(long answerId);


    ZhierAnswer queryByIds(@Param("userId") long userId,@Param("questionId") long questionId);

}
