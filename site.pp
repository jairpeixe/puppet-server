node "default" {
  
  include apt
  #include unattended_upgrades

  class { 'ntp':
    servers =>  ['a.st1.ntp.br','b.st1.ntp.br','c.st1.ntp.br','d.st1.ntp.br','a.ntp.br','b.ntp.br','c.ntp.br','gps.ntp.br']
  }

  class { 'mysql::server':
    root_password           => 'root',
    remove_default_accounts => true,
  }

  apt::source { 'google_chrome':
    comment  => 'Navegador Google Chrome',
    location => '[arch=amd64] http://dl.google.com/linux/chrome/deb/',
    release  => 'stable',
    repos    => 'main',
    key      => {
      'id'     => '4CCA1EAF950CEE4AB83976DCA040830F7FAC5991', 
      'source' => 'https://dl.google.com/linux/linux_signing_key.pub',
    },
    include  => {
      'deb' => true,
      'src' => false,
    },
  }
    apt::source { 'puppetlabs':
        location => 'http://apt.puppetlabs.com',
        repos    => 'main',
        key      => {
            'id'     => '6F6B15509CF8E59E6E469F327F438280EF8D349F',
            'server' => 'pgp.mit.edu',
        },
    }

    apt::source { 'webmin':
        location => 'https://download.webmin.com/download/repository',
        release  => 'sarge',
        repos    => 'contrib',
        key      => {
            'id'     => '1719003ACE3E5A41E2DE70DFD97A3AE911F63C51',
            'server' => 'pgp.mit.edu',
        },
    }

  #apt::source { 'sublime-text3':
  #  comment 	 => 'Sublime Text 3',
  #  location	 => 'deb https://download.sublimetext.com/',
  #  release	 => 'apt/stable'
  #}
  
  apt::ppa {
   'ppa:maarten-fonville/android-studio':
  }

  apt::ppa {
    'ppa:otto-kesselgulasch/gimp':
  }

  apt::ppa {
    'ppa:inkscape.dev/stable':
  }

  #apt::ppa {
  #  'ppa:danielrichter2007/grub-customizer':
  #}


  user { 'aluno':
    ensure      =>  'present',
    managehome  =>  'true',
    password    =>  '$6$d9I8S//p$mmj6czqKoVmv/BO/vrRoQMvLmxkY50C8pH9GzA2mub9d4P6e8DVL483WcmhQE72Y2Gu70qeBzY8ykx7kJSw9N.'
  }
  
  package { 'vim':
    ensure      => 'latest',
  }
  
  package { 'codeblocks':
    ensure => 'latest',
  }

  package { 'openssh-server':
    ensure => 'latest',
  }

  package { 'composer':
    ensure => 'latest',
  }
  
  package { 'nodejs':
    ensure => 'latest',
  }
  
  package { 'android-studio':
    ensure => 'latest',
    require => Class['apt::update'],
  }

  package { 'gimp':
    ensure => 'latest',
    require => Class['apt::update'],
  }

  package { 'inkscape':
    ensure => 'latest',
    require => Class['apt::update'],
  }

  package { 'grub-customizer':
    ensure => 'latest',
    require => Class['apt::update'],
  }

  package { 'qemu-kvm':
    ensure => 'latest',
  }

  #package { 'libvirt-bin':
  #  ensure => 'latest',
  #}

  package { 'bridge-utils':
    ensure => 'latest',
  }

  package { 'openjdk-8-jdk':
    ensure => 'latest',
  }

  package { 'gnome-tweak-tool':
    ensure => 'latest',
  }
   package { 'idle3':
    ensure => 'latest',
   }

  package { 'google-chrome-stable':
    ensure => 'latest',
    require =>  Class['apt::update'],
  }

  package { 'audacity':
    ensure  => 'latest',
  }

  package { 'lazarus':
    ensure => 'latest',
  }

  package { 'phpmyadmin':
    ensure => 'latest',
  }

  #package { 'mysql-workbench':
  #  ensure => 'latest',
  #}

  service { 'sshd':
    hasstatus => 'true',
    enable    => 'true',
    ensure    => 'running',
  }

}

