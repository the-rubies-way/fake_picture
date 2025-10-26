# -*- encoding: utf-8 -*-
# stub: rspec-core 3.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "rspec-core".freeze
  s.version = "3.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Steven Baker".freeze, "David Chelimsky".freeze, "Chad Humphries".freeze, "Myron Marston".freeze]
  s.bindir = "exe".freeze
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDjjCCAnagAwIBAgIBATANBgkqhkiG9w0BAQUFADBGMRIwEAYDVQQDDAlyc3Bl\nYy1kZXYxGzAZBgoJkiaJk/IsZAEZFgtnb29nbGVnb3VwczETMBEGCgmSJomT8ixk\nARkWA2NvbTAeFw0xMzExMDcxOTQyNTlaFw0xNDExMDcxOTQyNTlaMEYxEjAQBgNV\nBAMMCXJzcGVjLWRldjEbMBkGCgmSJomT8ixkARkWC2dvb2dsZWdvdXBzMRMwEQYK\nCZImiZPyLGQBGRYDY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA\nnhCeZouDLXWO55no+EdZNCtjXjfJQ1X9TbPcvBDD29OypIUce2h/VdKXB2gI7ZHs\nF5NkPggslTErGFmWAtIiur7u943RVqHOsyoIsy065F9fCtrykkA+22elvTDha4Iz\nRUCvuhQ3klatYk4jF+cGt1jNONNVdLOiy0bMynvcM7hoVQ2AomwGs+cEOWQ/4dkD\nJcNV3qfzF5QBcTD2372XNM53b25nYVQSX2KH5FF7BhlKyov33bOm2gA9M+mWIujW\nqgkyxVlfrlE+ZBgV3wXn1Cojg1LpTq35yOArgwioyrwwlZZJR9joN9s/nDklfr5A\n+dyETjFc6cmEPWZrt2cJBQIDAQABo4GGMIGDMAkGA1UdEwQCMAAwCwYDVR0PBAQD\nAgSwMB0GA1UdDgQWBBSW+WD7hn1swJ1A7i8tbuFeuNCJCjAkBgNVHREEHTAbgRly\nc3BlYy1kZXZAZ29vZ2xlZ291cHMuY29tMCQGA1UdEgQdMBuBGXJzcGVjLWRldkBn\nb29nbGVnb3Vwcy5jb20wDQYJKoZIhvcNAQEFBQADggEBAH27jAZ8sD7vnXupj6Y+\nBaBdfHtCkFaslLJ0aKuMDIVXwYuKfqoW15cZPDLmSIEBuQFM3lw6d/hEEL4Uo2jZ\nFvtmH5OxifPDzFyUtCL4yp6qgNe/Xf6sDsRg6FmKcpgqCwNOmsViaf0LPSUH/GYQ\n3Teoz8QCaDbD7AKsffT7eDrnbHnKweO1XdemRJC98u/yYxnGzMSWKEsn09etBlZ9\n7H67k5Z3uf6cfLZgToWL6zShzZY3Nun5r73YsNf2/QZOe4UZe4vfGvn6baw53ys9\n1yHC1AcSYpvi2dAbOiHT5iQF+krm4wse8KctXgTNnjMsHEoGKulJS2/sZl90jcCz\nmuA=\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2014-08-14"
  s.description = "BDD for Ruby. RSpec runner and example groups.".freeze
  s.email = "rspec@googlegroups.com".freeze
  s.executables = ["rspec".freeze]
  s.files = ["exe/rspec".freeze]
  s.homepage = "http://github.com/rspec/rspec-core".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "rspec-core-3.0.4".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<rspec-support>.freeze, ["~> 3.0.0"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 10.0.0"])
  s.add_development_dependency(%q<cucumber>.freeze, ["~> 1.3"])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.3"])
  s.add_development_dependency(%q<aruba>.freeze, ["~> 0.5"])
  s.add_development_dependency(%q<nokogiri>.freeze, ["= 1.5.2"])
  s.add_development_dependency(%q<coderay>.freeze, ["~> 1.0.9"])
  s.add_development_dependency(%q<mocha>.freeze, ["~> 0.13.0"])
  s.add_development_dependency(%q<rr>.freeze, ["~> 1.0.4"])
  s.add_development_dependency(%q<flexmock>.freeze, ["~> 0.9.0"])
end
