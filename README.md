【線上借書系統】
使用者測試帳號: 1111111111
使用者測試密碼:111

【使用框架】
前端vue.js (port:8081)
後端spring boot (port:8005)

【使用資料庫】
MySQL

【加密問題】
加密步驟如下，但產生同源政策問題導致系前後端無法串接，
因時間關係尚未測試到合適解決辦法。

1.springboot的pom文件加入依賴
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-security</artifactId>
</dependency>

2.新增user 鹽屬性
public class User {
    private String salt; // 新增存储鹽值
}

3.寫一個 BCryptPasswordEncoder()加密方法
@Configuration
public class SecurityConfig {
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}

4.service注入PasswordEncoder加密bean 撰寫邏輯
    @Autowired 
    
    private PasswordEncoder passwordEncoder;
    
    // 註冊
    public boolean isValadeRegist(String UserName, String PhoneNumber, String Password) {
    
        // 生成隨機鹽
        String salt = generateSalt();
        
        // 鹽加哈希過的密碼
        String hashedPassword = hashPassword(Password, salt);
        
        dao.addUser(UserName, PhoneNumber, hashedPassword, salt);
        
        return true;
    }
    
    // 登入邏輯
    public boolean isValadeUser(String PhoneNumber, String Password) {
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            //將使用者輸入的密碼哈希並加鹽比對資料庫
            if (hashPassword(Password, user.getSalt()).equals(user.getPassword())) {
                dao.updateLoginTime(lastLoginTime, PhoneNumber);
                return true;
            }
            return false;
        }
        return false;
    }
//利用 SecureRandom產生鹽
    private String generateSalt() {
        SecureRandom random = new SecureRandom();
        byte[] saltBytes = new byte[16];
        random.nextBytes(saltBytes);
        return Base64.getEncoder().encodeToString(saltBytes);
    }
// 鹽加密碼後哈希的方法
    private String hashPassword(String password, String salt) {
        return passwordEncoder.encode(salt + password);
    }
}
