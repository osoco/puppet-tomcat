class tomcat ($ensure = "installed", $tomcat_package = "tomcat6") {

    package { "$tomcat_package":
        ensure => $ensure
    }

    service { "$tomcat_package":
        ensure => running,
        hasstatus => true,
        hasrestart => true,
        enable => true,
        require => Package["$tomcat_package"]
    }

    file { "/usr/share/$tomcat_package/":
        ensure => directory,
        owner => "$tomcat_package",
        group => "$tomcat_package",
    }

}
