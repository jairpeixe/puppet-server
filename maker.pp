node
    maker-maq2
    {
        
        include chocolatey

        package { 'arduino':
            ensure      => 'latest',
            provider    => chocolatey,
        }

    }
