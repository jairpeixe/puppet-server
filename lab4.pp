node 
    lab4-maq1,
    lab4-maq2,
    lab4-maq3,
    lab4-maq4,
    lab4-maq5,
    lab4-maq6,
    lab4-maq7,
    lab4-maq8,
    lab4-maq9,
    lab4-maq10,
    lab4-maq11,
    lab4-maq12,
    lab4-maq13,
    lab4-maq14, 
    lab4-maq15,
    lab4-maq16, 
    lab4-maq17, 
    lab4-maq18, 
    lab4-maq19, 
    lab4-maq20, 
    lab4-maq21, 
    lab4-maq22, 
    lab4-maq23, 
    lab4-maq24,
    lab4-maq25,
    lab4-maq26,
    lab4-maq27, 
    lab4-maq28 
    {
   
    # Usuários do sistema Windows    
    $u_alunos='Aluno'
    $u_admin='Admin'

    # Gerenciador de pacotes chocolatey
    include chocolatey

    # Instalador e versão do software virtualbox
    $vb_version='Oracle VM VirtualBox 6.1.30'
    $vb_exe='VirtualBox-6.1.30-148432-Win.exe'

    # Endereço do Servidor de compartilhamento de arquivos
    $shared_srv='10.0.100.150'

    # Caminho dos instaladores
    $installers_path='Installers'

    # Pasta para softwares específicos do laboratório
    $lab4='lab4'

    # Instalador e versão do LibreOffice
    $libre_msi='LibreOffice_7.2.4_Win_x64.msi'
    $libre_version='LibreOffice 7.2.4.1'

    # Instalador e versão do vagrant
    $vagrant_exe='vagrant_2.2.19_x86_64.msi'
    $vagrant_version='Vagrant'

    # Diretório com instaladores comuns a todos os laboratórios
    $common='common'
    
    # Install git
    $git_exe='Git-2.34.1-64-bit.exe'
    $git_version='Git'
    $git_lnk='Git Bash.lnk'

    # Versão do Octave e instalador executável
    $gnu_octave_exe='octave-6.4.0-w64-installer.exe'
    $gnu_octave_version='Octave 6.4.0'

    # Instalação do gimp
    $gimp_exe='gimp-2.10.30-setup.exe'
    $gimp_version='GIMP 2.10.30'

    # Instalção inkscape
    $ink_msi='inkscape-1.1.1.msi'
    $ink_version='Inkscape'

    # Instalação do Unity Editor
    $unity_setup='UnitySetup64.exe'
    $unity_version='Unity 2020.3.25f1'
    
    # Instalação do Visual Studio Code - user setup
    $vscode_exe='VSCodeSetup-x64-1.63.2.exe'
    $vscode_version='Microsoft Visual Studio Code'

    # Instalação notepad++
    $noteplus_exe='npp.8.2.Installer.x64.exe'
    $noteplus_version='notepad'

    user { "${u_alunos}":
	    name	    => "${u_alunos}",
	    ensure	    => 'present',
	    groups	    => ['Usuários'],
        #managehome  => true,
    }

    user { "${u_admin}":
        name        => "${u_admin}",
        ensure      => present,
        password    => "#winlinux2021#",
    }

    package { "${vb_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${vb_exe}",
        install_options     => ["--silent"],
    }

    package { "${vagrant_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${vagrant_exe}",
        install_options     => ["/qn"],
        require     => Package["${vb_version}"],
    }

    reboot { 'after':
        subscribe   => Package["${vagrant_version}"],
    }

    package { "${libre_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${libre_msi}",
        install_options     => ["/qn", "ALLUSERS=1", "CREATEDESKTOPLINK=1", "REGISTER_ALL_MSO_TYPES=1", "ADDLOCAL=ALL"],
    }

    package { "${git_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${git_exe}",
        install_options     => ["/VERYSILENT", "/NORESTART"],
    }

    file { 'Git_Bash':
        path        => "C:\\Users\\${u_alunos}\\Desktop\\Git Bash.lnk",    
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${git_lnk}",
        require     => Package["${git_version}"],
    }

    package { "${gimp_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${gimp_exe}",
        install_options     => ["/VERYSILENT", "/NORESTART", "/MERGETASKS=desktopicon", "/ALLUSERS"],
    }

    package { "${ink_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${ink_msi}",
        install_options     => ["ALLUSERS=1", "/qn"],
    }

    package { "${gnu_octave_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${gnu_octave_exe}",
        install_options     => ["/S"],
    }

    package { "${unity_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${lab4}\\${unity_setup}",
        install_options     => ["/S"],
    }

    package { "${vscode_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${vscode_exe}",
        install_options     => ["/VERYSILENT", "/NORESTART", "/MERGETASKS=!runcode,desktopicon,addcontextmenufiles,addcontextmenufolders,associatewithfiles"],
    }

#    package { 'geogebra-classic.install':
#	    ensure    => 'latest',
#       provider  => chocolatey,
#    }
#    
#    package { 'python':
#	    ensure    => 'latest',
#	    provider  => chocolatey,
#    }
#
   # file { 'PythonIDLE.lnk':
   #     path    => "C:\\Users\${u_alunos}\\Desktop\\Python 3.10 IDLE.lnk",
   #     ensure  => 'file',
   #     source	=> 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Python 3.10\IDLE (Python 3.10 64-bit).lnk',
   #     require	=> Package['python'],
   # }
}

