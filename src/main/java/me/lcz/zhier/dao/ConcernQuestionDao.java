package me.lcz.zhier.dao;

import me.lcz.zhier.entity.ConcernQuestion;
import me.lcz.zhier.entity.ZhierQuestion;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by lcz on 2017/5/10.
 */
public interface ConcernQuestionDao {

    /**
     * 查找用户是否关注了相应问题
     * @param userId
     * @param questionId
     * @return
     */
    ConcernQuestion queryConcernInfo(@Param("userId") long userId,@Param("questionId") long questionId);

    /**
     * 加入关注关系
     * @param userId
     * @param questionId
     * @return
     */
    int addConcernInfo(@Param("userId")long userId,@Param("questionId")long questionId);

    /**
     * 删除关注关系
     * @param userId
     * @param questionId
     * @return
     */
    int deleteConcernInfo(@Param("userId")long userId,@Param("questionId")long questionId);

    List<ZhierQuestion> queryConcernedQuestion(long userId);

}
