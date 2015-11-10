package jp.co.biglobe.isp.aws.redshift;

import com.amazonaws.services.redshift.AmazonRedshiftClient;
import com.amazonaws.services.redshift.model.CreateClusterSubnetGroupRequest;
import com.amazonaws.services.redshift.model.DeleteClusterSubnetGroupRequest;
import jp.co.biglobe.isp.aws.AwsCommon;
import jp.co.biglobe.isp.aws.AwsResource;
import java.util.List;


public class ClusterSubnetGroup implements AwsResource {

    String name = "subnet-group-${project.extensions.systemName}-${project.extensions.environment}";

    String description = "Subnet Group for ${project.extensions.systemName} - ${project.extensions.environment}"

    List<String> subnetIds;



    @Override
    public ClusterSubnetGroup describe(AwsCommon aws) {
        return this;
    }

    @Override
    public ClusterSubnetGroup create(AwsCommon aws) {
        // Redshift Client
        AmazonRedshiftClient redshiftService = createClient(aws);

        // Redshift
        redshiftService.createClusterSubnetGroup(new CreateClusterSubnetGroupRequest()
            .withClusterSubnetGroupName(name)
            .withDescription(description)
            .withSubnetIds(subnetIds)
//                .withTags(systemTag, environmentTag)
        );

        return this;
    }

    @Override
    public void delete(AwsCommon aws) {
        // Redshift Client
        AmazonRedshiftClient redshiftService = createClient(aws);

        redshiftService.deleteClusterSubnetGroup(new DeleteClusterSubnetGroupRequest()
            .withClusterSubnetGroupName(name)
        );
    }


    AmazonRedshiftClient createClient(AwsCommon aws) {
        AmazonRedshiftClient redshiftService =
                new AmazonRedshiftClient(aws.getCredential());
        redshiftService.setRegion(aws.getRegion());

        return redshiftService;
    }
}