Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1060CCF2F7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FO0Guq0u2bLxFqUb5MMyKfXXibl+E3l8zx5BVN/T+Eo=; b=G2rR8ItGe6QfSmW75z1xQZWFxX
	DDUVXvJ2LYpH3tMdDgAAq4sD13bF1R98V9cnFQbVG2hubrp7FEbMyXtW+WQr02zPTR3lYSvsFSGJE
	OJ4hXXmPn95aiID19cXg7iY1MTj2curmBJ5zxHLvzCm0Qa36ZishCd4//8xXyFfmpoPITm4bClE0A
	YbTR2TJO3I/EjJEiZICsxGi4nDcXBQfeppR4/kmz607b84jmv5IRY0gZ2yPmE8+QPPr4JFNGNTGxF
	rMJal3EJf0MD0CMm+1ll9g/08l6uNAZGYfDa2P8TfzOdJn4Gam4RDdM349DsTIOjTMoQf+xhMGMwB
	C9iZccWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoRG-000000020dG-3Ynk;
	Mon, 19 Jan 2026 12:33:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoRD-000000020cs-35ER;
	Mon, 19 Jan 2026 12:32:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA3256014E;
	Mon, 19 Jan 2026 12:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E65C116C6;
	Mon, 19 Jan 2026 12:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768825974;
	bh=M+d6u8jNMJOG/dvieHbaSobR94YjAiJkXgQzt7gGqGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AedT0N6xsVrBAyEJQwxwMI7L0E1ha0dhwopq7LOvX6bGNGP/Hl2efB2FDeJWXCqHs
	 3M5e5CQKpAAZC4tSjvi4Vjy7OCPhNHVtZs36enVffdaRm16stc0+WGqN5AAwK8l/kD
	 jyyFF0tDkMTD/uMk9bRke/+5h9dxF/iUdvJGZmaqnyFiCFoHktjNbvpvF8WRpVLhEv
	 KrYzILjhNYkhIYsHeDBCIeO461iCbnO827xVPOjDMBKgF6SFjpKlfcu86CVkESJbVR
	 3JFAjjII3dtZAbzNbK2fb9d1jpmpEr6SlsOPfi9iqBPLTLlGxNc4it3VxoA5kHyEuI
	 vk/HT8NvfjNpQ==
Date: Mon, 19 Jan 2026 12:32:47 +0000
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
Message-ID: <aW4kb5EbxbrhTOxK@willie-the-truck>
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
 <20260107101005.84039-4-benjamin.gaignard@collabora.com>
 <aWZui-rn5RDPwpEO@willie-the-truck>
 <68a49f8b-178c-4fa2-b4a9-315ad602271d@collabora.com>
 <aWeTQ50DOtntcniN@willie-the-truck>
 <db0950f1-b357-47c2-9829-e33262ab456d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db0950f1-b357-47c2-9829-e33262ab456d@collabora.com>
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

