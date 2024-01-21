package com.example.book.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.book.model.BorrowingRecord;
import com.example.book.model.User;
import com.example.book.service.serviceImpl;

import jakarta.servlet.http.HttpSession;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

@RestController
@CrossOrigin
@RequestMapping("/library")
public class userController {
	@Autowired
	private serviceImpl service;
	// HttpSession session_local = null;

	// 首頁
	@GetMapping("/")
	@ResponseBody
	public String loginPage() {

		return "loginpage";
	}

	// 登入功能
	@CrossOrigin(origins = "http://localhost:8081")
	@PostMapping(path = "/login", consumes = "application/json", produces = "application/json")
	@ResponseBody
	public Map<String, String> loginSystem(@RequestBody Map<String, String> userdata, HttpSession session) {

		Map<String, String> response = new HashMap<>();

		String phoneNumber = userdata.get("loginPhoneNumber");
		String password = userdata.get("loginPassword");
		if (service.isValadeUser(phoneNumber, password)) {
			User user = service.getUser(phoneNumber).get();
			session.setAttribute("user", user);

			response.put("status", "login ok");
			response.put("sessionId", session.getId());
			response.put("userName", user.getUserName());
			response.put("userId", user.getUserId().toString());

			return response;
		} else {
			response.put("status", "login no");
			return response;
		}
	}

	// 登出功能
	@GetMapping("/logout")
	@ResponseBody
	public String logoutSystem(HttpSession session) {
		session.invalidate();
		return "logout ok";
	}

	// 註冊
	@PostMapping(path = "/regist", consumes = "application/json")
	@ResponseBody
	public String registSystem(@RequestBody Map<String, String> data) {
		String UserName = data.get("UserName");
		String PhoneNumber = data.get("PhoneNumber");
		String Password = data.get("Password");

		if (service.isValadeRegist(UserName, PhoneNumber, Password)) {
			return UserName + PhoneNumber + Password;
		}

		return "regist no";
	}

	// 瀏覽書籍列表
	@GetMapping("/booklist")
	@ResponseBody
	public List<Map<String, Object>> bookListPage() {
		List<Map<String, Object>> list = service.BookList();
		return list;
	}

	// 借閱功能
	@PutMapping("/borrowBook/{userId}/{id}")
	@ResponseBody
	public String borrowBook(@PathVariable("id") String InventoryId, @PathVariable("userId") String userId) {

		Integer inventoryIdInt = Integer.parseInt(InventoryId);
		Integer userIdInt = Integer.parseInt(userId);

		service.borrowBook(userIdInt,inventoryIdInt);

		return "borrow ok";
	}

	// 還書功能
	@PutMapping("/returnBook/{userId}/{id}")
	@ResponseBody
	public String returnBook(@PathVariable("id") String InventoryId, @PathVariable("userId") String userId) {

		Integer inventoryIdInt = Integer.parseInt(InventoryId);
		Integer userIdInt = Integer.parseInt(userId);
		service.returnBook(inventoryIdInt, userIdInt);
		return "returnBook";
	}

	// 查看個人借閱紀錄
	@GetMapping("/recorder/{userId}")
	@ResponseBody
	public List<Map<String, Object>> borrowRecorder(@PathVariable("userId") String userId) {
		
		Integer userIdInt = Integer.parseInt(userId);

		return service.UserBorrowRecorder(userIdInt);
	}

}