package kr.co.mitgomukgo.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Store {

	private int storeNo;
	private String storeName;
	private int ownerNo;
	private String address;
	private String phone;
	private String content;
	private String openHour;
	private String closedDay;
	private int rating;
	private int reviewCount;
}
