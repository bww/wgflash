
function WGCreateSWFWithPNGSet() {
  
  var dir;
  if((dir = fl.browseForFolderURL("open")) != null){
    fl.trace("Processing PNGs in Directory: "+ dir);
    
    var paths;
    if((paths = FLfile.listFolder(dir)) != null){
      for(var i = 0; i < paths.length; i++){
        var path = paths[i];
        if(path.length > 3 && path.substring(path.length - 3, path.length) == "png"){
          var fullpath = dir +"/"+ path;
          
          var doc;
          if((doc = fl.createDocument()) != null){
            doc.importFile(fullpath, false);
            var ewidth  = 0;
            var eheight = 0;
            
            var timeslines;
            if((timelines = doc.timelines) != null && timelines.length > 0){
              var elements;
              if((elements = timelines[0].layers[0].frames[0].elements) != null && elements.length > 0){
                ewidth = elements[0].width;
                eheight = elements[0].height;
              }
            }
            
            doc.library.items[doc.library.findItemIndex(path)].allowSmoothing = true;
            
            var flapath = fullpath.substring(0, fullpath.length - 3) +"fla";
            FLfile.remove(flapath);
            
            var pindex;
            if((pindex = doc.importPublishProfile("file:///Users/brian/Library/Application Support/Adobe/Flash CS4/en/Configuration/Publish Profiles/PNG To SWF Profile.xml")) >= 0){
              
              doc.currentPublishProfile = doc.publishProfiles[pindex];
              doc.width   = Math.round(ewidth);
              doc.height  = Math.round(eheight);
              
              fl.saveDocument(doc, flapath);
              doc.publish();
              doc.close(false);
              
            }else{
              fl.trace("Unable to load publish profile");
            }
            
          }
          
        }
      }
    }
    
  }
  
}

WGCreateSWFWithPNGSet();

