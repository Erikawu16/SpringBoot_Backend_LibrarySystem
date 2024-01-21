package com.example.book.repository;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.book.model.BorrowingRecord;
import com.example.book.model.Inventory;
import com.example.book.model.User;

import jakarta.servlet.http.HttpSession;

@Repository
public class daoImplMySQL implements dao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 添加用戶的存儲過程
	private static final String ADD_USER_PROCEDURE = "CALL addNewUser(?, ?, ?)";
	// 查找擁有特定電話號碼的用戶
	private static final String FIND_USER_BY_PHONE_PROCEDURE = "CALL findUserByUserPhoneNumber(?)";
	// 更新借閱狀態為可借閱
	private static final String UPDATE_BORROW_STATUS_TO_CAN_BORROW_PROCEDURE = "CALL UpdateBorrowStatusToCanBorrowProcedure(?)";
	// 更新借閱狀態為已借閱
	private static final String UPDATE_BORROW_STATUS_TO_BORROWED_PROCEDURE = "CALL UpdateBorrowStatusToBorrowedProcedure(?)";
	// 添加借閱記錄
	private static final String ADD_BORROW_RECORD_PROCEDURE = "CALL AddBorrowRecordProcedure(?, ?)";
	// 更新歸還時間
	private static final String UPDATE_RETURN_TIME_PROCEDURE = "CALL UpdateReturnTimeProcedure(?, ?, ?)";
	// 更新登錄時間
	private static final String UPDATE_LOGIN_TIME_PROCEDURE = "CALL UpdateLoginTimeProcedure(?, ?)";
	// 通過用戶ID查找用戶
	private static final String FIND_USER_BY_USER_ID_PROCEDURE = "CALL FindUserByUserIdProcedure(?)";
	// 通過庫存ID查找書籍
	private static final String FIND_BOOK_BY_INVENTORY_ID_PROCEDURE = "CALL FindBookByInventoryIdProcedure(?)";
	// 查找可借閱的書籍
	private static final String FIND_CAN_BORROW_BOOK_PROCEDURE = "CALL FindCanBorrowBookProcedure()";
	// 通過用戶ID查找借閱記錄
	private static final String FIND_BORROW_RECORD_BY_USER_ID_PROCEDURE = "CALL FindBorrowRecordByUserIdProcedure(?)";



	@Override

	public int addUser(String UserName, String PhoneNumber, String Password) {
		return jdbcTemplate.update(ADD_USER_PROCEDURE, UserName, PhoneNumber, Password);
	}

	@Override
	public Optional<User> findUserByUserPhoneNumber(String PhoneNumber) {
		try {
			User user = jdbcTemplate.queryForObject(FIND_USER_BY_PHONE_PROCEDURE,
					new BeanPropertyRowMapper<>(User.class), PhoneNumber);
			return Optional.ofNullable(user);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}

	
	@Override
	public Optional<User> findUserByUserId(Integer userId) {
	    User user = jdbcTemplate.queryForObject(
	            FIND_USER_BY_USER_ID_PROCEDURE,
	            new BeanPropertyRowMapper<>(User.class),
	            userId
	    );
	    return Optional.ofNullable(user);
	}


	

	@Override
	public void updateLoginTime(Date lastLoginTime, String phoneNumber) {
		jdbcTemplate.update(UPDATE_LOGIN_TIME_PROCEDURE, lastLoginTime, phoneNumber);

	}



	@Override
	public List<Map<String, Object>> findCanBorrowBook() {
	    return jdbcTemplate.queryForList(FIND_CAN_BORROW_BOOK_PROCEDURE);
	}

	
		@Override
	public List<Map<String, Object>> findBorrowRecorderByUserId(Integer userId) {
	    return jdbcTemplate.queryForList(FIND_BORROW_RECORD_BY_USER_ID_PROCEDURE, userId);
	}
	
	
	

	@Override
	public Optional<Inventory> findBookByInventoryId(Integer inventoryId) {
	    Inventory inventory = jdbcTemplate.queryForObject(
	            FIND_BOOK_BY_INVENTORY_ID_PROCEDURE,
	            new BeanPropertyRowMapper<>(Inventory.class),
	            inventoryId
	    );
	    return Optional.ofNullable(inventory);
	}

	@Override
	public void updateBorrowStatusToCanBorrow(Integer inventoryId) {
		jdbcTemplate.update(UPDATE_BORROW_STATUS_TO_CAN_BORROW_PROCEDURE, inventoryId);
	}

	@Override
	public void updateBorrowStatusToBorrowed(Integer inventoryId) {
		jdbcTemplate.update(UPDATE_BORROW_STATUS_TO_BORROWED_PROCEDURE, inventoryId);
	}

	@Override
	public void addBorrowRecorder( Integer inventoryId,Integer userId) {
		jdbcTemplate.update(ADD_BORROW_RECORD_PROCEDURE, userId, inventoryId);
	}

	@Override
	public void updateReturnTime(Integer inventoryId, Integer userId) {

	    ZoneId taipeiZone = ZoneId.of("Asia/Taipei");
	    LocalDateTime currentTime = LocalDateTime.now(taipeiZone);
	    Date returnTime = Date.from(currentTime.atZone(taipeiZone).toInstant());

	    jdbcTemplate.update(UPDATE_RETURN_TIME_PROCEDURE, inventoryId, userId, returnTime);
	}
}
