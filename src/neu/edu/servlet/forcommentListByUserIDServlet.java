package neu.edu.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import neu.edu.entity.News;
import neu.edu.entity.comment;
import neu.edu.service.ForNewListService;
import neu.edu.service.forcommentListService;
@WebServlet("/forcommentListByUserIDServlet")
public class forcommentListByUserIDServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		ArrayList<comment> list =  new forcommentListService().forcommentsListbyUserId(user_id,0);
		String jsonString = JSON.toJSONString(list);
		System.out.println(jsonString);
		response.getWriter().println(jsonString);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
