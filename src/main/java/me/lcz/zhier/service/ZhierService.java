package me.lcz.zhier.service;

import me.lcz.zhier.entity.QuestionAndaAnswer;
import me.lcz.zhier.entity.ZhierAnswer;
import me.lcz.zhier.entity.ZhierQuestion;
import me.lcz.zhier.entity.ZhierUser;

import java.util.List;

/**
 * Created by lcz on 2017/4/8.
 */
public interface ZhierService {
  //answer about
    List<ZhierAnswer> getAnswerByQuestion(long questionId);
    List<QuestionAndaAnswer> getAnswerByUser(long userId);
     ZhierAnswer getAnswerById(long answerId);
    boolean ifHaveAnswered(long userId, long questionId);
    boolean answer(long questionId,long userId,String userName,String answerText);
    boolean updateAnswer(long answerId,String newAnswerText);
    boolean deleteAnswer(long answerId);
    //question about
    List<ZhierQuestion> getQuestionByUser(long userId);
    ZhierQuestion getQuestionById(long questionId);
    List<ZhierQuestion> getQuestionByTag(String tagName);
    List<QuestionAndaAnswer> getAllQuestion();
    boolean raiseQuestion(long createUserId,String createUserName,String questionTag,String questionText);
  boolean deleteQuestion(long questionId);
  boolean updateQuestion(long questionId,String newQuestionText);
  List<ZhierQuestion> searchQuestion(String keyword);
    //user about
    boolean registUser(String userName,String password,String userEmail,int sex);
  boolean deleteUser(long userId);
    ZhierUser findUser(long userId);
    ZhierUser findUser(String userName);
  List<ZhierUser> findUserByKeyword(String keyword);
  boolean userIsRight(String userName,String password);
    //tag about
    void addTag(String tagName);
    List<String> findTagByKeyword(String keyword);


}
