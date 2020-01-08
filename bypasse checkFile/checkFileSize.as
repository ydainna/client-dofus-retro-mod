//Crée par ydainna le : 08/01/2020 (whit adobe flash cs6)

//Le dossier du jeu se trouve dans : %appData%=>local=>Ankama=>Zaap=>Dofus retro
//Allez au dossier : retroclient dans ressources=>app.asar.unpacked

//Ajouter le code dans la partie : dofus.utils => api (du loader ou du fichier core) (adapter celon besoin)
//Replace la fonction checkFileSize
//Replace le FOLDER_NAME par un nom de dossier dans la racine du dossier du jeu
//Dupliquer le dossier du jeu pour éviter les check updater
//Copier les fichier non modifier dans votre FOLDER_NAME (dossier, loader etc) (contenu du dossier retroclient)
//*conseiller* Si besoin decomprésser le fichier app.asar mettre votre dossier mod retroclient à la place de l'autre et supprimer app.asar.unpacked

//**note** il vous faudra surement adapter selon votre model de modification 

#initclip 48
var _loc1 = dofus.utils.Api.prototype;
_loc1.checkFileSize = function (sFile, nCheckID)
{
    sFile = "FOLDER_NAME/" + sFile; //permet de fake le checkFile pour qu'il reste dans un dossier non modifier
    var _loc2 = new Object();
    var ref = this;
    _loc2.onLoadComplete = function (mc, httpStatus)
    {
        ref.onFileCheckFinished(true, mc.getBytesTotal(), nCheckID);
        mc.removeMovieClip();
    };
    _loc2.onLoadError = function (mc, errorCode, httpStatus)
    {
        ref.onFileCheckFinished(false, mc.getBytesLoaded(), nCheckID);
        mc.removeMovieClip();
    };
    var _loc4 = dofus.DofusCore.getInstance().getTemporaryContainer();
    var _loc6 = _loc4.createEmptyMovieClip("FC" + nCheckID, _loc4.getNextHighestDepth());
    var _loc3 = new MovieClipLoader();
    _loc3.addListener(_loc2);
    _loc3.loadClip(sFile, _loc6);
};
#endinitclip
