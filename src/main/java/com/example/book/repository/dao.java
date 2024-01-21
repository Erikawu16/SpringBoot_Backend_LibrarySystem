package com.example.book.repository;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.example.book.model.Book;
import com.example.book.model.BorrowingRecord;
import com.example.book.model.Inventory;
import com.example.book.model.User;

import jakarta.servlet.http.HttpSession;

public interface dao {

	// 1.註冊會員
	int addUser(String UserName, String PhoneNumber, String Password);

	// 2. 根據使用者電話查找使用者(登入用-單筆)
	Optional<User> findUserByUserPhoneNumber(String PhoneNumber);
	//3.透過登入電話查找使用者id
	Optional<User> findUserByUserId(Integer UserId);
	

	// 2.2更新登入時間
	void updateLoginTime(Date LastLoginTime, String PhoneNumber);

	// 3. 查詢可借閱書籍
	List<Map<String, Object>> findCanBorrowBook();

	// 4. 根據使用者Id查找使用者借閱的書籍資料
	List<Map<String, Object>>findBorrowRecorderByUserId(Integer UserId);

	// 5.更新書籍借閱狀況(可借閱/已借閱)
	void updateBorrowStatusToCanBorrow(Integer InventoryId);
	void updateBorrowStatusToBorrowed(Integer InventoryId);
	
	void addBorrowRecorder(Integer InventoryId,Integer UserId);
	void updateReturnTime(Integer InventoryId,Integer UserId);
	//6.取得書籍
	Optional<Inventory> findBookByInventoryId(Integer InventoryId);
}
