package jp.co.biglobe.isp.aws;


import com.amazonaws.auth.AWSCredentialsProviderChain;
import com.amazonaws.regions.Region;

public interface AwsCommon {

    // 認証情報
    AWSCredentialsProviderChain getCredential();

    // リージョン
    Region getRegion();
}
