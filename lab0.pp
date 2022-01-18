node
    lab0-maq1,
    lab0-maq2,
    lab0-maq3,
    lab0-maq4,
    lab0-maq5,
    lab0-maq6,
    lab0-maq7,
    lab0-maq8,
    lab0-maq9,
    lab0-maq10,
    lab0-maq11,
    lab0-maq12,
    lab0-maq13,
    lab0-maq14,
    lab0-maq15, 
    lab0-maq16,
    lab0-maq17 {

    include chocolatey
    
    # Usuários do sistema
    $u_alunos='Aluno'
    $u_admin='Admin'

    $vb_exe='VirtualBox-6.1.30-148432-Win.exe'
    $shared_srv='10.0.100.150'
    $installers_path='Installers'
    $lab='lab0'
    $vb_version='Oracle VM VirtualBox 6.1.30'
    $libre_msi='LibreOffice_7.2.4_Win_x64.msi'
    $libre_version='LibreOffice 7.2.4.1'
    $vagrant_exe='vagrant_2.2.19_x86_64.msi'
    $vagrant_version='Vagrant'
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
    $gimp_version='Gimp 2.10.30'

    # Instalção inkscape
    $ink_msi='inkscape-1.1.1.msi'
    $ink_version='Inkscape'

    package { 'python':
        ensure      => 'latest',
        provider    => chocolatey,
    }
    
    file { 'PythonIDLE.lnk':
	    path        => 'C:\Users\Aluno\Desktop\Python 3.10 IDLE.lnk',
	    ensure      => 'file',
	    source	    => 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Python 3.10\IDLE (Python 3.10 64-bit).lnk',
	    require	    => Package['python'],
    }

    package { "${vb_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${lab}\\${vb_exe}",
        install_options     => ["--silent"],
    }

    package { "${vagrant_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${lab}\\${vagrant_exe}",
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

    package { "${gnu_octave_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${gnu_octave_exe}",
        install_options     => ["/S"],
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

}

