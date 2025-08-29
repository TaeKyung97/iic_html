package com.iiclab.dao;

import com.iiclab.dto.UserDto;
import com.iiclab.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    /**
     * 아이디와 비밀번호로 사용자를 조회하여 DTO로 반환합니다.
     * @param id 사용자 아이디
     * @param pw 사용자 비밀번호
     * @return UserDto 객체 (일치하는 사용자가 없으면 null)
     */
    public UserDto login(String id, String pw) {
        UserDto user = null;
        String sql = "SELECT * FROM user WHERE id = ? AND pw = ?"; // 실제 환경에서는 pw를 해시하여 비교해야 합니다.
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    user = new UserDto();
                    user.setId(rs.getString("id"));
                    user.setName(rs.getString("name"));
                    user.setRole(rs.getInt("role"));
                    user.setStudentNumber(rs.getString("student_number"));
                    user.setEmail(rs.getString("email"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    /**
     * 새로운 사용자를 데이터베이스에 추가합니다.
     * @param user 추가할 사용자 정보가 담긴 UserDto 객체
     * @return 성공 시 true, 실패 시 false
     * @throws SQLException SQL 예외 발생 시
     */
    public boolean addUser(UserDto user) throws SQLException {
        String sql = "INSERT INTO user (id, pw, name, role, email, student_number, grade, research_areas, photo, phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getPw());
            pstmt.setString(3, user.getName());
            pstmt.setInt(4, user.getRole()); // 기본값은 0 (일반회원)
            pstmt.setString(5, user.getEmail());
            pstmt.setString(6, user.getStudentNumber());
            pstmt.setString(7, user.getGrade());
            pstmt.setString(8, user.getResearchAreas());
            pstmt.setString(9, user.getPhoto());
            pstmt.setString(10, user.getPhone());
            return pstmt.executeUpdate() > 0;
        }
    }

    /**
     * 아이디, 이메일, 학번이 이미 존재하는지 확인합니다.
     * @param id 아이디
     * @param email 이메일
     * @param studentNumber 학번
     * @return 중복된 필드 이름 (없으면 null)
     */
    public String checkDuplicate(String id, String email, String studentNumber) {
        String sql = "SELECT 'id' as field FROM user WHERE id = ? UNION SELECT 'email' as field FROM user WHERE email = ? UNION SELECT 'student_number' as field FROM user WHERE student_number = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            pstmt.setString(2, email);
            pstmt.setString(3, studentNumber);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("field");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}

