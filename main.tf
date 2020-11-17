locals {
  tmux_path = (var.outpath == "" ? path.module : var.outpath)
}

data "template_file" "tmux" {
  template = file("${path.module}/tmux.ctmpl")
  vars = {
    session-name = var.session-name
    nodes        = join(" ", var.nodes)
    ssh-key      = var.ssh-key
    ssh-args     = var.ssh-args
    user         = var.user
  }
}

resource "local_file" "tmux" {
  content         = data.template_file.tmux.rendered
  filename        = "${local.tmux_path}/${var.outfile}"
  file_permission = "0755"
}

