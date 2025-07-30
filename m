Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88D0C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 19:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4zPmGDVYviav51y4z07PJNmrLYIefFNe+Z0UW0kyWU=; b=wwdswrZktg0n/xaegkexQ2yRCB
	QQk6yRoETKgcBZ+jdjY92XUkoY7y+bUB5Y45I9IWQAomZ0OYJThBuOdJTZUX5RsVRMewt84gSNJPQ
	fWAKrwlx1gWnm7rGtR6QRuU0ic68cKHTCNEXFLrThunBb4Fmn9CW+QWf471joAMncNAEE1jH1BGBf
	3VZ9AY44+JJpL2PQD+PIj8xlBHeD75AvRpmU/4fAiwfKUomb5cKb2VpBgIau9nTbPMGtmQDeC5P3F
	+Q18YbPkNqrdislBW13z+Ug7iHJ/15hnkgSIkoS3rAGzjLBFa89UKwivvFn1Rwl8YC9amIgB+JRhM
	ZKb8BCeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhCcc-00000002IO0-2Tjl;
	Wed, 30 Jul 2025 19:37:54 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhCa8-00000002IDe-3Mg9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 19:35:22 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56UJZ7NY3317915;
	Wed, 30 Jul 2025 14:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753904107;
	bh=G4zPmGDVYviav51y4z07PJNmrLYIefFNe+Z0UW0kyWU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wov6FKbRnFzXn0KFhskBVG/N65oXBAzsXXL165S809P9YK9nWpg9b3/Tm6JWG9F/W
	 nRiegl2o7OAO+AcmqvZZXrk6WVgLOHa3lcOwWO1QiCl4F88YiAw4Ebc1RU/B9wrcsD
	 UaMgY6mj7Zau93L2LD05XsCqdwfDwyH9v9mRWn0Y=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56UJZ7c63413840
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 30 Jul 2025 14:35:07 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 30
 Jul 2025 14:35:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 30 Jul 2025 14:35:07 -0500
Received: from [128.247.81.81] (uda0499903.dhcp.ti.com [128.247.81.81])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56UJZ7ew1443664;
	Wed, 30 Jul 2025 14:35:07 -0500
Message-ID: <570aa0e3-194e-4f5a-8cfc-a4dc525ae002@ti.com>
Date: Wed, 30 Jul 2025 14:35:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: ti: k3-j721s2-main: Add interrupts
 property
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
        "Kumar, Udit"
	<u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20250714092708.3944641-1-y-abhilashchandra@ti.com>
 <20250714092708.3944641-2-y-abhilashchandra@ti.com>
 <72545187-4605-40bb-9c68-54670c2e5332@ti.com>
 <05a07a03-3f59-489b-ae55-5f454266bafb@ti.com>
 <457e2428-f766-4e8d-bfb0-32084de45b5a@ti.com>
Content-Language: en-US
From: Jared McArthur <j-mcarthur@ti.com>
In-Reply-To: <457e2428-f766-4e8d-bfb0-32084de45b5a@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_123520_936977_42E081ED 
X-CRM114-Status: GOOD (  17.50  )
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

On 7/22/25 00:50, Yemike Abhilash Chandra wrote:
> Hi Udit,
> 
> Thanks for the review.
> 
> On 21/07/25 19:40, Kumar, Udit wrote:
>>
>> On 7/21/2025 7:37 PM, Kumar, Udit wrote:
>>>
>>> On 7/14/2025 2:57 PM, Yemike Abhilash Chandra wrote:
>>>> Add interrupts property for CDNS CSI2RX. Interrupt IDs are taken from the
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
>>>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
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
>>> Just cosmetic thing, if you are doing v2 then consider 152 first , followed by 153.
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

The interrupt lines are correct (153, 152, 157, and 152), but when I
read the TRM (specifically the Appendix xls) [0], the lines'
definitions include the offset. Where are you looking for the line
name?

Interrupt Input Line                       | Source Interrupt
-------------------------------------------|-----------------------------
COMPUTE_CLUSTER0_CLEC_SOC_EVENTS_IN_IN_184 | CSI_RX_IF0_CSI_IRQ_OUT_0
COMPUTE_CLUSTER0_CLEC_SOC_EVENTS_IN_IN_185 | CSI_RX_IF0_CSI_ERR_IRQ_OUT_0
COMPUTE_CLUSTER0_CLEC_SOC_EVENTS_IN_IN_188 | CSI_RX_IF1_CSI_IRQ_OUT_0
COMPUTE_CLUSTER0_CLEC_SOC_EVENTS_IN_IN_189 | CSI_RX_IF1_CSI_ERR_IRQ_OUT_0

You may want to change your comment to reflect the TRM's appendix.

[0]: https://www.ti.com/lit/zip/spruj28

> [0]: https://gist.github.com/Yemike-Abhilash-Chandra/f46587ec1ef72671ee31803dd93434b4
> 
> Thanks and Regards
> Yemike Abhilash Chandra
> 
>>
>>>
>>>> +            interrupt-names = "error_irq", "irq";
>>>>               clocks = <&k3_clks 38 3>, <&k3_clks 38 1>, <&k3_clks 38 3>,
>>>>                   <&k3_clks 38 3>, <&k3_clks 38 4>, <&k3_clks 38 4>;
>>>>               clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
>>>> @@ -1301,6 +1304,9 @@ ti_csi2rx1: ticsi2rx@4510000 {
>>>>           cdns_csi2rx1: csi-bridge@4514000 {
>>>>               compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
>>>>               reg = <0x00 0x04514000 0x00 0x1000>;
>>>> +            interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                     <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
>>>> +            interrupt-names = "error_irq", "irq";
>>>>               clocks = <&k3_clks 39 3>, <&k3_clks 39 1>, <&k3_clks 39 3>,
>>>>                   <&k3_clks 39 3>, <&k3_clks 39 4>, <&k3_clks 39 4>;
>>>>               clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
> 

-- 
Best,
Jared McArthur

