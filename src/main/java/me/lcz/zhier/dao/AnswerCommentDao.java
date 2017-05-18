package me.lcz.zhier.dao;

import me.lcz.zhier.entity.AnswerComment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by lcz on 2017/5/18.
 */
public interface AnswerCommentDao {

    List<AnswerComment> queryAllCommentByanswerId(@Param("answerId") long answerId);


    int insertCommentOnAnswer(@Param("answerId") long answerId,
                              @Param("userId") long userId,
                              @Param("commentText") String commentText);

    int insertCommentOncomment(@Param("answerId") long answerId,
                               @Param("commentUserId") long commentUserId,
                               @Param("commenttoUserId") long commenttoUserId,
                               @Param("commentText") String commentText);




}
