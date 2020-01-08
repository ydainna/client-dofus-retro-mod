//Crée par ydainna le : 08/01/2020 (whit adobe flash cs6)

//Le dossier du jeu se trouve dans : %appData%=>local=>Ankama=>Zaap=>Dofus retro
//Allez au dossier : retroclient dans ressources=>app.asar.unpacked

//Ajouter le code dans la partie : dofus.aks => Game (du loader ou du fichier core) (adapter celon besoin)
//Replace la fonction onMovement ou si elle existe pas ajoutée celle-ci
//*conseiller* Si besoin decomprésser le fichier app.asar mettre votre dossier mod retroclient à la place de l'autre et supprimer app.asar.unpacked

//**note** il vous faudra surement adapter selon votre model de modification 

_loc1.onMovement = function (sExtraData, bIsSummoned)
{
    var _loc82 = sExtraData.split("|");
    for (var _loc39 = 0; _loc39 < _loc82.length; _loc39 = _loc39 + 1)
    {
        var _loc54 = _loc82[_loc39];
        if (_loc54.length == 0)
        {
            continue;
        } // end if
        var _loc53 = false;
        var _loc38 = false;
        var _loc58 = _loc54.charAt(0);
        if (_loc58 == "+")
        {
            _loc38 = true;
        }
        else if (_loc58 == "~")
        {
            _loc38 = true;
            _loc53 = true;
        }
        else if (_loc58 != "-")
        {
            continue;
        } // end else if
        if (_loc38)
        {
            var _loc3 = _loc54.substr(1).split(";");
            var _loc25 = _loc3[0];
            var _loc26 = _loc3[1];
            var _loc73 = Number(_loc3[2]);
            var _loc6 = _loc3[3];
            var _loc14 = _loc3[4];
            if (!_loc53 && _loc14.charAt(0) == "[")
            {
                this.api.kernel.showMessage(undefined, "Le joueur <b>" + this.getLinkName(_loc14, _loc6) + "</b> est sur la carte.", "ERROR_CHAT");
            } // end if
            var _loc79 = _loc3[5];
            var _loc18 = _loc3[6];
            var _loc59 = false;
            var _loc68 = true;
            if (_loc18.charAt(_loc18.length - 1) == "*")
            {
                _loc18 = _loc18.substr(0, _loc18.length - 1);
                _loc59 = true;
            } // end if
            if (_loc18.charAt(0) == "*")
            {
                _loc68 = false;
                _loc18 = _loc18.substr(1);
            } // end if
            var _loc47 = _loc18.split("^");
            var _loc20 = _loc47.length == 2 ? (_loc47[0]) : (_loc18);
            var _loc61 = _loc79.split(",");
            var _loc15 = _loc61[0];
            var _loc70 = _loc61[1];
            var _loc80;
            if (_loc70.length)
            {
                var _loc69 = _loc70.split("*");
                _loc80 = new dofus.datacenter.Title(_global.parseInt(_loc69[0]), _loc69[1]);
            } // end if
            var _loc22 = 100;
            var _loc21 = 100;
            if (_loc47.length == 2)
            {
                var _loc56 = _loc47[1];
                if (_global.isNaN(Number(_loc56)))
                {
                    var _loc43 = _loc56.split("x");
                    _loc22 = _loc43.length == 2 ? (Number(_loc43[0])) : (100);
                    _loc21 = _loc43.length == 2 ? (Number(_loc43[1])) : (100);
                }
                else
                {
                    _loc21 = Number(_loc56);
                    _loc22 = Number(_loc56);
                } // end if
            } // end else if
            if (_loc53)
            {
                var _loc11 = this.api.datacenter.Sprites.getItemAt(_loc6);
                this.onSpriteMovement(false, _loc11);
            } // end if
            switch (_loc15)
            {
                case "-1":
                case "-2":
                {
                    var _loc8 = new Object();
                    _loc8.spriteType = _loc15;
                    _loc8.gfxID = _loc20;
                    _loc8.scaleX = _loc22;
                    _loc8.scaleY = _loc21;
                    _loc8.noFlip = _loc59;
                    _loc8.cell = _loc25;
                    _loc8.dir = _loc26;
                    _loc8.powerLevel = _loc3[7];
                    _loc8.color1 = _loc3[8];
                    _loc8.color2 = _loc3[9];
                    _loc8.color3 = _loc3[10];
                    _loc8.accessories = _loc3[11];
                    if (this.api.datacenter.Game.isFight)
                    {
                        _loc8.LP = _loc3[12];
                        _loc8.AP = _loc3[13];
                        _loc8.MP = _loc3[14];
                        if (_loc3.length > 18)
                        {
                            _loc8.resistances = new Array(Number(_loc3[15]), Number(_loc3[16]), Number(_loc3[17]), Number(_loc3[18]), Number(_loc3[19]), Number(_loc3[20]), Number(_loc3[21]));
                            _loc8.team = _loc3[22];
                        }
                        else
                        {
                            _loc8.team = _loc3[15];
                        } // end else if
                        _loc8.summoned = bIsSummoned;
                    } // end if
                    if (_loc15 == -1)
                    {
                        _loc11 = this.api.kernel.CharactersManager.createCreature(_loc6, _loc14, _loc8);
                    }
                    else
                    {
                        _loc11 = this.api.kernel.CharactersManager.createMonster(_loc6, _loc14, _loc8);
                    } // end else if
                    break;
                } 
                case "-3":
                {
                    var _loc5 = new Object();
                    _loc5.spriteType = _loc15;
                    _loc5.level = _loc3[7];
                    _loc5.scaleX = _loc22;
                    _loc5.scaleY = _loc21;
                    _loc5.noFlip = _loc59;
                    _loc5.cell = Number(_loc25);
                    _loc5.dir = _loc26;
                    var _loc23 = _loc3[8].split(",");
                    _loc5.color1 = _loc23[0];
                    _loc5.color2 = _loc23[1];
                    _loc5.color3 = _loc23[2];
                    _loc5.accessories = _loc3[9];
                    _loc5.bonusValue = _loc73;
                    var _loc60 = this.sliptGfxData(_loc18);
                    var _loc34 = _loc60.gfx;
                    this.splitGfxForScale(_loc34[0], _loc5);
                    _loc11 = this.api.kernel.CharactersManager.createMonsterGroup(_loc6, _loc14, _loc5);
                    if (this.api.kernel.OptionsManager.getOption("ViewAllMonsterInGroup") == true)
                    {
                        var _loc67 = _loc6;
                        var _loc9 = 1;
                        for (var _loc9 = 1; _loc9 < _loc34.length; ++_loc9)
                        {
                            if (_loc34[_loc39] == "")
                            {
                                continue;
                            } // end if
                            this.splitGfxForScale(_loc34[_loc9], _loc5);
                            _loc23 = _loc3[8 + 2 * _loc9].split(",");
                            _loc5.color1 = _loc23[0];
                            _loc5.color2 = _loc23[1];
                            _loc5.color3 = _loc23[2];
                            _loc5.dir = random(4) * 2 + 1;
                            _loc5.accessories = _loc3[9 + 2 * _loc9];
                            var _loc30 = _loc6 + "_" + _loc9;
                            var _loc16 = this.api.kernel.CharactersManager.createMonsterGroup(_loc30, undefined, _loc5);
                            var _loc29 = _loc67;
                            if (random(3) != 0 && _loc9 != 1)
                            {
                                _loc29 = _loc6 + "_" + (random(_loc9 - 1) + 1);
                            } // end if
                            var _loc28 = random(8);
                            this.api.gfx.addLinkedSprite(_loc30, _loc29, _loc28, _loc16);
                            if (!_global.isNaN(_loc16.scaleX))
                            {
                                this.api.gfx.setSpriteScale(_loc16.id, _loc16.scaleX, _loc16.scaleY);
                            } // end if
                            switch (_loc60.shape)
                            {
                                case "circle":
                                {
                                    _loc28 = _loc9;
                                    break;
                                } 
                                case "line":
                                {
                                    _loc29 = _loc30;
                                    _loc28 = 2;
                                    break;
                                } 
                            } // End of switch
                        } // end of for
                    } // end if
                    break;
                } 
                case "-4":
                {
                    var _loc13 = new Object();
                    _loc13.spriteType = _loc15;
                    _loc13.gfxID = _loc20;
                    _loc13.scaleX = _loc22;
                    _loc13.scaleY = _loc21;
                    _loc13.cell = _loc25;
                    _loc13.dir = _loc26;
                    _loc13.sex = _loc3[7];
                    _loc13.color1 = _loc3[8];
                    _loc13.color2 = _loc3[9];
                    _loc13.color3 = _loc3[10];
                    _loc13.accessories = _loc3[11];
                    _loc13.extraClipID = _loc3[12] != undefined && !_global.isNaN(Number(_loc3[12])) ? (Number(_loc3[12])) : (-1);
                    _loc13.customArtwork = Number(_loc3[13]);
                    _loc11 = this.api.kernel.CharactersManager.createNonPlayableCharacter(_loc6, Number(_loc14), _loc13);
                    break;
                } 
                case "-5":
                {
                    var _loc12 = new Object();
                    _loc12.spriteType = _loc15;
                    _loc12.gfxID = _loc20;
                    _loc12.scaleX = _loc22;
                    _loc12.scaleY = _loc21;
                    _loc12.cell = _loc25;
                    _loc12.dir = _loc26;
                    _loc12.color1 = _loc3[7];
                    _loc12.color2 = _loc3[8];
                    _loc12.color3 = _loc3[9];
                    _loc12.accessories = _loc3[10];
                    _loc12.guildName = _loc3[11];
                    _loc12.emblem = _loc3[12];
                    _loc12.offlineType = _loc3[13];
                    _loc11 = this.api.kernel.CharactersManager.createOfflineCharacter(_loc6, _loc14, _loc12);
                    break;
                } 
                case "-6":
                {
                    var _loc10 = new Object();
                    _loc10.spriteType = _loc15;
                    _loc10.gfxID = _loc20;
                    _loc10.scaleX = _loc22;
                    _loc10.scaleY = _loc21;
                    _loc10.cell = _loc25;
                    _loc10.dir = _loc26;
                    _loc10.level = _loc3[7];
                    if (this.api.datacenter.Game.isFight)
                    {
                        _loc10.LP = _loc3[8];
                        _loc10.AP = _loc3[9];
                        _loc10.MP = _loc3[10];
                        _loc10.resistances = new Array(Number(_loc3[11]), Number(_loc3[12]), Number(_loc3[13]), Number(_loc3[14]), Number(_loc3[15]), Number(_loc3[16]), Number(_loc3[17]));
                        _loc10.team = _loc3[18];
                    }
                    else
                    {
                        _loc10.guildName = _loc3[8];
                        _loc10.emblem = _loc3[9];
                    } // end else if
                    _loc11 = this.api.kernel.CharactersManager.createTaxCollector(_loc6, _loc14, _loc10);
                    break;
                } 
                case "-7":
                case "-8":
                {
                    var _loc7 = new Object();
                    _loc7.spriteType = _loc15;
                    _loc7.gfxID = _loc20;
                    _loc7.scaleX = _loc22;
                    _loc7.scaleY = _loc21;
                    _loc7.cell = _loc25;
                    _loc7.dir = _loc26;
                    _loc7.sex = _loc3[7];
                    _loc7.powerLevel = _loc3[8];
                    _loc7.accessories = _loc3[9];
                    if (this.api.datacenter.Game.isFight)
                    {
                        _loc7.LP = _loc3[10];
                        _loc7.AP = _loc3[11];
                        _loc7.MP = _loc3[12];
                        _loc7.team = _loc3[20];
                    }
                    else
                    {
                        _loc7.emote = _loc3[10];
                        _loc7.emoteTimer = _loc3[11];
                        _loc7.restrictions = Number(_loc3[12]);
                    } // end else if
                    if (_loc15 == "-8")
                    {
                        _loc7.showIsPlayer = true;
                        var _loc62 = _loc14.split("~");
                        _loc7.monsterID = _loc62[0];
                        _loc7.playerName = _loc62[1];
                    }
                    else
                    {
                        _loc7.showIsPlayer = false;
                        _loc7.monsterID = _loc14;
                    } // end else if
                    _loc11 = this.api.kernel.CharactersManager.createMutant(_loc6, _loc7);
                    break;
                } 
                case "-9":
                {
                    var _loc24 = new Object();
                    _loc24.spriteType = _loc15;
                    _loc24.gfxID = _loc20;
                    _loc24.scaleX = _loc22;
                    _loc24.scaleY = _loc21;
                    _loc24.cell = _loc25;
                    _loc24.dir = _loc26;
                    _loc24.ownerName = _loc3[7];
                    _loc24.level = _loc3[8];
                    _loc24.modelID = _loc3[9];
                    _loc11 = this.api.kernel.CharactersManager.createParkMount(_loc6, _loc14 != "" ? (_loc14) : (this.api.lang.getText("NO_NAME")), _loc24);
                    break;
                } 
                case "-10":
                {
                    var _loc27 = new Object();
                    _loc27.spriteType = _loc15;
                    _loc27.gfxID = _loc20;
                    _loc27.scaleX = _loc22;
                    _loc27.scaleY = _loc21;
                    _loc27.cell = _loc25;
                    _loc27.dir = _loc26;
                    _loc27.level = _loc3[7];
                    _loc27.alignment = new dofus.datacenter.Alignment(Number(_loc3[9]), Number(_loc3[8]));
                    _loc11 = this.api.kernel.CharactersManager.createPrism(_loc6, _loc14, _loc27);
                    break;
                } 
                default:
                {
                    var _loc4 = new Object();
                    _loc4.spriteType = _loc15;
                    _loc4.cell = _loc25;
                    _loc4.scaleX = _loc22;
                    _loc4.scaleY = _loc21;
                    _loc4.dir = _loc26;
                    _loc4.sex = _loc3[7];
                    if (this.api.datacenter.Game.isFight)
                    {
                        _loc4.level = _loc3[8];
                        var _loc66 = _loc3[9];
                        _loc4.color1 = _loc3[10];
                        _loc4.color2 = _loc3[11];
                        _loc4.color3 = _loc3[12];
                        _loc4.accessories = _loc3[13];
                        _loc4.LP = _loc3[14];
                        _loc4.AP = _loc3[15];
                        _loc4.MP = _loc3[16];
                        _loc4.resistances = new Array(Number(_loc3[17]), Number(_loc3[18]), Number(_loc3[19]), Number(_loc3[20]), Number(_loc3[21]), Number(_loc3[22]), Number(_loc3[23]));
                        _loc4.team = _loc3[24];
                        if (_loc3[25].indexOf(",") != -1)
                        {
                            var _loc51 = _loc3[25].split(",");
                            var _loc64 = Number(_loc51[0]);
                            var _loc48 = _global.parseInt(_loc51[1], 16);
                            var _loc44 = _global.parseInt(_loc51[2], 16);
                            var _loc42 = _global.parseInt(_loc51[3], 16);
                            if (_loc48 == -1 || _global.isNaN(_loc48))
                            {
                                _loc48 = this.api.datacenter.Player.color1;
                            } // end if
                            if (_loc44 == -1 || _global.isNaN(_loc44))
                            {
                                _loc44 = this.api.datacenter.Player.color2;
                            } // end if
                            if (_loc42 == -1 || _global.isNaN(_loc42))
                            {
                                _loc42 = this.api.datacenter.Player.color3;
                            } // end if
                            if (!_global.isNaN(_loc64))
                            {
                                var _loc40 = new dofus.datacenter.Mount(_loc64, Number(_loc20));
                                _loc40.customColor1 = _loc48;
                                _loc40.customColor2 = _loc44;
                                _loc40.customColor3 = _loc42;
                                _loc4.mount = _loc40;
                            } // end if
                        }
                        else
                        {
                            var _loc71 = Number(_loc3[25]);
                            if (!_global.isNaN(_loc71))
                            {
                                _loc4.mount = new dofus.datacenter.Mount(_loc71, Number(_loc20));
                            } // end if
                        } // end else if
                    }
                    else
                    {
                        _loc66 = _loc3[8];
                        _loc4.color1 = _loc3[9];
                        _loc4.color2 = _loc3[10];
                        _loc4.color3 = _loc3[11];
                        _loc4.accessories = _loc3[12];
                        _loc4.aura = _loc3[13];
                        _loc4.emote = _loc3[14];
                        _loc4.emoteTimer = _loc3[15];
                        _loc4.guildName = _loc3[16];
                        _loc4.emblem = _loc3[17];
                        _loc4.restrictions = _loc3[18];
                        if (_loc3[19].indexOf(",") != -1)
                        {
                            var _loc55 = _loc3[19].split(",");
                            var _loc65 = Number(_loc55[0]);
                            var _loc52 = _global.parseInt(_loc55[1], 16);
                            var _loc50 = _global.parseInt(_loc55[2], 16);
                            var _loc49 = _global.parseInt(_loc55[3], 16);
                            if (_loc52 == -1 || _global.isNaN(_loc52))
                            {
                                _loc52 = this.api.datacenter.Player.color1;
                            } // end if
                            if (_loc50 == -1 || _global.isNaN(_loc50))
                            {
                                _loc50 = this.api.datacenter.Player.color2;
                            } // end if
                            if (_loc49 == -1 || _global.isNaN(_loc49))
                            {
                                _loc49 = this.api.datacenter.Player.color3;
                            } // end if
                            if (!_global.isNaN(_loc65))
                            {
                                var _loc45 = new dofus.datacenter.Mount(_loc65, Number(_loc20));
                                _loc45.customColor1 = _loc52;
                                _loc45.customColor2 = _loc50;
                                _loc45.customColor3 = _loc49;
                                _loc4.mount = _loc45;
                            } // end if
                        }
                        else
                        {
                            var _loc63 = Number(_loc3[19]);
                            if (!_global.isNaN(_loc63))
                            {
                                _loc4.mount = new dofus.datacenter.Mount(_loc63, Number(_loc20));
                            } // end if
                        } // end else if
                    } // end else if
                    if (_loc53)
                    {
                        var _loc72 = [_loc6, this.createTransitionEffect(), _loc25, 10];
                    } // end if
                    var _loc35 = _loc66.split(",");
                    _loc4.alignment = new dofus.datacenter.Alignment(Number(_loc35[0]), Number(_loc35[1]));
                    _loc4.rank = new dofus.datacenter.Rank(Number(_loc35[2]));
                    _loc4.alignment.fallenAngelDemon = _loc35[4] == 1;
                    if (_loc35.length > 3 && _loc6 != this.api.datacenter.Player.ID)
                    {
                        if (this.api.lang.getAlignmentCanViewPvpGain(this.api.datacenter.Player.alignment.index, Number(_loc4.alignment.index)))
                        {
                            var _loc57 = Number(_loc35[3]) - _global.parseInt(_loc6);
                            var _loc81 = this.api.lang.getConfigText("PVP_VIEW_BONUS_MINOR_LIMIT");
                            var _loc76 = this.api.lang.getConfigText("PVP_VIEW_BONUS_MINOR_LIMIT_PRC");
                            var _loc75 = this.api.lang.getConfigText("PVP_VIEW_BONUS_MAJOR_LIMIT");
                            var _loc74 = this.api.lang.getConfigText("PVP_VIEW_BONUS_MAJOR_LIMIT_PRC");
                            var _loc37 = 0;
                            if (this.api.datacenter.Player.Level * (1 - _loc76 / 100) > _loc57)
                            {
                                _loc37 = -1;
                            } // end if
                            if (this.api.datacenter.Player.Level - _loc57 > _loc81)
                            {
                                _loc37 = -1;
                            } // end if
                            if (this.api.datacenter.Player.Level * (1 + _loc74 / 100) < _loc57)
                            {
                                _loc37 = 1;
                            } // end if
                            if (this.api.datacenter.Player.Level - _loc57 < _loc75)
                            {
                                _loc37 = 1;
                            } // end if
                            _loc4.pvpGain = _loc37;
                        } // end if
                    } // end if
                    if (!this.api.datacenter.Game.isFight && (_global.parseInt(_loc6, 10) != this.api.datacenter.Player.ID && ((this.api.datacenter.Player.alignment.index == 1 || this.api.datacenter.Player.alignment.index == 2) && ((_loc4.alignment.index == 1 || _loc4.alignment.index == 2) && (_loc4.alignment.index != this.api.datacenter.Player.alignment.index && (_loc4.rank.value && this.api.datacenter.Map.bCanAttack))))))
                    {
                        if (this.api.datacenter.Player.rank.value > _loc4.rank.value)
                        {
                            this.api.kernel.SpeakingItemsManager.triggerEvent(dofus.managers.SpeakingItemsManager.SPEAK_TRIGGER_NEW_ENEMY_WEAK);
                        } // end if
                        if (this.api.datacenter.Player.rank.value < _loc4.rank.value)
                        {
                            this.api.kernel.SpeakingItemsManager.triggerEvent(dofus.managers.SpeakingItemsManager.SPEAK_TRIGGER_NEW_ENEMY_STRONG);
                        } // end if
                    } // end if
                    var _loc46 = this.sliptGfxData(_loc18);
                    var _loc33 = _loc46.gfx;
                    this.splitGfxForScale(_loc33[0], _loc4);
                    _loc4.title = _loc80;
                    _loc11 = this.api.kernel.CharactersManager.createCharacter(_loc6, _loc14, _loc4);
                    dofus.datacenter.Character(_loc11).isClear = false;
                    _loc11.allowGhostMode = _loc68;
                    var _loc41 = _loc6;
                    var _loc36 = _loc46.shape == "circle" ? (0) : (2);
                    var _loc19 = 1;
                    while (++_loc19, _loc19 < _loc33.length)
                    {
                        if (_loc33[_loc19] == "")
                        {
                            continue;
                        } // end if
                        var _loc32 = _loc6 + "_" + _loc19;
                        var _loc17 = new Object();
                        this.splitGfxForScale(_loc33[_loc19], _loc17);
                        var _loc31 = new ank.battlefield.datacenter.Sprite(_loc32, ank.battlefield.mc.Sprite, dofus.Constants.CLIPS_PERSOS_PATH + _loc17.gfxID + ".swf");
                        _loc31.allDirections = false;
                        this.api.gfx.addLinkedSprite(_loc32, _loc41, _loc36, _loc31);
                        if (!_global.isNaN(_loc17.scaleX))
                        {
                            this.api.gfx.setSpriteScale(_loc31.id, _loc17.scaleX, _loc17.scaleY);
                        } // end if
                        switch (_loc46.shape)
                        {
                            case "circle":
                            {
                                _loc36 = _loc19;
                                break;
                            } 
                            case "line":
                            {
                                _loc41 = _loc32;
                                _loc36 = 2;
                                break;
                            } 
                        } // End of switch
                    } // end while
                    break;
                } 
            } // End of switch
            this.onSpriteMovement(_loc38, _loc11, _loc72);
            continue;
        } // end if
        var _loc78 = _loc54.substr(1);
        var _loc77 = this.api.datacenter.Sprites.getItemAt(_loc78);
        this.onSpriteMovement(_loc38, _loc77);
    } // end of for
};
_loc1.getLinkName = function (sName, sUniqId, bNoBold)
{
    var _loc2 = "<b>";
    var _loc1 = "</b>";
    if (bNoBold)
    {
        _loc2 = "";
        _loc1 = "";
    } // end if
    if (sUniqId != undefined && (sUniqId.length > 0 && sUniqId != ""))
    {
        return (_loc2 + "<a href=\'asfunction:onHref,ShowPlayerPopupMenu," + sName + "," + sUniqId + "\'>" + sName + "</a>" + _loc1);
    } // end if
    return (_loc2 + "<a href=\'asfunction:onHref,ShowPlayerPopupMenu," + sName + "\'>" + sName + "</a>" + _loc1);
};
