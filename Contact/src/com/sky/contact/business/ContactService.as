package com.sky.contact.business
{
	import com.adobe.cairngorm.business.Responder;
	import com.sky.contact.model.vo.ContactVO;
	
	import mx.controls.Alert;
	import mx.messaging.Channel;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	public class ContactService
	{
		private var channel : Channel;
		public var service : RemoteObject=new RemoteObject();
		public var success : Boolean;
		public function ContactService()
		{
			// Action Message Format
			channel = new AMFChannel("my-amf", "http://localhost:8080/blazeds/spring/messagebroker/amf");
			var cs : ChannelSet = new ChannelSet();
			cs.addChannel(channel);
			this.service.channelSet = cs;//这里指定channelSet，否则跨域访问报错
			this.service.destination = "contactService";
			this.service.showBusyCursor = true;
			this.service.addEventListener(ResultEvent.RESULT, resultHandler);
			this.service.addEventListener(FaultEvent.FAULT, faultHandler);
		}
		
		var responder: Responder;
		var contact: ContactVO;
		public function saveContact(contact: ContactVO, response: Responder): void {
			service.saveContact(contact);
			
			this.responder = response;
			
			this.contact = contact;
		}
		
		private function resultHandler(event : ResultEvent) : void
		{
			success = Boolean(event.result);
			
			if (success == true)
			{
				responder.onResult(contact);
			}
			else
			{
				responder.onFault();
			}
			if (event.token.resultHandler == null)
			{
				return;
			}
			event.token.resultHandler(event.result);
			
		}
		
		private function faultHandler(event : FaultEvent) : void
		{
			if (event.token.faultHandler == null)
			{
				return;
			}
			
			var rootCause : Object = event.fault.rootCause;
			if (rootCause != null)
			{
				event.token.faultHandler(event.fault.rootCause);
			}
			else if(event.fault.faultDetail==null)
			{
				Alert.show("Unknown Error, Please contact Administrator.");
			}
			else if(event.fault.faultCode == "Channel.Connect.Failed")
			{
				Alert.show("Whoa,Looks looks like your internet connection has issues,Please try again when the issues are resolved.");
			}
			else
			{
				Alert.show("Root Cause: \n"+rootCause+"\nExtra Details:\n"+event.fault.faultDetail);
			}
		}
	}
}