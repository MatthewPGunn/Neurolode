% eegplugin_Neurolode() - This plugin addeds a few analysis, exporting
%                          abilities, and processes created while working in INL
%                          process, made by Matthew Phillip Gunn in
%                          colaboration with the INL lab in Carbondale, IL.
function vers = eegplugin_Neurolode(fig, try_strings, catch_strings)

vers = 1.3;
% --- Neurolode 
ParentMenu = uimenu(fig, 'label', 'Neurolode');

CC = uimenu (ParentMenu, 'label', 'Common Commands');
        ReducePCA = uimenu (CC, 'label', 'Reduce PCA by 1','callback', ...
            ['[EEG com] = pop_reduce_pca_by_one(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;eeglab redraw']); 
        Convert2Cont = uimenu (CC, 'label', 'Convert to Continuous','callback', ...
            ['[EEG com] = convert2continuous(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;eeglab redraw']); 
        EpochFileBundle = uimenu (CC, 'label', 'Convert to Epoch','callback', ...
            ['[EEG com] = pop_epochfile(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;eeglab redraw']); 
    
Export0 = uimenu (ParentMenu, 'label', 'Export Data','separator', 'on');
        ExportExcel = uimenu (Export0, 'label', 'As Excel','callback', ...
            ['[EEG com] = pop_export2format(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        ExportDAT = uimenu (Export0, 'label', 'As DAT/Nscan','callback', ...
            ['[EEG com] = pop_export2format(EEG,1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        ExportTXT = uimenu (Export0, 'label', 'As TXT','callback', ...
            ['[EEG com] = pop_export2format(EEG,1,1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        sLORETA0 = uimenu (Export0, 'label', 'to sLORETA','callback', ...
            ['[EEG com]= pop_eeglab2sloreta(EEG,1,1,1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
   
Analysis0 = uimenu (ParentMenu, 'label', 'Analysis');
    Spectral_Centroid0 = uimenu (Analysis0, 'label', 'Spectral Centroid');        
        uimenu( Spectral_Centroid0, 'label', 'Time-Domain','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Centroid_Time(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        uimenu( Spectral_Centroid0, 'label', 'Frequency-Domain','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Centroid_Freq(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        uimenu( Spectral_Centroid0, 'label', 'Customize','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Centroid_Custom(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
    Spectral_Spread0 = uimenu (Analysis0, 'label', 'Spectral Spread');        
        uimenu( Spectral_Spread0, 'label', 'Time-Domain','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Spread_Time(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        uimenu( Spectral_Spread0, 'label', 'Frequency-Domain','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Spread_Freq(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        uimenu( Spectral_Spread0, 'label', 'Customize','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Spread_Custom(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
    Spectral_Skewness0 = uimenu (Analysis0, 'label', 'Spectral Skewness');        
        uimenu( Spectral_Skewness0, 'label', 'Time-Domain','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Skewness_Time(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        uimenu( Spectral_Skewness0, 'label', 'Frequency-Domain','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Skewness_Freq(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        uimenu( Spectral_Skewness0, 'label', 'Customize','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Skewness_Custom(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
    Spectral_Kurtosis0 = uimenu (Analysis0, 'label', 'Spectral Kurtosis');        
        uimenu( Spectral_Kurtosis0, 'label', 'Time-Domain','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Kurtosis_Time(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        uimenu( Spectral_Kurtosis0, 'label', 'Frequency-Domain','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Kurtosis_Freq(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        uimenu( Spectral_Kurtosis0, 'label', 'Customize','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Kurtosis_Custom(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
 end