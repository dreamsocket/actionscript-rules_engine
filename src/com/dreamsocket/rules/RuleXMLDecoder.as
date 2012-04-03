/**
 * Dreamsocket
 * 
 * Copyright 2010 Dreamsocket.
 * All Rights Reserved. 
 *
 * This software (the "Software") is the property of Dreamsocket and is protected by U.S. and
 * international intellectual property laws. No license is granted with respect to the
 * software and users may not, among other things, reproduce, prepare derivative works
 * of, modify, distribute, sublicense, reverse engineer, disassemble, remove, decompile,
 * or make any modifications of the Software without written permission from Dreamsocket.
 * Further, Dreamsocket does not authorize any user to remove or alter any trademark, logo,
 * copyright or other proprietary notice, legend, symbol, or label in the Software.
 * This notice is not intended to, and shall not, limit any rights Dreamsocket has under
 * applicable law.
 * 
 */
 
package com.dreamsocket.rules 
{
	import com.dreamsocket.rules.RuleListXMLDecoder;
	
	
	public class RuleXMLDecoder 
	{
		public function RuleXMLDecoder()
		{
		}
		
		
		public function decode(p_XML:XML):Rule
		{
			var ruleListDecoder:RuleListXMLDecoder = new RuleListXMLDecoder();
			var rule:Rule = new Rule();
			
			rule.children = ruleListDecoder.decode(p_XML);
			rule.operator = p_XML.@operator.toString();
			rule.property = p_XML.@property.toString();
			rule.propertyType = p_XML.@propertyType.length() ? p_XML.@propertyType.toString() : RulePropertyType.STRING;
			rule.value = p_XML.@value.toString();
			
			return rule;
		}
	}
}
