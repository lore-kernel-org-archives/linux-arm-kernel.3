Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DF3D2A00F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 13:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+57rajGiQSsT5fIGe54okeMO1T3lgk4TcXV24c1u80=; b=Zu2uzDDI15D9Wy3rMQRioDMgT7
	ClMXzlFnL3DBIEE9i95XHM6yB8OXNV5Z2wtCOOt+74JHwKFc1tfK1L502T5Va7eWYtdJBsYGT8tLv
	lBQVEr0aP7Ct2HwYAe6ofyUxD+9vxKkRzgi+e1Yre4VvSAWzSocvL4xV50ToH6yyl+KSIWWXGP8LH
	azicvz9xB2C57CFYY0jSL7Gi3oWE0nGaxXECQs/AcC9Jr9v6dE9GGShF9N0jAhRETEiW26JqHeua5
	nGU/WjpAdg1/Hf8rjv7hPnMq7FVSc+Z64bTOfaKyKvgRj7F+q8R3JTgClES7H7Wv8YUarZhBZMtxu
	M+iCsdpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg0Tc-00000009FuF-3PdA;
	Wed, 14 Jan 2026 12:59:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg0Ta-00000009Ftq-3nuW;
	Wed, 14 Jan 2026 12:59:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A1E98443C4;
	Wed, 14 Jan 2026 12:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5347DC19425;
	Wed, 14 Jan 2026 12:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768395593;
	bh=2/z3t3tjGrx/h34H8mnEiXZGVxzRQTFDBZSR/QkoL8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyl+x6niBnl+Hkqz669O/P43ZyunjSntia/2ZlIUSfxIlevMkhMao7Qj1TdQHI5Ik
	 lq/rkz0Dfc1NJ8XdsUbMqrwIq6simoJ/gnqKq6L7Xy+mp/Np2Bt6wtAqi7hNKD7Ehq
	 8vfXwH58/vx2kr3D32e/PnGfo3cJTC9dq+HytQRVUNZ4cBE5L8DHLF/nt/gogfGIU1
	 ORST1I3YxO+MNv1TBAGazKLamw645HtPkKD/K/RJog7pJD0andkbL+APJ/ezW8e+nE
	 nh0OSCokHR4CS5FQEgOlJoYlwn41MOuE0E3vZg1vH+CPraUVUSU8+GBgd8+irYngt4
	 vEVTCOs43w7mQ==
Date: Wed, 14 Jan 2026 12:59:47 +0000
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
Message-ID: <aWeTQ50DOtntcniN@willie-the-truck>
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
 <20260107101005.84039-4-benjamin.gaignard@collabora.com>
 <aWZui-rn5RDPwpEO@willie-the-truck>
 <68a49f8b-178c-4fa2-b4a9-315ad602271d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68a49f8b-178c-4fa2-b4a9-315ad602271d@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_045954_990191_6F1662C6 
X-CRM114-Status: GOOD (  38.71  )
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

On Tue, Jan 13, 2026 at 05:25:38PM +0100, Benjamin Gaignard wrote:
> 
> Le 13/01/2026 à 17:10, Will Deacon a écrit :
> > Hi Benjamin,
> > 
> > Thanks for posting a v11.
> > 
> > On Wed, Jan 07, 2026 at 11:09:53AM +0100, Benjamin Gaignard wrote:
> > > The Verisilicon IOMMU hardware block can be found in combination
> > > with Verisilicon hardware video codecs (encoders or decoders) on
> > > different SoCs.
> > > Enable it will allow us to use non contiguous memory allocators
> > > for Verisilicon video codecs.
> > > If both decoder and this iommu driver are compiled has modules
> > > there is undefined symboles issues so this iommu driver could
> > > only be compiled has built-in.
> > > 
> > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > ---
> > > changes in version 11:
> > > - Fix dependency issue when decoder driver is build as module.
> > > 
> > >   drivers/iommu/Kconfig     |  11 +
> > >   drivers/iommu/Makefile    |   1 +
> > >   drivers/iommu/vsi-iommu.c | 808 ++++++++++++++++++++++++++++++++++++++
> > >   include/linux/vsi-iommu.h |  21 +
> > >   4 files changed, 841 insertions(+)
> > >   create mode 100644 drivers/iommu/vsi-iommu.c
> > >   create mode 100644 include/linux/vsi-iommu.h
> > Based on your reply to v9:
> > 
> > https://lore.kernel.org/all/0eff8b1a-c45f-47b1-a871-59f4a0101f0f@collabora.com/
> > 
> > I took another look at this to see whether it had changed significantly
> > from v6 when compared to the rockchip driver. Sadly, they still look
> > very similar to me and I continue to suspect that the hardware is a
> > derivative. I really don't understand why having a shared implementation
> > of the default domain ops is difficult or controversial. Have you tried
> > to write it?
> > 
> > However, given that nobody from the Rockchip side has contributed to the
> > discussion and you claim that this is a distinct piece of IP, I don't
> > want to block the merging of the driver by leaving the conversation
> > hanging.
> > 
> > There is still one thing I don't understand (which, amusingly, the
> > rockchip driver doesn't seem to suffer from):
> > 
> > > +static void vsi_iommu_flush_tlb_all(struct iommu_domain *domain)
> > > +{
> > > +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> > > +	struct list_head *pos;
> > > +	unsigned long flags;
> > > +
> > > +	spin_lock_irqsave(&vsi_domain->lock, flags);
> > > +
> > > +	list_for_each(pos, &vsi_domain->iommus) {
> > > +		struct vsi_iommu *iommu;
> > > +		int ret;
> > > +
> > > +		iommu = list_entry(pos, struct vsi_iommu, node);
> > > +		ret = pm_runtime_resume_and_get(iommu->dev);
> > > +		if (ret < 0)
> > > +			continue;
> > > +
> > > +		spin_lock(&iommu->lock);
> > > +
> > > +		writel(VSI_MMU_BIT_FLUSH, iommu->regs + VSI_MMU_FLUSH_BASE);
> > > +		writel(0, iommu->regs + VSI_MMU_FLUSH_BASE);
> > > +
> > > +		spin_unlock(&iommu->lock);
> > > +		pm_runtime_put_autosuspend(iommu->dev);
> > > +	}
> > > +
> > > +	spin_unlock_irqrestore(&vsi_domain->lock, flags);
> > > +}
> > [...]
> > 
> > > +static const struct iommu_ops vsi_iommu_ops = {
> > > +	.identity_domain = &vsi_identity_domain,
> > > +	.release_domain = &vsi_identity_domain,
> > > +	.domain_alloc_paging = vsi_iommu_domain_alloc_paging,
> > > +	.of_xlate = vsi_iommu_of_xlate,
> > > +	.probe_device = vsi_iommu_probe_device,
> > > +	.release_device = vsi_iommu_release_device,
> > > +	.device_group = generic_single_device_group,
> > > +	.owner = THIS_MODULE,
> > > +	.default_domain_ops = &(const struct iommu_domain_ops) {
> > > +		.attach_dev		= vsi_iommu_attach_device,
> > > +		.map_pages		= vsi_iommu_map,
> > > +		.unmap_pages		= vsi_iommu_unmap,
> > > +		.flush_iotlb_all	= vsi_iommu_flush_tlb_all,
> > This has no callers and so your unmap routine appears to be broken.
> 
> It is a leftover of previous attempt to allow video decoder to clean/flush
> the iommu by using a function from the API.
> Now it is using vsi_iommu_restore_ctx().
> I while remove it in version 12.

Don't you still need some invalidation on the unmap path?

Will

