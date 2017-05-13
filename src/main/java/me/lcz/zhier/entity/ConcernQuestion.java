package me.lcz.zhier.entity;

/**
 * Created by lcz on 2017/5/10.
 */
public class ConcernQuestion {

    private long userId;

    private long questionId;

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(long questionId) {
        this.questionId = questionId;
    }
}
