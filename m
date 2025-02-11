Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE68C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 19:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxF1dkudNu4jXNzuJDQ8aQUY76prDpBLMz2PTATZYsQ=; b=YLDP4aWXhcix+DgxrRQ15k+tOy
	vl5hIyImR/SYn5vGKrSSqvKMKfPFFQ9NFbnfc42I1cwpl4UtBO8wIu8EE5/p1g3mVA4Nx1u6i8dxS
	e14xnuH+8Z7i9SDo3bzlSdwOFR2/WMB1gu3n62NEOjcP+3srbg+DWf/h6/M5QhFr8KH0cneMDy63N
	HH4PHEHzzbCUQ5BXrfHm8Y9E1xAGmMzSEM76/WnYLBXDMVGlV9iMbZ7x8DamAJ6JsYTlrKEEfd+06
	LFOmsjLemTMxXrP355Wz0KdmWeYCVE1IXV8O9JONOJMsI7iSAlO1gDkfEGD8JypezQcMp8goK7bKk
	TmXSl0mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvtQ-000000050mq-0lay;
	Tue, 11 Feb 2025 19:26:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thupg-00000004onC-3kqL;
	Tue, 11 Feb 2025 18:18:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87C9C13D5;
	Tue, 11 Feb 2025 10:18:22 -0800 (PST)
Received: from [10.57.35.63] (unknown [10.57.35.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4906B3F58B;
	Tue, 11 Feb 2025 10:17:59 -0800 (PST)
Message-ID: <4005a054-0bb7-4e1b-9c52-fa18aa2b0959@arm.com>
Date: Tue, 11 Feb 2025 18:17:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: adjust SMMU interrupt type
To: Niklas Cassel <cassel@kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, Patrick Wildt <patrick@blueri.se>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Kever Yang <kever.yang@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <Z6pxme2Chmf3d3uK@windev.fritz.box> <25203566.ouqheUzb2q@diego>
 <Z6tBElUDaPNgkaIf@ryzen>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <Z6tBElUDaPNgkaIf@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_101805_024473_4AFC77D0 
X-CRM114-Status: GOOD (  20.65  )
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

On 2025-02-11 12:22 pm, Niklas Cassel wrote:
> On Tue, Feb 11, 2025 at 08:40:25AM +0100, Heiko Stübner wrote:
>> Am Montag, 10. Februar 2025, 22:37:29 MEZ schrieb Patrick Wildt:
>>> The SMMU architecture requires wired interrupts to be edge triggered,
>>> which does not align with the DT description for the RK3588.  This leads
>>> to interrupt storms, as the SMMU continues to hold the pin high and only
>>> pulls it down for a short amount when issuing an IRQ.  Update the DT
>>> description to be in line with the spec and perceived reality.
>>>
>>
>> Cc'ed Niklas
>>
>> This should probably also get a
>>
>> Fixes: cd81d3a0695c ("arm64: dts: rockchip: add rk3588 pcie and php IOMMUs")
> 
> Agreed.
> 
> 
>>
>>> Signed-off-by: Patrick Wildt <patrick@blueri.se>
>>> ---
>>>   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 16 ++++++++--------
>>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
>>> index 8cfa30837ce7..520d0814a4de 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
>>> @@ -549,10 +549,10 @@ usb_host2_xhci: usb@fcd00000 {
>>>   	mmu600_pcie: iommu@fc900000 {
>>>   		compatible = "arm,smmu-v3";
>>>   		reg = <0x0 0xfc900000 0x0 0x200000>;
>>> -		interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH 0>,
>>> -			     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH 0>,
>>> -			     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH 0>,
>>> -			     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH 0>;
>>> +		interrupts = <GIC_SPI 369 IRQ_TYPE_EDGE_RISING 0>,
>>> +			     <GIC_SPI 371 IRQ_TYPE_EDGE_RISING 0>,
>>> +			     <GIC_SPI 374 IRQ_TYPE_EDGE_RISING 0>,
>>> +			     <GIC_SPI 367 IRQ_TYPE_EDGE_RISING 0>;
>>>   		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
>>>   		#iommu-cells = <1>;
>>>   	};
>>> @@ -560,10 +560,10 @@ mmu600_pcie: iommu@fc900000 {
>>>   	mmu600_php: iommu@fcb00000 {
>>>   		compatible = "arm,smmu-v3";
>>>   		reg = <0x0 0xfcb00000 0x0 0x200000>;
>>> -		interrupts = <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>,
>>> -			     <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH 0>,
>>> -			     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH 0>,
>>> -			     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH 0>;
>>> +		interrupts = <GIC_SPI 381 IRQ_TYPE_EDGE_RISING 0>,
>>> +			     <GIC_SPI 383 IRQ_TYPE_EDGE_RISING 0>,
>>> +			     <GIC_SPI 386 IRQ_TYPE_EDGE_RISING 0>,
>>> +			     <GIC_SPI 379 IRQ_TYPE_EDGE_RISING 0>;
>>>   		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
>>>   		#iommu-cells = <1>;
>>>   		status = "disabled";
>>>
> 
> Patrick, thank you for the patch!
> 
> FWIW, they have the same bug in downstream:
> https://github.com/radxa/kernel/blob/linux-6.1-stan-rkr4.1/arch/arm64/boot/dts/rockchip/rk3588s.dtsi#L2761-L2783
> 
> However, the Rockchip PCIe Virtualization Developer Guide correctly define
> the IRQs as edge triggered:
> https://dl.radxa.com/users/dev/Rockchip_PCIe_Virtualization_Developer_Guide_CN.pdf
> 
> Looking at the ARM SMMUv3 architecture specification:
> "An implementation must support one of, or optionally both of, wired
> interrupts and MSIs. Whether an implementation supports MSIs is discoverable
> from SMMU_IDR0.MSI and SMMU_S_IDR0.MSI. An implementation might support wired
> interrupt outputs that are edge-triggered. The discovery of support for wired
> interrupts is IMPLEMENTATION DEFINED."

Yup, rising edge is certainly what MMU-600 spits out.

Thanks,
Robin.

> 
> Thus:
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> 
> 
> Heiko, this patch should go to 6.14.
> 
> Side note: We also have another SMMU patch that should go to 6.14:
> https://lore.kernel.org/linux-rockchip/20250207143900.2047949-2-cassel@kernel.org/
> 
> 
> Kind regards,
> Niklas


