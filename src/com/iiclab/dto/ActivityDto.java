package com.iiclab.dto;

import java.util.Date;

public class ActivityDto {
    private int id;
    private int activity_type;
    private String title;
    private String participants;
    private Date start_date;
    private Date end_date;
    private String competition_name;
    private String competition_result;
    private String competition_desc;
    private String papers;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getActivity_type() { return activity_type; }
    public void setActivity_type(int activity_type) { this.activity_type = activity_type; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getParticipants() { return participants; }
    public void setParticipants(String participants) { this.participants = participants; }
    public Date getStart_date() { return start_date; }
    public void setStart_date(Date start_date) { this.start_date = start_date; }
    public Date getEnd_date() { return end_date; }
    public void setEnd_date(Date end_date) { this.end_date = end_date; }
    public String getCompetition_name() { return competition_name; }
    public void setCompetition_name(String competition_name) { this.competition_name = competition_name; }
    public String getCompetition_result() { return competition_result; }
    public void setCompetition_result(String competition_result) { this.competition_result = competition_result; }
    public String getCompetition_desc() { return competition_desc; }
    public void setCompetition_desc(String competition_desc) { this.competition_desc = competition_desc; }
    public String getPapers() { return papers; }
    public void setPapers(String papers) { this.papers = papers; }
}
