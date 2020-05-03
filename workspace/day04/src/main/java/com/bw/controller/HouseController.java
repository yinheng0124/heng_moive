package com.bw.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bw.bean.House;
import com.bw.bean.SysUser;
import com.bw.service.HouseSeriver;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class HouseController {
	
	@Autowired
	private HouseSeriver service;
	
	
	/**
	 *   跳转登陆页面
	 *   spring的form必须通过后端绑定对象跳转页面
	 * @param session
	 * @param u
	 * @param result
	 * @return
	 */
	@RequestMapping("toLogin.do")
	public String toLogin(Model model) {
		model.addAttribute("u", new  SysUser());
		return  "index";
	}
	
	
	@RequestMapping("login.do")
	public  String   login(HttpSession session, @Valid @ModelAttribute("u")SysUser u,BindingResult result) {
		if(result.hasErrors()) { //jsr303验证输入的账号密码有无错误
			return  "index";
		}
		u = service.login(u);  //通过账号密码查询
		if(u !=null) { //判断数据有无该用户
			session.setAttribute("loginu", u); //放入session作用域   拦截器的时候会用到session中的值
			return  "redirect:list.do";
		}
		return  "redirect:toLogin.do";
	}

	@RequestMapping("toUpdate.do")
	public String toUpdate(Model model,Integer id){
		House oneById = service.getOneById(id);
		model.addAttribute("house",oneById);
		return "update";
	}
	
	
	@RequestMapping("list.do")
	public  String  list(@RequestParam(defaultValue="1")Integer pageNum,House h,Model model) {
		//分页参数设置
		PageHelper.startPage(pageNum, 3);
		List<House> list =  service.getList(h);
		//页面获取下一页下一页总页等等的值
		PageInfo<House> pageInfo = new  PageInfo<>(list);
		
		model.addAttribute("pg",pageInfo);//页面传值
		model.addAttribute("list",list);//页面传值
		model.addAttribute("h", h);
		return "list";
	}
	
	
	/**
	 * ajax追加房主信息
	 */
	@RequestMapping("getOlist.do")
	@ResponseBody
	public  Object  getOlist() {
		return service.getOlist();
	}
	
	/**
	 * 添加
	 * @param h
	 * @param oids
	 * @param file
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("add.do")
	public  String  add(House h,Integer[] oids,@RequestParam("file")MultipartFile file,HttpServletRequest request) throws Exception {
		/*if(file !=null) {
			String path = request.getServletContext().getRealPath("/upload"); //保存文件的路径
			System.out.println(path);
			file.transferTo(new File(path,file.getOriginalFilename()));
			h.setHouse_pec("upload/"+file.getOriginalFilename());
		}*/
		
		 if(file !=null &&  file.getSize()>0) {
    		 String path="C:\\img";
    		 file.transferTo(new File(path,file.getOriginalFilename()));
    		 h.setHouse_pec("/img/"+file.getOriginalFilename());//证书文件地址保存到数据库
    	 }
		service.addh(h,oids);
		return  "redirect:list.do";
	}
	
	
	
	/**
	 * 回显
	 */
     @RequestMapping("getOneById.do")
     @ResponseBody
     public  Object getOneById(int hid) {
    	 House  house = service.getOneById(hid);  //房屋基本信息（页面基本信息回显）
    	 List<Integer> oids = service.getOidsByHid(hid); //复选框房主的id（用于页面复选框回显）
    	 Map<String, Object> map = new HashMap<String, Object>();
    	 map.put("h", house);
    	 map.put("oids", oids);
    	 return map;
     }
     
     
     /**
      * 修改
     * @throws IOException 
     * @throws IllegalStateException 
      */
     @RequestMapping("/update.do")
     public String  update(House h,Integer[] oids,@RequestParam("file")MultipartFile file) throws Exception {
    		/*	 File file2 = new File(path,file.getOriginalFilename());
				 if(!file2.exists()) {
					 file2.mkdirs();
				 }*/
    	 
    	 if(file !=null &&  file.getSize()>0) {
    		 String path="C:\\img";
    		 file.transferTo(new File(path,file.getOriginalFilename()));
    		 h.setHouse_pec("/img/"+file.getOriginalFilename());
    	 }
    	 service.updateHoues(h,oids);
    	 return  "redirect:list.do";
     }
	
     
     /**
      	* 注销
      * @param session
      * @return
      */
     @RequestMapping("loginOut.do")
     public String loginOut(HttpSession session) {
    	 session.invalidate(); //session销毁
    	 return "redirect:toLogin.do";
     }
     
}
