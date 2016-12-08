package com.sky.contact.control 
{
	import com.adobe.cairngorm.control.FrontController;
	import com.sky.contact.control.commands.AddContactCommand;
	
	/**
	 * 前台控制器，监听“添加联系人”事件
	 */
	public class AddContactControl extends FrontController
	{
		public function AddContactControl()
		{
			addCommand( AddContactControl.EVENT_ADD_CONTACT, AddContactCommand );//添加对EVENT_ADD_CONTACT状态的监听
		}
		
		public static const EVENT_ADD_CONTACT : String = "addcontact";//定义EVENT_ADD_CONTACT事件标识
	}
}