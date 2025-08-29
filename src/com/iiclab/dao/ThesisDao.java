package com.iiclab.dao;

import com.iiclab.dto.ThesisDto;
import com.iiclab.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ThesisDao {

    public List<ThesisDto> getAllTheses() {
        List<ThesisDto> theses = new ArrayList<>();
        
        // 'Journal Paper'와 'Conference Paper'만 선택하고 정렬하도록 SQL 변경
        String sql = "SELECT title, authors, category, date, location FROM thesis " +
                     "WHERE category IN ('Journal Paper', 'Conference Paper') " + // 이 부분 추가
                     "ORDER BY CASE category " +
                     "    WHEN 'Journal Paper'     THEN 1 " +
                     "    WHEN 'Conference Paper'  THEN 2 " +
                     "END, date DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                ThesisDto dto = new ThesisDto();
                dto.setTitle(rs.getString("title"));
                dto.setAuthors(rs.getString("authors"));
                dto.setCategory(rs.getString("category"));
                dto.setDate(rs.getString("date"));
                dto.setLocation(rs.getString("location"));
                theses.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return theses;
    }

    public int getThesisCount() {
        int count = 0;
        // 전체 논문 수가 아닌, 두 카테고리의 논문 수만 세도록 변경 가능
        String sql = "SELECT COUNT(*) FROM thesis WHERE category IN ('Journal Paper', 'Conference Paper')";
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
}
