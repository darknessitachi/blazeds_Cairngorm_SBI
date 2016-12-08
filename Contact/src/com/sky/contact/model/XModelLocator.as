package com.sky.contact.model 
{
 	import com.adobe.cairngorm.model.ModelLocator;
	import mx.collections.ArrayCollection;

	/**
	 * 存储AddContact类实例和联系人数组
	 */
 	[Bindable]
	public class XModelLocator implements ModelLocator
	{
		//单例对象引用
		private static var modelLocator : XModelLocator;
		
		/**
		 * 获取类的实例
		 */
		public static function getInstance() : XModelLocator 
		{
			if ( modelLocator == null )
				modelLocator = new XModelLocator();			
			return modelLocator;
	   }
	   
		/**
		 * 构造函数
		 */
	   	public function XModelLocator()
	   	{
	   		if(XModelLocator.modelLocator != null )
					throw new Error( "Only one ModelLocator instance should be instantiated" );	
	   	}
		
		public var addcontact : AddContact = new AddContact();//存储数据及状态
		public var contacts : ArrayCollection = new ArrayCollection();//联系人数组		
	}	
}

