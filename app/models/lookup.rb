class Lookup
  attr_reader :netid_interface, :system_user, :hosts, :netid
  def initialize(netid)
    @netid = netid

    @system_user = `whoami`.chomp

    @system_hostname = `hostname`.chomp

    @hosts = [ "ovid01.u.washington.edu",
      "ovid02.u.washington.edu",
      "ovid03.u.washington.edu",
      "vergil.u.washington.edu"
    ]

    @netid_interface = Netid.new(netid, system_user)
  end

  def validate_netid
     netid_interface.validate_netid?(netid)
  end

  def do
    metadata = {}
    metadata[:mysql] = check_for_mysql
    metadata[:processes] = get_processes
    metadata[:localhome] = check_for_localhome
    metadata[:webtypes] = check_webtype
    # metadata[:quota] = check_quota
    metadata
  end

  def check_for_mysql
    results = []
    hosts.each do |host|
      result = netid_interface.check_for_mysql_presence(host)
      results << host if result
    end
    results.empty? ? false : results
  end

  def get_processes
    results = {}
    hosts.each do |host|
      processes = netid_interface.get_processes(host)
      if processes
        results[host.to_s] = processes
      end
    end
    results
  end

  def check_for_localhome
    result = netid_interface.check_for_localhome
    result ? result : false
  end

  def check_webtype
    result = netid_interface.check_webtype
    result ? result : false
  end

  def check_quota
  end


end