node
    lab5-prof {

    $packages = ['googlechrome', 'adobereader', 'firefox', '7zip']    
    
    include chocolatey    
    
    user { 'ADMIN':
	ensure	    => 'present',
	password    => 'winlinux2018',
    }

    user { 'Professor':
	name	    => 'Professor',
	ensure	    => 'present',
	groups	    => ['Usuários'],
    }
   
    $packages.each |String $packages| {
    	package { "${packages}":
            ensure	    => 'latest',
            provider        => chocolatey,
    	}
    }
    
    # Instalação do software LTSpice em 4 passos

    # Passo 1 - Criar váriáveis apontando para as pastas de destino e o compartilhamento dos executáveis
    # Instalação executada anteriormente em uma máquina exemplo e criado o arquivo zipado para extração
    # nas máquinas destino.

    $install_lt_path='C:\Program Files\LTC\\'
    $source_lt_path='\\\10.0.100.150\Installers\LTC'
    $lt_bin_zip='LTSpiceXVII.zip'    

    # Passo 2 - Criação do diretório LTC na pasta da máquina que irá receber o executável, conforme a instalação do software.

    file { 'LTC':
	ensure	    => 'directory',
	path	    => "${install_lt_path}",
    }
    
    # Passo 3 - Cópia e descompactação do arquivo na pasta destino, o processo de instalação ocorre aqui.
    # Observação : foi instalado o módulo archive do puppet-forge, usando o programa 7zip para evitar erro. 
    # Usando a diretiva require com o nome do pacote para fazer a descompatção somente com o pacote instalado.

    archive { "${install_lt_path}":
	ensure        => present,
	extract       => true,
	extract_path  => "${install_lt_path}",
	source        => "${source_lt_path}\\${lt_bin_zip}",
	cleanup       => true,
	require	      => [ Package['7zip'], File['LTC'] ],
    }

    # Passo 4 - Criação do atalho na área de trabalho do usuário.

    file { 'LTSpice':
        path    => 'C:\Users\ADMIN\Desktop\LTSpiceXVII.lnk',
        ensure  => 'file',
        source  => "${source_lt_path}\\LTspice XVII.lnk",
    }

    package { 'PSIM 2021b_Demo version 2021b':
        ensure  => 'installed',
        source  => "\\\\10.0.100.150\\Installers\\PSIM_Setup.exe",
        install_options => ["/verysilent"]
    }

    file { 'FluidsimH':
	path    => 'C:\Users\ADMIN\Desktop\FluidSIM Hydraulics.lnk',
	ensure  => 'file',
	source	=> 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Festo Didactic\FluidSIM Hydraulics V 4.0 Demo Version English.lnk',
	require	=> Package['FluidSIM 4.0 Hydraulics Demo Version']
    }

    package { 'FluidSIM 4.0 Hydraulics Demo Version':
        ensure	    => 'installed',
        source      => '\\\10.0.100.150\Installers\demo001h4.exe',
	install_options     => ["/S", "/Y"],
    }

    file { 'FluidsimP':
	path    => 'C:\Users\ADMIN\Desktop\FluidSIM Pneumatics.lnk',
	ensure  => 'file',
	source	=> 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Festo Didactic\FluidSIM Pneumatics V 4.0 Demo Version English.lnk',
	require	=> Package['FluidSIM 4.0 Pneumatics Demo Version']
    }

    package { 'FluidSIM 4.0 Pneumatics Demo Version':
        ensure	    => 'installed',
        source      => '\\\10.0.100.150\Installers\demo001p4.exe',
        install_options     => ["/S", "/Y"],
    }

    package { 'Elipse E3 (x86) v5.6 Build 74 - PTB':
    	ensure 	      => 'installed',
    	source        => '\\\10.0.100.150\Installers\e3full-x86-ptb.exe',
 	install_options => ["/s"]
    }

    package { 'Elipse Modbus Simulator Demo v1.0 Build .36 - ENU':
    	ensure 	      => 'installed',
    	source        => '\\\10.0.100.150\Installers\ElipseModSimDemo-enu.exe',
 	install_options => ["/s"]
    }
    
    file { 'ModBus':
	path    => 'C:\Users\ADMIN\Desktop\ModBus Simulator.lnk',
	ensure  => 'file',
	source	=> 'C:\Users\ADMIN\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Elipse Software\Elipse Simulators\Modbus Simulator Demo.lnk',
	require	=> Package['Elipse Modbus Simulator Demo v1.0 Build .36 - ENU']
    }

    package { 'Proteus 8 Demonstration':
    	ensure 	      => 'installed',
    	source        => '\\\10.0.100.150\Installers\prodemo.exe',
 	    #install_options => ["/execnoui", "/quiet", "/norestart"]
    }

    package { 'EcoStruxure Machine Expert - Basic V1.2.0.65304':
        ensure      => 'installed',
        source      => "\\\\10.0.100.150\\Installers\\lab5\\MachineExpertBasic_V1.2_build65304.exe",
        install_options     => ["/NORESTART", "/VERYSILENT"],
    }

#    Instalação do autocad
#    package { 'Autocad 2021':
#	ensure	    => 'installed',
#	source	    => '\\\10.0.100.150\Installers\Img\Setup.exe',
#	install_options	    => ["/W", "/q", "/I", "Img\autocad-2021-lab5.ini", "/language", "pt-br"],
#    }
#
}

