Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A5ECA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 06:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rqiuhs9qS3mStsH6kBsbbBZ7pCIM/ILem2xM4jXsPXQ=; b=mxZlx8n/TlcvzuHEsTtDxNTBMn
	+dn57PxA7LaGSrJkyf29R4Tfb63VMR0EQ/N2X4vB1iIeNlt4kFUMVHeRrfFDxZxCggfp578nLTRFu
	AuYORECgfUm+Zx7d4P8jL0oEMJZReaGVY6g6lkUpbOgaxpcYKEhqAxGsL+ePMDmBbs2KNK8nOtnPq
	iCW90c21TaGoXf6Pj13LcNfRL6hq1QuDs1/RrYe6SOQu2DLGopgEF73+yjEPMNyftPsWTfkHGrX25
	KP5ffXm9Oqimnj8cr0gRO+Edl9qSC3+O5Lh7csNJyp7+xR9zP9uuPl3Ps66n6G4N+Kz3y25NwAjYF
	B0m+1PDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcHR-0000000FjN1-0RiH;
	Mon, 05 Oct 2026 06:34:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcHP-0000000FjMZ-1PVy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 06:34:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB81F405BE;
	Mon,  5 Oct 2026 06:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7481F00893;
	Mon,  5 Oct 2026 06:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791182070;
	bh=Rqiuhs9qS3mStsH6kBsbbBZ7pCIM/ILem2xM4jXsPXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M59JCq37XioFaPJIlm2Xap5S5YRaFX1ylNDjqEQH8OseXSwR9Ypk29srT4qmVz8nR
	 b7NUAaJ1ZyETV86crpTuAJbp8VhqxkPCXYBbJ1tpwB9mStLGZKLtz9CGkjnVH9Pq1e
	 BhfiZdUl5uSajvtV59i2zgHY7u0eCbDq+dS0QVns1t7RYJlnZD80ams/EK+8e5NsYf
	 mbkncD8gPb/xT4TieMQ0heVgSk1GnGvc6Y8eeAJsywme3ouNRHjkD2vAYQjlBjDTkt
	 bXEWnXkA+VbHxaeIPWGuvv9U/xQvxJGzu63pt4iJzFRe/XX0ZI0k2vVXdDUzg2X69z
	 ixQIpOgbFaNnA==
Date: Mon, 5 Oct 2026 07:34:25 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, robin.murphy@arm.com, joro@8bytes.org,
	praan@google.com, kevin.tian@intel.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org
Subject: Re: [PATCH v10 06/13] iommu/arm-smmu-v3: Add
 ARM_SMMU_OPT_KDUMP_ADOPT for kdump kernel
Message-ID: <asNE8YMbOUq0sncP@willie-the-truck>
References: <cover.1788130528.git.nicolinc@nvidia.com>
 <d661395d986d3aa78af200f55e43740996ee8a0f.1788130528.git.nicolinc@nvidia.com>
 <asJTsw-oWDlSqNa3@willie-the-truck>
 <20261004163501.GB4064@nvidia.com>
 <asK+GIWzXjwN3EaB@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asK+GIWzXjwN3EaB@nvidia.com>
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

On Sun, Oct 04, 2026 at 01:59:04PM -0700, Nicolin Chen wrote:
> On Sun, Oct 04, 2026 at 01:35:01PM -0300, Jason Gunthorpe wrote:
> > On Sun, Oct 04, 2026 at 02:25:07PM +0100, Will Deacon wrote:
> > > > + *  - A structural inconsistency at adoption time tosses the entire adoption and
> > > > + *    makes the SMMU fall back to a full reset blocking in-flight DMAs.
> > > > + *  - L2 stream tables are adopted lazily at master-inserting time, to bound the
> > > > + *    peak memory use against a corrupted L1 table; any lazy L2 adoption failure
> > > > + *    rejects that device alone, as its blast radius is bounded to the bus.
> > > > + *  - Only a coherent SMMU (ARM_SMMU_FEAT_COHERENCY) is supported, as the stream
> > > > + *    table adoption is done by memremap with MEMREMAP_WB, which is verified on
> > > > + *    the real hardware. Callers of these functions are responsible for gating
> > > > + *    ARM_SMMU_FEAT_COHERENCY once during the probe.
> > > 
> > > This is an artificial restriction and not one that I'm wild about for kdump:
> > > we should be able to support this for non-coherent SMMUs as well. Is there
> > > anything more to it than using MEMREMAP_WC in that case?
> >  
> > I've forgotten why it ended up like this, it was some complication
> > that seemed hard.. MEMREMAP_WC is not the same attribute dma coherent
> > would have used, I'm not sure we have the right stuff to be able to
> > flush any write combining buffer? I'm nervous about that at least.
> > 
> > Remember this is not just reading it but it has to operate like this
> > after the fact. In handover you wanted to use the dma cohernent
> > preservation.
> > 
> > So, I think this restriction is mostly a lack of the right MEMREMAP
> > flag? It is not insovlable just work outside the scope of this series.
> 
> I agree that it's safer to defer that to a followup series. It
> also needs someone who has a non-coherent HW for a full test.
> 
> On the other hand, this series is tested by folks from multiple
> organizations, so it's really a needed and verified one.

I wasn't disputing that, though. I'm saying that it's half finished
without the non-coherent part, so I'd like to understand what's needed
to add that. Can you please explain what is needed beyond using
MEMREMAP_WC? That maps to Normal-NC on arm64, just like the DMA API does.

Will

