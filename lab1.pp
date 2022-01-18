node
    lab1-maq1,
    lab1-maq2,
    lab1-maq3,
    lab1-maq4,
    lab1-maq5,
    lab1-maq6,
    lab1-maq7,
    lab1-maq8,
    lab1-maq9,
    lab1-maq10,
    lab1-maq11,
    lab1-maq12,
    lab1-maq13,
    lab1-maq14,
    lab1-maq15,
    lab1-maq16,
    lab1-maq17,
    lab1-maq18,
    lab1-maq19,
    lab1-maq20,
    lab1-maq21,
    lab1-maq22,
    lab1-maq23,
    lab1-maq24,
    lab1-maq25,
    lab1-maq26,
    lab1-maq27,
    lab1-maq28 {
    
    include chocolatey

    # Usuários do sistema
    $u_alunos='Aluno'
    $u_admin='Admin'
    
    # Ip do servidor de arquivos compartilhado
    $shared_srv='10.0.100.150'

    # Diretório contendo os executáveis dos instaladores
    $installers_path='Installers'

    # Executável do instalador do Libreoffice
    $libre_msi='LibreOffice_7.2.4_Win_x64.msi'

    # Versão da instalação do Libre, deve ser alterado para controle do puppet conforme a atualização
    $libre_version='LibreOffice 7.2.4.1'

    # Diretório para instalação dos softwares comuns a todos os laboratórios
    $common='common'

    # Instalação do libre Office
    package { "${libre_version}":
        ensure      => 'installed',
        source      => "\\\\${shared_srv}\\${installers_path}\\${common}\\${libre_msi}",
        install_options     => ["/qn", "ALLUSERS=1", "CREATEDESKTOPLINK=1", "REGISTER_ALL_MSO_TYPES=1", "ADDLOCAL=ALL"],
    }

}
