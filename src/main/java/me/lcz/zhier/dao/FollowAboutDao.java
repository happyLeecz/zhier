package me.lcz.zhier.dao;

import me.lcz.zhier.entity.FollowAbout;
import me.lcz.zhier.entity.ZhierUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by lcz on 2017/5/8.
 */
public interface FollowAboutDao {
    /**
     * 查找关注该用户的人
     * @param userId
     * @return
     */
    List<ZhierUser> queryFollower(long userId);

    /**
     * 查找该用户关注的人
     * @param userId
     * @return
     */
    List<ZhierUser> queryFollowing(long userId);

    /**
     * 加入关注信息
     * @param followerId
     * @param followingId
     * @return
     */
    int  addFollowInfo(@Param("followerId") long followerId,
                       @Param("followingId") long followingId);

    /**
     * 删除关注信息
     * @param followerId
     * @param followingId
     * @return
     */
    int deleteFollowingInfo(@Param("followerId")long followerId,
                            @Param("followingId")long followingId);

    /**
     * 查找关注信息
     * @param followerId
     * @param followingId
     * @return
     */
    FollowAbout queryFollowInfo(@Param("followerId")long followerId,
                                @Param("followingId")long followingId);

}
