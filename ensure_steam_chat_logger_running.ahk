Loop
{
	Process, Exist, Chat Logger++.exe
	If (ErrorLevel = 0) ;
        {
        Run, E:\Programs\Chat Logger++.exe
        }
    Sleep 1000 ;
}