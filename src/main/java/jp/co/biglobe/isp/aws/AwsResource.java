package jp.co.biglobe.isp.aws;

public interface AwsResource {

    <E extends AwsResource> E describe(AwsCommon aws);

    <E extends AwsResource> E create(AwsCommon aws);

    void delete(AwsCommon aws);
}
