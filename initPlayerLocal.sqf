[] spawn {
    _adjustLight = {
        CHBN_adjustBrightness = CHBN_adjustBrightness max 0 min 1;
        _brightness = if (CHBN_adjustBrightness > 0) then {200 * abs (1 - (2 ^ CHBN_adjustBrightness))} else {0};
        CHBN_light setLightAttenuation [10e10,(30000 / (_brightness max 10e-10)),4.31918e-005,4.31918e-005];
        CHBN_light setLightAmbient CHBN_adjustColor;
    };
    
    waitUntil {time > 0};
    if (missionNamespace getVariable ["CHBN_running",false]) exitWith {systemChat "CHBN script is running. Addon disabled."};
    CHBN_running = true;
    
    CHBN_adjustBrightness = missionNamespace getVariable ["CHBN_adjustBrightness",0.5]; // edit the level of brightness here, set to 1, can be 0.1 to however high you want it
    CHBN_adjustColor = missionNamespace getVariable ["CHBN_adjustColor",[0.5,0.7,1]];

    if (!isNil "CHBN_light") then {deleteVehicle CHBN_light};
    CHBN_light = "#lightpoint" createVehicleLocal [0,0,0];
    CHBN_light setLightBrightness 1;
    CHBN_light setLightDayLight false;
    call _adjustLight;

    for "_i" from 0 to 1 step 0 do {
        _adjustBrightness = CHBN_adjustBrightness;
        _adjustColor = CHBN_adjustColor;
        waitUntil {!(_adjustBrightness isEqualTo CHBN_adjustBrightness) || !(_adjustColor isEqualTo CHBN_adjustColor)};
        call _adjustLight;
    };
};
//new scripts
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups; // Initializes the player/client side Dynamic Groups framework

player disableConversation true;
player setSpeaker "NoVoice";
showSubtitles false;

// Radio Protocol disabled
player disableAI "RADIOPROTOCOL";
allPlayers disableAI "RADIOPROTOCOL";

if(!isDedicated) then 
{
 ﻿﻿   waitUntil {!isNull﻿﻿﻿﻿﻿ (findDisplay 46)}; // Wait for main display
    if((difficultyOption "thirdPersonView") isEqualTo 1) then 
    {
        while {true} do 
        {
 ﻿           waitUntil {cameraView isEqualTo "EXTERNAL" || cameraView isEqualTo "GROUP"};
            if((vehicle player) isEqualTo player) then 
            {
                player switchCamera "INTERNAL";
            };
        };
    };
};