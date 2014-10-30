﻿/*
 * Created by SharpDevelop.
 * User: Alexander Petrovskiy
 * Date: 10/26/2014
 * Time: 10:57 AM
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */

namespace Tmx.Core.Types.Remoting
{
	using System;
	using System.Collections.Generic;
	using Tmx.Interfaces.Remoting;
	using Tmx.Interfaces.TestStructure;
	
	/// <summary>
	/// Description of TestRun.
	/// </summary>
	public class TestRun : ITestRun
	{
		// readonly ITestWorkflow _workflow;
		ITestWorkflow _workflow;
		
		public TestRun()
		{
		    // Data = new Dictionary<string, string>();
		    Data = new CommonData();
            TestSuites = new List<ITestSuite>();
            Status = TestRunStatuses.Pending;
            Id = Guid.NewGuid();
		}
		
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        // public Dictionary<string, string> Data { get; set; }
        public ICommonData Data { get; set; }
        public List<ITestSuite> TestSuites { get; set; }
        public Guid TestLabId {
            get { return _workflow.TestLabId; }
        }
        
		public TestRunStatuses Status { get; set; }
		public TestRunStartTypes StartType { get; set; }
		public Guid WorkflowId
		{
		    get { return _workflow.Id; }
		}
		
		internal void SetWorkflow(ITestWorkflow testWorkflow)
		{
		    _workflow = testWorkflow;
		}
		
		public DateTime StartTime { get; set; }
	}
}
