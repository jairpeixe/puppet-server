node
    lab8-maq1,
    lab8-maq2,
    lab8-maq3,
    lab8-maq4,
    lab8-maq5,
    lab8-maq6,
    lab8-maq7,
    lab8-maq8,
    lab8-maq9,
    lab8-maq10,
    lab8-maq11,
    lab8-maq12,
    lab8-maq13,
    lab8-maq14,
    lab8-maq15,
    lab8-maq16,
    lab8-maq17,
    lab8-maq18,
    lab8-maq19,
    lab8-maq20,
    lab8-maq21,
    lab8-maq22,
    lab8-maq23,
    lab8-maq24,
    lab8-maq25,
    lab8-maq26,
    lab8-maq27,
    lab8-maq28
    {
        include chocolatey
        
        # Usuário do sistema

        # IP do servidor de compartilhamento de arquivos
        $shared_srv='10.0.100.150'

        # Diretório principal dos instaladores
        $installers_path='Installers'

        # Versão do LibreOffice e instalador executável
        $libre_msi='LibreOffice_7.2.4_Win_x64.msi'
        $libre_version='LibreOffice 7.2.4.1'

        # Versão do Octave e instalador executável
        $gnu_octave_exe='octave-6.4.0-w64-installer.exe'
        $gnu_octave_version='Octave 6.4.0'

        # Instalação do embarcadero dev c++
        $emb_exe='Embarcadero_Dev-Cpp_6.3_TDM-GCC 9.2_Setup.exe'
        $emb_version='Embarcadero Dev-C++'
        $emb_lnk='Dev-C++.lnk'

        # Diretório para programas específicos do laboratório
        $lab8='lab8'

        # Diretório para programas de uso comum dos laboratórios
        $common='common'

        # Link para área de trabalho do elipse studio.
        $elipse_lnk='Elipse Studio.lnk'
        
        # Versão do Autocad
        $autocad_version='Autodesk AutoCAD 2021 - Português - Brasil (Brazilian Portuguese)'

        package { "${autocad_version}":
	        ensure	    => 'installed',
	        source	    => "\\\\${shared_srv}\\${installers_path}\\Img\\Setup.exe",
	        install_options	    => ["/W", "/q", "/I", "Img\\autocad-2021-lab5.ini", "/language", "pt-br"],
        }

        package { "${libre_version}":
            ensure      => 'installed',
            source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${libre_msi}",
            install_options     => ["/qn", "/norestart", "ALLUSERS=1", "CREATEDESKTOPLINK=1", "REGISTER_ALL_MSO_TYPES=1", "ADDLOCAL=ALL"],
        }

        package { "${gnu_octave_version}":
            ensure      => 'installed',
            source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${gnu_octave_exe}",
            install_options     => ["/S"],
        }

        #Configuração do Elipse, para execução como usuário restrito
        $elipse_fix='e3_elipse_lab8.sdb'
        exec { 'elipse_run':
            command     => "sdbinst.exe \\\\${shared_srv}\\${installers_path}\\${lab8}\\${elipse_fix}",
            provider    => powershell,
        }

        #Configuração do Elipse 32 bits, para execução como usuário restrito
        $elipse_fix_td='elipse32.sdb'
        exec { 'elipsetd_run':
            command     => "sdbinst.exe \\\\${shared_srv}\\${installers_path}\\${lab8}\\${elipse_fix_td}",
            provider    => powershell,
        }

#        file { 'elipse_lnk':
#            path    => "C:\\Users\\${u_alunos}\\Desktop\\${elipse_lnk}",
#            ensure  => 'file',
#            source  => "\\\\${shared_srv}\\${installers_path}\\${lab8}\\ElipseStudio.lnk",
#        }
#
        package { "${emb_version}":
            ensure      => 'installed',
            source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${emb_exe}",
            install_options     => ["/S"],
        }

#        file { 'devc_lnk':
#            path    => "C:\\Users\\${u_alunos}\\Desktop\\${emb_lnk}",
#            ensure  => 'file',
#            source  => "\\\\${shared_srv}\\${installers_path}\\${lab8}\\${emb_lnk}",
#        }

    }
