package kr.co.mitgomukgo.member.controller;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mitgomukgo.member.model.service.MemberService;
import kr.co.mitgomukgo.member.model.vo.Member;
import kr.co.mitgomukgo.member.model.vo.Owner;
import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	
	
	@RequestMapping(value="/joinFrm.do")
	public String joinFrm() {
		return "/member/joinFrm";
	}
	@RequestMapping(value="/loginFrm.do")
	public String loginFrm() {
		return "/member/loginFrm";
	}
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="/memberPhoneCheck.do")
	public String memberPhoneCheck(String phone, Model model) throws CoolsmsException {
		
		  String api_key = "NCSWCXKJNQFT0JWN";
		  String api_secret = "MGVZXWLCEBOJRYV6RZZGAZELC7H5VTEA";
		  Message coolsms = new Message(api_key, api_secret);
		  
		  Random rand = new Random(); 
		  String numStr = "";
		  	for(int i=0; i<4; i++) {
		  		String ran = Integer.toString(rand.nextInt(10)); 
				numStr += ran;
			}
		  
		  HashMap<String, String> set = new HashMap<String, String>();
		  set.put("to", phone); // 수신번호

		  set.put("from", "01086676959"); // 발신번호
		  set.put("text", numStr); // 문자내용
		  set.put("type", "sms"); // 문자 타입
		  set.put("app_version", "test app 1.2"); 

		  try {
		  JSONObject result = coolsms.send(set); // 보내기&전송결과받기

		  System.out.println(result.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
		  model.addAttribute("numStr", numStr);
		  return numStr;
		
	}
	@ResponseBody
	@RequestMapping(value="/ownerPhoneCheck.do")
	public String ownerPhoneCheck(String phone, Model model) throws CoolsmsException {
		
		String api_key = "NCSWCXKJNQFT0JWN";
		  String api_secret = "MGVZXWLCEBOJRYV6RZZGAZELC7H5VTEA";
		  Message coolsms = new Message(api_key, api_secret);
		  
		  Random rand = new Random(); 
		  String numStr = "";
		  for(int i=0; i<4; i++) {
			String ran = Integer.toString(rand.nextInt(10)); 
			numStr += ran;
		  }
		  
		  HashMap<String, String> set = new HashMap<String, String>();
		  set.put("to", phone); // 수신번호

		  set.put("from", "01086676959"); // 발신번호
		  set.put("text", numStr); // 문자내용
		  set.put("type", "sms"); // 문자 타입
		  set.put("app_version", "test app 1.2"); 

		  try {
		  JSONObject result = coolsms.send(set); // 보내기&전송결과받기

		  System.out.println(result.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
		  model.addAttribute("numStr", numStr);
		  System.out.println(numStr);
		  return numStr;
		
	}
	
	@RequestMapping(value="/checkId.do")
	public String checkId(String checkId, Model model) {
		String memberId = service.checkId(checkId);
		if(memberId != null) {
			model.addAttribute("result",false);
			model.addAttribute("memberId",memberId);
			model.addAttribute("checkId", checkId);
		}else {
			model.addAttribute("result",true);
			model.addAttribute("memberId",memberId);
			model.addAttribute("checkId", checkId);
		}
		return "/member/checkId";
	}
	@RequestMapping(value="/ownerCheckId.do")
	public String ownerCheckId(String ownerCheckId, Model model) {
		String ownerId = service.ownerCheckId(ownerCheckId);
		if(ownerId != null) {
			model.addAttribute("result",false);
			model.addAttribute("ownerId",ownerId);
			model.addAttribute("ownerCheckId", ownerCheckId);
		}else {
			model.addAttribute("result",true);
			model.addAttribute("ownerId",ownerId);
			model.addAttribute("ownerCheckId", ownerCheckId);
		}
		return "/member/ownerCheckId";
	}
	@RequestMapping(value="/join.do")
	public String join(Member m) {
		int result = service.insertMember(m);
		if(result > 0) {
			return "redirect:/";
		}else {
			return "member/joinFrm";
		}
	}
	@RequestMapping(value="/login.do")
	public String login(Member member, HttpSession session) {
		Member m = service.selectOneMember(member);
		if(m != null) {
			session.setAttribute("m", m);
		}
		return "redirect:/";
	}
	@RequestMapping(value="/pwChk.do")
	public String pwChk(HttpSession session) {
		return "member/pwChk";
	}
	@RequestMapping(value="/mypage.do")
	public String mypage() {
		return "member/mypage";
	}
	@RequestMapping(value="/selectJoin.do")
	public String selectJoin() {
		return "member/selectJoin";
	}
	@RequestMapping(value="/ownerJoinFrm.do")
	public String ownerJoinFrm() {
		return "member/ownerJoinFrm";
	}
	@RequestMapping(value="/ownerJoin.do")
	public String ownerJoin(Owner o) {
		int result = service.insertOwner(o);
		if(result > 0) {
			return "redirect:/";
		}else {
			return "member/ownerJoinFrm";
		}
	}
}