On Wed, Jan 14, 2026 at 02:10:48PM +0100, Benjamin Gaignard wrote:
> 
> Le 14/01/2026 à 13:59, Will Deacon a écrit :
> > On Tue, Jan 13, 2026 at 05:25:38PM +0100, Benjamin Gaignard wrote:
> > > Le 13/01/2026 à 17:10, Will Deacon a écrit :
> > > > Hi Benjamin,
> > > > 
> > > > Thanks for posting a v11.
> > > > 
> > > > On Wed, Jan 07, 2026 at 11:09:53AM +0100, Benjamin Gaignard wrote:
> > > > > The Verisilicon IOMMU hardware block can be found in combination
> > > > > with Verisilicon hardware video codecs (encoders or decoders) on
> > > > > different SoCs.
> > > > > Enable it will allow us to use non contiguous memory allocators
> > > > > for Verisilicon video codecs.
> > > > > If both decoder and this iommu driver are compiled has modules
> > > > > there is undefined symboles issues so this iommu driver could
> > > > > only be compiled has built-in.
> > > > > 
> > > > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > > > ---
> > > > > changes in version 11:
> > > > > - Fix dependency issue when decoder driver is build as module.
> > > > > 
> > > > >    drivers/iommu/Kconfig     |  11 +
> > > > >    drivers/iommu/Makefile    |   1 +
> > > > >    drivers/iommu/vsi-iommu.c | 808 ++++++++++++++++++++++++++++++++++++++
> > > > >    include/linux/vsi-iommu.h |  21 +
> > > > >    4 files changed, 841 insertions(+)
> > > > >    create mode 100644 drivers/iommu/vsi-iommu.c
> > > > >    create mode 100644 include/linux/vsi-iommu.h
> > > > Based on your reply to v9:
> > > > 
> > > > https://lore.kernel.org/all/0eff8b1a-c45f-47b1-a871-59f4a0101f0f@collabora.com/
> > > > 
> > > > I took another look at this to see whether it had changed significantly
> > > > from v6 when compared to the rockchip driver. Sadly, they still look
> > > > very similar to me and I continue to suspect that the hardware is a
> > > > derivative. I really don't understand why having a shared implementation
> > > > of the default domain ops is difficult or controversial. Have you tried
> > > > to write it?
> > > > 
> > > > However, given that nobody from the Rockchip side has contributed to the
> > > > discussion and you claim that this is a distinct piece of IP, I don't
> > > > want to block the merging of the driver by leaving the conversation
> > > > hanging.
> > > > 
> > > > There is still one thing I don't understand (which, amusingly, the
> > > > rockchip driver doesn't seem to suffer from):
> > > > 
> > > > > +static void vsi_iommu_flush_tlb_all(struct iommu_domain *domain)
> > > > > +{
> > > > > +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> > > > > +	struct list_head *pos;
> > > > > +	unsigned long flags;
> > > > > +
> > > > > +	spin_lock_irqsave(&vsi_domain->lock, flags);
> > > > > +
> > > > > +	list_for_each(pos, &vsi_domain->iommus) {
> > > > > +		struct vsi_iommu *iommu;
> > > > > +		int ret;
> > > > > +
> > > > > +		iommu = list_entry(pos, struct vsi_iommu, node);
> > > > > +		ret = pm_runtime_resume_and_get(iommu->dev);
> > > > > +		if (ret < 0)
> > > > > +			continue;
> > > > > +
> > > > > +		spin_lock(&iommu->lock);
> > > > > +
> > > > > +		writel(VSI_MMU_BIT_FLUSH, iommu->regs + VSI_MMU_FLUSH_BASE);
> > > > > +		writel(0, iommu->regs + VSI_MMU_FLUSH_BASE);
> > > > > +
> > > > > +		spin_unlock(&iommu->lock);
> > > > > +		pm_runtime_put_autosuspend(iommu->dev);
> > > > > +	}
> > > > > +
> > > > > +	spin_unlock_irqrestore(&vsi_domain->lock, flags);
> > > > > +}
> > > > [...]
> > > > 
> > > > > +static const struct iommu_ops vsi_iommu_ops = {
> > > > > +	.identity_domain = &vsi_identity_domain,
> > > > > +	.release_domain = &vsi_identity_domain,
> > > > > +	.domain_alloc_paging = vsi_iommu_domain_alloc_paging,
> > > > > +	.of_xlate = vsi_iommu_of_xlate,
> > > > > +	.probe_device = vsi_iommu_probe_device,
> > > > > +	.release_device = vsi_iommu_release_device,
> > > > > +	.device_group = generic_single_device_group,
> > > > > +	.owner = THIS_MODULE,
> > > > > +	.default_domain_ops = &(const struct iommu_domain_ops) {
> > > > > +		.attach_dev		= vsi_iommu_attach_device,
> > > > > +		.map_pages		= vsi_iommu_map,
> > > > > +		.unmap_pages		= vsi_iommu_unmap,
> > > > > +		.flush_iotlb_all	= vsi_iommu_flush_tlb_all,
> > > > This has no callers and so your unmap routine appears to be broken.
> > > It is a leftover of previous attempt to allow video decoder to clean/flush
> > > the iommu by using a function from the API.
> > > Now it is using vsi_iommu_restore_ctx().
> > > I while remove it in version 12.
> > Don't you still need some invalidation on the unmap path?
> 
> In vsi_iommu_unmap_iova() page is invalided by calling vsi_mk_pte_invalid().

But that just writes an invalid descriptor and doesn't appear to invalidate
the TLB at all.

> That clear BIT(0) so the hardware knows the page is invalid.
> Do I have miss something here ?

Yes, the TLB structure needs to be invalidated so that the page-table
walker sees the new value that you have written in memory.

The rockchip driver gets this correct...

Will

