package com.iiclab.dao;

import com.iiclab.dto.GraduatedResearcherDto;
import com.iiclab.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GraduatedResearcherDao {

    /**
     * 모든 졸업생 목록을 졸업 연도(빠른순), 이름(가나다순)으로 정렬하여 조회합니다.
     * @return GraduatedResearcherDto 객체들의 List
     */
    public List<GraduatedResearcherDto> getAllGraduatedResearchers() {
        List<GraduatedResearcherDto> list = new ArrayList<>();
        // ▼▼▼ 수정: grade 정렬 순서를 DESC에서 ASC로 변경 ▼▼▼
        String sql = "SELECT student_number, name, grade, employment_place FROM gd_researcher ORDER BY grade ASC, name ASC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                GraduatedResearcherDto dto = new GraduatedResearcherDto();
                dto.setName(rs.getString("name"));
                dto.setStudent_number(rs.getString("student_number"));
                dto.setGrade(rs.getString("grade"));
                dto.setEmployment_place(rs.getString("employment_place"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 추가, 수정, 삭제 및 단일 조회 메서드는 더 이상 필요 없으므로 모두 삭제했습니다.
}
