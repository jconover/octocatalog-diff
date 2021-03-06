# Specify the SSL client certificate for Puppet Master. This makes it possible to authenticate with a
# client certificate keypair to the Puppet Master.
# @param parser [OptionParser object] The OptionParser argument
# @param options [Hash] Options hash being constructed; this is modified in this method.
OctocatalogDiff::CatalogDiff::Cli::Options::Option.newoption(:puppet_master_ssl_client_cert) do
  has_weight 320

  def parse(parser, options)
    OctocatalogDiff::CatalogDiff::Cli::Options.option_globally_or_per_branch(
      parser: parser,
      options: options,
      cli_name: 'puppet-master-ssl-client-cert',
      option_name: 'puppet_master_ssl_client_cert',
      desc: 'Full path to certificate file for SSL client auth to Puppet Master',
      validator: ->(x) { File.file?(x) || raise(Errno::ENOENT, "Suggested certificate #{x} does not exist") },
      translator: ->(x) { File.read(x) }
    )
  end
end
