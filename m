Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA170C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 14:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2ddgy3YMr1L131dVfH+5jVpRSPYrE1dF6J05eeKc08=; b=j0vLyBFfDdXCTjhhMmwG2vPSB/
	mBMsESlQ5JeLjqSxqcTNe8+NjXE9hyIidhZWI7rfzvZSOVdbDOcA9SZe6ajruaiktiRRnmTr9dD+r
	hTUDeqwv3jHu0JvvMu4thNoO9ijicawDV8LatWOpw/jfWOGzM+JNaPB1GTt1iILDkXj8mIeqNefsC
	sOdROkb6XnHe1jdOYwCb3cuiI+M6cVbxLG3R6h6hPzoSPK5JIxHj4wS/yEEXSFEPMByco/rBtkzW4
	TRfRGtP0gLsfvvcvXPP6EGDrHr857y90r9guRVf4qmLSl6em8O4hWUzl5RgchsfcLIEZZi6aPrMam
	lfxKSvDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMgC-000000035M0-3XLv;
	Mon, 27 Jul 2026 14:51:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMgA-000000035LC-3r64
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 14:51:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5BA91682;
	Mon, 27 Jul 2026 07:51:37 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 275623F86F;
	Mon, 27 Jul 2026 07:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785163901; bh=Fv4Qq52Od0IG4/8dw1STkdtFPA5yd3S8c31Fe9oTN7E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WBKT8PqxYEsdfiqhz5lApHSw8bmvY8ZftVOYhzc7A9GWLBkAZK5ixHk/m/HgE/0sz
	 puonVk8rEZ95mq0umcLqb56wYu1fhTwkD83/uFOgJ/KDI3IQWhtESjZWXBPTy3d5Ur
	 Wt9HYMnpUnRlpINkpZ0BGKfYmdewHxd8E/RHLtJg=
Message-ID: <910d1492-ad3b-4201-93c6-208be1dcde7d@arm.com>
Date: Mon, 27 Jul 2026 15:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fixing TegraDRM on multi_v7_defconfig / Enabling DMA API with
 tegra-smmu
To: Mikko Perttunen <mperttunen@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-tegra@vger.kernel.org, "iommu@lists.linux.dev" <iommu@lists.linux.dev>
References: <erKxvAxkSpOaODz6rOpDbQ@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <erKxvAxkSpOaODz6rOpDbQ@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_075143_128423_648EBF02 
X-CRM114-Status: GOOD (  41.30  )
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

On 24/07/2026 8:35 am, Mikko Perttunen wrote:
> Greetings everyone.
> 
> I've been looking at enabling more CI for 32-bit Tegra platforms
> recently, and I ran into a problem with TegraDRM not probing on
> tegra30-cardhu, but only on multi_v7_defconfig.
> 
> I traced the issue to the following sequence of events:
> 
> 1. On multi_v7_defconfig, CONFIG_ARM_DMA_USE_IOMMU is enabled, while on
>     tegra_defconfig it is not. This causes arm_setup_iommu_dma_ops to run
>     on TegraDRM devices.
> 
> 2. Some of these devices will be placed in a single IOMMU group by the
>     tegra-smmu driver. When arm_setup_iommu_dma_ops is called, depending
>     on probe deferrals, the group may have only the currently probing
>     device, or a previously deferred device and the new device.
> 
>     arm_setup_iommu_dma_ops calls iommu_attach_device. If the device is
>     alone in its group, this succeeds. If not, this fails. If
>     iommu_attach_device fails for every device in the group, everything
>     is "fine" and TegraDRM goes to probe and work fine. Hence let's
>     assume we have one device that succeeded the attach.
> 
> 3. iommu_device_use_default_domain gets called and succeeds on the first
>     device in the group. On the second device in the group, it fails
>     since group->owner_cnt was already 1. The custom ARM DMA IOMMU
>     implementation uses a custom UNMANAGED domain so the domain !=
>     default_domain check evaluates to true.
> 
> 4. Devices fail to probe which leads TegraDRM overall not to probe.
> 
> I've thought of the following options to fix this:
> 
> 1. Match behavior with tegra_defconfig: Figure out a way to not run
>     arm_setup_iommu_dma_ops for this situation (ideally any multi-device
>     group situation). However, I'd also like to enable DMA API with
>     tegra-smmu to get rid of the manual IOMMU API code paths in TegraDRM,
>     so this is not a particularly satisfying route.
> 
> 2. Improve the legacy path: Fix the ARM IOMMU DMA code to support
>     groups, and add an exception in iommu_device_use_default_domain. But
>     I presume we don't want such non-trivial modifications to that code
>     at this point.
> 
> 3. Modernize: Support CONFIG_IOMMU_DMA on ARM -- since there is an issue
>     with per-SoC quirks, I think this should be done one SoC at a time.
>     So come up with a way to dynamically pick between the legacy and
>     IOMMU_DMA paths. Perhaps if the SMMU driver explicitly requests the
>     DMA domain type, use the modern path. Currently, CONFIG_IOMMU_DMA and
>     CONFIG_ARM_DMA_USE_IOMMU are mutually exclusive so that has to be
>     changed.
> 
> FWIW, if we are to move to using DMA API with TegraDRM, one blocker
> would have to be resolved: boot splashes scanning out while the DMA
> domain is being set up. Since we cannot really use the iommu-addresses
> reserved-region device tree bindings with these old devices, my thought
> is to leave the display memory clients in bypass in tegra-smmu until the
> display driver has quiesced the hardware and can then call into
> tegra-smmu to enable translation.
> 
> Please let me know what you think and whom I missed in the To/Cc fields.

TBH I rather feel like the time for converting ARM to iommu-dma has 
passed - there are drivers which rely on specific behaviours of the ARM 
IOVA allocator which iommu-dma does not match, and meanwhile iommu-dma 
continues to grow more server-specific features which would be nothing 
but bloat on ARMv7 systems with <=2GB of RAM and no virtualisation. At 
this point I'm inclined to treat the existing DMA ops as legacy code 
like with alpha/sparc/etc.

While there is technically an option 4, to have tegra-smmu do what 
ipmmu-vmsa and mtk_iommu_v1 do and go coercing the ARM dma_iommu_mapping 
into groups behind the arch code's back, I am also still hoping to get 
rid of that and the messy probe_finalize step altogether. FWIW my 
preference would be some form of option 2 - off-hand I imagine you could 
probably get most of the way there by propagating the ARM mapping 
through group->iommudata (ironically tegra-smmu being the only driver in 
the way of that - looks like it could probably do its internal group 
accounting explicitly in release_device instead), plus one or two 
special cases to recognise ARM DMA domains in the core code as you say. 
The more involved, but ultimately neater, option would be to turn the 
ARM mapping inside-out and make it a proper domain cookie type with the 
ARM code providing its own definitions of iommu_{get,put}_dma_cookie() 
and iommu_setup_dma_ops(), so it could then work as a proper 
IOMMU_DOMAIN_DMA default domain, and we can lose the current 
ARM-specific identity domain bodges as well. I reckon the impact of that 
to core code shouldn't be much worse than the existing special-cases it 
would replace, while on the arch side it should effectively only really 
redistribute the current arm_setup_iommu_dma_ops() path, so functionally 
pretty low risk as well. It's just liable to be fiddly to do in 
manageable steps rather than one giant patch changing everything at once...

Cheers,
Robin.

