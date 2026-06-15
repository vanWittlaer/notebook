# SFTP-Users

Sometimes "legacy" interfaces like Solfusion require access to a folder that can be accessed by SFTP from outside the server. Since Solfusion does not make use of Symfony Flysystem, this must be configured manually. In any event, SSH should be configured to prohibit password login!

Create a user \<sftp-user> and assign it to same group as the webserver.

Create a directory for use by sftp, e.g. /var/sftp. Note this must be owned by root!

```
# /etc/ssh/sshd_config
...
Subsystem       sftp    /usr/lib/openssh/sftp-server -u 002
...
# sftp
Match User <sftp-user>
        ForceCommand internal-sftp
        PasswordAuthentication no
        ChrootDirectory /var/sftp
        PermitTunnel no
        AllowAgentForwarding no
        AllowTcpForwarding no
        X11Forwarding no
```

- `-u 002` is important to force setting the group permissions during sftp upload.
- Replace `<sftp-user>` with the name of your sftp user.
