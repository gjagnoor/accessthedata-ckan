# What is this file? See README.md

{ pkgs ? (import ./pinned.nix) }:
let
  mach-nix = import (builtins.fetchGit {
    url = "https://github.com/DavHau/mach-nix";
    ref = "refs/tags/3.5.0";
  }) {
    inherit pkgs;
    python = "python38";
  };
  pyenv = mach-nix.mkPython {
    requirements = builtins.readFile ./requirements.txt;
  };

  python38' = pkgs.python38.override {
    packageOverrides = self: super: {
      flask = super.flask.overridePythonAttrs (oldAttrs: rec {
        version = "2.0.3";
        src = oldAttrs.src.override {
          inherit version;
          hash = "sha256-4RIMIoyi9VO0cN9KX6knq2YlhGdSYGmYGz6wqRkCaH0=";
        };
        doCheck = false;
      });

      beaker = super.beaker.overridePythonAttrs (oldAttrs: rec {
        # CVE-2013-7489, rated "medium"; beaker is a hard CKAN requirement
        meta = pkgs.lib.filterAttrs (n: v: n != "knownVulnerabilities") oldAttrs.meta;
      });


      jinja2 = super.jinja2.overridePythonAttrs ( oldAttrs: rec {
        version = "3.0.3";
        src = oldAttrs.src.override {
          inherit version;
          hash = "sha256-YRuyc81o87mT+r3EBk/IWMW0epc8tap5mewbpAXIfNc=";
        };
        doCheck = false;
      });

      alembic = super.alembic.overridePythonAttrs (oldAttrs: rec {
        version = "1.7.6";
        src = oldAttrs.src.override {
          inherit version;
          hash = "sha256-bAwF6XaKiW2AQ4fiCymYgP4BvFZIQkaw3/6AddbT2Ec=";
        };
        doCheck = false;
      });
      sqlalchemy = super.sqlalchemy.overridePythonAttrs (oldAttrs: rec {
        version = "1.3.24";
        src = oldAttrs.src.override {
          inherit version;
          hash = "sha256-67t3fL+TEjWbiXv4G6ANrg9ctp+6KhgmXcwYpvXvdRk=";
        };
        doCheck = false;
      });
    };
  };

  example = with python38'.pkgs; buildPythonPackage rec {
    pname = "";
    version = "";

    src = fetchPypi {
      inherit pname version;
      sha256 = "";
    };
    propagatedBuildInputs = [];
    doCheck = false;
  };

  pytest-ckan = with python38'.pkgs; buildPythonPackage rec {
    pname = "pytest-ckan";
    version = "0.0.12";

    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-HooZ0SqlALPlj9ga0S5zM71elQVU8wvITEWlCka5QoI=";
    };
    propagatedBuildInputs = [];
    doCheck = false;
  };

  textblob = with python38'.pkgs; buildPythonPackage rec {
    pname = "textblob";
    version = "0.15.2";

    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-V08wvmilr8yfDM+tCIOUgzNDphHE8KIEc2IuB8AsrA8=";
    };
    propagatedBuildInputs = [
      nltk
    ];
    doCheck = false;
  };

  fanstatic = with python38'.pkgs; buildPythonPackage rec {
    pname = "fanstatic";
    version = "1.2";

    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-pVsWXHa1MnLwt+QPu9B084zy3FbHYo6Pz6H4LzXysbc=";
    };
    propagatedBuildInputs = [
      webob
      shutilwhich
    ];
    doCheck = false;
  };

  ckantoolkit = with python38'.pkgs; buildPythonPackage rec {
    pname = "ckantoolkit";
    version = "0.0.7";

    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-ckMsGhxIuWpuvGFPEfwrnDwn11B9u9NVNAaO8GCix1Q=";
    };
    propagatedBuildInputs = [
      six
    ];
    doCheck = false;
  };


  zope-interface = with python38'.pkgs; buildPythonPackage rec {
    pname = "zope.interface";
    version = "5.4.0";

    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-XbpfUw/sPwmI2Dt4zFkbWMC264QxqF7dFWmgU5qKWg4=";
    };
    propagatedBuildInputs = [];
    doCheck = false;
  };

  readme-renderer = with python38'.pkgs; buildPythonPackage rec {
    pname = "readme-renderer";
    version = "34.0";

    src = fetchPypi {
      inherit version;
      pname = "readme_renderer";
      sha256 = "sha256-37TRfyFwbRRfdHPgthyiRbpY6BDPmyIJpII5Z3+C5bA=";
    };
    propagatedBuildInputs = [
      bleach
      docutils
      pygments
    ];
    doCheck = false;
  };

  flask-login = with python38'.pkgs; buildPythonPackage rec {
    pname = "flask-login";
    version = "0.6.1";

    src = fetchPypi {
      pname = "Flask-Login";
      inherit version;
      sha256 = "sha256-EwbUdKJwoDbW/RT0VkDE13NV5PHGfKQzGzctNEiZe4w=";
    };
    propagatedBuildInputs = [
      bleach
      build
      certifi
      cffi
      charset-normalizer
      colorama
      cryptography
      docutils
      flask
      idna
      importlib-metadata
      jeepney
      keyring
      packaging
      pep517
      pkginfo
      pycparser
      pygments
      pyparsing
      #readme-renderer
      requests
      requests-toolbelt
      rfc3986
      secretstorage
      six
      tomli
      tqdm
      twine
      urllib3
      webencodings
      werkzeug
      zipp
    ];

    doCheck = false;
  };

  flask-multistatic = with python38'.pkgs; buildPythonPackage rec {
    pname = "flask-multistatic";
    version = "1.0";

    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-9enI5FHc6xjcY0OnICHJPF/FCf35YPpBY5yYzTMom1w=";
    };
    propagatedBuildInputs = [
      flask
    ];

    doCheck = false;
  };

  ckan = with python38'.pkgs; buildPythonPackage rec {
    pname = "ckan";
    version = "2.9.5";

    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-v6qnOINSOOjrsaKTkWAD8fuuFNpv5MSFWgjSTP+I3T8=";
    };

    propagatedBuildInputs = [
      alembic
      babel
      backports-zoneinfo
      beaker #CVE
      bleach
      blinker
      certifi
      charset-normalizer
      click
      deprecated
      dominate
      feedgen
      flask
      flask-babel
      flask-login
      flask-multistatic
      greenlet
      idna
      importlib-metadata
      importlib-resources
      itsdangerous
      jinja2
      lxml
      markdown
      markupsafe
      nose
      packaging
      passlib
      polib
      psycopg2
      pyjwt
      pyparsing
      pysolr
      python-dateutil
      python-magic
      pytz
      pytz-deprecation-shim
      pyutilib
      pyyaml
      redis
      requests
      rq
      simplejson
      six
      sqlalchemy #[mypy]
      mypy-extensions
      sqlparse
      typing-extensions
      tzdata
      tzlocal
      urllib3
      watchdog
      webassets
      webencodings
      werkzeug #[watchdog]
      wrapt
      zipp
      #zope-interface
    ];

    doCheck = false;
  };

  app = with python38'.pkgs; buildPythonPackage {
    pname = "accessthedata-ckan";
    version = "0.1";

    propagatedBuildInputs = [
      pytest
      pytest-factoryboy
      mock
      routes
      repoze_who
      inflect
      textblob

      fanstatic
      ckan
      ckantoolkit
    ];

    src = ./.;

    doCheck = false;
  };

in
  pkgs.mkShell {
    buildInputs = with python38'.pkgs; [
      app

      nose
      setuptools
    ];
  }
