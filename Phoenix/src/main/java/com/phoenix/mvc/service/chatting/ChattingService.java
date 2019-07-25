package com.phoenix.mvc.service.chatting;

import java.util.List;
import java.util.Map;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.domain.Chat;
import com.phoenix.mvc.service.domain.ChatFriend;
import com.phoenix.mvc.service.domain.ChatRoom;

public interface ChattingService {
	
	public Map getMyFriendsList(Search search) throws Exception;
	
	public Map getFriendSearchList(Search search) throws Exception;
		
	public int addFriend(ChatFriend chatFriend) throws Exception;
	
	public int updateFriend(ChatFriend chatFriend) throws Exception;
	
	public int deleteFriend(ChatFriend chatFriend) throws Exception;
	
	public Map getMyChatRoomList(Search search) throws Exception;
	
	public Map getChatRoom(Search search) throws Exception;
	
	public void addChatRoom(ChatRoom chatRoom) throws Exception;
	
	public void updateChatRoom(ChatRoom chatRoom) throws Exception;
	 
	public void removeChatRoom(ChatRoom chatRoom) throws Exception;
		
	public void testMethod(Chat chat) throws Exception;
	
	public void addChat(Chat chat) throws Exception;
	
	public List getChatList(Chat chat) throws Exception;
	//겟 챗룸으로 합치고 서비스에서 없애야 됨 DAO는 필요...
	
}
