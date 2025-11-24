Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689FECFD318
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 16:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miaYyJ0TuFkZVArno8w28NueGxVTnuS3MUsKhQyI8tE=; b=DrS+hJQZ42G5zmdKvs+9VSlIsh
	SWPMhQ0fiXitZGR3aQ6Oqr5HFnPySrXfO/CQGGjdKBD+zlXdIMG3XDWep8Ga1WRr9PcXQdERehewP
	wy18cTWJMPU9vkkEhQ62k6JHc8eO3DWDLtCEUy7rLX5doNSUuk0aUL5Xbr6flbJG9Ntr/Nl7fKEmm
	dcWORhZLHcxXRYopfbaVkFanItSw+emiLofLSNbZ1dilx+4Mc4gPxjTlpIVh3B6E9X3hGmDGcdNdI
	QTPf452SU4VjCyak2rxEBvZMMrM+THGqxJTtppzD+A3JPmSsBfstmAk+5kOydBeLy8LhN5CzsR73I
	rFFAL2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZXX-0000000C0Iq-07LK;
	Mon, 24 Nov 2025 16:35:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZXU-0000000C0IF-1E7V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 16:35:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37CB01477;
	Mon, 24 Nov 2025 08:35:34 -0800 (PST)
Received: from [10.1.30.67] (unknown [10.1.30.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE52F3F86F;
	Mon, 24 Nov 2025 08:35:40 -0800 (PST)
Message-ID: <f06636ed-c96f-4504-9706-9274cfd0c15b@arm.com>
Date: Mon, 24 Nov 2025 16:35:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: morello: Add CMN PMU
From: Robin Murphy <robin.murphy@arm.com>
To: vincenzo.frascino@arm.com, liviu.dudau@arm.com, sudeep.holla@arm.com,
 lpieralisi@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
References: <cbeb3832ded539c8c4616d49d3133078a34f88ad.1748350539.git.robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <cbeb3832ded539c8c4616d49d3133078a34f88ad.1748350539.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_083544_382072_09D34A27 
X-CRM114-Status: GOOD (  13.93  )
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

[ Trying to catch up with loose ends... ]

On 2025-05-27 1:55 pm, Robin Murphy wrote:
> Although CMN-Skeena is mildly modified for the Morello hardware
> architecture, it still identifies itself as CMN-600 r3p1. Since
> there are also no documented changes to its PMU functionality,
> we can make the PMU accessible via the standard CMN-600 binding.
> In general, PMU registers are non-functional on CMN Fast Models,
> so this is only meaningful for the real SDP hardware.

Vincenzo, Sudeep, any opinion on this? I believe it was considered 
useful by at least the one person who asked me about it :)

Thanks,
Robin.

> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>   arch/arm64/boot/dts/arm/morello-sdp.dts | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/arm/morello-sdp.dts b/arch/arm64/boot/dts/arm/morello-sdp.dts
> index cee49dee7571..42c85f450fa9 100644
> --- a/arch/arm64/boot/dts/arm/morello-sdp.dts
> +++ b/arch/arm64/boot/dts/arm/morello-sdp.dts
> @@ -108,6 +108,13 @@ smmu_pcie: iommu@4f400000 {
>   		dma-coherent;
>   	};
>   
> +	pmu@50000000 {
> +		compatible = "arm,cmn-600";
> +		reg = <0x0 0x50000000 0x0 0x4000000>;
> +		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +		arm,root-node = <0x804000>;
> +	};
> +
>   	pcie_ctlr: pcie@28c0000000 {
>   		device_type = "pci";
>   		compatible = "pci-host-ecam-generic";


