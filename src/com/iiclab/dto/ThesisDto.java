package com.iiclab.dto;

public class ThesisDto {
    private String title;
    private String authors;
    private String category;
    private String date; // 타입을 String으로 변경
    private String location;

    // Getters and Setters
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthors() {
        return authors;
    }

    public void setAuthors(String authors) {
        this.authors = authors;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDate() { // Getter 타입도 String으로 변경
        return date;
    }

    public void setDate(String date) { // Setter 타입도 String으로 변경
        this.date = date;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
