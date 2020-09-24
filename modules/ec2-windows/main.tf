resource "aws_instance" "terraform" {
  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = var.key_name
  get_password_data = true
  user_data         = <<EOF
        <powershell>
            $url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
            $file = "$env:temp\ConfigureRemotingForAnsible.ps1"
            (New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
            powershell.exe -ExecutionPolicy ByPass -File $file
        </powershell>
    EOF

  tags = {
    Name = "Ansible-framework-manage"
  }

  security_groups = [
    var.windows_sg
  ]
}