# Setup Borg System Backup

## Files included:

- `borgbackup-system.sh`
- `borgbackup-system.service`
- `borgbackup-system.timer`

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

Fill `BORG_REPO` and `BORG_PASSPHRASE` in borgbackup-system.sh.
Use your favorite text editor.

```
vim borgbackup-system.sh
```

- change owner of files to root:root
- change permissions on script
- move files to final locations

```
# chown root: borgbackup-system.sh borgbackup-system.service borgbackup-system.timer
# chmod 700 borgbackup-system.sh
# mkdir -p /root/bin
# mv borgbackup-system.sh /root/bin
# mv borgbackup-system.service /etc/systemd/system/
# mv borgbackup-system.timer /etc/systemd/system/
```

Enable systemd timer for automatic daily backups

```
# systemctl enable borgbackup-system.timer
# systemctl start borgbackup-system.timer
```
