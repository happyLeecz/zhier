package me.lcz.zhier.dao;

import me.lcz.zhier.entity.ZhierAnswer;

import java.util.Date;
import java.util.List;

/**
 * Created by lcz on 2017/4/8.
 */
public interface ZhierAnswerDao {

    /**
     * 添加问题回答
     * @param questionId
     * @param userId
     * @param answerText
     */
    int addAnswer(long questionId,long userId,String answerText);

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
    int updateAnswer(long answerId,String newAnswerText,Date updateTime);

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
    List<ZhierAnswer> queryAllByUser(long userId);

    /**
     * 根据回答Id查出回答
     * @param answerId
     * @return
     */
    ZhierAnswer queryByAnswerId(long answerId);

}
