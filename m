Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DFCC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 06:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVjrJMnJOpuiRTEnMRkig0no+x/TJr9/Pw/Rfkn0XB0=; b=CQlSGynICh4aNsLPOQHnE1FjN+
	T2aLCoxFu3MzbI06phYcJAOT9CXBTZV03/l64LgQay49wq6gRpTHjT/jQIOnqhWs+PVF1tYI70LWw
	qqcGZZ/OXLltKX+ntrywzUW0UFQ5Qhjedx/j6fwj1s/SjVXitMrF19aVjRTF/NM1LP/aoCpl+hW6O
	QYcXYlQQkQC44dQ0GDYeHQBNyaW3BruP9e4GKWc3YPzCoJkFjRbhk1QbmbrvBZGeVefmr1dWcH20u
	s7n2qEKF91NUBrxXCXgbfbfwVlb1b3AjC5Dv2cIMbPfRrlkmYwRUFVGk+DCF+1DSaX7ucFK5QKz5c
	aiSzeezQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0Zn-0000000Bp3u-2oxD;
	Wed, 30 Apr 2025 06:05:47 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0Jr-0000000BnOu-2fVN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 05:49:21 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53U5nFpR3282298
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 00:49:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745992155;
	bh=SVjrJMnJOpuiRTEnMRkig0no+x/TJr9/Pw/Rfkn0XB0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=R4wB0hke52yhPC1TGBVIRgSk8mKtcYCBoIcTfx02J0kQqByFO/6iHOjABczKflkFJ
	 YM+uYtF3ZDLB0Bx7gIgaZvHPGJJSBlcCMcqg1F/uQWq5D4TbGt3qR7KbT53xeZhzzu
	 P3vPOAo7Lj1OsdyYdiVFltirmr8Ndlgl1t0a9QN8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53U5nFHM083316
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Apr 2025 00:49:15 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 30
 Apr 2025 00:49:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 30 Apr 2025 00:49:14 -0500
Received: from [10.249.135.124] ([10.249.135.124])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53U5n1e0080805;
	Wed, 30 Apr 2025 00:49:02 -0500
Message-ID: <511ef271-ed0b-40b6-9abc-9fce0081d25b@ti.com>
Date: Wed, 30 Apr 2025 11:18:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: k3-am62p*/k3-j722s: Add bootph-all
 property to enable Ethernet boot
To: Nishanth Menon <nm@ti.com>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, <srk@ti.com>,
        <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Roger
 Quadros <rogerq@kernel.org>
References: <20250429072644.2400295-1-c-vankar@ti.com>
 <20250429072644.2400295-3-c-vankar@ti.com>
 <20250429112728.m54x2jwyjykcuus7@unzip>
Content-Language: en-US
From: "Vankar, Chintan" <c-vankar@ti.com>
In-Reply-To: <20250429112728.m54x2jwyjykcuus7@unzip>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_224919_859576_EF3F8FA1 
X-CRM114-Status: GOOD (  15.68  )
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

Hello Nishanth,

On 4/29/2025 4:57 PM, Nishanth Menon wrote:
> On 12:56-20250429, Chintan Vankar wrote:
>> Ethernet boot requires CPSW nodes to be present starting from R5 SPL
>> stage. Add bootph-all property to required nodes to enable Ethernet boot
>> for AM62P5-SK and J722S-EVM.
>>
>> Reviewed-by: Roger Quadros <rogerq@kernel.org>
>> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
>> ---
>>
>> Link to v3:
>> https://lore.kernel.org/r/20250425051055.2393301-3-c-vankar@ti.com/
>>
>> Changes from v3 to v4:
>> - No changes.
>>
>>   arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 3 +++
> 
> Please notice that we have the same problem[1] here as well.
> 
> [1] https://lore.kernel.org/all/20250425212427.vvyocc4mmne5g3vq@vividly/

I have added "bootph-all" property in the common file of J722S-EVM and 
AM62P5-SK since we are enabling Ethernet boot for both the boards. Are
you referring to move the nodes I have added in
"k3-am62p-j722s-common-main.dtsi" to respective board files,
"k3-am62p5-sk.dts" and "k3-j722s-evm.dts".

Regards,
Chintan.

> 
>>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts                | 2 ++
>>   arch/arm64/boot/dts/ti/k3-j722s-evm.dts                | 3 +++
>>   3 files changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>> index 7b65538110e8..11f484f88603 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>> @@ -50,6 +50,7 @@ phy_gmii_sel: phy@4044 {
>>   			compatible = "ti,am654-phy-gmii-sel";
>>   			reg = <0x4044 0x8>;
>>   			#phy-cells = <1>;
>> +			bootph-all;
>>   		};
>>   
>>   		epwm_tbclk: clock-controller@4130 {
>> @@ -730,6 +731,7 @@ cpsw_port1: port@1 {
>>   				mac-address = [00 00 00 00 00 00];
>>   				ti,syscon-efuse = <&cpsw_mac_syscon 0x0>;
>>   				status = "disabled";
>> +				bootph-all;
>>   			};
>>   
>>   			cpsw_port2: port@2 {
>> @@ -751,6 +753,7 @@ cpsw3g_mdio: mdio@f00 {
>>   			clock-names = "fck";
>>   			bus_freq = <1000000>;
>>   			status = "disabled";
>> +			bootph-all;
>>   		};
>>   
>>   		cpts@3d000 {
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>> index d29f524600af..5b2f0945a9eb 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>> @@ -227,6 +227,7 @@ main_mdio1_pins_default: main-mdio1-default-pins {
>>   			AM62PX_IOPAD(0x0160, PIN_OUTPUT, 0) /* (F17) MDIO0_MDC */
>>   			AM62PX_IOPAD(0x015c, PIN_INPUT, 0) /* (F16) MDIO0_MDIO */
>>   		>;
>> +		bootph-all;
>>   	};
>>   
>>   	main_mmc1_pins_default: main-mmc1-default-pins {
>> @@ -496,6 +497,7 @@ &cpsw3g_mdio {
>>   
>>   	cpsw3g_phy0: ethernet-phy@0 {
>>   		reg = <0>;
>> +		bootph-all;
>>   		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
>>   		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
>>   		ti,min-output-impedance;
>> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
>> index 34b9d190800e..93d770c5792e 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
>> @@ -310,6 +310,7 @@ mdio_pins_default: mdio-default-pins {
>>   			J722S_IOPAD(0x0160, PIN_OUTPUT, 0) /* (AC24) MDIO0_MDC */
>>   			J722S_IOPAD(0x015c, PIN_INPUT, 0) /* (AD25) MDIO0_MDIO */
>>   		>;
>> +		bootph-all;
>>   	};
>>   
>>   	ospi0_pins_default: ospi0-default-pins {
>> @@ -344,6 +345,7 @@ J722S_IOPAD(0x0140, PIN_OUTPUT, 0) /* (AF24) RGMII1_TD3 */
>>   			J722S_IOPAD(0x0130, PIN_OUTPUT, 0) /* (AG26) RGMII1_TXC */
>>   			J722S_IOPAD(0x012c, PIN_OUTPUT, 0) /* (AF25) RGMII1_TX_CTL */
>>   		>;
>> +		bootph-all;
>>   	};
>>   
>>   	main_usb1_pins_default: main-usb1-default-pins {
>> @@ -388,6 +390,7 @@ &cpsw3g_mdio {
>>   
>>   	cpsw3g_phy0: ethernet-phy@0 {
>>   		reg = <0>;
>> +		bootph-all;
>>   		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
>>   		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
>>   		ti,min-output-impedance;
>> -- 
>> 2.34.1
>>
> 

