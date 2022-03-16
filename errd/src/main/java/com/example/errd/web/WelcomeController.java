package com.example.errd.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.errd.service.BoardService;
import com.example.errd.vo.BoardVO;

@Controller
public class WelcomeController {

	@Autowired
	private BoardService boardService;

	@RequestMapping("/")
	public String index(Model listM, HttpServletRequest request, BoardVO b) {
		int page=1;
		int limit=3;//페이징에서 한페이지에서 보여지는 목록 개수
			
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		//검색과 관련
		String find_name = request.getParameter("find_name"); //검색어
		String find_field = request.getParameter("find_field");//검색 필드
		b.setFind_field(find_field);
		b.setFind_name("%"+find_name+"%");//% 와일드 카드 문자는 검색해서 하나의 임의의 모르는 문자와 매핑 대응

		int totalCount = boardService.getTotalCount(b);//총 레코드 개수, 검색 전후 레코드 개수
		System.out.println("검색전후 레코드 개수 or 총 레코드 개수 : " + totalCount);

		b.setStartrow((page-1)*limit+1); //시작 행 번호
		b.setEndrow(b.getStartrow()+limit-1);//끝 행 번호

		List<BoardVO> blist = boardService.getBoardList(b); //검색 전후 자료실 목록

		//총페이지수
		int maxpage = (int)((double)totalCount/limit+0.95);
		//시작페이지
		int startpage = (((int)((double)page/10+0.9))-1)*10+1;
		//마지막페이지
		int endpage = maxpage;
		if(endpage>startpage+10-1){
			endpage = startpage+10-1;
		}

		listM.addAttribute("blist", blist); //blist 속성 키이름에 목록을 저장
		listM.addAttribute("page", page);
		listM.addAttribute("startpage",startpage);
		listM.addAttribute("endpage",endpage);
		listM.addAttribute("maxpage",maxpage);
		listM.addAttribute("listCount",totalCount); //listCount 속성 키이름에 검색전후 레코드 개수 저장
		listM.addAttribute("find_field", find_field); //검색필드
		listM.addAttribute("find_name", find_name); //검색어
		
		return "index";
	}

	//게시글(오늘의 카드) 저장
	@RequestMapping("/todayCard_ok")
	public String todayCard_ok(@ModelAttribute BoardVO b) {
		boardService.insertBoard(b); 
		return "redirect:/";
	}

	//게시글(오늘의 카드) 삭제
	@GetMapping("/todayCard_del/{no}")
	public ModelAndView todayCard_del(@PathVariable("no") int no, ModelAndView mv) {
		mv.addObject("no", no);
		mv.setViewName("board_del");
		return mv;
	}

	@PostMapping("/todayCard_del/{no}")
	public void todayCard_del_ok(@PathVariable("no") int no, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String pwd = (String)request.getParameter("board_pwd");
		String db_pwd = boardService.checkPwd(no);
		if(!db_pwd.equals(pwd)) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다! 다시 입력해주세요!');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			boardService.delBoard(no);
			out.println("<script>");
			out.println("alert('게시글을 삭제하였습니다!');");
			out.println("opener.location.replace('/');");
			out.println("window.close();");
			out.println("</script>");
		}

	}

	//게시글(오늘의 카드) 수정
	@GetMapping("/todayCard_edit/{no}")
	public ModelAndView todayCard_edit(@PathVariable("no") int no, ModelAndView mv) {
		mv.addObject("no", no);
		mv.setViewName("board_edit");
		return mv;
	}

	//게시판(좋아요) 
	@ResponseBody
	@RequestMapping("/todayCard_like")
	public Map<String,Integer> todayCard_like(@RequestParam("board_no") int board_no,@RequestParam("like_state") int like_state) {

		Map<String, Integer> map = new HashMap<>();

		//눌렀는데 up_state가 0인경우(좋아요 안 누른 상태)
		if(like_state == 0) {
			boardService.upBoardLike(board_no);//좋아요 수 증가
			like_state = 1;//좋아요 상태로 변경
		}else if(like_state == 1){
			boardService.delBoardLike(board_no);
			like_state = 0;//좋아요 취소 상태로 변경
		}

		map.put("like_state", like_state);

		return map;
	}

	//게시판(좋아요수)
	@ResponseBody
	@RequestMapping("/todayCard_likeCount")
	public Map<String,Integer> todayCard_likeCount(@RequestParam("board_no") int board_no) {

		Map<String, Integer> map = new HashMap<>();
		int like_count=0; 

		like_count = boardService.getBoardLike(board_no);

		map.put("like_count", like_count);

		return map;
	}




}
