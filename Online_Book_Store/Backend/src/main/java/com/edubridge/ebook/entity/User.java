package com.edubridge.ebook.entity;


import javax.persistence.*;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "User_Details")
public class User {
    @Id
    @GeneratedValue
    @Column(name="id")
    private int id;
    
    @Column(name="user_name")
    private String userName;
    
    @Column(name="password")
    private String password;
    
    @Column(name="email")
    private String email;
}