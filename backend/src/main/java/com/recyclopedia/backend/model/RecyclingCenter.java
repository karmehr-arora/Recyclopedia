package com.recyclopedia.backend.model;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "recycling_centers")
public class RecyclingCenter {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String address;
    private String phone;
    private String website;
    private String hours;
    private String notes;

    @Column(columnDefinition = "json")
    private String accepts;

    // getters + setters
    public void setID(Long id) {this.id = id;}
    public Long getID() {return id;}

    public void setName(String name) {this.name = name;}
    public String getName() {return name;}

    public void setAddress(String address) {this.address = address;}
    public String getAddress() {return address;}

    public String getPhone() {return phone;}
    public void setPhone(String phone) {this.phone = phone;}

    public String getWebsite() {return website;}
    public void setWebsite(String website) {this.website = website;}

    public String getHours() {return hours;}
    public void setHours(String hours) {this.hours = hours;}

    public String getNotes() {return notes;}
    public void setNotes(String notes) {this.notes = notes;}

    public String getAccepts() {
        return accepts;
    }

    public void setAccepts(String accepts) {
        this.accepts = accepts;
    }
}
