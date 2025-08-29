package com.iiclab.dto;

public class ResearcherDto {
    private String name;
    private String student_number;
    private String status;
    private String grade;
    private String email;
    private String phone;
    private String research_areas;
    private String photo;

    // role 필드 및 getter/setter 삭제

    // Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStudent_number() {
        return student_number;
    }

    public void setStudent_number(String student_number) {
        this.student_number = student_number;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getResearch_areas() {
        return research_areas;
    }

    public void setResearch_areas(String research_areas) {
        this.research_areas = research_areas;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
}
