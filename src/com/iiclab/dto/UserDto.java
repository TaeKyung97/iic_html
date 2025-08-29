package com.iiclab.dto;

public class UserDto {
    private String id;
    private String pw; // DTO에서는 비밀번호를 다룰 수 있지만, 실제 로직에서는 주의해야 합니다.
    private String name;
    private int role;
    private String email;
    private String studentNumber;
    private String grade;
    private String researchAreas;
    private String photo;
    private String phone;

    // 모든 필드에 대한 Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getPw() { return pw; }
    public void setPw(String pw) { this.pw = pw; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getRole() { return role; }
    public void setRole(int role) { this.role = role; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getStudentNumber() { return studentNumber; }
    public void setStudentNumber(String studentNumber) { this.studentNumber = studentNumber; }
    public String getGrade() { return grade; }
    public void setGrade(String grade) { this.grade = grade; }
    public String getResearchAreas() { return researchAreas; }
    public void setResearchAreas(String researchAreas) { this.researchAreas = researchAreas; }
    public String getPhoto() { return photo; }
    public void setPhoto(String photo) { this.photo = photo; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
}

