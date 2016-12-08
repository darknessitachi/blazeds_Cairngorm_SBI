package com.sky.contact.control.commands.events 
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.sky.contact.model.vo.ContactVO;
	import com.sky.contact.control.AddContactControl;

	/**
	 * 自定义“添加联系人”事件，可携带ContactVO类型数据
	 */
	public class AddContactEvent extends CairngormEvent 
	{
		public var contactVO : ContactVO;//联系人
		
		public function AddContactEvent( contactVO : ContactVO )
		{
			super( AddContactControl.EVENT_ADD_CONTACT );//调用父类构造函数
			this.contactVO = contactVO;//接收数据
		}
	}	
}