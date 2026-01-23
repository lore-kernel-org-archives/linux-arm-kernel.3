Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB8ED7788E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 17:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gH0oWS0D7QnHDLdOJPg7RphiU3FIrAiRMdKqxPGo/iQ=; b=0Sy8VjZrVnumXLYN98XLCtrt3s
	08SGkHZzMwB0jL/viCz4t+ep2LT1TkVLoYnilyMXVktTkM/e24iAvCe1dAH4tF8bgP9f4xjd/rmdJ
	+uMa7QIpM/BMSB1VGQdGPeja77Rd4tOLaB/bi8fg5scAlJBQ2A7gkiuP3jZ/Q7kONQ0C5Tyg2q0Eb
	xqkp2AP+ktrd9Rcpk9pMKlIFKK31PoPfm/pNCJrS2WgMSH7kxiX3kT0wRXdih/KWCCiOoJQFANH+a
	eHSZkD1QSbZZGfkn5X5nIt51hyAQ+MM2f2hQ7UXCUwRSX7ZBVb4kQdYOGAWcDsnGYqsJQfj3eo8k1
	A80Watyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKk3-00000009Gbc-3eHy;
	Fri, 23 Jan 2026 17:14:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKk2-00000009Gb5-08lQ;
	Fri, 23 Jan 2026 17:14:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62173417C3;
	Fri, 23 Jan 2026 17:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD58FC4CEF1;
	Fri, 23 Jan 2026 17:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769188477;
	bh=KuWTwQAvHKNEr7McYbtyjdsmHZtcDax2InXNF4vfUac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IMyD5dIxCP9zQnGyRwuErwnLguBZCDeZLKP9ED4GVP9KZvGImzrxVqvtkyTo5toDQ
	 twULnG+AnaQ6GicScONE10tSmaym03JPpQsUHGVJvzv25h2LAMeUzzkjONAAP6P2hu
	 7gvXSzaj81E/JAPy1X6owf7tXRdFCrZKuiw8lo6lpUd0q8y8mGfQ5LZ7vMQFI+jy8U
	 3m9bC5GwmBWqEov1tJ5Log4I3/fMjqcqZuo6jx7f+d1VpXTUiv6i7lRSyTdnAWMsr3
	 s9CYwi/cvbBFO43BsZlLQHcRutV7916+N3hEWgikOYnzt3SmMR4KR9SIwOVlE/PoFw
	 x9a72+MBAlgeA==
Date: Fri, 23 Jan 2026 17:14:30 +0000
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
Message-ID: <aXOsdlGMVzhHOrUr@willie-the-truck>
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
 <20260107101005.84039-4-benjamin.gaignard@collabora.com>
 <aWZui-rn5RDPwpEO@willie-the-truck>
 <68a49f8b-178c-4fa2-b4a9-315ad602271d@collabora.com>
 <aWeTQ50DOtntcniN@willie-the-truck>
 <db0950f1-b357-47c2-9829-e33262ab456d@collabora.com>
 <aW4kb5EbxbrhTOxK@willie-the-truck>
 <b8f43fe8-3e07-4d98-a50d-817c31370710@collabora.com>
 <aXDL2JH_4RCDmAJv@willie-the-truck>
 <4b33b50f-f0c3-4db8-b394-dd2d4d6e3a55@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b33b50f-f0c3-4db8-b394-dd2d4d6e3a55@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_091438_109909_362E7541 
X-CRM114-Status: GOOD (  33.78  )
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

On Wed, Jan 21, 2026 at 02:50:18PM +0100, Benjamin Gaignard wrote:
> 
> Le 21/01/2026 à 13:51, Will Deacon a écrit :
> > On Mon, Jan 19, 2026 at 03:03:44PM +0100, Benjamin Gaignard wrote:
> > > > > > > > > +static const struct iommu_ops vsi_iommu_ops = {
> > > > > > > > > +	.identity_domain = &vsi_identity_domain,
> > > > > > > > > +	.release_domain = &vsi_identity_domain,
> > > > > > > > > +	.domain_alloc_paging = vsi_iommu_domain_alloc_paging,
> > > > > > > > > +	.of_xlate = vsi_iommu_of_xlate,
> > > > > > > > > +	.probe_device = vsi_iommu_probe_device,
> > > > > > > > > +	.release_device = vsi_iommu_release_device,
> > > > > > > > > +	.device_group = generic_single_device_group,
> > > > > > > > > +	.owner = THIS_MODULE,
> > > > > > > > > +	.default_domain_ops = &(const struct iommu_domain_ops) {
> > > > > > > > > +		.attach_dev		= vsi_iommu_attach_device,
> > > > > > > > > +		.map_pages		= vsi_iommu_map,
> > > > > > > > > +		.unmap_pages		= vsi_iommu_unmap,
> > > > > > > > > +		.flush_iotlb_all	= vsi_iommu_flush_tlb_all,
> > > > > > > > This has no callers and so your unmap routine appears to be broken.
> > > > > > > It is a leftover of previous attempt to allow video decoder to clean/flush
> > > > > > > the iommu by using a function from the API.
> > > > > > > Now it is using vsi_iommu_restore_ctx().
> > > > > > > I while remove it in version 12.
> > > > > > Don't you still need some invalidation on the unmap path?
> > > > > In vsi_iommu_unmap_iova() page is invalided by calling vsi_mk_pte_invalid().
> > > > But that just writes an invalid descriptor and doesn't appear to invalidate
> > > > the TLB at all.
> > > > 
> > > > > That clear BIT(0) so the hardware knows the page is invalid.
> > > > > Do I have miss something here ?
> > > > Yes, the TLB structure needs to be invalidated so that the page-table
> > > > walker sees the new value that you have written in memory.
> > > > 
> > > > The rockchip driver gets this correct...
> > > Rockchip hardware have a ZAP_ONE_LINE register which didn't exist on Verisilicon
> > > hardware.
> > Presumably you have some sort of Verisilicon datasheet or downstream driver
> > from which you can infer the TLB invalidation runes?
> 
> I have only this downstream driver:
> https://github.com/rockchip-linux/kernel/blob/develop-6.1/drivers/iommu/rockchip-iommu-av1d.c
> No datasheet...
> 
> > 
> > > I have tried to use VSI_MMU_BIT_FLUSH on VSI driver after unmapping iova
> > > but it doesn't work.
> > What do you mean by "doesn't work"? If it works without doing any
> > invalidation at all, then it's very peculiar that adding the invalidation
> > would introduce issues.
> 
> I mean VSI_MMU_BIT_FLUSH register can't be used to invalid the TLB.
> I think the hardware iterates over the pages tables in memory and
> check the valid/invalid bit.

I bet it doesn't: that would be horrible for performance.

The hardware clearly has TLB invalidation support, as the downstream driver
that you linked above implements av1_iommu_flush_tlb_all() to poke it.
If the hardware has a TLB, then unmapping a page-table means you need to:

1. Clear the valid bit from the descriptor in memory
2. Have some sort of memory barrier
3. Invalidate the TLB
4. Wait for the invalidation to complete

All IOMMUs tend to work like that and I don't think this one is any
different.

Will

