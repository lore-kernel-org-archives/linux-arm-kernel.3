Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFABC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 10:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSjJtqdXOK2619OVhSk/cvk2yD64s3HepL+hT3bVVSo=; b=SL9Rg5Oz7rQ3zCXBltBiqjv0cB
	JYm+3W7tnuQ8G68BshiiGUj/nkKDGyb54vwcnIb2J+hNq1cw+ZyEu0DfI71NHGbymrGmRE05cHyit
	JcG6HH7E3iBaJBzyj4kOIyBbkRMDyDK5aHOkMV61BqXDMwu5SPPqnk5VP4g/02M0G/1rWtOZe/hsT
	LRMoeHeUqjM+G6YLvGgoNkNTCGU0blSmuodrcVXUyeQ7xD/kmugyTMED/hL5+I2s8TcqNO6cANkxf
	K0XLzixEcWlZzIcor470pgVYDo/eJarfz1K+xyw9OwBDgw5og2p0nRTYaOT4Uyf5BvlJ7xdSvDmLK
	w8nGUD7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcUU-00000004mqO-3OQt;
	Tue, 15 Jul 2025 10:02:26 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcFb-00000004k82-3edX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 09:47:05 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56F9ks402235260;
	Tue, 15 Jul 2025 04:46:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752572814;
	bh=jSjJtqdXOK2619OVhSk/cvk2yD64s3HepL+hT3bVVSo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TU+S+Vjxvo1w/t9UsKNrQ7K9dEjlS8PBqFfDcOZohoVDL/YBUsR2zQLSoonzh2XRQ
	 B66XhiP0jHH3c5+Zy71bpyzUZc0p16vdIUNf9zkTKlKO/tMjfd6WyfcaLJ26kxklsw
	 Y7tqfJ8rHVa4RCgsuR4xGjx3Y0ctRPUnsUdFH01I=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56F9kstD1177302
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 15 Jul 2025 04:46:54 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 15
 Jul 2025 04:46:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 15 Jul 2025 04:46:54 -0500
Received: from [172.24.227.166] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.166])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56F9kotu2356744;
	Tue, 15 Jul 2025 04:46:51 -0500
Message-ID: <e8400355-d59e-44ad-8f69-af068a6ee85c@ti.com>
Date: Tue, 15 Jul 2025 15:16:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] arm64: dts: ti: k3-j784s4-j742s2-main-common: add
 DSI & DSI PHY
To: Vignesh Raghavendra <vigneshr@ti.com>, <nm@ti.com>,
        <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250624082619.324851-1-j-choudhary@ti.com>
 <20250624082619.324851-2-j-choudhary@ti.com>
 <ed2ccf14-b470-4f3e-a793-61866cf7e26c@ti.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <ed2ccf14-b470-4f3e-a793-61866cf7e26c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_024704_008304_138354B2 
X-CRM114-Status: GOOD (  12.93  )
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

On 26/06/25 11:56, Vignesh Raghavendra wrote:
> Hi
> 
> On 24/06/25 13:56, Jayesh Choudhary wrote:
>> Add DT nodes for DPI to DSI Bridge and DSI Phy.
>> The DSI bridge is Cadence DSI and the PHY is a
>> Cadence DPHY with TI wrapper.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 37 +++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>> index 363d68fec387..2413c4913a8b 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
>> @@ -2517,6 +2517,43 @@ watchdog18: watchdog@2550000 {
>>   		status = "reserved";
>>   	};
>>   
>> +	dphy_tx0: phy@4480000 {
>> +		compatible = "ti,j721e-dphy";
>> +		reg = <0x0 0x04480000 0x0 0x1000>;
> 
> Follow the convention of the file. Use:
> 
> 		reg = <0x00 0x04480000 0x00 0x1000>;

Okay I will add padding.
Will add it to 4th field as well as I am seeing it in some
nodes:

reg = <0x00 0x04480000 0x00 0x00001000>;

> 
> Please fix throughout the series.


Okay.

> 
>> +		clocks = <&k3_clks 402 20>, <&k3_clks 402 3>;
>> +		clock-names = "psm", "pll_ref";
>> +		#phy-cells = <0>;
>> +		power-domains = <&k3_pds 402 TI_SCI_PD_EXCLUSIVE>;
>> +		assigned-clocks = <&k3_clks 402 3>;
>> +		assigned-clock-parents = <&k3_clks 402 4>;
>> +		assigned-clock-rates = <19200000>;
>> +		status = "disabled";
>> +	};
>> +
>> +	dsi0: dsi@4800000 {
>> +		compatible = "ti,j721e-dsi";
>> +		reg = <0x0 0x04800000 0x0 0x100000>, <0x0 0x04710000 0x0 0x100>;
>> +		clocks = <&k3_clks 215 2>, <&k3_clks 215 5>;
>> +		clock-names = "dsi_p_clk", "dsi_sys_clk";
>> +		power-domains = <&k3_pds 215 TI_SCI_PD_EXCLUSIVE>;
> 
>> +		interrupt-parent = <&gic500>;
> 
> This is implied and can be dropped.

Will drop.

Warm Regards,
Jayesh

> 
>> +		interrupts = <GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH>;
>> +		phys = <&dphy_tx0>;
>> +		phy-names = "dphy";
>> +		status = "disabled";
>> +
>> +		dsi0_ports: ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			port@0 {
>> +				reg = <0>;
>> +			};
>> +			port@1 {
>> +				reg = <1>;
>> +			};
>> +		};
>> +	};
>> +
>>   	mhdp: bridge@a000000 {
>>   		compatible = "ti,j721e-mhdp8546";
>>   		reg = <0x0 0xa000000 0x0 0x30a00>,
> 

