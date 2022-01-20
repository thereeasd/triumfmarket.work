@echo Off
set ServiceName=Transport
sc queryex %ServiceName%|find "STATE"|Find "RUNNING">Nul&&(
    net stop %ServiceName%>nul||(
        for /F "tokens=3" %%A in ('sc queryex %ServiceName%^|find "PID"') Do (
            taskkill /F /T /PID %%A>nul
            ping -n 4 127.0.0.1>nul
        )
        net stop %ServiceName% 2>nul
    )
)
net start %ServiceName%