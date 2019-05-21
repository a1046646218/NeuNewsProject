package neu.edu.service;

import java.util.ArrayList;

import neu.edu.entity.News;

public class ForNewListService {
	public ArrayList<News> getNewListByID(int user_id,int num){
		ArrayList<News> list = new ArrayList<>();
		for(int i=0;i<5;i++) {
			list.add(new News(1, "111", 20, 11, 2, "dsdasdsa", "hhah", 20, "wo", "C:\\Users\\N&B\\Desktop\\headimg.jpg"));
		}
		return list;
	}
}
