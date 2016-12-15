/*
    IMS_raidTasks.sqf
    Written by Salutesh
    www.reality-gaming.eu
	
    Description: Mission tasks for the fortress mission.  
*/

IMS_Overmind_TaskEvent_1 = {
	IMS_Overmind_Task_1 = player createSimpleTask ["Overmind - The Mission [Part 1]"];
	IMS_Overmind_Task_1 setSimpleTaskDescription ["<img align='center' image='textures\mission.paa' width='360' height='360'/><br/><br/><font color='#db3a49'>Situation:</font><br/>Bandits have taken the fortress near Lijnhaven.<br/>There are sensitive technologies, explosives and resources in the area.<br/><br/><font color='#db3a49'>Mission Ojective:</font><br/>The objective is to investigate the fortress area and find a way to stop the bandits from stealing the technologies and explosives.<br/><br/>Go to the fortess area and investigate anything that might be useful to achieve the success of this mission.",
	"Overmind - The Mission [Part 1]",""];
	IMS_Overmind_Task_1 setSimpleTaskType "search";
	IMS_Overmind_Task_1 setSimpleTaskDestination [6899.03,11444.1,0];
	IMS_Overmind_Task_1 setTaskState "Assigned";
	player setCurrentTask IMS_Overmind_Task_1;
};

publicVariable "IMS_Overmind_TaskEvent_1";