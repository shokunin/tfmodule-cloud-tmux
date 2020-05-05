data "template_file" "tmux" {
  template = "${file("${path.module}/tmux.ctmpl")}"
  vars = {
      session-name = "foo"
      nodes        = join(" ", var.nodes)
      ssh-key      = var.ssh-key
      ssh-args     = var.ssh-args
      user         = var.user
  }
}

resource "null_resource" "tmux" {
  provisioner "local-exec" {
     command = "echo \"${data.template_file.tmux.rendered}\" > ${path.module}/${var.outfile} && chmod +x ${path.module}/${var.outfile} "
  }
  depends_on = ["data.template_file.tmux"]
}