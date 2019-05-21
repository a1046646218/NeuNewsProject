package neu.edu.service;

import java.util.ArrayList;

import neu.edu.entity.comment;

public class forcommentListService {
	public ArrayList<comment> forcommentsListbyUserId(int user_id,int num){
		ArrayList<comment> li = new ArrayList<>();
		for(int i=0;i<5;i++) {
			li.add(new comment(111, 111, 111, "xxx", 1, 5, "hahahah"));
		}
		return li;
	}
}
