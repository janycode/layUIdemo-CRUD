package com.demo.controller;

import com.demo.pojo.TbClass;
import com.demo.pojo.TbDocument;
import com.demo.service.TbClassService;
import com.demo.service.TbDocumentService;
import com.demo.utils.JsonUtils;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/doc")
public class TbDocumentController {

    @Autowired
    private TbDocumentService tbDocumentService;
    @Autowired
    private TbClassService tbClassService;

    /**
     * 查询下拉菜单
     * @param session
     */
    @RequestMapping("/getClasses")
    @ResponseBody
    public List<TbClass> findClass(HttpSession session) {
        List<TbClass> classList = tbClassService.findAll();
        session.setAttribute("classList", classList);
        return classList;
    }

    /**
     * 进 showAll.jsp
     * @return
     */
    @RequestMapping("/toShowAll")
    public String toShowAll(HttpSession session) {
        // 下拉菜单
        findClass(session);
        return "/showAll.jsp";
    }

    /**
     * 查询所有，响应 json
     * 1. json 返回数据："{\"code\": 0,\"msg\": \"\",\"count\": 1000,\"data\": []}"
     * 2. produces 可以解决 json 字符串中的中文在 springMVC 出现乱码问题
     *
     * @return
     */
    @RequestMapping("/findAll")
    @ResponseBody
    public Map<String, Object> findAll(Integer page, Integer limit, Integer classId) {
        PageInfo<TbDocument> pageInfo = tbDocumentService.findAll(page, limit, classId);
        // 将数量和数据封装在 layUI 表格需要的 JSON 格式中
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0); // 必须
        map.put("msg", "success"); // 必须，默认""
        map.put("count", pageInfo.getTotal()); // 必须
        map.put("data", pageInfo.getList()); // 必须，默认 ""
        return map;
    }

    /**
     * 跳转 addDoc.jsp
     * @param session
     * @return
     */
    @RequestMapping("/toAdd")
    public String toAdd(HttpSession session) {
        // 下拉菜单
        findClass(session);
        return "/addDoc.jsp";
    }

    /**
     * 新增一条记录
     * @param tbDocument
     * @return
     */
    @RequestMapping("/addOne")
    public String addOne(TbDocument tbDocument) {
        System.out.println("添加：" + tbDocument);

        int res = tbDocumentService.addDoc(tbDocument);
        return "redirect:/doc/toShowAll";
    }

    /**
     * 进 updateDoc.jsp
     * @return
     */
    @RequestMapping("/toUpdate")
    @ResponseBody
    public String toUpdate(@RequestBody TbDocument tbDocument, HttpSession session) throws Exception {
        System.out.println("修改：" + tbDocument);
        session.setAttribute("tbDocument", tbDocument);

        Map<String, Object> map = new HashMap<>();
        map.put("flag", true);
        map.put("msg", "success");
        String jsonStr = JsonUtils.toJsonStr(map);
        return jsonStr;
    }

    /**
     * 进 修改页
     * @return
     */
    @RequestMapping("/update")
    public String updateDoc(HttpSession session) {
        //TbDocument tbDocument = (TbDocument) session.getAttribute("tbDocument");
        // 下拉菜单
        findClass(session);

        System.out.println("进修改页");
        return "/updateDoc.jsp";
    }

    /**
     * 修改该条记录
     * @return
     */
    @RequestMapping("/updateOne")
    public String updateOne(TbDocument tbDocument) {
        //TbDocument tbDocument = (TbDocument) session.getAttribute("tbDocument");
        System.out.println("修改为：" + tbDocument);
        int res = tbDocumentService.updateDoc(tbDocument);
        return "redirect:/doc/toShowAll";
    }

    /**
     * 删除单个
     * @param id
     * @return
     */
    @RequestMapping("/toDelete")
    @ResponseBody
    public Map<String, Object> toDelete(Integer id) {
        System.out.println("删除：" + id);
        int res = tbDocumentService.deleteById(id);
        Map<String, Object> map = new HashMap<>();
        map.put("flag", true);
        map.put("msg", "success");
        return map;
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @RequestMapping("/deleteByIds")
    @ResponseBody
    public String deleteByIds(Integer [] ids) {
        for (Integer id : ids) {
            int res = tbDocumentService.deleteById(id);
        }
        return "success";
    }
}
