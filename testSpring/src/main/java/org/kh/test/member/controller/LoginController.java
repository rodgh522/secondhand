package org.kh.test.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.kh.test.member.model.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

//Scribe library용 naver login구현체 추가
@Controller
public class LoginController {
	
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	MemberService mService;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login1.do", method = { RequestMethod.GET, RequestMethod.POST})
	public String login(Model model, HttpSession session) {
		//네이버 아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//네이버
		model.addAttribute("url", naverAuthUrl);
		
		//생성한 인증 URL을 View로 전달
		return "loginPage2";
	}
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST})
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)throws IOException {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//로그인 사용자 정보 읽어오깅
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		//json형태로 바꿔서 apiResult에서 email, name 추출해서
		JSONParser parser =new JSONParser();
		Object obj;
		try {
			obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject)obj;
			
			//데이터 파싱
			JSONObject response_obj = (JSONObject)jsonObj.get("response");
			String email = (String)response_obj.get("email");
			String name = (String)response_obj.get("name");
			String id = (String)response_obj.get("id");
			System.out.println(id);
			//model.addAttribute("email", email);

			int result=mService.emailCheck(email);
			
			if(result>0) {
				return "redirect:/login.do?memberId="+email+"&memberPw="+id;
			}else {		
				model.addAttribute("naverId", id);
				model.addAttribute("naverEmail", email);
				model.addAttribute("naverName", name);
				return "naverJoinForm";
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "loginPage";
	}
}

