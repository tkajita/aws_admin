package jp.co.biglobe.isp.aws;

import com.amazonaws.auth.AWSCredentialsProviderChain;
import com.amazonaws.auth.DefaultAWSCredentialsProviderChain;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import lombok.Getter;

@Getter
public class AwsCommonImpl implements AwsCommon {

    // 認証情報
    final AWSCredentialsProviderChain credential;
    // リージョン
    final Region region;

    public AwsCommonImpl() {
        credential = new DefaultAWSCredentialsProviderChain();
        region = Region.getRegion(Regions.AP_NORTHEAST_1);
    }
}
