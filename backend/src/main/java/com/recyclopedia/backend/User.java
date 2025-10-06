/**
 *  When this runs it should create a table called user in mysql
 */
package com.recyclopedia.backend;

import jakarta.persistence.*;

@Entity //tells to represent as table in database 
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) //auto increment
    private Long id; //primary key
    private String name; //column

    public User() {}

    public User(String name) {
        this.name = name;
    }
    //additional constructors
    
    //getters and setters
}