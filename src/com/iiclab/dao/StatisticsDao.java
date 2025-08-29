package com.iiclab.dao;

import com.iiclab.dto.StatisticsDto;
import com.iiclab.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StatisticsDao {
    public StatisticsDto getStatistics() {
        StatisticsDto dto = new StatisticsDto();

        String sqlThesis = "SELECT COUNT(*) FROM thesis";
        String sqlResearcher = "SELECT COUNT(*) FROM researcher WHERE status IN ('대학원생', '학부생')";
        String sqlActivities = "SELECT COUNT(*) FROM activities";

        try (Connection conn = DBConnection.getConnection()) {
            try (PreparedStatement pstmt = conn.prepareStatement(sqlThesis);
                 ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) dto.setThesisCount(rs.getInt(1));
            }
            try (PreparedStatement pstmt = conn.prepareStatement(sqlResearcher);
                 ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) dto.setResearcherCount(rs.getInt(1));
            }
            try (PreparedStatement pstmt = conn.prepareStatement(sqlActivities);
                 ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) dto.setActivitiesCount(rs.getInt(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }
}

