package kr.co.mitgomukgo.cart.model.service;

import java.util.ArrayList;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mitgomukgo.cart.model.dao.CartDao;
import kr.co.mitgomukgo.cart.model.vo.Cart;
import kr.co.mitgomukgo.market.model.vo.Market;
import kr.co.mitgomukgo.member.model.vo.Member;


@Service
public class CartService {
	@Autowired
	private CartDao dao;

	

	public int insertCart(Cart c) {
		return dao.insertCart(c);
	}



	public ArrayList<Cart> cartList(Cart c) {
		ArrayList<Cart> list = dao.cartList(c);
		return (ArrayList<Cart>) list;
	}



	public ArrayList<Cart> ordercart(Cart c, String memberId) {
		ArrayList<Cart> list = dao.ordercart(c, memberId);
		return (ArrayList<Cart>) list;
	}



	public Cart searchCart(Cart c) {
		return dao.searchCart(c);
	}



	public int updateCart(Cart c) {
		return dao.updateCart(c);
	}



//	public boolean deleteCart(String productNoArr, String memberId) {
//		StringTokenizer token = new StringTokenizer(productNoArr, "/");
//		boolean result = true;
//
//		while (token.hasMoreTokens()) {
//			int proNo = Integer.parseInt(token.nextToken());
//			Cart c = new Cart();
//			
//			c.setMemberId(memberId);
//			int changeResult = dao.deleteCart(c);
//			System.out.println(c);
//			if (changeResult == 0) {
//				result = false;
//				break;
//			}
//		}
//		return result;
//	}
	
	
	

}
