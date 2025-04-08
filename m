Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836EFC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 09:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrO5+3jLA9u6YmdlYq07ISlibfw3+DurUYygTV//ofg=; b=30cC8BjXUMe/OYGO6uHwp3MTsy
	MlL8bLMd6oMOxOlrGM6RjEePHXkOh3fDxCBPAseSPuLU/w1bc0PS6moEJU+qwCe7xoVV3NNFbaEiO
	Wg0cU/dTlOg0qUFyV6vfMPg48vEiqmwKDC6bf3NEIQXAjgQbksm+M/u4BQzqhVSfit+ecYTJvx9bz
	2u159Qke2UpeD68c+p9qs2ugn5InLO4g8zSHhnLUFdS9HK0kG3iuOrK/TH5J4WRL/YrCU0Div+d4s
	Jf2NnpEoaHnOhKJtLBo6I+eQP2k5xW8H6lbJj4nP511VvtPKRBeebfv2q5dHb5HGO4ZVK96RnQ79V
	otBw2/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u256M-00000003Pip-2NKN;
	Tue, 08 Apr 2025 09:18:38 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24qO-00000003Mgx-0vZe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 09:02:09 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53891hi11160287
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 04:01:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744102903;
	bh=rrO5+3jLA9u6YmdlYq07ISlibfw3+DurUYygTV//ofg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JOkLFO3xUToYd/3n7owkQSKS7En/kxmM0K9OB3M57N7mEAnePlon7ZipaD19H72SM
	 aDjEp7Z5mVR9nQ0po4zpI+gx6cP9pkhfZwoX1gsFCuy9rtRE/VFjF+z96brCVBwbNe
	 0RRMPjd0JFmcXmkveJtIfCygdZBGzEn6izsX3Rzk=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53891hYc094144
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 04:01:43 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 04:01:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 04:01:42 -0500
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53891cZ8017127;
	Tue, 8 Apr 2025 04:01:39 -0500
Message-ID: <c1762c69-6a76-4f89-ab64-e6d9215e1be2@ti.com>
Date: Tue, 8 Apr 2025 14:31:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: ti: k3-j721e-sk: Fix dtbs_check warnings
 in IMX219 overlay
To: Nishanth Menon <nm@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <jai.luthra@linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250401114053.229534-1-y-abhilashchandra@ti.com>
 <20250401114053.229534-4-y-abhilashchandra@ti.com>
 <20250407134523.d56rjpydflmkw2ze@privatize>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20250407134523.d56rjpydflmkw2ze@privatize>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_020208_356638_EDDE8DE9 
X-CRM114-Status: GOOD (  15.69  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Nishanth,

On 07/04/25 19:15, Nishanth Menon wrote:
> $subject - the patch adds description for the supplies for the sensor.
> Please fix the description.
> 

In this patch, I am addressing all dtbs_check warnings generated from 
this overlay:

1. Adding the missing regulator node
2. Removing the incorrectly added clock-names property

Due to the inclusion of both changes, I opted for a more generic commit 
title.
Please let me know if you want me to split this patch into two separate 
patches
with specific commit titles and commit messages.

Thanks and Regards
Yemike Abhilash Chandra

> On 17:10-20250401, Yemike Abhilash Chandra wrote:
>> The device tree bindings mandate three regulator nodes for the IMX219
>> sensor: VANA (analog), VDIG (digital core), and VDDL (digital I/O). Add the
>> necessary regulator nodes in the device tree overlay and also the device
>> tree bindings do not include a clock-names property. Remove the incorrectly
>> added clock-names entry to avoid dtbs_check warnings.
>>
>> Fixes: f767eb918096 ("arm64: dts: ti: k3-j721e-sk: Add overlay for IMX219")
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>>   .../dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso  | 35 +++++++++++++++++--
>>   1 file changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso b/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
>> index 47bb5480b5b0..4eb3cffab032 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
>> +++ b/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
>> @@ -19,6 +19,33 @@ clk_imx219_fixed: imx219-xclk {
>>   		#clock-cells = <0>;
>>   		clock-frequency = <24000000>;
>>   	};
>> +
>> +	reg_2p8v: regulator-2p8v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "2P8V";
>> +		regulator-min-microvolt = <2800000>;
>> +		regulator-max-microvolt = <2800000>;
>> +		vin-supply = <&vdd_sd_dv>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	reg_1p8v: regulator-1p8v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "1P8V";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		vin-supply = <&vdd_sd_dv>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	reg_1p2v: regulator-1p2v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "1P2V";
>> +		regulator-min-microvolt = <1200000>;
>> +		regulator-max-microvolt = <1200000>;
>> +		vin-supply = <&vdd_sd_dv>;
>> +		regulator-always-on;
>> +	};
>>   };
>>   
>>   &csi_mux {
>> @@ -34,7 +61,9 @@ imx219_0: imx219-0@10 {
>>   		reg = <0x10>;
>>   
>>   		clocks = <&clk_imx219_fixed>;
>> -		clock-names = "xclk";
>> +		VANA-supply = <&reg_2p8v>;
>> +		VDIG-supply = <&reg_1p8v>;
>> +		VDDL-supply = <&reg_1p2v>;
>>   
>>   		port {
>>   			csi2_cam0: endpoint {
>> @@ -56,7 +85,9 @@ imx219_1: imx219-1@10 {
>>   		reg = <0x10>;
>>   
>>   		clocks = <&clk_imx219_fixed>;
>> -		clock-names = "xclk";
>> +		VANA-supply = <&reg_2p8v>;
>> +		VDIG-supply = <&reg_1p8v>;
>> +		VDDL-supply = <&reg_1p2v>;
>>   
>>   		port {
>>   			csi2_cam1: endpoint {
>> -- 
>> 2.34.1
>>
> 

