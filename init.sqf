//Disable Saving
enableSaving [false, false];
//AI STFU
enableSentences false;
//Radio Report
0 fadeRadio 0;

if (isServer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\show_fps.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\show_fps.sqf";
};

missionNamespace setVariable ["BIS_respSpecAi",true];
missionNamespace setVariable ["BIS_respSpecAllowFreeCamera",true];
missionNamespace setVariable ["BIS_respSpecAllow3PPCamera",true];
missionNamespace setVariable ["BIS_respSpecShowFocus",true];
missionNamespace setVariable ["BIS_respSpecShowCameraButtons",true];
missionNamespace setVariable ["BIS_respSpecShowControlsHelper",true];
missionNamespace setVariable ["BIS_respSpecShowHeader",true];
missionNamespace setVariable ["BIS_respSpecLists",true];

tf_west_radio_code="_zlo";
tf_east_radio_code="_zlo";
tf_guer_radio_code="_zlo";

// MAKE SURE THE PLAYER INITIALIZES PROPERLY



if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};  
};

player createDiarySubject ["Saber Group","Saber Group"];
player createDiaryRecord ["Saber Group", ["Saber Group","Saber Group Information<br />1. No info<br />2. No info<br />3. No info"]];

player disableConversation true;
player setSpeaker "NoVoice";
showSubtitles false;
// Radio Protocol disabled
player disableAI "RADIOPROTOCOL";
allPlayers disableAI "RADIOPROTOCOL";