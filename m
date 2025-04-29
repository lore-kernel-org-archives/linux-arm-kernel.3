Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7F9C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 07:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xji29AeQrTuafVznn9jEAm/SluSXzCm1zJ/2Vyy1tQc=; b=cfZ320H5r8hH0T4n8NVXm+dp7y
	xgviaI9UsH7b+L6srxB4hKCL9NkznxFjUOfRKdjvjMN3dK9DPr+dA7D2RIaEXBuTgJsIZNPupSEJb
	mvysymy+3VMHbhyRfthxCufKvy+36pi/K3vAFIndbFy/USnLLR1FuA/g7yTWeWRSIu42fCWkQxGCn
	IOPXtmLkR0vBOtDJnqsbCQv1tzv3oCWTOfrsGo2fLm/Yl5LWC4Zcg+oOgjejrxMmtIflXrWI5eBRa
	5t8wB2tOWUss5YdtlcfapKGCUQN2cV3qU2nC/AodB1FgrU6zAng9yfMFIZphUpPn6iHERCO6+f89H
	77ww5wZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fY5-00000008miL-1uEB;
	Tue, 29 Apr 2025 07:38:37 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fOY-00000008krO-3Br8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 07:28:48 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53T7ShD33027792
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 02:28:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745911723;
	bh=Xji29AeQrTuafVznn9jEAm/SluSXzCm1zJ/2Vyy1tQc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=y2zF76gpa+SIgv1ror2rHkxg2ODljwtgFqzAZCtzqmexgGqqQdoaD7WqfW+FSE4vg
	 0FPsUOHM7P6UG9PhGEeUQXHh+y+ErhLeDE1bVk1AzHKbJgAi8njWe33iDrz+wD4H+P
	 4K9pNAoPlDgS4oJ3jxeNAMKMgisvHgtCElJCoQ6I=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53T7ShN6051172
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 02:28:43 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 02:28:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 02:28:42 -0500
Received: from [172.24.227.220] (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53T7ScOc110802;
	Tue, 29 Apr 2025 02:28:39 -0500
Message-ID: <ce025a6f-abf3-44aa-b011-848deea4c309@ti.com>
Date: Tue, 29 Apr 2025 12:58:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: ti: k3-am68-sk/k3-j721s2-mcu: Add
 bootph-all property to enable Ethernet boot
To: Nishanth Menon <nm@ti.com>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, <srk@ti.com>,
        <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250425051055.2393301-1-c-vankar@ti.com>
 <20250425051055.2393301-2-c-vankar@ti.com>
 <20250425212427.vvyocc4mmne5g3vq@vividly>
Content-Language: en-US
From: Chintan Vankar <c-vankar@ti.com>
In-Reply-To: <20250425212427.vvyocc4mmne5g3vq@vividly>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_002846_907078_178821BA 
X-CRM114-Status: GOOD (  14.94  )
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

On 26/04/25 02:54, Nishanth Menon wrote:
> On 10:40-20250425, Chintan Vankar wrote:
>> Ethernet boot requires CPSW nodes to be present starting from R5 SPL
>> stage. Add bootph-all property to required nodes to enable Ethernet boot
>> on AM68-SK and J721S2-EVM.
>>
>> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
>> ---
>>
>> Link to v2:
>> https://lore.kernel.org/r/20250302153502.181832-2-c-vankar@ti.com/
>>
>> Changes from v2 to v3:
>> - Removed "bootph-all" property from "mcu_cpsw" node as suggested by
>>    Vignesh since child node already has that.
>>
>>   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 3 +++
>>   arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi | 3 +++
> 
> Why does every board that uses j721s2 need to have bootph-all for
> cpsw? Is network boot mandatory boot mode for all boards? That does
> not sound right. Just do them in the board file please.
> 

I have posted next version with your changes at here:
https://lore.kernel.org/r/20250429072644.2400295-1-c-vankar@ti.com/

Regards,
Chintan.

>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
>> index 5fa70a874d7b..c402d5e288b0 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
>> @@ -344,6 +344,7 @@ J721S2_WKUP_IOPAD(0x008, PIN_OUTPUT, 0) /* (E22) MCU_RGMII1_TD3 */
>>   			J721S2_WKUP_IOPAD(0x018, PIN_OUTPUT, 0) /* (F21) MCU_RGMII1_TXC */
>>   			J721S2_WKUP_IOPAD(0x000, PIN_OUTPUT, 0) /* (F22) MCU_RGMII1_TX_CTL */
>>   		>;
>> +		bootph-all;
>>   	};
>>   
>>   	mcu_mdio_pins_default: mcu-mdio-default-pins {
>> @@ -351,6 +352,7 @@ mcu_mdio_pins_default: mcu-mdio-default-pins {
>>   			J721S2_WKUP_IOPAD(0x034, PIN_OUTPUT, 0) /* (A21) MCU_MDIO0_MDC */
>>   			J721S2_WKUP_IOPAD(0x030, PIN_INPUT, 0) /* (A22) MCU_MDIO0_MDIO */
>>   		>;
>> +		bootph-all;
>>   	};
>>   
>>   	mcu_mcan0_pins_default: mcu-mcan0-default-pins {
>> @@ -626,6 +628,7 @@ &mcu_cpsw {
>>   &davinci_mdio {
>>   	phy0: ethernet-phy@0 {
>>   		reg = <0>;
>> +		bootph-all;
>>   		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
>>   		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
>>   		ti,min-output-impedance;
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
>> index bc31266126d0..218290b1840a 100644
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
>> @@ -562,6 +564,7 @@ cpsw_port1: port@1 {
>>   				label = "port1";
>>   				ti,syscon-efuse = <&cpsw_mac_syscon 0x0>;
>>   				phys = <&phy_gmii_sel 1>;
>> +				bootph-all;
>>   			};
>>   		};
>>   
>> -- 
>> 2.34.1
>>
>>
> 

