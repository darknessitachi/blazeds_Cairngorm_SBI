package com.sky.contact.business
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.sky.contact.model.vo.ContactVO;

	import flash.utils.setTimeout;

	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	import mx.controls.Alert;

	/**
	 * AddContactCommand类的代理类，用以执行添加联系人的具体操作
	 */
	public class AddContactDelegate
	{

		public function AddContactDelegate(responder:Responder)
		{
			this.responder=responder;
		}

		private var responder:Responder; //定义Responder类实例
		private var service:Object; //定义Object变量

		/**
		 * 添加联系人处理函数
		 */
		public function addcontact(contactVO:ContactVO):void
		{
			var contactService:ContactService=new ContactService();
			contactService.saveContact(contactVO, responder);
			
			
			/*Alert.show(contactService.success.toString());
			if (contactService.success == true)
			{
				responder.onResult(contactVO);
			}
			else
			{
				responder.onFault();
			}*/
			//setTimeout(addcontactResult, 1000, contactVO); //延迟1秒，并提交给addcontactResult函数
		}

	/**
	 * 添加结果处理

	private function addcontactResult(contactVO:ContactVO):void
	{
		if (1) //若运行正常，开始添加联系人
		{

		}
		else //若运行不正常，提示错误
		{

		}
	}*/
	}
}
