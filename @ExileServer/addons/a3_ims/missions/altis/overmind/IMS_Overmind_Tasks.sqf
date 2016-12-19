/*
    IMS_raidTasks.sqf
    Written by Salutesh
    www.reality-gaming.eu
	
    Description: Mission tasks for the fortress mission.  
*/

IMS_Overmind_TaskEvent_1 = {
	IMS_Overmind_Task_1 = player createSimpleTask ["Overmind - [Part 1] The Fallen Hero"];
	IMS_Overmind_Task_1 setSimpleTaskDescription ["<img align='center' image='textures\mission.paa' width='360' height='360'/><br/><br/><font color='#db3a49'>Mission Information:</font><br/>The dead officer holds a dokument that contains military mission instructions.<br/>A big group of bandits have taken over the local military Base.<br/>There are sensitive research datas hosted on the servers in the area.<br/><br/><font color='#db3a49'>Mission Objective:</font><br/>The mission objective is to investigate the military base and find a way to recive the research datas from the servers.<br/><br/>Infiltrate the area and investigate anything that might be useful to achieve the success of this mission.",
	"Overmind - [Part 1] The Fallen Hero","Investigate buildings in this area."];
	IMS_Overmind_Task_1 setSimpleTaskType "search";
	IMS_Overmind_Task_1 setSimpleTaskDestination [16104.9,16866.7,0];
	IMS_Overmind_Task_1 setTaskState "Assigned";
	player setCurrentTask IMS_Overmind_Task_1;
};

IMS_Overmind_TaskEvent_1_End = {
	IMS_Overmind_Task_1 setTaskState "Succeeded";
};

IMS_Overmind_TaskEvent_2 = {
	IMS_Overmind_Task_2 = player createSimpleTask ["Overmind - [Part 2] Hide and Seek"];
	IMS_Overmind_Task_2 setSimpleTaskDescription ["<img align='center' image='textures\mission.paa' width='360' height='360'/><br/><br/><font color='#db3a49'>Mission Update:</font><br/>You recived the local security protocols. With them you can enter locked security buildings in the area.<br/><br/>Locate the research center now and download the data from the servers.",
	"Overmind - [Part 2] Hide and Seek","Interact with research center control-panel."];
	IMS_Overmind_Task_2 setSimpleTaskType "interact";
	IMS_Overmind_Task_2 setSimpleTaskDestination [16006.8,17019.4,0];
	IMS_Overmind_Task_2 setTaskState "Assigned";
	player setCurrentTask IMS_Overmind_Task_2;
};

IMS_Overmind_TaskEvent_2_End = {
	IMS_Overmind_Task_2 setTaskState "Succeeded";
};

IMS_Overmind_TaskEvent_3 = {
	IMS_Overmind_Task_3 = player createSimpleTask ["Overmind - [Part 3] Hack the System"];
	IMS_Overmind_Task_3 setSimpleTaskDescription ["<img align='center' image='textures\mission.paa' width='360' height='360'/><br/><br/><font color='#db3a49'>Mission Update:</font><br/>You have found the research server network. Download the datas from the servers now.</font><br/>",
	"Overmind - [Part 3] Hack the System","Interact with server control laptop."];
	IMS_Overmind_Task_3 setSimpleTaskType "interact";
	IMS_Overmind_Task_3 setSimpleTaskDestination [16016.5,17022.6,0];
	IMS_Overmind_Task_3 setTaskState "Assigned";
	player setCurrentTask IMS_Overmind_Task_3;
};

IMS_Overmind_TaskEvent_3_End = {
	IMS_Overmind_Task_3 setTaskState "Succeeded";
};

