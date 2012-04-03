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
	import com.dreamsocket.utils.PropertyStringUtil;

	public class RuleRunner 
	{
		protected var m_comparisons:Object;
		
		
		public function RuleRunner()
		{
			this.m_comparisons = {};
			this.m_comparisons[RuleOperator.CONTAINS] = this.contains;
			this.m_comparisons[RuleOperator.EQUAL_TO] = this.isEqual;
			this.m_comparisons[RuleOperator.GREATER_THAN] = this.isGreaterThan;
			this.m_comparisons[RuleOperator.GREATER_THAN_EQUAL_TO] = this.isGreaterThanOrEqual;
			this.m_comparisons[RuleOperator.LESS_THAN] = this.isLessThan;
			this.m_comparisons[RuleOperator.LESS_THAN_EQUAL_TO] = this.isLessThanOrEqual;
			this.m_comparisons[RuleOperator.NOT_EQUAL_TO] = this.isNotEqual;
		}

		
		public function run(p_data:Object, p_rules:Array):Boolean
		{
			if(!p_rules || p_rules.length == 0) return true;

			var i:uint = p_rules.length;
			var rule:Rule;
			while(i--)
			{
				rule = Rule(p_rules[i]);
				if((this.compare(p_data, rule) && this.run(p_data, rule.children)))
					return true;
			}
			
			return false;
		}
		
		
		protected function compare(p_data:Object, p_rule:Rule):Boolean
		{
			var funct:Function = this.m_comparisons[p_rule.operator] as Function;

			if(funct is Function)
			{
				var dataValue:* = this.getValue(PropertyStringUtil.evalSinglePropertyString(p_data, p_rule.property), p_rule.propertyType);
	
				if(!dataValue) return false;

				return funct(this.getValue(p_rule.value, p_rule.propertyType), dataValue);
			}
			return false;
		}
		
		

		protected function contains(p_valueA:*, p_valueB:*):Boolean
		{
			return String(p_valueB).indexOf(String(p_valueA)) != -1;
		}


		protected function getValue(p_value:String, p_propertyType:String):*
		{
			if(p_propertyType == RulePropertyType.NUMBER && p_value is String)
			{
				var reg:RegExp = new RegExp("[0-9]+");
				var match:Array = p_value.match(reg);
				return (match) ? Number(match[0]) : NaN;
			}
			else if(p_propertyType == RulePropertyType.STRING && !(p_value is String))
			{
				return String(p_value);
			}
			else
			{
				return p_value;
			}
		}
	
		

		protected function isEqual(p_valueA:*, p_valueB:*):Boolean
		{
			return p_valueA == p_valueB;
		}


		protected function isNotEqual(p_valueA:*, p_valueB:*):Boolean
		{
			return p_valueA != p_valueB;
		}

		
		protected function isLessThan(p_valueA:*, p_valueB:*):Boolean
		{
			return p_valueB < p_valueA;
		}
		
		
		protected function isLessThanOrEqual(p_valueA:*, p_valueB:*):Boolean
		{
			return p_valueB <= p_valueA;
		}
		
		
		protected function isGreaterThan(p_valueA:*, p_valueB:*):Boolean
		{
			return p_valueB > p_valueA;
		}
		
				
		protected function isGreaterThanOrEqual(p_valueA:*, p_valueB:*):Boolean
		{
			return p_valueB >= p_valueA;
		}				
	}
}
