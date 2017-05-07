package me.lcz.zhier.dto;

/**
 * Created by lcz on 2017/4/10.
 */
public class ActionResult {
    String whichTable;
    boolean result;
    int data;

    public ActionResult(String whichTable, boolean result) {
        this.whichTable = whichTable;
        this.result = result;
    }

    public ActionResult(String whichTable, int data) {
        this.whichTable = whichTable;
        this.data = data;
    }

    public String getWhichTable() {
        return whichTable;
    }

    public void setWhichTable(String whichTable) {
        this.whichTable = whichTable;
    }

    public boolean isResult() {
        return result;
    }

    public void setResult(boolean result) {
        this.result = result;
    }

    public int getData() {
        return data;
    }

    public void setData(int data) {
        this.data = data;
    }
}