IMS_Overmind_TaskEvent_4 = {
	IMS_Overmind_Task_4 = player createSimpleTask ["Overmind - [Part 4] Download Datas"];
	IMS_Overmind_Task_4 setSimpleTaskDescription ["<img align='center' image='textures\mission.paa' width='360' height='360'/><br/><br/><font color='#db3a49'>Mission Update:</font><br/>Download the datas from the laptop to your XM8 device.</font><br/>",
	"Overmind - [Part 4] Download Datas","Interact with server control laptop again."];
	IMS_Overmind_Task_4 setSimpleTaskType "download";
	IMS_Overmind_Task_4 setSimpleTaskDestination [16016.5,17022.6,0];
	IMS_Overmind_Task_4 setTaskState "Assigned";
	player setCurrentTask IMS_Overmind_Task_4;
};

IMS_Overmind_TaskEvent_4_End = {
	IMS_Overmind_Task_4 setTaskState "Succeeded";
};

IMS_Overmind_TaskEvent_5 = {
	IMS_Overmind_Task_5 = player createSimpleTask ["Overmind - [Part 5] Engines on!"];
	IMS_Overmind_Task_5 setSimpleTaskDescription ["<img align='center' image='textures\mission.paa' width='360' height='360'/><br/><br/><font color='#db3a49'>Mission Update:</font><br/>Find the local communication center and transfer the datas to the dead officers command center.</font><br/>",
	"Overmind - [Part 5] Engines On!","Interact with the generator."];
	IMS_Overmind_Task_5 setSimpleTaskType "interact";
	IMS_Overmind_Task_5 setSimpleTaskDestination [16006.7,16913,0];
	IMS_Overmind_Task_5 setTaskState "Assigned";
	player setCurrentTask IMS_Overmind_Task_5;
};

IMS_Overmind_TaskEvent_5_End = {
	IMS_Overmind_Task_5 setTaskState "Succeeded";
};

IMS_Overmind_TaskEvent_6 = {
	IMS_Overmind_Task_6 = player createSimpleTask ["Overmind - [Part 6] XM8 OS"];
	IMS_Overmind_Task_6 setSimpleTaskDescription ["<img align='center' image='textures\mission.paa' width='360' height='360'/><br/><br/><font color='#db3a49'>Mission Update:</font><br/>Activate the communication center computer system.</font><br/>",
	"Overmind - [Part 6] XM8 OS","Interact with the communication center computer."];
	IMS_Overmind_Task_6 setSimpleTaskType "interact";
	IMS_Overmind_Task_6 setSimpleTaskDestination [16008.6,16914,0];
	IMS_Overmind_Task_6 setTaskState "Assigned";
	player setCurrentTask IMS_Overmind_Task_6;
};

IMS_Overmind_TaskEvent_6_End = {
	IMS_Overmind_Task_6 setTaskState "Succeeded";
};

IMS_Overmind_TaskEvent_7 = {
	IMS_Overmind_Task_7 = player createSimpleTask ["Overmind - [Part 7] Upload the Datas"];
	IMS_Overmind_Task_7 setSimpleTaskDescription ["<img align='center' image='textures\mission.paa' width='360' height='360'/><br/><br/><font color='#db3a49'>Mission Update:</font><br/>Upload the research data to the communication center network.</font><br/>",
	"Overmind - [Part 7] Upload the Datas","Interact with the communication center computer keyboard."];
	IMS_Overmind_Task_7 setSimpleTaskType "upload";
	IMS_Overmind_Task_7 setSimpleTaskDestination [16008.4,16913,0];
	IMS_Overmind_Task_7 setTaskState "Assigned";
	player setCurrentTask IMS_Overmind_Task_7;
};

IMS_Overmind_TaskEvent_7_End = {
	IMS_Overmind_Task_7 setTaskState "Succeeded";
};

