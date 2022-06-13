package com.example.service.friendService;

import java.util.List;

import com.example.domain.DogKindVO;
import com.example.domain.FriendVO;
import com.example.domain.PetVO;
import com.example.domain.UserVO;

public interface FriendService {
	
	public List<DogKindVO> getDogList();
	
	public int getUserCount();
	
	public List<UserVO> getRandomUsers(String email);
	
	List<FriendVO> getFriendRequests(String userEmail);
	
	//친구 프로필 띄우기
	UserVO getUserInfo(UserVO vo);
	
	List<PetVO> getUserInfoList(UserVO vo);
}
