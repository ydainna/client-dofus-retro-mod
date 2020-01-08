//Crée par ydainna le : 08/01/2020 (whit adobe flash cs6)

//Le dossier du jeu se trouve dans : %appData%=>local=>Ankama=>Zaap=>Dofus retro
//Allez au dossier : retroclient dans ressources=>app.asar.unpacked

//Ajouter le code dans la partie : dofus.utils.consoleParsers => ChatConsoleParser (du loader ou du fichier core) (adapter celon besoin)
//Replace la fonction process ou ajouter si existe pas
//Dupliquer le dossier du jeu pour éviter les check updater
//*conseiller* Si besoin decomprésser le fichier app.asar mettre votre dossier mod retroclient à la place de l'autre et supprimer app.asar.unpacked

//**note** il vous faudra surement adapter selon votre model de modification 

#initclip 5
_loc1 = dofus.utils.consoleParsers.ChatConsoleParser.prototype;
_loc1.process = function (sCmd, oParams)
{
    super.process(sCmd, oParams);
    sCmd = this.parseSpecialDatas(sCmd);
    if (sCmd.charAt(0) == "/")
    {
        var _loc3 = sCmd.split(" ");
        var _loc11 = _loc3[0].substr(1).toUpperCase();
        _loc3.splice(0, 1);
        while (_loc3[0].length == 0)
        {
            _loc3.splice(0, 1);
        } // end while
        switch (_loc11)
        {
            case "HELP":
            case "H":
            case "?":
            {
                this.api.kernel.showMessage(undefined, this.api.lang.getText("COMMANDS_HELP"), "INFO_CHAT");
                break;
            } 
            case "VERSION":
            case "VER":
            case "ABOUT":
            {
                var _loc4 = "--------------------------------------------------------------\n";
                _loc4 = _loc4 + ("<b>DOFUS Client v" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION + "</b> (build " + dofus.Constants.BUILD_NUMBER + ")");
                if (dofus.Constants.BETAVERSION > 0)
                {
                    _loc4 = _loc4 + (" <b><font color=\"#FF0000\">BETA VERSION " + dofus.Constants.BETAVERSION + "</font></b>");
                } // end if
                _loc4 = _loc4 + ("\n(c) ANKAMA GAMES (" + dofus.Constants.VERSIONDATE + ")\n");
                _loc4 = _loc4 + ("Flash player " + System.capabilities.version + "\n");
                if (dofus.Constants.CORE_MODULES_INFOS.length > 0)
                {
                    _loc4 = _loc4 + "Core modules : ";
                    var _loc5 = 0;
                    while (_loc5 < dofus.Constants.CORE_MODULES_INFOS.length)
                    {
                        var _loc7 = dofus.Constants.CORE_MODULES_INFOS[_loc5];
                        _loc4 = _loc4 + _loc7.name + " v" + _loc7.version;
                        if (_loc5 + 1 < dofus.Constants.CORE_MODULES_INFOS.length)
                        {
                            _loc4 = _loc4 + ", ";
                        } // end if
                        ++_loc5;
                    } // end while
                    _loc4 = _loc4 + "\n";
                } // end if
                _loc4 = _loc4 + "--------------------------------------------------------------";
                this.api.kernel.showMessage(undefined, _loc4, "INFO_CHAT");
                break;
            } 
            case "T":
            {
                this.api.network.Chat.send(_loc3.join(" "), "#", oParams);
                break;
            } 
            case "G":
            {
                if (this.api.datacenter.Player.guildInfos != undefined)
                {
                    this.api.network.Chat.send(_loc3.join(" "), "%", oParams);
                } // end if
                break;
            } 
            case "P":
            {
                if (this.api.ui.getUIComponent("Party") != undefined)
                {
                    this.api.network.Chat.send(_loc3.join(" "), "$", oParams);
                } // end if
                break;
            } 
            case "A":
            {
                this.api.network.Chat.send(_loc3.join(" "), "!", oParams);
                break;
            } 
            case "R":
            {
                this.api.network.Chat.send(_loc3.join(" "), "?", oParams);
                break;
            } 
            case "B":
            {
                this.api.network.Chat.send(_loc3.join(" "), ":", oParams);
                break;
            } 
            case "I":
            {
                this.api.network.Chat.send(_loc3.join(" "), "^", oParams);
                break;
            } 
            case "Q":
            {
                this.api.network.Chat.send(_loc3.join(" "), "@", oParams);
            } 
            case "M":
            {
                this.api.network.Chat.send(_loc3.join(" "), "¤", oParams);
                break;
            } 
            case "W":
            case "MSG":
            case "WHISPER":
            {
                if (_loc3.length < 2)
                {
                    this.api.kernel.showMessage(undefined, this.api.lang.getText("SYNTAX_ERROR", [" /w &lt;" + this.api.lang.getText("NAME") + "&gt; &lt;" + this.api.lang.getText("MSG") + "&gt;"]), "ERROR_CHAT");
                    break;
                } // end if
                var _loc16 = _loc3[0];
                if (_loc16.length < 2)
                {
                    this.api.kernel.showMessage(undefined, this.api.lang.getText("SYNTAX_ERROR", [" /w &lt;" + this.api.lang.getText("NAME") + "&gt; &lt;" + this.api.lang.getText("MSG") + "&gt;"]), "ERROR_CHAT");
                    break;
                } // end if
                _loc3.shift();
                var _loc20 = _loc3.join(" ");
                this.pushWhisper("/w " + _loc16 + " ");
                this.api.network.Chat.send(_loc20, _loc16, oParams);
                break;
            } 
            case "WHOAMI":
            {
                this.api.network.Basics.whoAmI();
                break;
            } 
            case "WHOIS":
            {
                if (_loc3.length == 0)
                {
                    this.api.kernel.showMessage(undefined, this.api.lang.getText("SYNTAX_ERROR", [" /whois &lt;" + this.api.lang.getText("NAME") + "&gt;"]), "ERROR_CHAT");
                    break;
                } // end if
                this.api.network.Basics.whoIs(_loc3[0]);
                break;
            } 
            case "F":
            case "FRIEND":
            case "FRIENDS":
            {
                switch (_loc3[0].toUpperCase())
                {
                    case "A":
                    case "+":
                    {
                        this.api.network.Friends.addFriend(_loc3[1]);
                        break;
                    } 
                    case "D":
                    case "R":
                    case "-":
                    {
                        this.api.network.Friends.removeFriend(_loc3[1]);
                        break;
                    } 
                    case "L":
                    {
                        this.api.network.Friends.getFriendsList();
                        break;
                    } 
                    default:
                    {
                        this.api.kernel.showMessage(undefined, this.api.lang.getText("SYNTAX_ERROR", [" /f &lt;A/D/L&gt; &lt;" + this.api.lang.getText("NAME") + "&gt;"]), "ERROR_CHAT");
                        break;
                    } 
                } // End of switch
                break;
            } 
            case "IGNORE":
            case "ENEMY":
            {
                switch (_loc3[0].toUpperCase())
                {
                    case "A":
                    case "+":
                    {
                        this.api.network.Enemies.addEnemy(_loc3[1]);
                        break;
                    } 
                    case "D":
                    case "R":
                    case "-":
                    {
                        this.api.network.Enemies.removeEnemy(_loc3[1]);
                        break;
                    } 
                    case "L":
                    {
                        this.api.network.Enemies.getEnemiesList();
                        break;
                    } 
                    default:
                    {
                        this.api.kernel.showMessage(undefined, this.api.lang.getText("SYNTAX_ERROR", [" /f &lt;A/D/L&gt; &lt;" + this.api.lang.getText("NAME") + "&gt;"]), "ERROR_CHAT");
                        break;
                    } 
                } // End of switch
                break;
            } 
            case "PING":
            {
                this.api.network.ping();
                break;
            } 
            case "GOD":
            case "GODMODE":
            {
                var _loc18 = ["Bill", "Tyn", "Nyx", "Lichen", "Simsoft", "Kam", "ToT", "Sispano"];
                this.api.kernel.showMessage(undefined, _loc18[Math.floor(Math.random() * _loc18.length)], "INFO_CHAT");
                break;
            } 
            case "APING":
            {
                this.api.kernel.showMessage(undefined, "Average ping : " + this.api.network.getAveragePing() + "ms (on " + this.api.network.getAveragePingPacketsCount() + " packets)", "INFO_CHAT");
                break;
            } 
            case "MAPID":
            {
                this.api.kernel.showMessage(undefined, "MAP ID : " + this.api.datacenter.Map.id, "INFO_CHAT");
                if (this.api.datacenter.Player.isAuthorized)
                {
                    this.api.kernel.showMessage(undefined, "Area : " + this.api.datacenter.Map.area, "INFO_CHAT");
                    this.api.kernel.showMessage(undefined, "Sub area : " + this.api.datacenter.Map.subarea, "INFO_CHAT");
                    this.api.kernel.showMessage(undefined, "Super Area : " + this.api.datacenter.Map.superarea, "INFO_CHAT");
                } // end if
                break;
            } 
            case "CELLID":
            {
                this.api.kernel.showMessage(undefined, "CELL ID : " + this.api.datacenter.Player.data.cellNum, "INFO_CHAT");
                break;
            } 
            case "TIME":
            {
                this.api.kernel.showMessage(undefined, this.api.kernel.NightManager.date + " - " + this.api.kernel.NightManager.time, "INFO_CHAT");
                break;
            } 
            case "LIST":
            case "PLAYERS":
            {
                if (!this.api.datacenter.Game.isFight)
                {
                    this.api.kernel.showMessage(undefined, this.api.lang.getText("CANT_DO_COMMAND_HERE", [_loc11]), "ERROR_CHAT");
                    return;
                } // end if
                var _loc13 = new Array();
                var _loc8 = this.api.datacenter.Sprites.getItems();
                for (var _loc15 in _loc8)
                {
                    if (_loc8[_loc15] instanceof dofus.datacenter.Character)
                    {
                        _loc13.push("- " + _loc8[_loc15].name);
                    } // end if
                } // end of for...in
                this.api.kernel.showMessage(undefined, this.api.lang.getText("PLAYERS_LIST") + " :\n" + _loc13.join("\n"), "INFO_CHAT");
                break;
            } 
            case "KICK":
            {
                if (!this.api.datacenter.Game.isFight || this.api.datacenter.Game.isRunning)
                {
                    this.api.kernel.showMessage(undefined, this.api.lang.getText("CANT_DO_COMMAND_HERE", [_loc11]), "ERROR_CHAT");
                    return;
                } // end if
                var _loc12 = String(_loc3[0]);
                var _loc6 = this.api.datacenter.Sprites.getItems();
                for (var _loc15 in _loc6)
                {
                    if (_loc6[_loc15] instanceof dofus.datacenter.Character && _loc6[_loc15].name == _loc12)
                    {
                        var _loc10 = _loc6[_loc15].id;
                        break;
                    } // end if
                } // end of for...in
                if (_loc10 != undefined)
                {
                    this.api.network.Game.leave(_loc10);
                }
                else
                {
                    this.api.kernel.showMessage(undefined, this.api.lang.getText("CANT_KICK_A", [_loc12]), "ERROR_CHAT");
                } // end else if
                break;
            } 
            case "SPECTATOR":
            case "S":
            {
                if (!this.api.datacenter.Game.isRunning || this.api.datacenter.Game.isSpectator)
                {
                    this.api.kernel.showMessage(undefined, this.api.lang.getText("CANT_DO_COMMAND_HERE", [_loc11]), "ERROR_CHAT");
                    return;
                } // end if
                this.api.network.Fights.blockSpectators();
                break;
            } 
            case "AWAY":
            {
                this.api.network.Basics.away();
                break;
            } 
            case "INVISIBLE":
            {
                this.api.network.Basics.invisible();
                break;
            } 
            case "INVITE":
            {
                var _loc17 = String(_loc3[0]);
                if (_loc17.length == 0 || _loc17 == undefined)
                {
                    break;
                } // end if
                this.api.network.Party.invite(_loc17);
                break;
            } 
            case "CONSOLE":
            {
                this.api.ui.loadUIComponent("Debug", "Debug", undefined, {bAlwaysOnTop: true});
                break;
            } 
            case "DEBUG":
            {
                if (this.api.datacenter.Player.isAuthorized)
                {
                    this.api.kernel.DebugManager.toggleDebug();
                } // end if
                break;
            } 
            case "CHANGECHARACTER":
            {
                this.api.kernel.changeServer();
                break;
            } 
            case "LOGOUT":
            {
                this.api.kernel.disconnect();
                break;
            } 
            case "QUIT":
            {
                this.api.kernel.quit();
                break;
            } 
            case "THINK":
            case "METHINK":
            case "PENSE":
            case "TH":
            {
                if (_loc3.length < 1)
                {
                    this.api.kernel.showMessage(undefined, this.api.lang.getText("SYNTAX_ERROR", [" /" + _loc11.toLowerCase() + " &lt;" + this.api.lang.getText("TEXT_WORD") + "&gt;"]), "ERROR_CHAT");
                    break;
                } // end if
                var _loc23 = "!THINK!" + _loc3.join(" ");
                if (this.api.datacenter.Player.canChatToAll)
                {
                    this.api.network.Chat.send(_loc23, "*", oParams);
                } // end if
                break;
            } 
            case "ME":
            case "EM":
            case "MOI":
            case "EMOTE":
            {
                if (!this.api.lang.getConfigText("EMOTES_ENABLED"))
                {
                    this.api.kernel.showMessage(undefined, this.api.lang.getText("UNKNOW_COMMAND", [_loc11]), "ERROR_CHAT");
                    break;
                } // end if
                if (_loc3.length < 1)
                {
                    this.api.kernel.showMessage(undefined, this.api.lang.getText("SYNTAX_ERROR", [" /" + _loc11.toLowerCase() + " &lt;" + this.api.lang.getText("TEXT_WORD") + "&gt;"]), "ERROR_CHAT");
                    break;
                } // end if
                var _loc22 = _loc3.join(" ");
                if (this.api.datacenter.Player.canChatToAll)
                {
                    this.api.network.Chat.send(dofus.Constants.EMOTE_CHAR + _loc22 + dofus.Constants.EMOTE_CHAR, "*", oParams);
                } // end if
                break;
            } 
            case "KB":
            {
                this.api.ui.loadUIComponent("KnownledgeBase", "KnownledgeBase");
                break;
            } 
            case "RELEASE":
            {
                if (this.api.datacenter.Player.data.isTomb)
                {
                    this.api.network.Game.freeMySoul();
                }
                else if (this.api.datacenter.Player.data.isSlow)
                {
                    this.api.kernel.showMessage(undefined, this.api.lang.getText("ERROR_ALREADY_A_GHOST"), "ERROR_CHAT");
                }
                else
                {
                    this.api.kernel.showMessage(undefined, this.api.lang.getText("ERROR_NOT_DEAD_AT_LEAST_FOR_NOW"), "ERROR_CHAT");
                } // end else if
                break;
            } 
            case "SELECTION":
            {
                if (_loc3[0] == "enable" || _loc3[0] == "on")
                {
                    this.api.ui.getUIComponent("Banner").setSelectable(true);
                }
                else if (_loc3[0] == "disable" || _loc3[0] == "off")
                {
                    this.api.ui.getUIComponent("Banner").setSelectable(false);
                }
                else
                {
                    this.api.kernel.showMessage(undefined, this.api.lang.getText("SYNTAX_ERROR", ["/selection [enable|on|disable|off]"]), "ERROR_CHAT");
                } // end else if
                break;
            } 
            case "WTF":
            case "DOFUS2":
            {
                this.api.kernel.showMessage(undefined, "(°~°)", "ERROR_BOX");
                break;
            } 
            case "CLS":
            case "CLEAR":
            {
                this.api.kernel.ChatManager.clear();
                this.api.kernel.ChatManager.refresh(true);
                break;
            } 
            case "TACTIC":
            {
                if (this.api.datacenter.Player.isAuthorized || this.api.datacenter.Game.isFight)
                {
                    this.api.network.Game.changeTacticModeState();
                    var _loc21 = this.api.network.Game._bTacticMode;
                    this.api.ui.getUIComponent("FightOptionButtons")._btnTactic.selected = _loc21;
                } // end if
                break;
            } 
            case "SNOW":
            {
                amount = 100;
                mWidth = Stage.width;
                mHeight = Stage.height;
                var i = 0;
                while (i < amount)
                {
                    thisFlake = this.attachMovie("flake", "flake" + i, i);
                    with (thisFlake)
                    {
                        _x = Math.random() * mWidth;
                        _y = Math.random() * mHeight;
                        _xscale = _yscale = _alpha = 40 + Math.random() * 60;
                    } // End of with
                    thisFlake.yspeed = Math.random() * 2 + 0.200000;
                    thisFlake.increment = -0.025000 + Math.random() * 0.050000;
                    thisFlake.radian = 0;
                    thisFlake.onEnterFrame = function ()
                    {
                        var _loc2 = this;
                        _loc2.radians = _loc2.radians + _loc2.increment;
                        _loc2._x = _loc2._x + Math.sin(_loc2.radians);
                        _loc2._y = _loc2._y + _loc2.yspeed;
                        if (_loc2._y >= mHeight)
                        {
                            _loc2._y = -10;
                            _loc2._x = -10 + Math.random() * mWidth;
                        } // end if
                        if (_loc2._x >= mWidth || _loc2._x <= 0)
                        {
                            _loc2._y = -10;
                            _loc2._x = -10 + Math.random() * mWidth;
                        } // end if
                    };
                    ++i;
                } // end while
                break;
            } 
            case "SPEAKINGITEM":
            {
                if (this.api.datacenter.Player.isAuthorized)
                {
                    this.api.kernel.showMessage(undefined, "Count : " + this.api.kernel.SpeakingItemsManager.nextMsgDelay, "ERROR_CHAT");
                    break;
                } // end if
            } 
            default:
            {
                var _loc19 = this.api.lang.getEmoteID(_loc11.toLowerCase());
                if (_loc19 != undefined)
                {
                    this.api.network.Emotes.useEmote(_loc19);
                }
                else
                {
                    this.api.kernel.showMessage(undefined, this.api.lang.getText("UNKNOW_COMMAND", [_loc11]), "ERROR_CHAT");
                } // end else if
                break;
            } 
        } // End of switch
    }
    else if (this.api.datacenter.Player.canChatToAll)
    {
        this.api.network.Chat.send(sCmd, "*", oParams);
    } // end else if
};
#endinitclip
