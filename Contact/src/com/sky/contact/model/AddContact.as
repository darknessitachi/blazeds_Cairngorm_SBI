package com.sky.contact.model
{
	import com.sky.contact.model.vo.ContactVO;
	
	/**
	 * 存储应用程序的数据及状态
	 */
	public class AddContact
	{
		[Bindable]
		public var contactVO : ContactVO;//联系人信息
		[Bindable]
		public var statusMessage : String;//运行信息
		[Bindable]
		public var isPending : Boolean;//操作是否完成
	}
}