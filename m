Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F77D2F33D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HA0972uhVBqMCWIXzMDKGzVJtAxCkFUt0jyg9CYVfjc=; b=OTriBWxnPMZxUo2mYRpxe8ZV0X
	SfFTzf910/ZCICIlcR08hyq6RyH8px3hbxV/HbubCSbG7Rca5zOhsY77BkttfxU3WQSfkkNlfbI7+
	bl1kXodYEzkFugi4aUelyby352aPUeUbM4CyaoVm+mUmIi2EvqVv9/7xV4ATM7poSk/dxo0lAXn5Y
	eh9hQ0oSsmYdM2O6iFWBh3SDoJzTokcYLfMJYZwyv9RcjJ5kcQpjPKwVsNR6YoFUfY0UwPpuEx6qQ
	Ukb2ANrKRZyrTVHAA0s/BwyfvSNJFzDe/tN/WwgyLcgz3PcFX0cQ8vm3EL+inGayMMVTAhcKjEBAx
	Cl4VBQPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgz5-00000007RhX-0zF9;
	Tue, 13 Jan 2026 16:11:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgyw-00000007RfR-3yhi;
	Tue, 13 Jan 2026 16:11:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 341AF43929;
	Tue, 13 Jan 2026 16:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA060C116C6;
	Tue, 13 Jan 2026 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768320658;
	bh=48Es2S409yTlI0s3L/SUlUr5jxhH+oDf+zUm7CAM85k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mn5SO9lbfHAajh8SBuC1H52zRDk2i1cJjIXW4qSymf39CjYWseqUy+bq7qbrv1v35
	 Okv56wH8VLF1fAJoHtVOrHuuNNCxiTUxSkOMtvnK7PQ8oF7K01s2f5l2U4OYv+M845
	 uIhdzWAuIeGrpzS29zWnuC5JY688XqjDUTY4Ji8KI4AOojEQ8+0QMy3dw6Z9MaFxhK
	 ANsgSFDkVCihoDbdNvSzy9o3M48u9zHfM5BLWecw7+Fi8XnSX20vvdyEa7IyOZsUhv
	 LFJONDt1lusgdG+GL3mZxhOY0e0El8obSA7NESf5HW/4M83g5dCiVkSDZV88sNsjy2
	 cG2Ruju+DQ6lQ==
Date: Tue, 13 Jan 2026 16:10:51 +0000
From: Will Deacon <will@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v11 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <aWZui-rn5RDPwpEO@willie-the-truck>
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
 <20260107101005.84039-4-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107101005.84039-4-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_081101_528398_3418EDE7 
X-CRM114-Status: GOOD (  25.25  )
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

Hi Benjamin,

Thanks for posting a v11.

On Wed, Jan 07, 2026 at 11:09:53AM +0100, Benjamin Gaignard wrote:
> The Verisilicon IOMMU hardware block can be found in combination
> with Verisilicon hardware video codecs (encoders or decoders) on
> different SoCs.
> Enable it will allow us to use non contiguous memory allocators
> for Verisilicon video codecs.
> If both decoder and this iommu driver are compiled has modules
> there is undefined symboles issues so this iommu driver could
> only be compiled has built-in.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> changes in version 11:
> - Fix dependency issue when decoder driver is build as module.
> 
>  drivers/iommu/Kconfig     |  11 +
>  drivers/iommu/Makefile    |   1 +
>  drivers/iommu/vsi-iommu.c | 808 ++++++++++++++++++++++++++++++++++++++
>  include/linux/vsi-iommu.h |  21 +
>  4 files changed, 841 insertions(+)
>  create mode 100644 drivers/iommu/vsi-iommu.c
>  create mode 100644 include/linux/vsi-iommu.h

Based on your reply to v9:

https://lore.kernel.org/all/0eff8b1a-c45f-47b1-a871-59f4a0101f0f@collabora.com/

I took another look at this to see whether it had changed significantly
from v6 when compared to the rockchip driver. Sadly, they still look
very similar to me and I continue to suspect that the hardware is a
derivative. I really don't understand why having a shared implementation
of the default domain ops is difficult or controversial. Have you tried
to write it?

However, given that nobody from the Rockchip side has contributed to the
discussion and you claim that this is a distinct piece of IP, I don't
want to block the merging of the driver by leaving the conversation
hanging.

There is still one thing I don't understand (which, amusingly, the
rockchip driver doesn't seem to suffer from):

> +static void vsi_iommu_flush_tlb_all(struct iommu_domain *domain)
> +{
> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> +	struct list_head *pos;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&vsi_domain->lock, flags);
> +
> +	list_for_each(pos, &vsi_domain->iommus) {
> +		struct vsi_iommu *iommu;
> +		int ret;
> +
> +		iommu = list_entry(pos, struct vsi_iommu, node);
> +		ret = pm_runtime_resume_and_get(iommu->dev);
> +		if (ret < 0)
> +			continue;
> +
> +		spin_lock(&iommu->lock);
> +
> +		writel(VSI_MMU_BIT_FLUSH, iommu->regs + VSI_MMU_FLUSH_BASE);
> +		writel(0, iommu->regs + VSI_MMU_FLUSH_BASE);
> +
> +		spin_unlock(&iommu->lock);
> +		pm_runtime_put_autosuspend(iommu->dev);
> +	}
> +
> +	spin_unlock_irqrestore(&vsi_domain->lock, flags);
> +}

[...]

> +static const struct iommu_ops vsi_iommu_ops = {
> +	.identity_domain = &vsi_identity_domain,
> +	.release_domain = &vsi_identity_domain,
> +	.domain_alloc_paging = vsi_iommu_domain_alloc_paging,
> +	.of_xlate = vsi_iommu_of_xlate,
> +	.probe_device = vsi_iommu_probe_device,
> +	.release_device = vsi_iommu_release_device,
> +	.device_group = generic_single_device_group,
> +	.owner = THIS_MODULE,
> +	.default_domain_ops = &(const struct iommu_domain_ops) {
> +		.attach_dev		= vsi_iommu_attach_device,
> +		.map_pages		= vsi_iommu_map,
> +		.unmap_pages		= vsi_iommu_unmap,
> +		.flush_iotlb_all	= vsi_iommu_flush_tlb_all,

This has no callers and so your unmap routine appears to be broken.

Will

