from aws_cdk import aws_ec2 as ec2

class VPCResources:
  def createResources(self, ns):

    # VPC
    self.bentoVPC = ec2.Vpc(self,
        "{}-vpc".format(ns),
        cidr=self.config[ns]['vpc_cidr_block'])