Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D31C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 11:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrRSD3PbZTPAHVSh/yIWQ6kP6ELKmzfyM3fZUnn2niM=; b=wpYlAXvGtZ1PQuDAMgnDTfuvca
	LkyiwIORlQaMmifD5S8IQKYtf4MdmSvRmT/A0JptPJXmXKuvpayqTr5kmSg/5QjB1/463TQ4poK1V
	oaRQ9K2TAUfNMggpVOuSRy+CdjAQG71A+jWUnC7iycefVB7NUwctUIMkHyL2Aak75hTfQM+t9GQZg
	Ovys0FnMw3UO6NvSPtJYQ0QdAPklel5CI9I2x8VGe1hZ8rHX2Z589V7FkZthE0JGqPl3vREMbi7EJ
	MYy60BwkZZ+4YhzXRNPr+40xDts6JrRcBQBf6KO8uV8mEhi7JJLhAjXwK/93XQPl11HD7d8vx76mD
	0XTRcCrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGVm-00000009hUi-3A4j;
	Fri, 25 Jul 2025 11:22:50 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFwc-00000009dA8-1U3X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:46:31 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56PAkNbO2163931;
	Fri, 25 Jul 2025 05:46:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753440383;
	bh=mrRSD3PbZTPAHVSh/yIWQ6kP6ELKmzfyM3fZUnn2niM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=X7fKBOwxApS4IoduzRVtbBYQu/sYtQFJLtz/Lq3y0UbRkIFschtdBwNGgzoztH4tj
	 kGUivju/mcixXVJjJNuUCE4uphyZoX8GD3jNlJiglRVhuv1MqE/M3B9AmPvh7eg9R6
	 OA+8ItOIqJWvFU8+RfY+RFuHrlNOGOJvc+yY7U48=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56PAkNG82237368
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 25 Jul 2025 05:46:23 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 25
 Jul 2025 05:46:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 25 Jul 2025 05:46:23 -0500
Received: from [172.24.18.25] (lt5cd2489kgj.dhcp.ti.com [172.24.18.25])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56PAkJ6l1924763;
	Fri, 25 Jul 2025 05:46:19 -0500
Message-ID: <d15078ef-9a3a-47f6-a1c8-b9eed911e945@ti.com>
Date: Fri, 25 Jul 2025 16:16:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: ti: k3-j721s2-main: Add interrupts
 property
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>
References: <20250714092708.3944641-1-y-abhilashchandra@ti.com>
 <20250714092708.3944641-2-y-abhilashchandra@ti.com>
 <72545187-4605-40bb-9c68-54670c2e5332@ti.com>
 <05a07a03-3f59-489b-ae55-5f454266bafb@ti.com>
 <457e2428-f766-4e8d-bfb0-32084de45b5a@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <457e2428-f766-4e8d-bfb0-32084de45b5a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_034630_579229_3B893EA8 
X-CRM114-Status: GOOD (  16.03  )
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


On 7/22/2025 11:20 AM, Yemike Abhilash Chandra wrote:
> Hi Udit,
>
> Thanks for the review.
>
> On 21/07/25 19:40, Kumar, Udit wrote:
>>
>> On 7/21/2025 7:37 PM, Kumar, Udit wrote:
>>>
>>> On 7/14/2025 2:57 PM, Yemike Abhilash Chandra wrote:
>>>> Add interrupts property for CDNS CSI2RX. Interrupt IDs are taken 
>>>> from the
>>>> J721S2 TRM [0].
>>>>
>>>> Interrupt Line      | Source Interrupt
>>>> --------------------|----------------------------
>>>> GIC500SS_SPI_IN_153 | CSI_RX_IF1_CSI_ERR_IRQ_0
>>>> GIC500SS_SPI_IN_152 | CSI_RX_IF1_CSI_IRQ_0
>>>> GIC500SS_SPI_IN_157 | CSI_RX_IF2_CSI_ERR_IRQ_0
>>>> GIC500SS_SPI_IN_156 | CSI_RX_IF2_CSI_IRQ_0
>>>>
>>>> [0]: https://www.ti.com/lit/zip/spruj28
>>>>
>>>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>>>> ---
>>>>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 6 ++++++
>>>>   1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi 
>>>> b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
>>>> index 62f45377a2c9..6f32a2b0c40c 100644
>>>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
>>>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
>>>> @@ -1248,6 +1248,9 @@ ti_csi2rx0: ticsi2rx@4500000 {
>>>>           cdns_csi2rx0: csi-bridge@4504000 {
>>>>               compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
>>>>               reg = <0x00 0x04504000 0x00 0x1000>;
>>>> +            interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
>>>
>>> Just cosmetic thing, if you are doing v2 then consider 152 first , 
>>> followed by 153.
>>>
>>> Otherwise
>>>
>>> Reviewed-by: Udit Kumar <u-kumar1@ti.com>
>>
>>
>> Sorry, sent too fast, offset of 32 missing .
>>
>
> From what I’ve seen, the SPI interrupt IDs on J721S2 start from 0,
> so I don’t think we need to subtract the 32 offset.
>
>
> Interrupt Input Line   Interrupt ID    Source Interrupt
> -------------------------------------------------------------
> GIC500SS_SPI_IN_00     0               ESM0_ESM_INT_CFG_LVL_0
>
> To confirm this, I’ve latched onto the correct interrupt line, and
> my IRQ handler is getting triggered as expected. I’m also seeing the
> desired output [0].
>
> Let me know if I might be missing anything.
>

Thanks for update and please retain Reviewed-by


> [0]: 
> https://gist.github.com/Yemike-Abhilash-Chandra/f46587ec1ef72671ee31803dd93434b4
>
> Thanks and Regards
> Yemike Abhilash Chandra
>
>>
>>>
>>>> +            interrupt-names = "error_irq", "irq";
>>>>               clocks = <&k3_clks 38 3>, <&k3_clks 38 1>, <&k3_clks 
>>>> 38 3>,
>>>>                   <&k3_clks 38 3>, <&k3_clks 38 4>, <&k3_clks 38 4>;
>>>>               clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
>>>> @@ -1301,6 +1304,9 @@ ti_csi2rx1: ticsi2rx@4510000 {
>>>>           cdns_csi2rx1: csi-bridge@4514000 {
>>>>               compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
>>>>               reg = <0x00 0x04514000 0x00 0x1000>;
>>>> +            interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                     <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
>>>> +            interrupt-names = "error_irq", "irq";
>>>>               clocks = <&k3_clks 39 3>, <&k3_clks 39 1>, <&k3_clks 
>>>> 39 3>,
>>>>                   <&k3_clks 39 3>, <&k3_clks 39 4>, <&k3_clks 39 4>;
>>>>               clock-names = "sys_clk", "p_clk", "pixel_if0_clk",

