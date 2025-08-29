package com.iiclab.dao;

import com.iiclab.dto.ActivityDto;
import com.iiclab.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ActivityDao {

    // 모든 활동 목록 조회
    public List<ActivityDto> getAllActivities() {
        List<ActivityDto> activities = new ArrayList<>();
        String sql = "SELECT * FROM activities ORDER BY start_date DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                ActivityDto dto = new ActivityDto();
                dto.setId(rs.getInt("id"));
                dto.setActivity_type(rs.getInt("activity_type"));
                dto.setTitle(rs.getString("title"));
                dto.setParticipants(rs.getString("participants"));
                dto.setStart_date(rs.getDate("start_date"));
                dto.setEnd_date(rs.getDate("end_date"));
                dto.setCompetition_name(rs.getString("competition_name"));
                dto.setCompetition_result(rs.getString("competition_result"));
                dto.setCompetition_desc(rs.getString("competition_desc"));
                dto.setPapers(rs.getString("papers"));
                activities.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return activities;
    }

    // 최신 활동을 지정된 개수만큼 조회 (index.jsp 등에서 사용될 수 있으므로 유지)
    public List<ActivityDto> getRecentActivities(int limit) {
        List<ActivityDto> activities = new ArrayList<>();
        String sql = "SELECT * FROM activities ORDER BY start_date DESC LIMIT ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, limit);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    ActivityDto dto = new ActivityDto();
                    dto.setId(rs.getInt("id"));
                    dto.setActivity_type(rs.getInt("activity_type"));
                    dto.setTitle(rs.getString("title"));
                    dto.setParticipants(rs.getString("participants"));
                    dto.setStart_date(rs.getDate("start_date"));
                    dto.setEnd_date(rs.getDate("end_date"));
                    dto.setCompetition_name(rs.getString("competition_name"));
                    dto.setCompetition_result(rs.getString("competition_result"));
                    dto.setCompetition_desc(rs.getString("competition_desc"));
                    dto.setPapers(rs.getString("papers"));
                    activities.add(dto);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return activities;
    }

    // 대외활동 총 개수 조회 (index.jsp 등에서 사용될 수 있으므로 유지)
    public int getActivityCount() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM activities";
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
    
    // getActivityById, addActivity, updateActivity, deleteActivity 메서드 삭제
}
