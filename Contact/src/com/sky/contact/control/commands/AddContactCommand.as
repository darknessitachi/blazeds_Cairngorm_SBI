package com.sky.contact.control.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.sky.contact.business.AddContactDelegate;
	import com.sky.contact.control.commands.events.AddContactEvent;
	import com.sky.contact.model.XModelLocator;
	import com.sky.contact.model.vo.ContactVO;
	import mx.formatters.DateFormatter;
	import mx.rpc.events.ResultEvent;

	/**
	 * 处理添加联系人事件
	 */
	public class AddContactCommand implements Command, Responder
	{
		private var model:XModelLocator=XModelLocator.getInstance();

		/**
		 * 执行命令函数
		 */
		public function execute(event:CairngormEvent):void
		{
			model.addcontact.isPending=true; //改变isPending状态

			var delegate:AddContactDelegate=new AddContactDelegate(this); //定义AddContactDelegate类实例  
			var addcontactEvent:AddContactEvent=AddContactEvent(event); //接收传递来的数据，并存于addcontactEvent变量
			delegate.addcontact(addcontactEvent.contactVO); //执行delegate实例的addcontact方法，开始添加联系人      
		}

		/**
		 * 命令运行错误的处理函数
		 * 提示错误消息，并修改操作状态
		 */
		public function onFault(event:*=null):void
		{
			model.addcontact.statusMessage="添加联系人失败";
			model.addcontact.isPending=false; //改变isPending状态
		}

		/**
		 * 命令运行正常的处理函数
		 * 将联系人信息存储于联系人数组中，并修改操作状态
		 */
		public function onResult(event:*=null):void
		{
			model.addcontact.statusMessage="";
			
			model.addcontact.contactVO=ContactVO(event); //接收传递来的数据，并存于model.addcontact.contactVO中
			model.addcontact.isPending=false; //改变isPending状态

			/*定义Object变量obj,用以存储联系人信息*/
			var obj:Object=new Object();
			obj.fullname=ContactVO(event).fullname;
			obj.emailaddress=ContactVO(event).emailaddress;

			/*添加联系人日期。日期格式化为“年-月-日,时:分:秒”*/
			var now:Date=new Date();
			var df:DateFormatter=new DateFormatter();
			df.formatString="YYYY-M-DD,J:NN:S";
			obj.addcontactDate=df.format(now);

			model.contacts.addItem(obj); //添加obj变量到model.contacts中.
		}
	}
}