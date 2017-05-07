package me.lcz.zhier.service.impl;

import me.lcz.zhier.dao.*;
import me.lcz.zhier.entity.*;
import me.lcz.zhier.service.ZhierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by lcz on 2017/4/8.
 */
@Service
public class ZhierServiceImpl implements ZhierService {
    @Autowired
    private ZhierAnswerDao zhierAnswerDao;
    @Autowired
    private ZhierQuestionDao zhierQuestionDao;
    @Autowired
    private ZhierUserDao zhierUserDao;
    @Autowired
    private ZhierQuestionTagDao zhierQuestionTagDao;
    @Autowired
    private AnswerLikeAboutDao answerLikeAboutDao;

    public List<ZhierAnswer> getAnswerByQuestion(long questionId) {
        return zhierAnswerDao.queryAllByQuestion(questionId);
    }

    public List<QuestionAndaAnswer> getAnswerByUser(long userId) {
        return zhierAnswerDao.queryAllByUser(userId);
    }

    public ZhierAnswer getAnswerById(long answerId) {
        return zhierAnswerDao.queryByAnswerId(answerId);
    }

    public boolean ifHaveAnswered(long userId, long questionId) {

        if(zhierAnswerDao.queryByIds(userId,questionId)==null)
            return false;
        else
            return true;
    }

    public boolean answer(long questionId, long userId, String userName, String answerText) {
        if (zhierAnswerDao.addAnswer(questionId, userId, userName, answerText) == 0)
            return false;
        else return true;
    }

    public boolean updateAnswer(long answerId, String newAnswerText) {
        Date currentTime = new Date();
        if (zhierAnswerDao.updateAnswer(answerId, newAnswerText, currentTime) == 0)
            return false;
        else
            return true;
    }

    public boolean deleteAnswer(long answerId) {
        if (zhierAnswerDao.deleteAnswer(answerId) == 0)
            return false;
        else return true;

    }

    public List<ZhierQuestion> getQuestionByUser(long userId) {
        return zhierQuestionDao.queryAllByUser(userId);
    }

    public ZhierQuestion getQuestionById(long questionId) {
        return zhierQuestionDao.queryById(questionId);
    }

    public List<ZhierQuestion> getQuestionByTag(String tagName) {
        return zhierQuestionDao.queryAllByTag(tagName);
    }

    public List<QuestionAndaAnswer> getAllQuestion() {
        return zhierQuestionDao.queryAll();
    }

    public boolean raiseQuestion(long createUserId, String createUserName, String questionTag, String questionText) {
        addTag(questionTag);
        if (zhierQuestionDao.createQuestion(createUserId, createUserName, questionTag, questionText) == 0)
            return false;
        else
            return true;

    }

    public boolean deleteQuestion(long questionId) {
        if (zhierQuestionDao.deleteQuestion(questionId) == 0)
            return false;
        else return true;

    }

    public boolean updateQuestion(long questionId, String newQuestionText) {

        Date currentTime = new Date();
        if (zhierQuestionDao.updateQuestion(questionId, newQuestionText, currentTime)
                == 0)
            return false;
        else return true;

    }

    public List<ZhierQuestion> searchQuestion(String keyword) {
        return zhierQuestionDao.queryByKeyword(keyword);
    }

    public boolean registUser(String userName, String password, String userEmail, int sex) {
        if(zhierUserDao.findUserByUserName(userName)==null) {
            if (zhierUserDao.addUser(userName, password, userEmail, sex) == 0)
                return false;
            else
                return true;
        }else
            return false;

    }

    public boolean deleteUser(long userId) {
        if (zhierUserDao.deleteUser(userId) == 0)
            return false;
        else
            return true;

    }

    public ZhierUser findUser(long userId) {
        return zhierUserDao.queryUserById(userId);
    }

    public ZhierUser findUser(String userName) {
        return zhierUserDao.findUserByUserName(userName);
    }

    public List<ZhierUser> findUserByKeyword(String keyword) {
        return zhierUserDao.queryUserByKeyword(keyword);
    }

    public boolean userIsRight(String userName, String password) {
        if (findUser(userName).getPassword().equals(password))
            return true;
        else
            return false;
    }

    public void addTag(String questionTag) {
        if (zhierQuestionTagDao.findQuestionTag(questionTag) == null)
            zhierQuestionTagDao.addQuestionTag(questionTag);


    }


    public List<String> findTagByKeyword(String keyword) {
        return zhierQuestionTagDao.findTagByKeyword(keyword);
    }

    public AnswerLikeAbout findUserLikes(long answerId, long userId) {
        return answerLikeAboutDao.queryInfo(answerId,userId);
    }

    public void addLikes(long answerId, long userId, int type) {
        answerLikeAboutDao.insertInfo(answerId, userId, type);
    }

    public void updateLikes(long answerId, long userId, int type) {
        answerLikeAboutDao.updateInfo(answerId, userId, type);
    }

    public int getLikesNum(long answerId, int type) {
        return answerLikeAboutDao.queryInfoNum(answerId, type);
    }
}



