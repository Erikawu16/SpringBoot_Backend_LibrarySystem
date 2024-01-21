package com.example.book.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.web.bind.annotation.RequestParam;

import com.example.book.model.BorrowingRecord;
import com.example.book.model.Inventory;
import com.example.book.model.User;

import jakarta.servlet.http.HttpSession;

public interface service {

	boolean isValadeRegist(String UserName, String PhoneNumber, String Password);

	boolean isValadeUser(String PhoneNumber, String Password);

	Optional<User> getUser(String PhoneNumber);
	Optional<User> getUserBySession(HttpSession session);

	List<Map<String, Object>> BookList();

	List<Map<String, Object>> UserBorrowRecorder(Integer UserId);

	void borrowBook(Integer InventoryId,Integer UserId);

	void returnBook(Integer InventoryId,Integer UserId);

	Optional<Inventory> getBook(Integer InventoryId);

}
