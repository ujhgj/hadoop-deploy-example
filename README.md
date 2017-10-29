# Hadoop cluster + Hive

Example Terraform/Ansible IaC repository for Hadoop cluster and Apache Hive

You can deploy the cluster locally using Vagrant. There is an example of Vagrantfile and `slaves` file for it:

    $ cp ansible/roles/hadoop/templates/slaves.vagrant ansible/roles/hadoop/templates/slaves
    $ vagrant up

There's also Terraform example of deployment for GCE

    $ cd terraform
    $ terraform init
    $ cp terraform.tfvars.example terraform.tfvars
    $ vi terraform.tfvars

### Hadoop

Generate rsa key for master-slave interaction and place it to `ansible/roles/hadoop/files/id_rsa` and `ansible/roles/hadoop/files/id_rsa.pub`

You have to fill up `slaves` and `hosts` files manually. See examples in `slaves.vagrant` and `hosts.sample` files.

    $ vi ansible/roles/hadoop/templates/slaves
    $ vi ansible/hosts
    
To bring up cluster:

    $ ansible-playbook cluster.yml --limit tag_hadoop-master --extra-vars "hadoop_master=<master-ip> hadoop_type_of_node=master"
    $ ansible-playbook cluster.yml --limit tag_hadoop-slave --extra-vars "hadoop_master=<master-ip> hadoop_type_of_node=slave"

The first time you bring up HDFS, it must be formatted. Format a new distributed filesystem as hdfs:

    $ hdfs namenode -format

Start HDFS with a utility script:

    $ start-dfs.sh

Start YARN processes with a utility script:

    $ start-yarn.sh

To attach a new data node run this command on a new host:

    $ hadoop-daemon.sh --script hdfs start datanode; yarn-daemon.sh start nodemanager

### Hive

You must use below HDFS commands to create /tmp and /user/hive/warehouse (aka hive.metastore.warehouse.dir) and set them chmod g+w before you can create a table in Hive.

    $ hadoop fs -mkdir       /tmp
    $ hadoop fs -mkdir -p    /user/hive/warehouse
    $ hadoop fs -chmod g+w   /tmp
    $ hadoop fs -chmod g+w   /user/hive/warehouse

Starting from Hive 2.1, we need to run the schematool command below as an initialization step. For example, we can use "derby" as db type.

    $ schematool -dbType derby -initSchema

Run HiveServer2 and Beeline in embedded mode:

    $ beeline -u jdbc:hive2://


### Apache Spark

Spark is also present, you can make calls to Spark API like this:

    $ /opt/spark/bin/run-example SparkPi 10

### Issues

1) Need to fill ip addresses in `slaves` and inventory files manually
2) Slow provisioning (too much to download)
3) Java version is not in official recommended list for Hadoop
