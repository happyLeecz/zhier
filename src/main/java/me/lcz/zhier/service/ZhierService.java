package me.lcz.zhier.service;

import me.lcz.zhier.entity.*;

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
  //like about
  AnswerLikeAbout findUserLikes(long answerId,long userId);
  void addLikes(long answerId,long userId,int type);
  void updateLikes(long answerId,long userId,int type);
  int getLikesNum(long answerId,int type);
  //follow about
     boolean follow(long userId,long followingId);
     List<ZhierUser> getFollower(long userId);
     List<ZhierUser> getFollowing(long userId);
     boolean deleteFollowInfo(long userId,long followingId);
     FollowAbout findFollowInfo(long userId,long followingId);
  //concern question about
      ConcernQuestion getConcernInfo(long userId,long questionId);
      boolean addConcernInfo(long userId,long questionId);
      boolean deleteConcernInfo(long userId,long questionId);
      List<ZhierQuestion> getConcernedQuestion(long userId);
    //answerCommentAbout
    List<AnswerComment> getAnswerComment(long answerId);
    boolean addCommentOnAnswer(long answerId,long commentUserId,String commentText);
    boolean addCommentOnComment(long answerId,long commentUserId,long commenttoUserId,String commentText);
    //report



}
