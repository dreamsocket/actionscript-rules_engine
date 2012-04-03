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
 
package 
{
	import com.dreamsocket.rules.Rule;
	import com.dreamsocket.rules.RuleOperator;
	import com.dreamsocket.rules.RuleRunner;
	import com.dreamsocket.rules.RulePropertyType;
	
	import flash.display.Sprite;

	public  class TestRules extends Sprite
	{
		public function TestRules()
		{
			var rule1:Rule;
			var rule2:Rule;
			var rules:Array = [];
			var specifications:Object = {};
			var data:Object = {specifications:specifications};
			var ruleRunner:RuleRunner = new RuleRunner();

			specifications["Size of Yard"] = "1 Acre or More";


			rule1 = new Rule();
			rule1.property = "data.specifications['Size of Yard']";
			rule1.operator = RuleOperator.CONTAINS;
			rule1.value = "1 Acre or More";

			rule1 = new Rule();
			rule2.property = "data.specifications['Size of Yard']";
			rule2.operator = RuleOperator.CONTAINS;
			rule2.value = "1/2 - 1 Acre";

			/*
			rule2 = new Rule();
			rule2.property = "test";
			rule2.value = "foo";
			rule2.operator = RuleOperator.EQUAL_TO;

			rule2.children.push(rule1);

			rule1 = new Rule();
			rule1.property = "test";
			rule1.value = "foo";
			rule1.operator = RuleOperator.EQUAL_TO;

			rule2.children.push(rule1);
			*/

			rules.push(rule1);
			rules.push(rule2);

			trace(ruleRunner.run(data, rules));
		}
	}
}