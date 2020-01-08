//Crée par ydainna le : 08/01/2020 (whit adobe flash cs6)

//Le dossier du jeu se trouve dans : %appData%=>local=>Ankama=>Zaap=>Dofus retro
//Allez au dossier : retroclient dans ressources=>app.asar.unpacked

//Ajouter le code dans la partie : dofus.Constants => Game (du loader ou du fichier core) (adapter celon besoin)
//Replace la fonction onMovement ou si elle existe pas ajoutée celle-ci
//Dupliquer le dossier du jeu pour éviter les check updater

//*conseiller* Si besoin decomprésser le fichier app.asar mettre votre dossier mod retroclient à la place de l'autre et supprimer app.asar.unpacked

//**note** il vous faudra surement adapter selon votre model de modification 


#initclip 2
_loc1 = dofus.Constants;
_loc1.DEBUG = true; //active le mode debug
_loc1.DEBUG_DATAS = true; //permet de voir le network dans la console dev electron (packet (ex: wpe pro))
_loc1.LOG_DATAS = true; //permet de voir le network dans la console dev electron (packet (ex: wpe pro))
_loc1.DEBUG_ENCRYPTION = true; //permet de voir le network dans la console dev electron (packet (ex: wpe pro))
#endinitclip