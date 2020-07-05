package com.demo.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TbDocument {
    private Integer id;

    private String name;

    private String description;

    private String author;

//    // 作为 json 输出时的格式
//    @JsonFormat(pattern = "yyyy-MM-dd", locale = "zh", timezone = "GMT+8")
//    // 给对象设置属性时，需要传入的格式，比如添加、修改
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String uploadTime;

    private Integer classId;

    private TbClass tbClass;
}