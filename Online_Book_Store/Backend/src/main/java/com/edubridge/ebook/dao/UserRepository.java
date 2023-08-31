package com.edubridge.ebook.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.edubridge.ebook.entity.User;

public interface UserRepository extends JpaRepository<User , Integer>{
   User findByUserName(String userName);
}
