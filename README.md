# tfmodule-cloud-tmux

Generates a script that will automatically open up a tmux session on every node passed to it

## Usage

```
module "tmuxer" {
  source   = "github.com/shokunin/tfmodule-cloud-tmux"
  ssh-key  = "id_tester"
  user     = "ubuntu"
  ssh-args = "-o ForwardAgent=yes -o IdentitiesOnly=yes -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
  nodes    = module.mynodes.node-external-ips          # is a list eg: ["192.168.0.1", "192.168.0.2", "192.168.0.3"]
  outpath  = "."
  name     = "mynodes" # defaults to ./cloud-tmux
}    

```

### After the terraform apply simply run

```
./cloud-tmux
```

Note if you set the name above the script will appear as ./<name>


If you detach the session it should still be visible and re-running the script will re-attach your session

```
$ tmux ls
0: 3 windows (created Tue Jun 23 10:36:15 2020) (attached)
cloud-tmux: 5 windows (created Tue Jun 23 12:26:48 2020)
``

