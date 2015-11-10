package jp.co.biglobe.isp.aws;

import lombok.Getter;

@Getter
public class SystemCommon {

    // システム名
    final String name;
    // 環境
    final Environment environment;


    public SystemCommon(String name, String environment) {
        this.name = name;
        this.environment = Environment.valueOf(environment);
    }
}
