package com.sky.contact.model.vo
{
	import com.adobe.cairngorm.vo.ValueObject;//引用ValueObject类
	
	/**
	 * 联系人
	 */
	[RemoteClass(alias="com.sky.flexonspring.domain.Contact")] //修饰指明和哪个java对象一致
	public class ContactVO implements ValueObject
	{
		public var fullname : String;//联系人姓名
		public var emailaddress : String;//联系人Email
		public var addcontactDate : String;//添加时间
	}
}