node
    lab5-maq1,
    lab5-maq2,
    lab5-maq3,
    lab5-maq4,
    lab5-maq5,
    lab5-maq6,
    lab5-maq7,
    lab5-maq8,
    lab5-maq9,
    lab5-maq10,
    lab5-maq11,
    lab5-maq12,
    lab5-maq13,
    lab5-maq14,
    lab5-maq15,
    lab5-maq16,
    lab5-maq17,
    lab5-maq18,
    lab5-maq19,
    lab5-maq20,
    lab5-maq21,
    lab5-maq22,
    lab5-maq23,
    lab5-maq24,
    lab5-maq25,
    lab5-maq26,
    lab5-maq27,
    lab5-maq28,
    lab5-maq29,
    lab5-maq30
    
    {

    include chocolatey
    
    $u_alunos='Aluno'
    $u_admin='Admin'

    user { "${u_admin}":
	ensure	   => 'present',
	password   => '#winlinux2021#'
    }    

    user { "${u_alunos}":
	name	   => 'Aluno',
	ensure	   => 'present',
	groups     => 'Usuários',
    }    
    
    # Instalação do software LTSpice em 4 passos

    # Passo 1 - Criar váriáveis apontando para as pastas de destino e o compartilhamento dos executáveis
    # Instalação executada anteriormente em uma máquina exemplo e criado o arquivo zipado para extração
    # nas máquinas destino.

    $install_lt_path='C:\Program Files\LTC'
    $source_lt_path='\\\10.0.100.150\Installers\LTC'
    $lt_bin_zip='LTSpiceXVII.zip'    

    # Passo 2 - Criação do diretório LTC na pasta da máquina que irá receber o executável, conforme a instalação do software.

    file { 'LTC':
	ensure	    => 'directory',
	path	    => "${install_lt_path}",
    }
    
    # Passo 3 - Cópia e descompactação do arquivo na pasta destino, o processo de instalação ocorre aqui.
    # Observação : foi instalado o módulo archive do puppet-forge, usando o programa 7zip para evitar erro. 
    # Usando a diretiva require com o nome do pacote para fazer a descompatção somente com o pacote instalado.

    archive { "C:\\Program Files\\LTC\\${lt_bin_zip}":
	ensure        => present,
	extract       => true,
	extract_path  => "${install_lt_path}",
	source        => "${source_lt_path}\\${lt_bin_zip}",
	cleanup       => true,
	require	      => [Package['7zip'], File['LTC']],
    }

    # Passo 4 - Criação do atalho na área de trabalho do usuário.

    file { 'LTSpice':
        path    => "C:\\Users\\${u_alunos}\\Desktop\\LTSpiceXVII.lnk",
        ensure  => 'file',
        source  => "${source_lt_path}\\LTspice XVII.lnk",
    }

    package { 'PSIM 2021b_Demo version 2021b':
        ensure  => 'installed',
        source  => "\\\\10.0.100.150\\Installers\\PSIM_Setup.exe",
        install_options => ["/verysilent"]
    }

    file { 'Psim.lnk':
        path    => "C:\\Users\\${u_alunos}\\Desktop\\PSIM.lnk",
        ensure  => 'file',
        source  => "\\\\10.0.100.150\\Installers\\PSIM.lnk",
        require => Package['PSIM 2021b_Demo version 2021b'],
    }

    file { 'FluidsimH':
	path    => "C:\\Users\\${u_alunos}\\Desktop\\FluidSIM Hydraulics.lnk",
	ensure  => 'file',
	source	=> 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Festo Didactic\FluidSIM Hydraulics V 4.0 Demo Version English.lnk',
	require	=> Package['FluidSIM 4.0 Hydraulics Demo Version']
    }

    package { 'FluidSIM 4.0 Hydraulics Demo Version':
        ensure	    => 'installed',
        source      => '\\\10.0.100.150\Installers\demo001h4.exe',
	install_options     => ["/S", "/Y"],
    }

    file { 'FluidsimP':
	path    => "C:\\Users\\${u_alunos}\\Desktop\\FluidSIM Pneumatics.lnk",
	ensure  => 'file',
	source	=> 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Festo Didactic\FluidSIM Pneumatics V 4.0 Demo Version English.lnk',
	require	=> Package['FluidSIM 4.0 Pneumatics Demo Version']
    }

    package { 'FluidSIM 4.0 Pneumatics Demo Version':
        ensure	    => 'installed',
        source      => '\\\10.0.100.150\Installers\demo001p4.exe',
        install_options     => ["/S", "/Y"],
    }

    package { 'Autodesk AutoCAD 2021 - Português - Brasil (Brazilian Portuguese)':
	    ensure	    => 'installed',
	    source	    => '\\\10.0.100.150\Installers\Img\Setup.exe',
	    install_options	    => ["/W", "/q", "/I", "Img\\autocad-2021-lab5.ini", "/language", "pt-br"],
    }


    file { 'WEG':
	    ensure	    => 'directory',
	    path	    => 'C:\Program Files (x86)\WEG',
    }

    archive { "C:\\Program Files (x86)\\WEG\\Clic02.zip":
	    ensure        => present,
	    extract       => true,
	    extract_path  => 'C:\Program Files (x86)\WEG\\',
	    source        => '\\\10.0.100.150\Installers\Clic02.zip',
	    cleanup       => true,
	    require	      => [Package['7zip'], File['WEG']],
    }

    package { "Elipse E3 (x86) v5.6 Build 74 - PTB":
        ensure 	      => 'installed',
        source        => '\\\10.0.100.150\Installers\e3full-x86-ptb.exe',
        install_options => ["/s"]
    }

    file { 'Elipse':
	path    => "C:\\Users\\${u_alunos}\\Desktop\\Elipse Studio.lnk",
	ensure  => 'file',
	source	=> '\\\10.0.100.150\Installers\Elipse Studio.lnk',
	require	=> Package['Elipse E3 (x86) v5.6 Build 74 - PTB']
    }

    package { 'Elipse Modbus Simulator Demo v1.0 Build .36 - ENU':
    	ensure 	      => 'installed',
    	source        => '\\\10.0.100.150\Installers\ElipseModSimDemo-enu.exe',
 	    install_options => ["/s"]
    }
    
    file { 'ModBus':
	    path    => "C:\\Users\\${u_alunos}\\Desktop\\ModBus Simulator.lnk",
	    ensure  => 'file',
	    source	=> "\\\\10.0.100.150\\Installers\\Elipse ModBus Simulator.lnk",
	    require	=> Package['Elipse Modbus Simulator Demo v1.0 Build .36 - ENU']
    }

    package { 'Proteus 8 Demonstration':
    	ensure 	      => 'installed',
    	source        => '\\\10.0.100.150\Installers\prodemo.exe',
 	    #install_options => ["/exenoui", "msiOptions", "/qn", "/norestart"]
    }
    
    $gnu_octave_exe='octave-6.4.0-w64-installer.exe'
    $gnu_octave_version='Octave 6.4.0'

    #package { "${gnu_octave_version}":
    #    ensure      => 'installed',
    #    source      => "\\\\10.0.100.150\\Installers\\common\\${gnu_octave_exe}",
    #    install_options     => ["/S"],
    #}

    package { 'EcoStruxure Machine Expert - Basic V1.2.0.65304':
        ensure      => 'installed',
        source      => "\\\\10.0.100.150\\Installers\\lab5\\MachineExpertBasic_V1.2_build65304.exe",
        install_options     => ["/NORESTART", "/VERYSILENT", "/SUPPRESMSGBOXES"],
    }

    #Configuração do Elipse, para execução como usuário restrito
    exec { 'elipse_run':
        command     => "sdbinst.exe \\\\10.0.100.150\\Installers\\elipse_fix\\e3_studio.sdb",
        provider    => powershell,
    }

#    exec { 'Priv-net':
#	    command       => 'Set-NetConnectionProfile -InterfaceIndex 7 -NetWorkCategory Private',
#	    provider      => powershell,
#    }

#    exec { 'winrm-activate':
#	    command      => 'winrm quickconfig -q',
#	    provider     => powershell,
#    }

#    package { 'adobereader':
#        ensure	    => 'latest',
#        provider    => chocolatey,
#    }
#
#    file { 'Adobe.lnk':
#	path    => 'C:\Users\Aluno\Desktop\Adobe Reader.lnk',
#	ensure  => 'file',
#	source	=> 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Acrobat Reader DC.lnk',
#	require	=> Package['adobereader'],
#    }
#
#    package { 'googlechrome':
#        ensure	    => 'latest',
#        provider    => chocolatey,
#    }
#
#    package { 'libreoffice-fresh':
#        ensure	    => 'latest',
#        provider    => chocolatey,
#    }
#
    package { '7zip':
        ensure	    => 'latest',
        provider    => chocolatey,
    }

    file { '7Zip.lnk':
	    path    => 'C:\Users\Aluno\Desktop\7Zip.lnk',
	    ensure  => 'file',
	    source	=> 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\7-Zip\7-Zip File Manager.lnk',
	    require	=> Package['7zip'],
    }

#    package { 'python':
#        ensure	    => 'latest',
#        provider    => chocolatey,
#    }
#
#    file { 'PythonIDLE.lnk':
#	path    => 'C:\Users\Aluno\Desktop\Python 3.10 IDLE.lnk',
#	ensure  => 'file',
#	source	=> 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Python 3.10\IDLE (Python 3.10 64-bit).lnk',
#	require	=> Package['7zip'],
#    }
#
#    package { 'codeblocks':
#        ensure	    => 'latest',
#        provider    => chocolatey,
#    }
#
#    file { 'CodeBlocks.lnk':
#        path    => 'C:\Users\Aluno\Desktop\Code Blocks.lnk',
#        ensure  => 'file',
#        source	=> 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CodeBlocks\CodeBlocks.lnk',
#        require	=> Package['codeblocks'],
#    }
#
    package { 'firefox':
        ensure	    => 'latest',
        provider    => chocolatey,
    }
#
    #package { 'inkscape':
    #    ensure	    => 'latest',
    #    provider    => chocolatey,
    #}

    #package { 'gimp':
    #    ensure	    => 'latest',
    #    provider    => chocolatey,
    #}

    #package { 'vcredist-all':
    #    ensure	    => 'latest',
    #    provider    => chocolatey,
    #}

    #package { 'vscode':
    #    ensure	    => 'latest',
    #    provider    => chocolatey,
    #}

    #package { 'git':
    #    ensure	    => 'latest',
    #    provider    => chocolatey,
    #}
    #

    #package { 'sublimetext3':
    #    ensure	    => 'latest',
    #    provider    => chocolatey,
    #}

    #package { 'blender':
    #    ensure	    => 'latest',
    #    provider    => chocolatey,
    #}

    #package { 'mysql.workbench':
    #    ensure	    => 'latest',
    #    provider    => chocolatey,
    #}

    #package { 'github-desktop':
    #    ensure	    => 'latest',
    #    provider    => chocolatey,
    #}

    #package { 'pgadmin4':
    #    ensure	    => 'latest',
    #    provider    => chocolatey,
    #}

}
