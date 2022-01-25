node
    lab2-maq1,
    lab2-maq2,
    lab2-maq3,
    lab2-maq4,
    lab2-maq5,
    lab2-maq6,
    lab2-maq7,
    lab2-maq8,
    lab2-maq9,
    lab2-maq10,
    lab2-maq11,
    lab2-maq12,
    lab2-maq13,
    lab2-maq14,
    lab2-maq15,
    lab2-maq16,
    lab2-maq17,
    lab2-maq18,
    lab2-maq19,
    lab2-maq20,
    lab2-maq21,
    lab2-maq22,
    lab2-maq23,
    lab2-maq24,
    lab2-maq25,
    lab2-maq26,
    lab2-maq27,
    lab2-maq28
    {

    include chocolatey
    include archive

    # Usuários do sistema
    $u_alunos='Aluno'
    $u_admin='Admin'

    # Grupos para adicionar usuários
    $grupos='Usuários'

    # Endereço do Servidor de compartilhamento de arquivos
    $shared_srv='10.0.100.150'

    # Caminho dos instaladores
    $installers_path='Installers'

    # Diretório com instaladores comuns a todos os laboratórios
    $common='common'

    # Pasta para softwares específicos do laboratório
    $lab2='lab2'
    
    # Pasta do laboartório 4 com softwares que são comuns a este laboratório
    $lab4='lab4'

    # Instalação do embarcadero dev c++
    $emb_exe='Embarcadero_Dev-Cpp_6.3_TDM-GCC 9.2_Setup.exe'
    $emb_version='Embarcadero Dev-C++'
    $emb_lnk='Dev-C++.lnk'

    # Google Chrome install
    $chrome_msi='googlechromestandaloneenterprise64.msi'
    $chrome_version='Google Chrome'

    # Firefox Install
    $fire_exe='Firefox Setup 95.0.2.exe'
    $fire_version='Mozilla Firefox (x64 pt-BR)'

    # Instalador do LibreOffice
    $libre_msi='LibreOffice_7.2.5_Win_x64.msi'
    # Versão instalada do LibreOffice
    $libre_version='LibreOffice 7.2.5.2'

    # 7zip
    $zip_exe='7z2107-x64.exe'
    # 7zip version
    $zip_version='7-Zip 21.07 (x64)'
    $zip_lnk='7-Zip File Manager.lnk'

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
    $noteplus_version='Notepad++ (64-bit x64)'
    
    # Instalação Acrobat reader
    $acro_exe='AcroRdrDC1900820071_pt_BR.exe'
    $acro_version='Adobe Acrobat Reader DC - Português'

    # instalação do java runtime X86 e x64 - Obs: td = trinta e dois bits, sq = sessenta e quatro bits
    $java_td_exe='jre-8u321-windows-i586.exe'
    $java_sq_exe='jre-8u321-windows-x64.exe'
    $java_td_version='Java 8 Update 321'
    $java_sq_version='Java 8 Update 321 (64-bit)'

    # Instalação do OpenJDK, ambiente de desenvolvimento do Java - Obs: Instalação do arquivo zipado, requer a instalação do 7zip antes.
    $openjdk_zip='openjdk-17.0.1_windows-x64_bin.zip'
    $openjdk_version='jdk-17.0.1'

    # Instalador do Blender 64bits
    $blender_msi='blender-3.0.0-windows-x64.msi'
    $blender_version='blender'

    # Instalador audacity
    $audacity_exe='audacity-win-3.1.3-64bit.exe'
    $audacity_version='Audacity 3.1.3'

    # Codeblocks
    $codeblocks_exe='codeblocks-20.03mingw-setup.exe'
    $codeblocks_version='codeblocks'
    $codeblocks_lnk='CodeBlocks.lnk'

    # Instalação Visual Studio 2022
    # Pasta com os arquivos da instalação offline
    $vsoffline='vsoffline2022'
    # Versão do programa Instalado
    $vs_version='Visual Studio Community 2022'
    # Visual Studio Installler Community exe
    $vs_exe='vs_Community.exe'
    
    # Sublime text build 4
    $sublime_version='Sublime Text'
    # Sublime exe
    $sublime_exe='sublime_text_build_4126_x64_setup.exe'

    # Nodejs install
    $node_version='Node.js'
    # Node msi 
    $node_msi='node-v16.13.2-x64.msi'

    # Instalação da IDE de programação Lazarus com freepascal
    $lazarus_version='Lazarus 2.2.0'
    # Executável do Lazarus
    $lazarus_exe='lazarus-2.2.0-fpc-3.2.2-win64.exe'

    # Instalação do Tile Studio Versão I e II, instalção através de arquivos zip, requer obrigatóriamente a instalação do 7zip, usando a declaração require no resource archive
    $tilei_zip='ts.zip'
    $install_tsI_path='C:\Program Files\tsI'
    $install_tsII_path='C:\Program Files\tsII'
    $tileii_zip='ts-2.55-bin.zip'

    # Instalação do postgresql server
    $postgre_version='PostgreSQL 14 '
    $postgre_exe='postgresql-14.1-1-windows-x64.exe'

    # Instalação do PGAdmin para gerenciamento do banco de dados postgresql
    $pgadmin_version='pgAdmin 4 version 6.4'
    $pgadmin_exe='pgadmin4-6.4-x64.exe'

    # Xampp installation
    $xampp_version='XAMPP'
    $xampp_exe='xampp-windows-x64-8.1.1-2-VS16-installer.exe'

    # Instalação do python 3.10.2
    $python_exe='python-3.10.2-amd64.exe'
    $python_version='Python 3.10.2 (64-bit)'

    # Arquivos para instalação do violet UML editor, não requer instalção normal, somente a cópia do executável e cópia do atalho para área de trabalho.
    $violet_exe='violetumleditor-2.1.0.exe'
    $violet_folder="C:\\Program Files\\Violet"

    # pasta compartilhada com todos os executáveis de todas as versões do visual c++ redistribuível.
    $vc_folder='vcredist'

    # Instalação dos pacotes Microsoft Visual C++ Redistribuíveis.
    # executáveis dos vc2005 e 2008, obs: a sigla zcsq significa zero cinco ou 2005 e a sigla sq sessenta e quatro bits e td trinta e dois bits
    # siga esta sequência para os outros executáveis
    $vc_zcsq_exe='VC_05_x64.EXE' 
    $vc_zcsq_version='Microsoft Visual C++ 2005 Redistributable (x64)'
    $vc_zctd_exe='VC_05_x86.EXE'
    $vc_zctd_version='Microsoft Visual C++ 2005 Redistributable'
    $vc_zosq_exe='VC_08_x64.exe' 
    $vc_zosq_version='Microsoft Visual C++ 2008 Redistributable - x64 9.0.30729.6161'
    $vc_zotd_exe='VC_08_x86.exe'
    $vc_zotd_version='Microsoft Visual C++ 2008 Redistributable - x86 9.0.30729.6161'

    $vchashd = { 'Microsoft Visual C++ 2010  x64 Redistributable - 10.0.40219' => 'VC_10_x64.exe', 'Microsoft Visual C++ 2010  x86 Redistributable - 10.0.40219' => 'VC_10_x86.exe' }

    $vcarraynew = { 'Microsoft Visual C++ 2012 Redistributable (x64) - 11.0.61030' => 'VC_12_x64.exe',
        'Microsoft Visual C++ 2012 Redistributable (x86) - 11.0.61030' => 'VC_12_x86.exe',
        'Microsoft Visual C++ 2013 Redistributable (x64) - 12.0.40664' => 'VC_13_x64.exe',
        'Microsoft Visual C++ 2013 Redistributable (x86) - 12.0.40664' => 'VC_13_x86.exe',
        'Microsoft Visual C++ 2015-2022 Redistributable (x64) - 14.30.30704' => 'VC_15_22.x64.exe',
        'Microsoft Visual C++ 2015-2022 Redistributable (x86) - 14.30.30704' => 'VC_15_22.x86.exe'
    }
    

    $vchashd.each |$name, $exe| { 
        package { "${name}":
            ensure	    => 'installed',
            source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${vc_folder}\\${exe}", 
            install_options  => ["/q", "/norestart"],
        }
    }

    $vcarraynew.each |$name, $exe| { 
        package { "${name}":
            ensure	    => 'installed',
            source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${vc_folder}\\${exe}", 
            install_options  => ["/install", "/quiet", "/norestart"],
        }
    }

    # Criação do diretório para instalação do violet
    file { 'violet':
        ensure	    => 'directory',
	    path	    => "${violet_folder}",
    }
    
    # Cópia do arquivo executável do violet para a pasta
    file { 'violet_install':
	    ensure	    => 'file',
	    path	    => "${violet_folder}\\${violet_exe}",
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${violet_exe}", 
        require     => File['violet'],
    }
   
    # Criação do atalho na área de trabalho
    file { 'violet_lnk':
        path        => "C:\\Users\\${u_alunos}\\Desktop\\Violet UML Editor.lnk",    
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\Violet UML Editor.lnk",
        require     => File['violet_install'],
    }

    package { "${python_version}":
        ensure	    => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${python_exe}", 
        install_options  => [ '/quiet', 'InstallAllUsers=1', 'PrependPath=1'],
    }
    
    # Atalho para IDLE pyhton
    file { 'py_idle_lnk':
        path        => "C:\\Users\\${u_alunos}\\Desktop\\IDLE (Python 3.10 64-bit).lnk",    
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\IDLE (Python 3.10 64-bit).lnk",
        require     => Package["${python_version}"],
    }

    # Atalho para a linha de comando do interpretador python
    file { 'python_lnk':
        path        => "C:\\Users\\${u_alunos}\\Desktop\\Python 3.10 (64-bit).lnk",    
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\Python 3.10 (64-bit).lnk",
        require     => Package["${python_version}"],
    }

    package { "${postgre_version}":
            ensure	    => 'installed',
            source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${postgre_exe}", 
            install_options  => [ '--mode', 'unattended', '--unattendedmodeui', 'none', '--superaccount', 'root', '--superpassword', 'root'],
    }
    
    package { "${pgadmin_version}":
            ensure	    => 'installed',
            source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${pgadmin_exe}", 
            install_options  => ["/VERYSILENT", "/NORESTART", "/ALLUSERS"],
    }
    
    file { 'pgadmin_lnk':
        path        => "C:\\Users\\${u_alunos}\\Desktop\\pgAdmin 4 v6.lnk",    
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\pgAdmin 4 v6.lnk",
        require     => Package["${pgadmin_version}"],
    }

    #package { "${xampp_version}":
    #        ensure	    => 'installed',
    #        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${xampp_exe}", 
    #        #install_options  => ["--mode unattended", "--disable-components xampp_mysql, xampp_filezilla, xampp_mercury, xampp_tomcat, xampp_perl, xampp_webalizer, xampp_sendmail", "--launchapps 0"],
    #}
    
    package { "${node_version}":
            ensure	    => 'installed',
            source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${node_msi}", 
            install_options  => ["/qn"],
    }
    
    file { 'node_lnk':
        path        => "C:\\Users\\${u_alunos}\\Desktop\\Node.js.lnk",    
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\Node.js.lnk",
        require     => Package["${node_version}"],
    }

    package { "${lazarus_version}":
            ensure	    => 'installed',
            source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${lazarus_exe}", 
            install_options  => ["/VERYSILENT", "/NORESTART"],
    }
    
    file { 'lazarus_lnk':
        path        => "C:\\Users\\${u_alunos}\\Desktop\\Lazarus IDE.lnk",    
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\Lazarus.lnk",
        require     => Package["${lazarus_version}"],
    }

    package { "${vc_zcsq_version}":
            ensure	    => 'installed',
            source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${vc_folder}\\${vc_zcsq_exe}", 
            install_options  => ["/q"],
    }
    
    package { "${vc_zctd_version}":
            ensure	    => 'installed',
            source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${vc_folder}\\${vc_zctd_exe}", 
            install_options  => ["/q"],
    }

    package { "${vc_zosq_version}":
            ensure	    => 'installed',
            source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${vc_folder}\\${vc_zosq_exe}", 
            install_options  => ["/q"],
    }
    
    package { "${vc_zotd_version}":
            ensure	    => 'installed',
            source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${vc_folder}\\${vc_zotd_exe}", 
            install_options  => ["/q"],
    }

    user { "${u_admin}":
	    ensure	   => 'present',
	    password   => '#winlinux2021#'
    }    

    user { "${u_alunos}":
	    name	   => "${u_alunos}",
	    ensure	   => 'present',
	    groups     => "${grupos}",
    }    

    package { "${acro_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${acro_exe}",
        install_options     => ["/sAll", "/rs", "/msi", "EULA_ACCEPT=YES"],
    }

    package { "${sublime_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${sublime_exe}",
        install_options     => ["/VERYSILENT", "/NORESTART", "/TASKS=contextentry"],
    }

    file { 'sublime_lnk':
        path        => "C:\\Users\\${u_alunos}\\Desktop\\Sublime Text.lnk",    
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\Sublime Text.lnk",
        require     => Package["${sublime_version}"],
    }

    package { "${vs_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${vsoffline}\\${vs_exe}",
        install_options     => ["-q", "--norestart", "--includeRecommended", "--installWhileDownloading", "--add", "Microsoft.VisualStudio.Workload.ManagedDesktop", "--add", "Microsoft.VisualStudio.Workload.ManagedGame", "--add", "Microsoft.VisualStudio.Workload.NativeDesktop", "--add", "Microsoft.VisualStudio.Workload.NativeGame", "--add", "Microsoft.VisualStudio.Workload.NativeMobile", "--add", "Microsoft.VisualStudio.Workload.NetCrossPlat", "--add", "Microsoft.VisualStudio.Workload.NetWeb", "--add", "Microsoft.VisualStudio.Workload.Node", "--add", "Microsoft.VisualStudio.Workload.Python", "--add", "Microsoft.VisualStudio.Workload.Universal"],
    }

    # Atalho da área de trabalho visual studio 2022
    file { 'vs_lnk':
        path        => "C:\\Users\\${u_alunos}\\Desktop\\Visual Studio 2022.lnk",    
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\Visual Studio 2022.lnk",
        require     => Package["${vs_version}"],
    }

    #package { "${codeblocks_version}":
    #    ensure      => 'installed',
    #    source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${codeblocks_exe}",
    #    install_options     => ["/S"],
    #}

    file { 'codeblocks_lnk':
        path        => "C:\\Users\\${u_alunos}\\Desktop\\Code Blocks.lnk",    
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${codeblocks_lnk}",
        #require     => Package["${codeblocks_version}"],
    }

    package { "${audacity_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${audacity_exe}",
        install_options     => ["/VERYSILENT", "/NORESTART"],
    }

    package { "${blender_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${blender_msi}",
        install_options     => ["ALLUSERS=1", "/qn"],
    }

    #file { 'tsI':
	#    ensure	    => 'directory',
	#    path	    => "${install_tsI_path}",
    #}
    #
    #archive { 'tilestudioI':
    #    path        => "C:\\Users\\${u_alunos}\\AppData\\Local\\${tilei_zip}",
    #    ensure      => present,
    #    extract     => true,
    #    extract_path    => "${install_tsI_path}",
    #    source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${tilei_zip}", 
    #    cleanup     => true,
    #    temp_dir    => "C:\\Users\\${u_alunos}\\AppData\\Local\\Temp",
    #    require     => [ Package["${zip_version}"], File['tsI'] ],      
    #}

    file { 'tsII':
	    ensure	    => 'directory',
	    path	    => "${install_tsII_path}",
    }
    
    archive { 'tilestudioII':
        path        => "C:\\Users\\${u_alunos}\\AppData\\Local\\${tileii_zip}",
        ensure      => present,
        extract     => true,
        extract_path    => "${install_tsII_path}",
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${tileii_zip}", 
        cleanup     => true,
        temp_dir    => "C:\\Users\\${u_alunos}\\AppData\\Local\\Temp",
        require     => [ Package["${zip_version}"], File['tsII'] ],       
    }

    file { 'tileII_lnk':
        path        => "C:\\Users\\${u_alunos}\\Desktop\\Tile Studio II.lnk",    
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\Tile Studio II.lnk",
        require     => File['tsII'],
    }

    archive { 'openjdk':
        path        => "C:\\Users\\${u_alunos}\\AppData\\Local\\${openjdk_zip}",
        ensure      => present,
        extract     => true,
        extract_path    => "C:\\Program Files\\Java",
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${openjdk_zip}", 
        cleanup     => true,
        temp_dir    => "C:\\Users\\${u_alunos}\\AppData\\Local\\Temp",
        require     => Package["${zip_version}"],        
    }

    windows_env { "JAVA_HOME=C:\\Program Files\\Java\\${openjdk_version}":
        mergemode   => clobber,
    }
    
    # Adicionando o caminho do JDK para os executáveis na váriavel de ambiente path
    windows_env { "PATH=C:\\Program Files\\Java\\${openjdk_version}\\bin": 

    }

    # Adicionando o caminho do FreePascal para os executáveis na váriavel de ambiente path
    windows_env { "PATH=C:\\lazarus\\fpc\\3.2.2\\bin\\x86_64-win64": 

    }

    package { "${java_td_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${java_td_exe}",
        install_options     => ["/s"],
    }

    package { "${java_sq_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${java_sq_exe}",
        install_options     => ["/s"],
    }

    package { "${emb_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${emb_exe}",
        install_options     => ["/S"],
    }

    package { "${noteplus_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${noteplus_exe}",
        install_options     => ["/S"],
    }

    file { 'noteplus_lnk':
        path        => "C:\\Users\\${u_alunos}\\Desktop\\Notepad++.lnk",    
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\Notepad++.lnk",
        require     => Package["${noteplus_version}"],
    }

    file { 'DEV-C++':
        path        => "C:\\Users\\${u_alunos}\\Desktop\\Dev C++.lnk",    
        source      => "\\\\${shared_srv}\\${installers_path}\\${lab2}\\${emb_lnk}",
        require     => Package["${emb_version}"],
    }

    package { "${fire_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${fire_exe}",
        install_options     => ["-ms"],
    }

    package { "${chrome_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${chrome_msi}",
        install_options     => ["/qn"],
    }

    package { "${libre_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${libre_msi}",
        install_options     => ["/qn", "ALLUSERS=1", "CREATEDESKTOPLINK=1", "REGISTER_ALL_MSO_TYPES=1", "ADDLOCAL=ALL"],
    }

    package { "${zip_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${zip_exe}",
        install_options     => ["/S"],
    }

    file { '7-Zip_lnk':
        path        => "C:\\Users\\${u_alunos}\\Desktop\\${zip_lnk}",    
        source      => "\\\\${shared_srv}\\${installers_path}\\${lab2}\\${zip_lnk}",
        require     => Package["${zip_version}"],
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

}
