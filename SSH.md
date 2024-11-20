How to Use SSH atleast for Windows : `important note : run on bash using "bash" in ur terminal` 

1. generate ur key fingerprints using : `$ ssh-keygen -t rsa -b 4096 -C "example@example.com"`
2. use ur key using : `$ eval $(ssh-agent -s)` u may get an error here` `unable to start ssh-agent service, error :1058, To solve this follow 2a. steps
    2a. run Windows Powershell as Administrator
    2b. check the output status using: `> Get-Service ssh-agent`
    2c. Set-Service ssh-agent -StartupType Manual
    2d. start step 2 over `so this steps is for enabling ssh-agent`
3. add ur key using:  `ssh-add ~/.ssh/id_rsa`
4. add ur key on github using: `clip < ~/.ssh/id_rsa.pub` if clip not found use: ` cat ~/.ssh/id_rsa.pub`
5. u will get ur final SSH-Key such as: ` ssh-rsa AAAAB3NzaC1yc2EAAAAD173Oe1kp0Ojnsn7sRWt/XT5nFH3CSTv6VWyxq4YUJ4ZykWa5opyiAJmvtjxOMCmVTuX2r1T4Livn0foHGt7+66FJXrXUQgyJ4RXanufb3bAekxbFPg3S6Gyr2kk+I3TYWcFsLLwjU0VVJwodQkpyygAUzhomx9OQ0FMpfkQa5VrZnaSLjjtNOUSAaq30e7JWYxtoVih2HfVkcmqc53QjY4T3Xb0cmLZF3EmwCeB66dgJtpTNMvM54ceD30INsaMFNqG8XjbJtGUCHYEIR5l/LI20K5F25BRTnCzRV9dB5FUJ8taVMGRHJob9PDUdxpA2HEJYilm8ZbLbRmKJtU+H91WNCG6pvy9Yf9MREkOZQHcWIuAsH8uJvTTbqm1eAY2g34FjarRdqZIpvdxkrErDHqh4k42owNEmHjSaAw53Y8M54fjBdFHTjGDqHBamlKcIzQbin/czFq1a+pgopIANDhZjWZNvMiTak7BjVrVOciKD3Pa/KKy03nSEfEGExLbFEi1Q8QEGd6idtUAjL7fyVPWatRwCnOvGLMPTk73m7t0IAYTm4n7dO0S5OeWTUPTT+8vIfFCmE9OT2aJDIpZY1+f8Q== youremail@gmail.com`

6. copy ur key 
7. open github on browser
8. on profile go to setting
9. on "Access" find SSH and GPG Keys
10. add ur SSH key that u already copied 
11. congratsss
12. any git command are the same 
