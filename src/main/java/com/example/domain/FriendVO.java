package com.example.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "friend")
public class FriendVO {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int friend_no;
	private String user_sign;
	@ManyToOne
	@JoinColumn(name = "user_email")
	private UserVO user1;
	@ManyToOne
	@JoinColumn(name = "user_email1")
	private UserVO user2;
}
