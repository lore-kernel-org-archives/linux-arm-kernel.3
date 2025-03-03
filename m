Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D948FC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 18:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OXcs9rd6LU272jx0hvJeNCeWilIYJbVsDhfgH7IVNQ=; b=ZTJkJZz0LsjEgbuXiYW22y2I3j
	1EpTExOgLfOjV+L0mEqyfIZwZ/Y9AYK/Q4G9EnX7+p6b1ib1CtPsnBD5k/V+/rYFDXwL8OwuOOJ3R
	HppDETEDSalXf3AG2VXxP3q2ki8aKJ7AGgXT8BlJ3Ttmfu1lsfa+oJfPEZJAY11dOW6bkGWKPkyzR
	iMwf9MeoC+M2XtLILVZ5/oygwFmJ/zFN92JocB3rJ/Lu/lo6nVFkjkoLXNnD52QfhjUb/su1q7fno
	HAmE1grsFLzy1MywQVE8hcbHZePSg//k6EQ4+J3xTAqfQJJEwoibeH+XVwe2bVfhezTzjp6FhKfFq
	dunf9IMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAWh-00000001wNi-1Xri;
	Mon, 03 Mar 2025 18:28:27 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAV6-00000001w7U-29j4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 18:26:50 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 523IQfH32746417
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Mar 2025 12:26:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741026401;
	bh=2OXcs9rd6LU272jx0hvJeNCeWilIYJbVsDhfgH7IVNQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IP9//ev56TbGqMZ4D6UhiHjkB3UkqOwXIcxc/Lb7DUN08WlFG0BwY5JDQJ74taTO5
	 PWMmHDzt2InU1W29kibhGNVQfSgkgj6JYZ6bxDb3RDYjmkbf4IBmGSGkAHxio2GU14
	 BLc4drnHFmYwMbJiiapoI3/cLR7vT00hbjKI7tKY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 523IQfbc003604
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Mar 2025 12:26:41 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Mar 2025 12:26:41 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Mar 2025 12:26:41 -0600
Received: from [10.249.135.49] ([10.249.135.49])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 523IQbTg121603;
	Mon, 3 Mar 2025 12:26:38 -0600
Message-ID: <13bd564d-84bc-4b97-9591-126eb51772fb@ti.com>
Date: Mon, 3 Mar 2025 23:56:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: ti: k3-am68-sk/k3-j721s2-mcu: Add
 bootph-all property to enable Ethernet boot
To: Vignesh Raghavendra <vigneshr@ti.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero
 Kristo <kristo@kernel.org>,
        Nishanth Menon <nm@ti.com>
CC: <s-vadapalli@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250302153502.181832-1-c-vankar@ti.com>
 <20250302153502.181832-2-c-vankar@ti.com>
 <6b5839b3-84cb-42ee-8336-81ebf9b2e40d@ti.com>
Content-Language: en-US
From: "Vankar, Chintan" <c-vankar@ti.com>
In-Reply-To: <6b5839b3-84cb-42ee-8336-81ebf9b2e40d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_102648_838820_F0BB016E 
X-CRM114-Status: GOOD (  13.95  )
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

Hello Vignesh,

On 3/3/2025 1:44 PM, Vignesh Raghavendra wrote:
> 
> 
> On 02/03/25 21:05, Chintan Vankar wrote:
>> Ethernet boot requires CPSW nodes to be present starting from R5 SPL
>> stage. Add bootph-all property to required nodes to enable Ethernet boot
>> on AM68-SK and J721S2-EVM.
>>
>> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
>> ---
>>
>> Link to v1:
>> https://lore.kernel.org/r/20250106123122.3531845-2-c-vankar@ti.com/
>>
>> Changes from v1 to v2:
>> - No changes.
>>
>>   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 3 +++
>>   arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi | 4 ++++
>>   2 files changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
>> index 11522b36e0ce..8e9101dd2152 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
>> @@ -333,6 +333,7 @@ J721S2_WKUP_IOPAD(0x008, PIN_OUTPUT, 0) /* (E22) MCU_RGMII1_TD3 */
>>   			J721S2_WKUP_IOPAD(0x018, PIN_OUTPUT, 0) /* (F21) MCU_RGMII1_TXC */
>>   			J721S2_WKUP_IOPAD(0x000, PIN_OUTPUT, 0) /* (F22) MCU_RGMII1_TX_CTL */
>>   		>;
>> +		bootph-all;
>>   	};
>>   
>>   	mcu_mdio_pins_default: mcu-mdio-default-pins {
>> @@ -340,6 +341,7 @@ mcu_mdio_pins_default: mcu-mdio-default-pins {
>>   			J721S2_WKUP_IOPAD(0x034, PIN_OUTPUT, 0) /* (A21) MCU_MDIO0_MDC */
>>   			J721S2_WKUP_IOPAD(0x030, PIN_INPUT, 0) /* (A22) MCU_MDIO0_MDIO */
>>   		>;
>> +		bootph-all;
>>   	};
>>   
>>   	mcu_mcan0_pins_default: mcu-mcan0-default-pins {
>> @@ -615,6 +617,7 @@ &mcu_cpsw {
>>   &davinci_mdio {
>>   	phy0: ethernet-phy@0 {
>>   		reg = <0>;
>> +		bootph-all;
>>   		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
>>   		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
>>   		ti,min-output-impedance;
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
>> index bc31266126d0..29cd4b1ffbbf 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
>> @@ -154,12 +154,14 @@ mcu_conf: bus@40f00000 {
>>   		cpsw_mac_syscon: ethernet-mac-syscon@200 {
>>   			compatible = "ti,am62p-cpsw-mac-efuse", "syscon";
>>   			reg = <0x200 0x8>;
>> +			bootph-all;
>>   		};
>>   
>>   		phy_gmii_sel: phy@4040 {
>>   			compatible = "ti,am654-phy-gmii-sel";
>>   			reg = <0x4040 0x4>;
>>   			#phy-cells = <1>;
>> +			bootph-all;
>>   		};
>>   
>>   	};
>> @@ -538,6 +540,7 @@ mcu_cpsw: ethernet@46000000 {
>>   		clocks = <&k3_clks 29 28>;
>>   		clock-names = "fck";
>>   		power-domains = <&k3_pds 29 TI_SCI_PD_EXCLUSIVE>;
>> +		bootph-all;
>>   
> 
> Since a child node has bootph-all, no need to put the same in the parent
> hierarchy.
> 

Thank you for pointing this out, I will remove it from the parent node
and post the next version.

Regards,
Chintan.

>>   		dmas = <&mcu_udmap 0xf000>,
>>   		       <&mcu_udmap 0xf001>,
>> @@ -562,6 +565,7 @@ cpsw_port1: port@1 {
>>   				label = "port1";
>>   				ti,syscon-efuse = <&cpsw_mac_syscon 0x0>;
>>   				phys = <&phy_gmii_sel 1>;
>> +				bootph-all;
>>   			};
>>   		};
>>   
> 
> 

