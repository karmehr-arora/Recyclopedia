package com.recyclopedia.backend.model;

import jakarta.persistence.*;

@Entity
@Table(name = "reminders")
public class Reminder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String pickupType; // "trash", "recycling"

    private int dayOfWeek;     // 1–7

    @Column(name = "reminder_hour")
    private Integer hour;

    @Column(name = "reminder_minute")
    private Integer minute;

    private boolean remindSetOut;
    private boolean remindBringIn;
    private boolean enabled;
    private String notes;

    // Getters + Setters + Constructors
    public void setID(Long id) {this.id = id;}
    public Long getID() {return id;}

    public String getPickupType() { return pickupType; }
    public void setPickupType(String pickupType) { this.pickupType = pickupType; }

    public int getDayOfWeek() { return dayOfWeek; }
    public void setDayOfWeek(int dayOfWeek) { this.dayOfWeek = dayOfWeek; }

    public Integer getHour() { return hour; }
    public void setHour(Integer hour) { this.hour = hour; }

    public Integer getMinute() { return minute; }
    public void setMinute(Integer minute) { this.minute = minute; }

    public boolean isRemindSetOut() { return remindSetOut; }
    public void setRemindSetOut(boolean remindSetOut) { this.remindSetOut = remindSetOut; }

    public boolean isRemindBringIn() { return remindBringIn; }
    public void setRemindBringIn(boolean remindBringIn) { this.remindBringIn = remindBringIn; }

    public boolean isEnabled() { return enabled; }
    public void setEnabled(boolean enabled) { this.enabled = enabled; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
}