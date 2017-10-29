Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |v|
    v.memory = 1024
  end

  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/xenial64"
    master.vm.hostname = "master"
    master.vm.network :private_network, ip: "192.168.255.10"

    master.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/cluster.yml"
      ansible.verbose = true
      ansible.groups = {
        "tag_hadoop-master" => ["master"]
      }
      ansible.extra_vars = {
        "hadoop_master" => "192.168.255.10",
        "hadoop_type_of_node" => "master",
        "hdfs_props" => {
          "dfs.namenode.datanode.registration.ip-hostname-check" => "false"
        }
      }
    end
  end

  config.vm.define "slave1" do |slave|
    slave.vm.box = "ubuntu/xenial64"
    slave.vm.hostname = "slave1"
    slave.vm.network :private_network, ip: "192.168.255.11"

    slave.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/cluster.yml"
      ansible.verbose = true
      ansible.groups = {
        "tag_hadoop-slave" => ["slave1"]
      }
      ansible.extra_vars = {
        "hadoop_master" => "192.168.255.10",
        "hadoop_type_of_node" => "slave"
      }
    end
  end

  config.vm.define "slave2" do |slave|
    slave.vm.box = "ubuntu/xenial64"
    slave.vm.hostname = "slave2"
    slave.vm.network :private_network, ip: "192.168.255.12"

    slave.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/cluster.yml"
      ansible.verbose = true
      ansible.groups = {
        "tag_hadoop-slave" => ["slave2"]
      }
      ansible.extra_vars = {
        "hadoop_master" => "192.168.255.10",
        "hadoop_type_of_node" => "slave"
      }
    end
  end

end
