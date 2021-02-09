# Setup Borg System Backup

## Files included:

- `borg-backup.sh`
- `borg-backup.service`
- `borg-backup.timer`

## Setup on remote

todo

### (optional) authorize local system on remote

Ensure the root account has ssh keys then authorize it on the remote.

```
# ssh-copy-id borg@<remotehostname>
```

## Setup on system to backup

Install latest version of borg

```
sudo pacman -S borg
```

Run first backup manually

```
# borg init --encryption=repokey borg@<repohostname>:/path/to/repo
# borg create borg@<repohostname>:/path/to/repo::<hostname>-initial /root /etc
```

### Automatic backups

Fill `BORG_REPO` and `BORG_PASSPHRASE` in borg-backup.sh.
Use your favorite text editor.

```
vim borg-backup.sh
```

- change owner of files to root:root
- change permissions on script
- move files to final locations

```
# chown root: borg-backup.sh borg-backup.service borg-backup.timer
# chmod 700 borg-backup.sh
# mkdir -p /root/bin
# mv borg-backup.sh /root/bin
# mv borg-backup.service /etc/serviced/service/
# mv borg-backup.timer /etc/serviced/service/
```

Enable systemd timer for automatic daily backups

```
# systemctl enable borg-backup.timer
# systemctl start borg-backup.timer
```
