Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D170CFD318
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 17:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjELbD1gWRjpQBsqfo+fckd8h4RPqZ7n7+l68bVnpr4=; b=J8kxdbdvkHuMLwVZqhAM/Z82JN
	nSrtO18hJXQ42y8KEBHtwyaUQd4yNzE+egYRPjnhvhAONBaIoU0+m1tZqY3yHbW3W6CMZTw0h3w3G
	E9/eFIRfepq9gmsYQa/1Vshhdap0WkEGp8xINNrKffh+htEYqm2+TFI3gLUev4RJmvXXNcFV/kNW6
	6GXGQtPeEfl/O/GwyZUFgV5LriEcfn6Rf42nC1dFtMLW6w/QGC2uNJESk4zEKuVEQUXQGKlIoYqxy
	9S5UVj/zxaAiNfVojvJjUkR8YywsrK+iStU/l4B7ckI/FlavYXIWCmGjg2wLf3KTnzNZBvyZ7ijWG
	lkfSHADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNa4y-0000000C4vJ-39k1;
	Mon, 24 Nov 2025 17:10:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNa4w-0000000C4uv-2zmM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 17:10:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B34401477;
	Mon, 24 Nov 2025 09:10:08 -0800 (PST)
Received: from [10.1.200.38] (e119884-lin.cambridge.arm.com [10.1.200.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60F883F73B;
	Mon, 24 Nov 2025 09:10:15 -0800 (PST)
Message-ID: <4c5d3da8-424e-4529-b5f4-4ad1f5f3810b@arm.com>
Date: Mon, 24 Nov 2025 17:10:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: morello: Add CMN PMU
To: Robin Murphy <robin.murphy@arm.com>, liviu.dudau@arm.com,
 sudeep.holla@arm.com, lpieralisi@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
References: <cbeb3832ded539c8c4616d49d3133078a34f88ad.1748350539.git.robin.murphy@arm.com>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <cbeb3832ded539c8c4616d49d3133078a34f88ad.1748350539.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_091018_817126_AB8DA14D 
X-CRM114-Status: GOOD (  13.67  )
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



On 27/05/2025 13:55, Robin Murphy wrote:
> Although CMN-Skeena is mildly modified for the Morello hardware
> architecture, it still identifies itself as CMN-600 r3p1. Since
> there are also no documented changes to its PMU functionality,
> we can make the PMU accessible via the standard CMN-600 binding.
> In general, PMU registers are non-functional on CMN Fast Models,
> so this is only meaningful for the real SDP hardware.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Fine by me.

Acked-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  arch/arm64/boot/dts/arm/morello-sdp.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/arm/morello-sdp.dts b/arch/arm64/boot/dts/arm/morello-sdp.dts
> index cee49dee7571..42c85f450fa9 100644
> --- a/arch/arm64/boot/dts/arm/morello-sdp.dts
> +++ b/arch/arm64/boot/dts/arm/morello-sdp.dts
> @@ -108,6 +108,13 @@ smmu_pcie: iommu@4f400000 {
>  		dma-coherent;
>  	};
>  
> +	pmu@50000000 {
> +		compatible = "arm,cmn-600";
> +		reg = <0x0 0x50000000 0x0 0x4000000>;
> +		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +		arm,root-node = <0x804000>;
> +	};
> +
>  	pcie_ctlr: pcie@28c0000000 {
>  		device_type = "pci";
>  		compatible = "pci-host-ecam-generic";

-- 
Regards,
Vincenzo


