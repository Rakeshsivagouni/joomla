{
 "AWSTemplateFormatVersion": "2010-09-09",
 "Conditions": {
  "optin": {
   "Fn::Equals": [
    "Yes",
    {
     "Ref": "allowUsageAnalytics"
    }
   ]
  }
 },
 "Description": "Template Version 2.9.0: AWS CloudFormation Template for creating a 1NIC BIG-IP in an existing VPC **WARNING** This template creates Amazon EC2 Instances. You will be billed for the AWS resources used if you create a stack from this template.",
 "Mappings": {
  "BigipRegionMap": {
   "ap-northeast-1": {
    "Best": "ami-da9526bc",
    "Better": "ami-629b2804",
    "Good": "ami-9a9122fc"
   },
   "ap-northeast-2": {
    "Best": "ami-05b81f6b",
    "Better": "ami-92bb1cfc",
    "Good": "ami-72b91e1c"
   },
   "ap-south-1": {
    "Best": "ami-e4a5ea8b",
    "Better": "ami-dca4ebb3",
    "Good": "ami-2fa7e840"
   },
   "ap-southeast-1": {
    "Best": "ami-bc96c2df",
    "Better": "ami-1d95c17e",
    "Good": "ami-a694c0c5"
   },
   "ap-southeast-2": {
    "Best": "ami-d501eab7",
    "Better": "ami-d901eabb",
    "Good": "ami-0800eb6a"
   },
   "ca-central-1": {
    "Best": "ami-7e9a211a",
    "Better": "ami-46a61d22",
    "Good": "ami-e3a71c87"
   },
   "eu-central-1": {
    "Best": "ami-a444c7cb",
    "Better": "ami-7744c718",
    "Good": "ami-5a4ac935"
   },
   "eu-west-1": {
    "Best": "ami-f666d38f",
    "Better": "ami-b060d5c9",
    "Good": "ami-5a67d223"
   },
   "eu-west-2": {
    "Best": "ami-2d2c3349",
    "Better": "ami-482b342c",
    "Good": "ami-c02b34a4"
   },
   "sa-east-1": {
    "Best": "ami-564f0a3a",
    "Better": "ami-0a4d0866",
    "Good": "ami-4b4c0927"
   },
   "us-east-1": {
    "Best": "ami-2e89db54",
    "Better": "ami-858ad8ff",
    "Good": "ami-6c500316"
   },
   "us-east-2": {
    "Best": "ami-74193711",
    "Better": "ami-ce1836ab",
    "Good": "ami-2a17394f"
   },
   "us-west-1": {
    "Best": "ami-074f7767",
    "Better": "ami-3a41795a",
    "Good": "ami-0d4f776d"
   },
   "us-west-2": {
    "Best": "ami-67d90b1f",
    "Better": "ami-e2d5079a",
    "Good": "ami-39da0841"
   }
  }
 },
 "Metadata": {
  "AWS::CloudFormation::Interface": {
   "ParameterGroups": [
    {
     "Label": {
      "default": "NETWORKING CONFIGURATION"
     },
     "Parameters": [
      "Vpc",
      "managementSubnetAz1",
      "managementSubnetAz2",
      "subnet1Az1",
      "subnet1Az2",
      "subnet2Az1",
      "availabilityZone1",
      "availabilityZone2",
      "numberOfAdditionalNics",
      "additionalNicLocation"
     ]
    },
    {
     "Label": {
      "default": "INSTANCE CONFIGURATION"
     },
     "Parameters": [
      "imageName",
      "instanceType",
      "applicationInstanceType",
      "licenseKey1",
      "licenseKey2",
      "managementGuiPort",
      "sshKey",
      "restrictedSrcAddress",
      "restrictedSrcAddressApp",
      "ntpServer",
      "timezone"
     ]
    },
    {
     "Label": {
      "default": "TAGS"
     },
     "Parameters": [
      "application",
      "environment",
      "group",
      "owner",
      "costcenter"
     ]
    },
    {
     "Label": {
      "default": "BIG-IQ LICENSING CONFIGURATION"
     },
     "Parameters": [
      "bigiqAddress",
      "bigiqUsername",
      "bigiqPasswordS3Arn",
      "bigiqLicensePoolName"
     ]
    },
    {
     "Label": {
      "default": "TEMPLATE ANALYTICS"
     },
     "Parameters": [
      "allowUsageAnalytics"
     ]
    }
   ],
   "ParameterLabels": {
    "Vpc": {
     "default": "VPC"
    },
    "additionalNicLocation": {
     "default": "Additional NIC Location"
    },
    "allowUsageAnalytics": {
     "default": "Send Anonymous Statistics to F5"
    },
    "application": {
     "default": "Application"
    },
    "applicationInstanceType": {
     "default": "Application Instance Type"
    },
    "availabilityZone1": {
     "default": "Availability Zone 1"
    },
    "availabilityZone2": {
     "default": "Availability Zone 2"
    },
    "bigiqAddress": {
     "default": "BIG-IQ address (private)"
    },
    "bigiqLicensePoolName": {
     "default": "BIG-IQ License Pool Name"
    },
    "bigiqPasswordS3Arn": {
     "default": "S3 ARN of the BIG-IQ Password File"
    },
    "bigiqUsername": {
     "default": "BIG-IQ user with Licensing Privileges"
    },
    "costcenter": {
     "default": "Cost Center"
    },
    "environment": {
     "default": "Environment"
    },
    "group": {
     "default": "Group"
    },
    "imageName": {
     "default": "BIG-IP Image Name"
    },
    "instanceType": {
     "default": "AWS Instance Size"
    },
    "licenseKey1": {
     "default": "License Key 1"
    },
    "licenseKey2": {
     "default": "License Key 2"
    },
    "managementGuiPort": {
     "default": "BIG-IP Management Port"
    },
    "managementSubnetAz1": {
     "default": "Management Subnet AZ1"
    },
    "managementSubnetAz2": {
     "default": "Management Subnet AZ2"
    },
    "ntpServer": {
     "default": "NTP Server"
    },
    "numberOfAdditionalNics": {
     "default": "Number Of Additional NICs"
    },
    "owner": {
     "default": "Owner"
    },
    "restrictedSrcAddress": {
     "default": "Source Address(es) for Management Access"
    },
    "restrictedSrcAddressApp": {
     "default": "Source Address(es) for Web Application Access (80/443)"
    },
    "sshKey": {
     "default": "SSH Key"
    },
    "subnet1Az1": {
     "default": "Subnet1 in AZ1"
    },
    "subnet1Az2": {
     "default": "Subnet1 in AZ2"
    },
    "subnet2Az1": {
     "default": "Subnet2 in AZ1"
    },
    "timezone": {
     "default": "Timezone (Olson)"
    }
   }
  },
  "Version": "2.9.0"
 },
 "Outputs": {
  "Bigip1ExternalInterfacePrivateIp": {
   "Description": "Internally routable IP of the public interface on BIG-IP",
   "Value": {
    "Fn::GetAtt": [
     "Bigip1subnet1Az1Interface",
     "PrimaryPrivateIpAddress"
    ]
   }
  },
  "Bigip1InstanceId": {
   "Description": "Instance Id of BIG-IP in Amazon",
   "Value": {
    "Ref": "Bigip1Instance"
   }
  },
  "Bigip1Url": {
   "Description": "BIG-IP Management GUI",
   "Value": {
    "Fn::Join": [
     "",
     [
      "https://",
      {
       "Fn::GetAtt": [
        "Bigip1Instance",
        "PublicIp"
       ]
      },
      ":",
      {
       "Ref": "managementGuiPort"
      }
     ]
    ]
   }
  },
  "Bigip1VipEipAddress": {
   "Description": "EIP address for VIP",
   "Value": {
    "Fn::Join": [
     "",
     [
      "http://",
      {
       "Fn::GetAtt": [
        "Bigip1Instance",
        "PublicIp"
       ]
      },
      ":80"
     ]
    ]
   }
  },
  "Bigip1subnet1Az1Interface": {
   "Description": "External interface Id on BIG-IP",
   "Value": {
    "Ref": "Bigip1subnet1Az1Interface"
   }
  },
  "Bigip1subnet1Az1SelfEipAddress": {
   "Description": "IP Address of the External interface attached to BIG-IP",
   "Value": {
    "Ref": "Bigip1subnet1Az1SelfEipAddress"
   }
  },
  "availabilityZone1": {
   "Description": "Availability Zone",
   "Value": {
    "Fn::GetAtt": [
     "Bigip1Instance",
     "AvailabilityZone"
    ]
   }
  },
  "bigipExternalSecurityGroup": {
   "Description": "Public or External Security Group",
   "Value": {
    "Ref": "bigipExternalSecurityGroup"
   }
  }
 },
 "Parameters": {
  "Vpc": {
   "ConstraintDescription": "This must be an existing VPC within the working region.",
   "Type": "AWS::EC2::VPC::Id"
  },
  "allowUsageAnalytics": {
   "AllowedValues": [
    "Yes",
    "No"
   ],
   "Default": "Yes",
   "Description": "This deployment can send anonymous statistics to F5 to help us determine how to improve our solutions. If you select **No** statistics are not sent.",
   "Type": "String"
  },
  "application": {
   "Default": "f5app",
   "Description": "Name of the Application Tag",
   "Type": "String"
  },
  "bigiqAddress": {
   "ConstraintDescription": "Verify the private IP address of the BIG-IQ device that contains the pool of licenses",
   "Description": "Private IP address of the BIG-IQ device that contains the pool of BIG-IP licenses",
   "MaxLength": "255",
   "MinLength": "1",
   "Type": "String"
  },
  "bigiqLicensePoolName": {
   "ConstraintDescription": "Verify the Name of BIG-IQ License Pool",
   "Description": "Name of the pool on BIG-IQ that contains the BIG-IP licenses",
   "MaxLength": "255",
   "MinLength": "1",
   "Type": "String"
  },
  "bigiqPasswordS3Arn": {
   "ConstraintDescription": "Verify the S3 ARN of BIG-IQ Password file",
   "Description": "S3 ARN of the BIG-IQ Password file. e.g. arn:aws:s3:::bucket_name/full_path_to_file for public regions or  arn:aws-us-gov:s3:::bucket_name/full_path_to_file) for GovCloud (US)",
   "MaxLength": "255",
   "MinLength": "1",
   "Type": "String"
  },
  "bigiqUsername": {
   "ConstraintDescription": "Verify the BIG-IQ user with privileges to license BIG-IP. Can be Admin, Device Manager, or Licensing Manager",
   "Description": "BIG-IQ user with privileges to license BIG-IP. Must be 'Admin', 'Device Manager', or 'Licensing Manager'",
   "MaxLength": "255",
   "MinLength": "1",
   "Type": "String"
  },
  "costcenter": {
   "Default": "f5costcenter",
   "Description": "Name of the Cost Center Tag",
   "Type": "String"
  },
  "environment": {
   "Default": "f5env",
   "Description": "Name of the Environment Tag",
   "Type": "String"
  },
  "group": {
   "Default": "f5group",
   "Description": "Name of the Group Tag",
   "Type": "String"
  },
  "imageName": {
   "AllowedValues": [
    "Good",
    "Better",
    "Best"
   ],
   "ConstraintDescription": "Must be a valid F5 BIG-IP VE image type",
   "Default": "Best",
   "Description": "F5 BIG-IP Performance Type",
   "Type": "String"
  },
  "instanceType": {
   "AllowedValues": [
    "t2.medium",
    "t2.large",
    "m3.large",
    "m3.xlarge",
    "m3.2xlarge",
    "m4.large",
    "m4.xlarge",
    "m4.2xlarge",
    "m4.4xlarge",
    "m4.10xlarge",
    "c3.xlarge",
    "c3.2xlarge",
    "c3.4xlarge",
    "c3.8xlarge",
    "c4.xlarge",
    "c4.2xlarge",
    "c4.4xlarge",
    "c4.8xlarge"
   ],
   "ConstraintDescription": "Must be a valid EC2 instance type for BIG-IP",
   "Default": "m3.2xlarge",
   "Description": "Size of the F5 BIG-IP Virtual Instance",
   "Type": "String"
  },
  "managementGuiPort": {
   "ConstraintDescription": "Must be a valid, unused port on the BIG-IP.",
   "Default": "8443",
   "Description": "Port for the BIG-IP management Configuration utility",
   "Type": "Number"
  },
  "ntpServer": {
   "Default": "0.pool.ntp.org",
   "Description": "NTP server for this implementation",
   "Type": "String"
  },
  "owner": {
   "Default": "f5owner",
   "Description": "Name of the Owner Tag",
   "Type": "String"
  },
  "restrictedSrcAddress": {
   "AllowedPattern": "(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})",
   "ConstraintDescription": "Must be a valid IP CIDR range of the form x.x.x.x/x.",
   "Description": " The IP address range used to SSH and access managment GUI on the EC2 instances",
   "MaxLength": "18",
   "MinLength": "9",
   "Type": "String"
  },
  "restrictedSrcAddressApp": {
   "AllowedPattern": "(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})",
   "ConstraintDescription": "Must be a valid IP CIDR range of the form x.x.x.x/x.",
   "Description": " The IP address range that can be used to access web traffic (80/443) to the EC2 instances",
   "MaxLength": "18",
   "MinLength": "9",
   "Type": "String"
  },
  "sshKey": {
   "Description": "Key pair for accessing the instance",
   "Type": "AWS::EC2::KeyPair::KeyName"
  },
  "subnet1Az1": {
   "ConstraintDescription": "The subnet ID must be within an existing VPC",
   "Description": "Public or External subnet",
   "Type": "AWS::EC2::Subnet::Id"
  },
  "timezone": {
   "Default": "UTC",
   "Description": "Olson timezone string from /usr/share/zoneinfo",
   "Type": "String"
  }
 },
 "Resources": {
  "Bigip1Instance": {
   "Metadata": {
    "AWS::CloudFormation::Init": {
     "config": {
      "commands": {
       "001-disable-1nicautoconfig": {
        "command": "/usr/bin/setdb provision.1nicautoconfig disable"
       },
       "002-install-libs": {
        "command": {
         "Fn::Join": [
          " ",
          [
           "nohup /config/installCloudLibs.sh",
           "&>> /var/log/cloudlibs-install.log < /dev/null &"
          ]
         ]
        }
       },
       "003-generate-password": {
        "command": {
         "Fn::Join": [
          "",
          [
           "nohup /config/waitThenRun.sh",
           " f5-rest-node /config/cloud/aws/node_modules/f5-cloud-libs/scripts/runScript.js",
           " --signal PASSWORD_CREATED",
           " --file f5-rest-node",
           " --cl-args '/config/cloud/aws/node_modules/f5-cloud-libs/scripts/generatePassword --file /config/cloud/aws/.adminPassword'",
           " --log-level verbose",
           " -o /var/log/generatePassword.log",
           " &>> /var/log/cloudlibs-install.log < /dev/null",
           " &"
          ]
         ]
        }
       },
       "004-create-admin-user": {
        "command": {
         "Fn::Join": [
          "",
          [
           "nohup /config/waitThenRun.sh",
           " f5-rest-node /config/cloud/aws/node_modules/f5-cloud-libs/scripts/runScript.js",
           " --wait-for PASSWORD_CREATED",
           " --signal ADMIN_CREATED",
           " --file /config/cloud/aws/node_modules/f5-cloud-libs/scripts/createUser.sh",
           " --cl-args '--user admin",
           " --password-file /config/cloud/aws/.adminPassword",
           "'",
           " --log-level verbose",
           " -o /var/log/createUser.log",
           " &>> /var/log/cloudlibs-install.log < /dev/null",
           " &"
          ]
         ]
        }
       },
       "005-network-config": {
        "command": {
         "Fn::Join": [
          "",
          [
           "nohup /config/waitThenRun.sh ",
           "f5-rest-node /config/cloud/aws/node_modules/f5-cloud-libs/scripts/runScript.js ",
           "--file /config/cloud/aws/node_modules/f5-cloud-libs/scripts/aws/1nicSetup.sh ",
           "--cwd /config/cloud/aws/node_modules/f5-cloud-libs/scripts/aws ",
           "--log-level debug ",
           "-o /var/log/1nicSetup.log ",
           "--wait-for ADMIN_CREATED ",
           "--signal NETWORK_CONFIG_DONE ",
           "&>> /var/log/cloudlibs-install.log < /dev/null &"
          ]
         ]
        }
       },
       "101-disable-dhcp": {
        "command": {
         "Fn::Join": [
          "",
          [
           "nohup /config/waitThenRun.sh ",
           "f5-rest-node /config/cloud/aws/node_modules/f5-cloud-libs/scripts/runScript.js ",
           "--file /config/disableDhcp.sh ",
           "--cwd /config/ ",
           "--log-level debug ",
           "-o /var/log/disableDhcp.log ",
           "--wait-for NETWORK_CONFIG_DONE ",
           "--signal DISABLE_DHCP_DONE ",
           "&>> /var/log/cloudlibs-install.log < /dev/null &"
          ]
         ]
        }
       },
       "006-onboard-BIG-IP": {
        "command": {
         "Fn::If": [
          "optin",
          {
           "Fn::Join": [
            " ",
            [
             "REGION=\"",
             {
              "Ref": "AWS::Region"
             },
             "\";",
             "DEPLOYMENTID=`echo \"",
             {
              "Ref": "AWS::StackId"
             },
             "\"|sha512sum|cut -d \" \" -f 1`;",
             "CUSTOMERID=`echo \"",
             {
              "Ref": "AWS::AccountId"
             },
             "\"|sha512sum|cut -d \" \" -f 1`;",
             "NAME_SERVER=`/config/cloud/aws/getNameServer.sh mgmt`;",
             "nohup /config/waitThenRun.sh",
             "f5-rest-node /config/cloud/aws/node_modules/f5-cloud-libs/scripts/onboard.js",
             "--port 8443",
             "--ssl-port ",
             {
              "Ref": "managementGuiPort"
             },
             "--wait-for DISABLE_DHCP_DONE",
             "-o /var/log/onboard.log",
             "--log-level debug",
             "--no-reboot",
             "--host localhost",
             "--user admin",
             "--password-url file:///config/cloud/aws/.adminPassword",
             "--hostname `curl -s -f --retry 20 http://169.254.169.254/latest/meta-data/hostname`",
             "--ntp ",
             {
              "Ref": "ntpServer"
             },
             "--tz ",
             {
              "Ref": "timezone"
             },
             "--dns ${NAME_SERVER}",
             "--module ltm:nominal",
             "--license-pool --big-iq-host ",
             {
              "Ref": "bigiqAddress"
             },
             "--big-iq-user ",
             {
              "Ref": "bigiqUsername"
             },
             "--big-iq-password-uri ",
             {
              "Ref": "bigiqPasswordS3Arn"
             },
             "--license-pool-name ",
             {
              "Ref": "bigiqLicensePoolName"
             },
             "--metrics \"cloudName:aws,region:${REGION},bigipVersion:13.0.0.3.0.1679,customerId:${CUSTOMERID},deploymentId:${DEPLOYMENTID},templateName:f5-existing-stack-bigiq-1nic-bigip.template,templateVersion:2.9.0,licenseType:bigiq\"",
             "--ping",
             "&>> /var/log/cloudlibs-install.log < /dev/null &"
            ]
           ]
          },
          {
           "Fn::Join": [
            " ",
            [
             "NAME_SERVER=`/config/cloud/aws/getNameServer.sh mgmt`;",
             "nohup /config/waitThenRun.sh",
             "f5-rest-node /config/cloud/aws/node_modules/f5-cloud-libs/scripts/onboard.js",
             "--port 8443",
             "--ssl-port ",
             {
              "Ref": "managementGuiPort"
             },
             "--wait-for DISABLE_DHCP_DONE",
             "-o /var/log/onboard.log",
             "--log-level debug",
             "--no-reboot",
             "--host localhost",
             "--user admin",
             "--password-url file:///config/cloud/aws/.adminPassword",
             "--hostname `curl -s -f --retry 20 http://169.254.169.254/latest/meta-data/hostname`",
             "--ntp ",
             {
              "Ref": "ntpServer"
             },
             "--tz ",
             {
              "Ref": "timezone"
             },
             "--dns ${NAME_SERVER}",
             "--module ltm:nominal",
             "--license-pool --big-iq-host ",
             {
              "Ref": "bigiqAddress"
             },
             "--big-iq-user ",
             {
              "Ref": "bigiqUsername"
             },
             "--big-iq-password-uri file:///config/cloud/aws/.bigiq",
             "--license-pool-name ",
             {
              "Ref": "bigiqLicensePoolName"
             },
             "--ping",
             "&>> /var/log/cloudlibs-install.log < /dev/null &"
            ]
           ]
          }
         ]
        }
       },
       "102-rerun-network-config": {
        "command": {
         "Fn::Join": [
          "",
          [
           "nohup /config/waitThenRun.sh ",
           "f5-rest-node /config/cloud/aws/node_modules/f5-cloud-libs/scripts/runScript.js ",
           "--file /config/cloud/aws/node_modules/f5-cloud-libs/scripts/aws/1nicSetup.sh ",
           "--cwd /config/cloud/aws/node_modules/f5-cloud-libs/scripts/aws ",
           "--log-level debug ",
           "-o /var/log/rerun1nicSetup.log ",
           "--wait-for ONBOARD_DONE ",
           "--signal RERUN_NETWORK_CONFIG_DONE ",
           "&>> /var/log/cloudlibs-install.log < /dev/null &"
          ]
         ]
        }
       },
       "007-custom-config": {
        "command": {
         "Fn::Join": [
          " ",
          [
           "nohup /config/waitThenRun.sh",
           "f5-rest-node /config/cloud/aws/node_modules/f5-cloud-libs/scripts/runScript.js",
           "--file /config/cloud/aws/custom-config.sh",
           "--cwd /config/cloud/aws",
           "-o /var/log/custom-config.log",
           "--log-level debug",
           "--wait-for RERUN_NETWORK_CONFIG_DONE",
           "--signal CUSTOM_CONFIG_DONE",
           "&>> /var/log/cloudlibs-install.log < /dev/null &"
          ]
         ]
        }
       },
       "008-cluster": {
        "command": {
         "Fn::Join": [
          " ",
          []
         ]
        }
       },
       "009-rm-password": {
        "command": {
         "Fn::Join": [
          " ",
          [
           "nohup /config/waitThenRun.sh",
           "f5-rest-node /config/cloud/aws/node_modules/f5-cloud-libs/scripts/runScript.js",
           "--file /config/cloud/aws/rm-password.sh",
           "-o /var/log/rm-password.log",
           "--log-level debug",
           "--wait-for CUSTOM_CONFIG_DONE",
           "--signal PASSWORD_REMOVED",
           "&>> /var/log/cloudlibs-install.log < /dev/null &"
          ]
         ]
        }
       }
      },
      "files": {
       "/config/cloud/aws/custom-config.sh": {
        "content": {
         "Fn::Join": [
          "",
          [
           "#!/bin/bash\n",
           "PROGNAME=$(basename $0)\n",
           "function error_exit {\n",
           "echo \"${PROGNAME}: ${1:-\\\"Unknown Error\\\"}\" 1>&2\n",
           "exit 1\n",
           "}\n",
           "declare -a tmsh=()\n",
           "echo `date` 'Waiting for \"Tmm ready - links up\"'\n",
           "while [ $(grep -c 'Tmm ready - links up' /var/log/ltm) -lt 2 ]; do continue; done;echo `date` 'Tmm ready - links up'\n",
           "echo 'starting custom-config.sh'\n",
           "tmsh+=(\n",
           "\"tmsh load sys application template /config/cloud/aws/f5.service_discovery.tmpl\"\n",
           "\"tmsh save /sys config\")\n",
           "for CMD in \"${tmsh[@]}\"\n",
           "do\n",
           "  \"/config/cloud/aws/node_modules/f5-cloud-libs/scripts/waitForMcp.sh\"\n",
           "    if $CMD;then\n",
           "        echo \"command $CMD successfully executed.\"\n",
           "    else\n",
           "        error_exit \"$LINENO: An error has occurred while executing $CMD. Aborting!\"\n",
           "    fi\n",
           "done\n",
           "date\n",
           "### START CUSTOM CONFIGURTION\n",
           "### END CUSTOM CONFIGURATION"
          ]
         ]
        },
        "group": "root",
        "mode": "000755",
        "owner": "root"
       },
       "/config/cloud/aws/f5.service_discovery.tmpl": {
        "group": "root",
        "mode": "000755",
        "owner": "root",
        "source": "https://raw.githubusercontent.com/F5Networks/f5-cloud-iapps/v1.2.0/f5-service-discovery/f5.service_discovery.tmpl"
       },
       "/config/cloud/aws/getNameServer.sh": {
        "content": {
         "Fn::Join": [
          "\n",
          [
           "INTERFACE=$1",
           "INTERFACE_MAC=`ifconfig ${INTERFACE} | egrep HWaddr | awk '{print tolower($5)}'`",
           "VPC_CIDR_BLOCK=`curl -s -f --retry 20 http://169.254.169.254/latest/meta-data/network/interfaces/macs/${INTERFACE_MAC}/vpc-ipv4-cidr-block`",
           "VPC_NET=${VPC_CIDR_BLOCK%/*}",
           "NAME_SERVER=`echo ${VPC_NET} | awk -F. '{ printf \"%d.%d.%d.%d\", $1, $2, $3, $4+2 }'`",
           "echo $NAME_SERVER"
          ]
         ]
        },
        "group": "root",
        "mode": "000755",
        "owner": "root"
       },
       "/config/cloud/aws/rm-password.sh": {
        "content": {
         "Fn::Join": [
          "",
          [
           "#!/bin/bash\n",
           "PROGNAME=$(basename $0)\n",
           "function error_exit {\n",
           "echo \"${PROGNAME}: ${1:-\"Unknown Error\"}\" 1>&2\n",
           "exit 1\n",
           "}\n",
           "date\n",
           "echo 'starting rm-password.sh'\n",
           "declare -a tmsh=()\n",
           "tmsh+=(\"rm /config/cloud/aws/.adminPassword\")\n",
           "for CMD in \"${tmsh[@]}\"\n",
           "do\n",
           "  if $CMD;then\n",
           "      echo \"command $CMD successfully executed.\"\n",
           "  else\n",
           "      error_exit \"$LINENO: An error has occurred while executing $CMD. Aborting!\"\n",
           "  fi\n",
           "done\n",
           "date\n"
          ]
         ]
        },
        "group": "root",
        "mode": "000755",
        "owner": "root"
       },
       "/config/cloud/f5-cloud-libs-aws.tar.gz": {
        "group": "root",
        "mode": "000755",
        "owner": "root",
        "source": "https://raw.githubusercontent.com/F5Networks/f5-cloud-libs-aws/v1.6.0/dist/f5-cloud-libs-aws.tar.gz"
       },
       "/config/cloud/f5-cloud-libs.tar.gz": {
        "group": "root",
        "mode": "000755",
        "owner": "root",
        "source": "https://raw.githubusercontent.com/F5Networks/f5-cloud-libs/v3.6.0/dist/f5-cloud-libs.tar.gz"
       },
       "/config/installCloudLibs.sh": {
        "content": {
         "Fn::Join": [
          "\n",
          [
           "#!/bin/bash",
           "echo about to execute",
           "checks=0",
           "while [ $checks -lt 120 ]; do echo checking mcpd",
           "    tmsh -a show sys mcp-state field-fmt | grep -q running",
           "    if [ $? == 0 ]; then",
           "        echo mcpd ready",
           "        break",
           "    fi",
           "    echo mcpd not ready yet",
           "    let checks=checks+1",
           "    sleep 10",
           "done",
           "echo loading verifyHash script",
           "#if ! tmsh load sys config merge file /config/verifyHash; then",
           "#    echo cannot validate signature of /config/verifyHash",
           "#    exit",
           "#fi",
           "#echo loaded verifyHash",
           "#declare -a filesToVerify=(\"/config/cloud/f5-cloud-libs.tar.gz\" \"/config/cloud/f5-cloud-libs-aws.tar.gz\" \"/config/cloud/aws/f5.service_discovery.tmpl\")",
           "#for fileToVerify in \"${filesToVerify[@]}\"",
           "#do",
           "#    echo verifying \"$fileToVerify\"",
           "#    if ! tmsh run cli script verifyHash \"$fileToVerify\"; then",
           "#        echo \"$fileToVerify\" is not valid",
           "#        exit 1",
           "#    fi",
           "#    echo verified \"$fileToVerify\"",
           "#done",
           "mkdir -p /config/cloud/aws/node_modules",
           "echo expanding f5-cloud-libs.tar.gz",
           "tar xvfz /config/cloud/f5-cloud-libs.tar.gz -C /config/cloud/aws/node_modules",
           "echo installing dependencies",
           "tar xvfz /config/cloud/f5-cloud-libs-aws.tar.gz -C /config/cloud/aws/node_modules/f5-cloud-libs/node_modules",
           "echo cloud libs install complete",
           "touch /config/cloud/cloudLibsReady"
          ]
         ]
        },
        "group": "root",
        "mode": "000755",
        "owner": "root"
       },
       "/config/verifyHash": {
        "content": "cli script /Common/verifyHash {\nproc script::run {} {\n        if {[catch {\n            set hashes(f5-cloud-libs.tar.gz) 52d52e458d769b16c55308084eeb842e813ed2d83b2f7273145a96d9ebf7ffb04364e53d66feab0d332b2e22040f17ebdb02893715f0a952570d4c4b614034fb\n            set hashes(f5-cloud-libs-aws.tar.gz) 1a4ba191e997b2cfaaee0104deccc0414a6c4cc221aedc65fbdec8e47a72f1d5258b047d6487a205fa043fdbd6c8fcb1b978cac36788e493e94a4542f90bd92b\n            set hashes(f5-cloud-libs-azure.tar.gz) 8dc5f7a475dbd0e5b56204af450052083146e3c61dc537707657815854fb386fb34e46ec1e94f6e1a98ea974e9502780b04d7cd6096cd9bc849712911829d740\n            set hashes(f5-cloud-libs-gce.tar.gz) 6ef33cc94c806b1e4e9e25ebb96a20eb1fe5975a83b2cd82b0d6ccbc8374be113ac74121d697f3bfc26bf49a55e948200f731607ce9aa9d23cd2e81299a653c1\n            set hashes(f5-cloud-libs-openstack.tar.gz) fb6d63771bf0c8d9cae9271553372f7fb50ce2e7a653bb3fb8b7d57330a18d72fa620e844b579fe79c8908a3873b2d33ee41803f23ea6c5dc9f7d7e943e68c3a\n            set hashes(asm-policy-linux.tar.gz) 63b5c2a51ca09c43bd89af3773bbab87c71a6e7f6ad9410b229b4e0a1c483d46f1a9fff39d9944041b02ee9260724027414de592e99f4c2475415323e18a72e0\n            set hashes(f5.http.v1.2.0rc4.tmpl) 47c19a83ebfc7bd1e9e9c35f3424945ef8694aa437eedd17b6a387788d4db1396fefe445199b497064d76967b0d50238154190ca0bd73941298fc257df4dc034\n            set hashes(f5.http.v1.2.0rc6.tmpl) 811b14bffaab5ed0365f0106bb5ce5e4ec22385655ea3ac04de2a39bd9944f51e3714619dae7ca43662c956b5212228858f0592672a2579d4a87769186e2cbfe\n            set hashes(f5.http.v1.2.0rc7.tmpl) 21f413342e9a7a281a0f0e1301e745aa86af21a697d2e6fdc21dd279734936631e92f34bf1c2d2504c201f56ccd75c5c13baa2fe7653213689ec3c9e27dff77d\n            set hashes(f5.aws_advanced_ha.v1.3.0rc1.tmpl) 9e55149c010c1d395abdae3c3d2cb83ec13d31ed39424695e88680cf3ed5a013d626b326711d3d40ef2df46b72d414b4cb8e4f445ea0738dcbd25c4c843ac39d\n            set hashes(f5.aws_advanced_ha.v1.4.0rc1.tmpl) de068455257412a949f1eadccaee8506347e04fd69bfb645001b76f200127668e4a06be2bbb94e10fefc215cfc3665b07945e6d733cbe1a4fa1b88e881590396\n            set hashes(asm-policy.tar.gz) 2d39ec60d006d05d8a1567a1d8aae722419e8b062ad77d6d9a31652971e5e67bc4043d81671ba2a8b12dd229ea46d205144f75374ed4cae58cefa8f9ab6533e6\n            set hashes(deploy_waf.sh) eebaf8593a29fa6e28bb65942d2b795edca0da08b357aa06277b0f4d2f25fe416da6438373f9955bdb231fa1de1a7c8d0ba7c224fa1f09bd852006070d887812\n            set hashes(f5.policy_creator.tmpl) 06539e08d115efafe55aa507ecb4e443e83bdb1f5825a9514954ef6ca56d240ed00c7b5d67bd8f67b815ee9dd46451984701d058c89dae2434c89715d375a620\n            set hashes(f5.service_discovery.tmpl) acc7c482a1eb8787a371091f969801b422cb92830b46460a3313b6a8e1cda0759f8013380e0c46d5214a351a248c029ec3ff04220aaef3e42a66badf9804041f\n\n            set file_path [lindex $tmsh::argv 1]\n            set file_name [file tail $file_path]\n\n            if {![info exists hashes($file_name)]} {\n                tmsh::log err \"No hash found for $file_name\"\n                exit 1\n            }\n\n            set expected_hash $hashes($file_name)\n            set computed_hash [lindex [exec /usr/bin/openssl dgst -r -sha512 $file_path] 0]\n            if { $expected_hash eq $computed_hash } {\n                exit 0\n            }\n            tmsh::log err \"Hash does not match for $file_path\"\n            exit 1\n        }]} {\n            tmsh::log err {Unexpected error in verifyHash}\n            exit 1\n        }\n    }\n    script-signature no/ysl50WsNMZY/cjdTa8QueYHB/KedTiHGLUcdttFQdJLQmA+JrUdmsiztcfzX3VLCKo6UG+E3zDYDCoKElOSL6qX4DN1BlKtibskC9WboANCuZ8aSolJCmjD1axmNHZce7AWvblt4iJNxjP7e3AFsZHnKG8cwSPKqJuHiroMRwkEANAPfqnZcDMWEwV94FqhHoVy9m08t5ktMKFCqscpS3FiZo8tJYaNxqQ2TatkN+0vIYzS7e45nmWCe7v26MMubG0HjUAgfOD7kKmb0PQLBtlzoXQC6vA+bpO6cmGxGsbgZBimDl/CgK0LEqEPCacTDZbUVuTryeYBT+EL6mYQ==\n    signing-key /Common/f5-irule\n}",
        "group": "root",
        "mode": "000755",
        "owner": "root"
       },
       "/config/disableDhcp.sh": {
        "content": {
         "Fn::Join": [
          "",
          [
           "#!/bin/bash\n",
           "PROGNAME=$(basename $0)\n",
           "function error_exit {\n",
           "echo \"${PROGNAME}: ${1:-\\\"Unknown Error\\\"}\" 1>&2\n",
           "exit 1\n",
           "}\n",
           "echo 'starting disableDhcp.sh aws s3 cp'\n",
           "version=$(ls /opt/aws/ | grep awscli);\n",
           "AWSCLI=/opt/aws/$version;\n",
           "export PATH=$PATH:$AWSCLI/bin;\n",
           "export PYTHONPATH=$PYTHONPATH:$AWSCLI/lib64/python2.6/site-packages;\n",
           "export PYTHONPATH=$PYTHONPATH:$AWSCLI/lib/python2.6/site-packages;\n",
           "date;\n",
           "sleep 300;\n",
           "date;\n",
           "aws s3 cp s3://bigiqtest/v5x.txt /config/cloud/aws/.bigiq;\n",
           "declare -a tmsh=()\n",
           "echo 'starting disableDhcp.sh mgmt-dhcp disabled'\n",
           "tmsh+=(\n",
           "\"tmsh modify /sys global-settings mgmt-dhcp disabled\"\n",
           "\"tmsh save /sys config\")\n",
           "for CMD in \"${tmsh[@]}\"\n",
           "do\n",
           "  \"/config/cloud/aws/node_modules/f5-cloud-libs/scripts/waitForMcp.sh\"\n",
           "    if $CMD;then\n",
           "        echo \"command $CMD successfully executed.\"\n",
           "    else\n",
           "        error_exit \"$LINENO: An error has occurred while executing $CMD. Aborting!\"\n",
           "    fi\n",
           "done\n",
           "date\n",
          ]
         ]
        },
        "group": "root",
        "mode": "000755",
        "owner": "root"
       },
       "/config/waitThenRun.sh": {
        "content": {
         "Fn::Join": [
          "\n",
          [
           "#!/bin/bash",
           "while true; do echo \"waiting for cloud libs install to complete\"",
           "    if [ -f /config/cloud/cloudLibsReady ]; then",
           "        break",
           "    else",
           "        sleep 10",
           "    fi",
           "done",
           "\"$@\""
          ]
         ]
        },
        "group": "root",
        "mode": "000755",
        "owner": "root"
       }
      }
     }
    }
   },
   "Properties": {
    "BlockDeviceMappings": [
     {
      "DeviceName": "/dev/xvda",
      "Ebs": {
       "DeleteOnTermination": "true",
       "VolumeType": "gp2"
      }
     },
     {
      "DeviceName": "/dev/xvdb",
      "NoDevice": {}
     }
    ],
    "IamInstanceProfile": {
     "Ref": "bigipServiceDiscoveryProfile"
    },
    "ImageId": {
     "Fn::FindInMap": [
      "BigipRegionMap",
      {
       "Ref": "AWS::Region"
      },
      {
       "Ref": "imageName"
      }
     ]
    },
    "InstanceType": {
     "Ref": "instanceType"
    },
    "KeyName": {
     "Ref": "sshKey"
    },
    "NetworkInterfaces": [
     {
      "Description": "Public or External Interface",
      "DeviceIndex": "0",
      "NetworkInterfaceId": {
       "Ref": "Bigip1subnet1Az1Interface"
      }
     }
    ],
    "Tags": [
     {
      "Key": "Application",
      "Value": {
       "Ref": "application"
      }
     },
     {
      "Key": "Costcenter",
      "Value": {
       "Ref": "costcenter"
      }
     },
     {
      "Key": "Environment",
      "Value": {
       "Ref": "environment"
      }
     },
     {
      "Key": "Group",
      "Value": {
       "Ref": "group"
      }
     },
     {
      "Key": "Name",
      "Value": {
       "Fn::Join": [
        "",
        [
         "Big-IP: ",
         {
          "Ref": "AWS::StackName"
         }
        ]
       ]
      }
     },
     {
      "Key": "Owner",
      "Value": {
       "Ref": "owner"
      }
     }
    ],
    "UserData": {
     "Fn::Base64": {
      "Fn::Join": [
       "",
       [
        "#!/bin/bash\n",
        "/opt/aws/apitools/cfn-init-1.4-0.amzn1/bin/cfn-init -v -s ",
        {
         "Ref": "AWS::StackId"
        },
        " -r ",
        "Bigip1Instance",
        " --region ",
        {
         "Ref": "AWS::Region"
        },
        "\n"
       ]
      ]
     }
    }
   },
   "Type": "AWS::EC2::Instance"
  },
  "Bigip1subnet1Az1Interface": {
   "Properties": {
    "Description": "Public External Interface for the BIG-IP",
    "GroupSet": [
     {
      "Ref": "bigipExternalSecurityGroup"
     }
    ],
    "SecondaryPrivateIpAddressCount": "1",
    "SubnetId": {
     "Ref": "subnet1Az1"
    }
   },
   "Type": "AWS::EC2::NetworkInterface"
  },
  "Bigip1subnet1Az1SelfEipAddress": {
   "Properties": {
    "Domain": "vpc"
   },
   "Type": "AWS::EC2::EIP"
  },
  "Bigip1subnet1Az1SelfEipAssociation": {
   "Properties": {
    "AllocationId": {
     "Fn::GetAtt": [
      "Bigip1subnet1Az1SelfEipAddress",
      "AllocationId"
     ]
    },
    "NetworkInterfaceId": {
     "Ref": "Bigip1subnet1Az1Interface"
    },
    "PrivateIpAddress": {
     "Fn::GetAtt": [
      "Bigip1subnet1Az1Interface",
      "PrimaryPrivateIpAddress"
     ]
    }
   },
   "Type": "AWS::EC2::EIPAssociation"
  },
  "bigipExternalSecurityGroup": {
   "Properties": {
    "GroupDescription": "Public or External interface rules, including BIG-IP management",
    "SecurityGroupIngress": [
     {
      "CidrIp": {
       "Ref": "restrictedSrcAddress"
      },
      "FromPort": "22",
      "IpProtocol": "tcp",
      "ToPort": "22"
     },
     {
      "CidrIp": {
       "Ref": "restrictedSrcAddress"
      },
      "FromPort": {
       "Ref": "managementGuiPort"
      },
      "IpProtocol": "tcp",
      "ToPort": {
       "Ref": "managementGuiPort"
      }
     },
     {
      "CidrIp": {
       "Ref": "restrictedSrcAddressApp"
      },
      "FromPort": "80",
      "IpProtocol": "tcp",
      "ToPort": "80"
     },
     {
      "CidrIp": {
       "Ref": "restrictedSrcAddressApp"
      },
      "FromPort": "443",
      "IpProtocol": "tcp",
      "ToPort": "443"
     }
    ],
    "Tags": [
     {
      "Key": "Application",
      "Value": {
       "Ref": "application"
      }
     },
     {
      "Key": "Costcenter",
      "Value": {
       "Ref": "costcenter"
      }
     },
     {
      "Key": "Environment",
      "Value": {
       "Ref": "environment"
      }
     },
     {
      "Key": "Group",
      "Value": {
       "Ref": "group"
      }
     },
     {
      "Key": "Name",
      "Value": {
       "Fn::Join": [
        "",
        [
         "Bigip Security Group: ",
         {
          "Ref": "AWS::StackName"
         }
        ]
       ]
      }
     },
     {
      "Key": "Owner",
      "Value": {
       "Ref": "owner"
      }
     }
    ],
    "VpcId": {
     "Ref": "Vpc"
    }
   },
   "Type": "AWS::EC2::SecurityGroup"
  },
  "bigipSecurityGroupIngressBigiqLic": {
   "Properties": {
    "CidrIp": {
     "Fn::Join": [
      "",
      [
       {
        "Ref": "bigiqAddress"
       },
       "/32"
      ]
     ]
    },
    "FromPort": {
     "Ref": "managementGuiPort"
    },
    "GroupId": {
     "Ref": "bigipExternalSecurityGroup"
    },
    "IpProtocol": "tcp",
    "ToPort": {
     "Ref": "managementGuiPort"
    }
   },
   "Type": "AWS::EC2::SecurityGroupIngress"
  },
  "bigipServiceDiscoveryAccessRole": {
   "Properties": {
    "AssumeRolePolicyDocument": {
     "Statement": [
      {
       "Action": [
        "sts:AssumeRole"
       ],
       "Effect": "Allow",
       "Principal": {
        "Service": [
         "ec2.amazonaws.com"
        ]
       }
      }
     ],
     "Version": "2012-10-17"
    },
    "Path": "/",
    "Policies": [
     {
      "PolicyDocument": {
       "Statement": [
        {
         "Action": [
          "ec2:DescribeInstances",
          "ec2:DescribeInstanceStatus",
          "ec2:DescribeAddresses",
          "ec2:AssociateAddress",
          "ec2:DisassociateAddress",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DescribeNetworkInterfaceAttributes",
          "ec2:DescribeRouteTables",
          "ec2:ReplaceRoute",
          "ec2:assignprivateipaddresses",
          "sts:AssumeRole"
         ],
         "Effect": "Allow",
         "Resource": [
          "*"
         ]
        },
        {
         "Action": [
          "s3:GetObject"
         ],
         "Effect": "Allow",
         "Resource": {
          "Ref": "bigiqPasswordS3Arn"
         }
        }
       ],
       "Version": "2012-10-17"
      },
      "PolicyName": "BigipServiceDiscoveryPolicy"
     }
    ]
   },
   "Type": "AWS::IAM::Role"
  },
  "bigipServiceDiscoveryProfile": {
   "Properties": {
    "Path": "/",
    "Roles": [
     {
      "Ref": "bigipServiceDiscoveryAccessRole"
     }
    ]
   },
   "Type": "AWS::IAM::InstanceProfile"
  }
 }
}
