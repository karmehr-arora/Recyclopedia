package com.recyclopedia.backend.model;

public class Reminder {
    private String id;
    private String pickupType; // "trash", "recycling"
    private int dayOfWeek;     // 1–7
    private int hour;
    private int minute;
    private boolean remindSetOut;
    private boolean remindBringIn;
    private boolean enabled;
    private String notes;

    // Getters + Setters + Constructors
}