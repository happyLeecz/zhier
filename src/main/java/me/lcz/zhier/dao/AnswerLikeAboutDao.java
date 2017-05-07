package me.lcz.zhier.dao;

import me.lcz.zhier.entity.AnswerLikeAbout;
import org.apache.ibatis.annotations.Param;

/**
 * Created by lcz on 2017/5/7.
 */
public interface AnswerLikeAboutDao {
    /**
     * 查找数据
     * @param answerId
     * @param userId
     * @return
     */
    AnswerLikeAbout queryInfo(@Param("answerId") long answerId,
                              @Param("userId") long userId);

    /**
     * 查找数据数量
     * @param answerId
     * @param userId
     * @return
     */
    int queryInfoNum(@Param("answerId") long answerId,
                     @Param("type") int type);

    /**
     * 插入数据
     * @param answerId
     * @param userId
     * @param type
     * @return
     */
    int insertInfo(@Param("answerId") long answerId,
                   @Param("userId") long userId,
                   @Param("type") int type);

    /**
     * 更新数据
     * @param answerId
     * @param userId
     * @param type
     * @return
     */
    int updateInfo(@Param("answerId")long answerId,
                   @Param("userId")long userId,
                   @Param("type") int type);
}
