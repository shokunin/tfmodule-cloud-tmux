locals {
  tmux_path = (var.outpath == "" ? "${path.module}" : "${var.outpath}")
}

data "template_file" "tmux" {
  template = "${file("${path.module}/tmux.ctmpl")}"
  vars = {
      session-name = var.session-name
      nodes        = join(" ", var.nodes)
      ssh-key      = var.ssh-key
      ssh-args     = var.ssh-args
      user         = var.user
  }
}

resource "null_resource" "tmux" {
  provisioner "local-exec" {
     command = "echo \"${data.template_file.tmux.rendered}\" > ${local.tmux_path}/${var.outfile} && chmod +x ${local.tmux_path}/${var.outfile} "
  }
  depends_on = ["data.template_file.tmux"]
}