IMS_Overmind_TaskEvent_8 = {
	IMS_Overmind_Task_8 = player createSimpleTask ["Overmind - [Part 8] Power On!"];
	IMS_Overmind_Task_8 setSimpleTaskDescription ["<img align='center' image='textures\mission.paa' width='360' height='360'/><br/><br/><font color='#db3a49'>Mission Update:</font><br/>Activate the terminal to transfer the reasearch datas.</font><br/>",
	"Overmind - [Part 8] Power On!","Interact with the communication center terminal."];
	IMS_Overmind_Task_8 setSimpleTaskType "interact";
	IMS_Overmind_Task_8 setSimpleTaskDestination [16012.2,16916.3,1.44712];
	IMS_Overmind_Task_8 setTaskState "Assigned";
	player setCurrentTask IMS_Overmind_Task_8;
};

IMS_Overmind_TaskEvent_8_End = {
	IMS_Overmind_Task_8 setTaskState "Succeeded";
};

IMS_Overmind_TaskEvent_9 = {
	IMS_Overmind_Task_9 = player createSimpleTask ["Overmind - [Part 9] Transfer the Data"];
	IMS_Overmind_Task_9 setSimpleTaskDescription ["<img align='center' image='textures\mission.paa' width='360' height='360'/><br/><br/><font color='#db3a49'>Mission Update:</font><br/>Transfer the datas with the terminal now.</font><br/>",
	"Overmind - [Part 9] Transfer the Data","Interact with the communication center terminal again."];
	IMS_Overmind_Task_9 setSimpleTaskType "intel";
	IMS_Overmind_Task_9 setSimpleTaskDestination [16012.2,16916.3,1.44712];
	IMS_Overmind_Task_9 setTaskState "Assigned";
	player setCurrentTask IMS_Overmind_Task_9;
};

IMS_Overmind_TaskEvent_9_End = {
	IMS_Overmind_Task_9 setTaskState "Succeeded";
};

IMS_Overmind_TaskEvent_10 = {
	IMS_Overmind_Task_10 = player createSimpleTask ["Overmind - [Final] Run Boy Run!"];
	IMS_Overmind_Task_10 setSimpleTaskDescription ["<img align='center' image='textures\mission.paa' width='360' height='360'/><br/><br/><font color='#db3a49'>Mission Update:</font><br/>You recived a message from the dead officers command center.<br/>They thank you for your deeds and they send an attention over.<br/>But for now you should leafe the area fast! They plan to blow everything up!</font><br/>",
	"Overmind - [Final] Run Boy Run!","Run for your life and leafe the area to this point."];
	IMS_Overmind_Task_10 setSimpleTaskType "run";
	IMS_Overmind_Task_10 setSimpleTaskDestination [15871,16989.2,0];
	IMS_Overmind_Task_10 setTaskState "Assigned";
	player setCurrentTask IMS_Overmind_Task_10;
};

IMS_Overmind_TaskEvent_10_End = {
	IMS_Overmind_Task_10 setTaskState "Succeeded";
};

publicVariable "IMS_Overmind_TaskEvent_1";
publicVariable "IMS_Overmind_TaskEvent_1_End";
publicVariable "IMS_Overmind_TaskEvent_2";
publicVariable "IMS_Overmind_TaskEvent_2_End";
publicVariable "IMS_Overmind_TaskEvent_3";
publicVariable "IMS_Overmind_TaskEvent_3_End";
publicVariable "IMS_Overmind_TaskEvent_4";
publicVariable "IMS_Overmind_TaskEvent_4_End";
publicVariable "IMS_Overmind_TaskEvent_5";
publicVariable "IMS_Overmind_TaskEvent_5_End";
publicVariable "IMS_Overmind_TaskEvent_6";
publicVariable "IMS_Overmind_TaskEvent_6_End";
publicVariable "IMS_Overmind_TaskEvent_7";
publicVariable "IMS_Overmind_TaskEvent_7_End";
publicVariable "IMS_Overmind_TaskEvent_8";
publicVariable "IMS_Overmind_TaskEvent_8_End";
publicVariable "IMS_Overmind_TaskEvent_9";
publicVariable "IMS_Overmind_TaskEvent_9_End";
publicVariable "IMS_Overmind_TaskEvent_10";
publicVariable "IMS_Overmind_TaskEvent_10_End";