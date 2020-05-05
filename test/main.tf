module "mymodule" {
  source       = "../"
  session-name = "tmux-test"
  outpath      = "/tmp"
  ssh-key      = "test.pem"
  user         = "root"
  nodes        = ["node1.example.com", "192.168.0.1", "node2.example.com"]
}
