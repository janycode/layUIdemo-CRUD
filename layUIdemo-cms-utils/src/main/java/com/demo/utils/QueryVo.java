package com.demo.utils;

import java.io.Serializable;


public class QueryVo implements Serializable {
    private Integer classId;

    public QueryVo() {
    }

    public QueryVo(Integer classId) {
        this.classId = classId;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    @Override
    public String toString() {
        return "QueryVo{" +
                "classId=" + classId +
                '}';
    }
}
