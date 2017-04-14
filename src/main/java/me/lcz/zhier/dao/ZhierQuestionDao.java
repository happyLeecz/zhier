package me.lcz.zhier.dao;

import me.lcz.zhier.entity.ZhierQuestion;

import java.util.Date;
import java.util.List;

/**
 * Created by lcz on 2017/4/6.
 */
public interface ZhierQuestionDao {
 /**
  * 创建问题
  * @param createByWho
  * @param questionTag
  * @param questionText
     * @return
     */
 int createQuestion(long createByWho,String questionTag,String questionText);

 /**
  * 删除问题
  * @param questionId
     */
 int deleteQuestion(long questionId);

 /**
  * 通过id查找问题
  * @param questionId
  * @return
     */
 ZhierQuestion queryById(long questionId);

 /**
  * 通过用户查找该用户创建的问题
  * @param userId
  * @return
     */
 List<ZhierQuestion> queryAllByUser(long userId);

 /**
  * 更新问题
  * @param questionId
  * @param newQuestionText
     */

 int updateQuestion(long questionId,String newQuestionText,Date updateTime);

 /**
  * 根据标签查找问题
  * @param tagName
  * @return
     */
 List<ZhierQuestion> queryAllByTag(String tagName);

 /**
  * 查出所有问题
  * @return
     */
 List<ZhierQuestion> queryAll();

}
