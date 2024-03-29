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
	import com.dreamsocket.rules.RuleXMLDecoder;
	

	public class RuleListXMLDecoder 
	{
		public function RuleListXMLDecoder()
		{
		}
		
		
		public function decode(p_XML:XML):Array
		{
			if(!p_XML) return [];
			
			var ruleDecoder:RuleXMLDecoder = new RuleXMLDecoder();
			var rules:Array = [];
			var ruleNode:XML;
			var ruleNodes:XMLList = p_XML.*;
			
			for each(ruleNode in ruleNodes)
			{
				rules.push(ruleDecoder.decode(ruleNode));
			}
			
			return rules;
		}		
	}
}
