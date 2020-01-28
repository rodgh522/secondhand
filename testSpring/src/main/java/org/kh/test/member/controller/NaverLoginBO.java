package org.kh.test.member.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class NaverLoginBO {
	/* 인증 요청문을 구성하는 파라미터 */
	//client_id: 애플리케이션 등록 후 발급받은 클라이언트 아이디
	//response_type: 인증 과정에 대한 구분값. code로 값이 고정돼 있습니다.
	//redirect_uri: 네이버 로그인 인증의 결과를 전달받을 콜백 URL(URL 인코딩). 애플리케이션을 등록할 때 Callback URL에 설정한 정보입니다.
	//state: 애플리케이션이 생성한 상태 토큰
	
	private final static String CLIENT_ID = "QopgVfmM7zXeSs24yqjw";
	private final static String CLIENT_SECRET = "U5EciOzBAR";
	private final static String REDIRECT_URI = "http://192.168.10.7/callback.do";
	private final static String SESSION_STATE = "oauth_state";
	//프로필 조회 API URL
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	//네이버 아이디로 인증 url 생성 method
	public String getAuthorizationUrl(HttpSession session) {
		//세션 유효성 검증을 위하여 난수를 생성
		String state = generateRandomString();
		//생성한 난수 값을 session에 저장
		setSession(session,state);
		//Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네-아 로 인증 url 생성
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.state(state)
				.build(NaverLoginApi.instance());
		return oauthService.getAuthorizationUrl();
	}
	
	//네이버 아이디로 Callback 처리 및 AccessToken 획득 method
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{
		
		//callback으로 전달받은 세션검증용 난수값과 세션에 저장되어 있는 값이 일치하는가
		String sessionState = getSession(session);
		if(StringUtils.pathEquals(sessionState, state)) {
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(CLIENT_ID)
					.apiSecret(CLIENT_SECRET)
					.callback(REDIRECT_URI)
					.state(state)
					.build(NaverLoginApi.instance());
		// Scribe에서 제공하는 AccessToken 획득 기능으로 네-아로 Access Token 획득
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		return accessToken;
		}
		return null;
	}
	//세션 유효성 검증을 위한 난수 생성기
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}
	//http session에 데이터저장
	private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}
	//http session 데이터 가져오기
	private String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}
	// Access Token을 이용하여 네이버 사용자 프로필 api를 호출
	public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI).build(NaverLoginApi.instance());
		System.out.println(CLIENT_ID);
		System.out.println(CLIENT_SECRET);
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		return response.getBody();
	}
}

