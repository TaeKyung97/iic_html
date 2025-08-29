package com.iiclab.dao;

import com.iiclab.dto.ResearcherDto;
import com.iiclab.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ResearcherDao {

    // 상태(학부생/대학원생)에 따른 연구원 목록 조회
    public List<ResearcherDto> getResearchersByStatus(String status) {
        List<ResearcherDto> list = new ArrayList<>();
        String sql = "SELECT * FROM researcher WHERE status = ? ORDER BY grade ASC, name ASC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, status);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    ResearcherDto dto = new ResearcherDto();
                    dto.setName(rs.getString("name"));
                    dto.setStudent_number(rs.getString("student_number"));
                    dto.setStatus(rs.getString("status"));
                    dto.setGrade(rs.getString("grade"));
                    dto.setEmail(rs.getString("email"));
                    dto.setPhone(rs.getString("phone"));
                    dto.setResearch_areas(rs.getString("research_areas"));
                    dto.setPhoto(rs.getString("photo"));
                    list.add(dto);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 연구원 총 인원 수 조회 (index.jsp에서 사용되므로 유지)
    public int getResearcherCount() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM researcher";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    // getResearcher, addResearcher, updateResearcher, deleteResearcher 메서드는
    // 더 이상 필요 없으므로 모두 삭제했습니다.
}
