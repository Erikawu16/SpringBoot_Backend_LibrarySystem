package com.example.book.service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

import com.example.book.model.BorrowingRecord;
import com.example.book.model.Inventory;
import com.example.book.model.User;
import com.example.book.repository.dao;

import jakarta.servlet.http.HttpSession;
@Service
public class serviceImpl implements service {
	@Autowired
	private dao dao;

	// 1.註冊
	public boolean isValadeRegist(String UserName, String PhoneNumber, String Password) {
		dao.addUser(UserName, PhoneNumber,  Password);
		

		return true;
	}

	// 2.登入邏輯
	@Override
	public boolean isValadeUser(String PhoneNumber, String Password) {
		ZoneId taipeiZone = ZoneId.of("Asia/Taipei");
		// 取得台灣的當地時間
		LocalDateTime currentTime = LocalDateTime.now(taipeiZone);
		// LocalDateTime轉換為Date
		Date LastLoginTime = Date.from(currentTime.atZone(taipeiZone).toInstant());
		Optional<User> userOpt = dao.findUserByUserPhoneNumber(PhoneNumber);
		if (userOpt.isPresent()) {
			User user = userOpt.get();
			if (user.getPassword().equals(Password)) {
				dao.updateLoginTime(LastLoginTime, PhoneNumber);
				return true;
			}
			return false;
		}
		return false;
	}

	// 2.2取得user
	public Optional<User> getUser(String PhoneNumber) {
		return dao.findUserByUserPhoneNumber(PhoneNumber);

	}

	// 3.查看頁面
	public List<Map<String, Object>> BookList() {
		return dao.findCanBorrowBook();
	}

	// 4.使用者借閱紀錄查詢邏輯
	@Override
	public List<Map<String, Object>>UserBorrowRecorder(Integer UserId) {
		
		return dao.findBorrowRecorderByUserId(UserId);
	}

	// 5.借閱書籍
	@Transactional
	@Override
	public void borrowBook( Integer UserId,Integer InventoryId) {
		dao.updateBorrowStatusToBorrowed(InventoryId);
		dao.addBorrowRecorder(InventoryId, UserId);
	}

	// 6.歸還書籍
	@Transactional
	@Override
	public void returnBook(Integer InventoryId,Integer userId) {
		dao.updateBorrowStatusToCanBorrow(InventoryId);
		dao.updateReturnTime(InventoryId, userId);
	}


	@Override
	public Optional<User> getUserBySession(HttpSession session) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public Optional<Inventory> getBook(Integer InventoryId) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}



}
