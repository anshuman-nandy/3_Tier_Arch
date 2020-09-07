import boto3
import sys
 
filter_str = sys.argv[1]


ec2 = boto3.resource('ec2')
client = boto3.client('ec2')

for instance in ec2.instances.all():
    idi = instance.id
    #print ("Current Instance ID :" + idi)
    response = client.describe_instances(
    Filters=[
        {
            'Name': 'instance-type',
            'Values': [
               filter_str ,
            ]
        },
    ],
    InstanceIds=[idi]
    
    )
    print (response)

   
