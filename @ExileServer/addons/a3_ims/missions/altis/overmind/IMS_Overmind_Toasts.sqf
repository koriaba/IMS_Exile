/*
    IMS_raidToasts.sqf
    Written by Salutesh
    www.reality-gaming.eu
	
    Description: Toast notifications for the fortress mission.  
*/
IMS_Overmind_Toast2_Terminal = {
	["SuccessTitleAndText", ["<t color='#a0df3b' font='PuristaSemiBold'>Interaction</t>", format ["<t color='#fbfcfe' font='PuristaSemiBold'>Transfer complete!</t>"]]] call ExileClient_gui_toaster_addTemplateToast;
};

IMS_Overmind_Toast1_Terminal = {
	["SuccessTitleAndText", ["<t color='#a0df3b' font='PuristaSemiBold'>Interaction</t>", format ["<t color='#fbfcfe' font='PuristaSemiBold'>Terminal activated!</t>"]]] call ExileClient_gui_toaster_addTemplateToast;
};

IMS_Overmind_Toast_Keyboard = {
	["SuccessTitleAndText", ["<t color='#a0df3b' font='PuristaSemiBold'>XM8 OS</t>", format ["<t color='#fbfcfe' font='PuristaSemiBold'>Transfer complete!</t>"]]] call ExileClient_gui_toaster_addTemplateToast;
};

IMS_Overmind_Toast_PC = {
	["SuccessTitleAndText", ["<t color='#a0df3b' font='PuristaSemiBold'>Interaction</t>", format ["<t color='#fbfcfe' font='PuristaSemiBold'>Computer activated and online!</t>"]]] call ExileClient_gui_toaster_addTemplateToast;
};

IMS_Overmind_Toast_Generator = {
	["SuccessTitleAndText", ["<t color='#a0df3b' font='PuristaSemiBold'>Interaction</t>", format ["<t color='#fbfcfe' font='PuristaSemiBold'>Generator activated and power online!</t>"]]] call ExileClient_gui_toaster_addTemplateToast;
};

IMS_Overmind_Toast_Tablet = {
	["SuccessTitleAndText", ["<t color='#a0df3b' font='PuristaSemiBold'>Interaction</t>", format ["<t color='#fbfcfe' font='PuristaSemiBold'>You have recived the security intel. You have now authorization to access different buildings in this area.</t>"]]] call ExileClient_gui_toaster_addTemplateToast;
};

IMS_Overmind_Toast1_Laptop = {
	["InfoTitleAndText", ["<t color='#3fd4fc' font='PuristaSemiBold'>XM8 OS</t>", format ["<t color='#fbfcfe' font='PuristaSemiBold'>Download started! Please wait..</t>"]]] call ExileClient_gui_toaster_addTemplateToast;
};

IMS_Overmind_Toast2_Laptop = {
	["SuccessTitleAndText", ["<t color='#a0df3b' font='PuristaSemiBold'>XM8 OS</t>", format ["<t color='#fbfcfe' font='PuristaSemiBold'>Download complete!</t>"]]] call ExileClient_gui_toaster_addTemplateToast;
};

IMS_Overmind_Toast3_Laptop = {
	["SuccessTitleAndText", ["<t color='#a0df3b' font='PuristaSemiBold'>Interaction</t>", format ["<t color='#fbfcfe' font='PuristaSemiBold'>You have recived the research data!</t>"]]] call ExileClient_gui_toaster_addTemplateToast;
};

IMS_Overmind_Toast_Unlocked = {
	["SuccessTitleAndText", ["<t color='#a0df3b' font='PuristaSemiBold'>Unlocked</t>", format ["<t color='#fbfcfe' font='PuristaSemiBold'>Building is unlocked now!</t>"]]] call ExileClient_gui_toaster_addTemplateToast;
};

IMS_Overmind_Toast_Locked = {
	["SuccessTitleAndText", ["<t color='#a0df3b' font='PuristaSemiBold'>Locked</t>", format ["<t color='#fbfcfe' font='PuristaSemiBold'>Building is locked now!</t>"]]] call ExileClient_gui_toaster_addTemplateToast;
};


publicVariable "IMS_Overmind_Toast1_Laptop";
publicVariable "IMS_Overmind_Toast2_Laptop";
publicVariable "IMS_Overmind_Toast3_Laptop";
publicVariable "IMS_Overmind_Toast_Locked";
publicVariable "IMS_Overmind_Toast_Unlocked";
publicVariable "IMS_Overmind_Toast_Tablet";
publicVariable "IMS_Overmind_Toast_Generator";
publicVariable "IMS_Overmind_Toast_PC";
publicVariable "IMS_Overmind_Toast_Keyboard";
publicVariable "IMS_Overmind_Toast1_Terminal";
publicVariable "IMS_Overmind_Toast2_Terminal";