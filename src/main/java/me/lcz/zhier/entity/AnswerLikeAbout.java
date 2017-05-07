package me.lcz.zhier.entity;

/**
 * Created by lcz on 2017/5/7.
 */
public class AnswerLikeAbout {

private long answerId;

    private long userId;

    private int types;

    public long getAnswerId() {
        return answerId;
    }

    public void setAnswerId(long answerId) {
        this.answerId = answerId;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public int getTypes() {
        return types;
    }

    public void setTypes(int types) {
        this.types = types;
    }
}
