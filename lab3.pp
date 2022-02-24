node
    lab3-maq1,
    lab3-maq2,
    lab3-maq3,
    lab3-maq4,
    lab3-maq5,
    lab3-maq6,
    lab3-maq7,
    lab3-maq8,
    lab3-maq9,
    lab3-maq10,
    lab3-maq11,
    lab3-maq12,
    lab3-maq13,
    lab3-maq14,
    lab3-maq15,
    lab3-maq16,
    lab3-maq17,
    lab3-maq18,
    lab3-maq19,
    lab3-maq20,
    lab3-maq21,
    lab3-maq22,
    lab3-maq23,
    lab3-maq24,
    lab3-maq25,
    lab3-maq26,
    lab3-maq27,
    lab3-maq28
    {

    include chocolatey

    # Usuários do sistema
    $u_alunos='Aluno'
    $u_admin='Admin'

    $shared_srv='10.0.100.150'
    $installers_path='Installers'
    $lab='lab3'

    $common='common'

    $libre_msi='LibreOffice_7.3.0_Win_x64.msi'
    $libre_version='LibreOffice 7.3.0.3'
    
    $ciscopt_version='Cisco Packet Tracer 8.0 64Bit'
    $ciscopt_exe='PacketTracer8_x64.exe'

    package { "${libre_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${libre_msi}",
        install_options     => ["/qn", "RebootYesNo=No", "ALLUSERS=1", "CREATEDESKTOPLINK=1", "REGISTER_ALL_MSO_TYPES=1", "ADDLOCAL=ALL"],
    }

    package { "${ciscopt_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${ciscopt_exe}",
        install_options     => ["/VERYSILENT", "/NORESTART"],
    }

    file { 'CiscoPT_lnk':
	    path        => "C:\\Users\\${u_alunos}\\Desktop\\Cisco Packet Tracer.lnk",
	    ensure      => 'file',
	    source	    => "\\\\${shared_srv}\\${installers_path}\\${common}\\Cisco Packet Tracer 8.lnk",
	    require	    => Package["${ciscopt_version}"],
    }

}
