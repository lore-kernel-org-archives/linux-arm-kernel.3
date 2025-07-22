Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4B4C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 05:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HA54An8RWm8lbhsfU7W1tLrMDcipcyCl86TuK6LUpE=; b=LlyCrrbtXvaEEqosyRsaAbtAmt
	4VzLdKGo4Egr+L3m02WRhQ4xTBAGYUZcbIjtH0R/z6AgeJsR+lBWSK/KUbgvlhbuN7Kd+z+ACMaBn
	4THlg9LEoDJ65z0NW/PvkT0tyF4MtVqZ6hmnXwPGpKNdPn6Nq0T7wUvnCIxBZiPhHCcawIv04pr1k
	LIUH9HgGdxpyA/OZk68vGMxbHRHlC2B3zGf4FRFf5Wnt4sbkxhzYgGDwhb92SqszqNgrrFyhBji+B
	WByh64Eax2Jh9z4GrqCBJGeXzcPfzPPQI7TQc4+L7W9oTPh83IeG8+UeZj4GB1nvcYiXd6dKINAbC
	9UgTar9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue60H-00000001NRf-0lPh;
	Tue, 22 Jul 2025 05:57:29 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5u1-00000001MWT-0JJA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 05:51:03 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56M5ouYR975209;
	Tue, 22 Jul 2025 00:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753163456;
	bh=/HA54An8RWm8lbhsfU7W1tLrMDcipcyCl86TuK6LUpE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NkULTkd8CLRwZL9F4AcpCREgbRZ0ibeZauJ1ob/YiYnlraZPHpzoJgze025JXhc6w
	 kCi1OsbCQoV3H9LJG83V5k3eXnqkESUqLaKSJOSYr9IqK7k3BXjhIqE5LQkkhQioyR
	 uZonsnsJfF6Tin4Yk4T050tRH8cx5z+7P5jUGmBY=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56M5ouKh1882953
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 22 Jul 2025 00:50:56 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 22
 Jul 2025 00:50:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 22 Jul 2025 00:50:55 -0500
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56M5opG6535126;
	Tue, 22 Jul 2025 00:50:52 -0500
Message-ID: <457e2428-f766-4e8d-bfb0-32084de45b5a@ti.com>
Date: Tue, 22 Jul 2025 11:20:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: ti: k3-j721s2-main: Add interrupts
 property
To: "Kumar, Udit" <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20250714092708.3944641-1-y-abhilashchandra@ti.com>
 <20250714092708.3944641-2-y-abhilashchandra@ti.com>
 <72545187-4605-40bb-9c68-54670c2e5332@ti.com>
 <05a07a03-3f59-489b-ae55-5f454266bafb@ti.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <05a07a03-3f59-489b-ae55-5f454266bafb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_225101_249662_B361BE32 
X-CRM114-Status: GOOD (  12.16  )
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

Hi Udit,

Thanks for the review.

On 21/07/25 19:40, Kumar, Udit wrote:
> 
> On 7/21/2025 7:37 PM, Kumar, Udit wrote:
>>
>> On 7/14/2025 2:57 PM, Yemike Abhilash Chandra wrote:
>>> Add interrupts property for CDNS CSI2RX. Interrupt IDs are taken from 
>>> the
>>> J721S2 TRM [0].
>>>
>>> Interrupt Line      | Source Interrupt
>>> --------------------|----------------------------
>>> GIC500SS_SPI_IN_153 | CSI_RX_IF1_CSI_ERR_IRQ_0
>>> GIC500SS_SPI_IN_152 | CSI_RX_IF1_CSI_IRQ_0
>>> GIC500SS_SPI_IN_157 | CSI_RX_IF2_CSI_ERR_IRQ_0
>>> GIC500SS_SPI_IN_156 | CSI_RX_IF2_CSI_IRQ_0
>>>
>>> [0]: https://www.ti.com/lit/zip/spruj28
>>>
>>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>>> ---
>>>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi 
>>> b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
>>> index 62f45377a2c9..6f32a2b0c40c 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
>>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
>>> @@ -1248,6 +1248,9 @@ ti_csi2rx0: ticsi2rx@4500000 {
>>>           cdns_csi2rx0: csi-bridge@4504000 {
>>>               compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
>>>               reg = <0x00 0x04504000 0x00 0x1000>;
>>> +            interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
>>> +                     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
>>
>> Just cosmetic thing, if you are doing v2 then consider 152 first , 
>> followed by 153.
>>
>> Otherwise
>>
>> Reviewed-by: Udit Kumar <u-kumar1@ti.com>
> 
> 
> Sorry, sent too fast, offset of 32 missing .
> 

 From what I’ve seen, the SPI interrupt IDs on J721S2 start from 0,
so I don’t think we need to subtract the 32 offset.


Interrupt Input Line   Interrupt ID    Source Interrupt
-------------------------------------------------------------
GIC500SS_SPI_IN_00     0               ESM0_ESM_INT_CFG_LVL_0

To confirm this, I’ve latched onto the correct interrupt line, and
my IRQ handler is getting triggered as expected. I’m also seeing the
desired output [0].

Let me know if I might be missing anything.

[0]: 
https://gist.github.com/Yemike-Abhilash-Chandra/f46587ec1ef72671ee31803dd93434b4

Thanks and Regards
Yemike Abhilash Chandra

> 
>>
>>> +            interrupt-names = "error_irq", "irq";
>>>               clocks = <&k3_clks 38 3>, <&k3_clks 38 1>, <&k3_clks 38 
>>> 3>,
>>>                   <&k3_clks 38 3>, <&k3_clks 38 4>, <&k3_clks 38 4>;
>>>               clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
>>> @@ -1301,6 +1304,9 @@ ti_csi2rx1: ticsi2rx@4510000 {
>>>           cdns_csi2rx1: csi-bridge@4514000 {
>>>               compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
>>>               reg = <0x00 0x04514000 0x00 0x1000>;
>>> +            interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
>>> +                     <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
>>> +            interrupt-names = "error_irq", "irq";
>>>               clocks = <&k3_clks 39 3>, <&k3_clks 39 1>, <&k3_clks 39 
>>> 3>,
>>>                   <&k3_clks 39 3>, <&k3_clks 39 4>, <&k3_clks 39 4>;
>>>               clock-names = "sys_clk", "p_clk", "pixel_if0_clk",

