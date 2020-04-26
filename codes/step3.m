%Directory of the audio files
folder='I:\Signals and Systems\Final Project final submit\Signals and Systems Final Project\voices';

audioFiles=dir(fullfile(folder,'*.mp3'));
for i=1:numel(audioFiles)
  filename=audioFiles(i).name;
  s = strcat(folder,'\',audioFiles(i).name);
  maxFreq = getPeak(s);
  

  [~, f,ext] = fileparts(audioFiles(i).name);
  dm = abs(122-maxFreq); %distance to male's voice peak
  df = abs(212-maxFreq); %distance to female's voice peak
  
  if(dm <= df)
      rename = strcat(f,'_male',ext);
      movefile(fullfile(folder,audioFiles(i).name), fullfile(folder,rename));
  else
      rename = strcat(f,'_female',ext); 
      movefile(fullfile(folder,audioFiles(i).name), fullfile(folder,rename));
  end
  
end