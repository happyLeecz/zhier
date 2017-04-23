package me.lcz.zhier.dao;


import me.lcz.zhier.entity.ZhierUser;
import org.apache.ibatis.annotations.Param;

/**
 * Created by lcz on 2017/4/6.
 */
public interface ZhierUserDao {

    /**
     * 增添用户
     * @param userName
     * @param password
     * @param userEmail
     * @param sex
     */
   int addUser(@Param("userName") String userName, @Param("password") String password, @Param("userEmail") String userEmail,@Param("sex") int sex);

    /**
     * 根据用户名查找用户
     * @param userName
     * @return
     */
    ZhierUser findUserByUserName(String userName);
    /**
     * 删除用户
     * @param userId
     */
    int deleteUser(long userId);

    /**
     * 通过id查找用户
     * @param userId
     * @return
     */
    ZhierUser queryUserById(long userId);
}
