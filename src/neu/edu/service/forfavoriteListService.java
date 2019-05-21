package neu.edu.service;

import java.util.ArrayList;

import neu.edu.entity.News;

public class forfavoriteListService {
	public ArrayList<News> getfavoriteListByID(int user_id,int num){
		ArrayList<News> list = new ArrayList<>();
		for(int i=0;i<5;i++) {
			list.add(new News(1, "111", 20, 11, 2, "dsdasdsssssssssssssssssa", "hhah", 20, "wo", "C:\\Users\\N&B\\Desktop\\headimg.jpg"));
		}
		return list;
	}
}
