Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF0FCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 08:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmXtqj+1EA0qDhQoy1XIX6T58V/e4lq7osWmqeeZ2Hk=; b=FFo4UjMtRUf4Ubx8/Lzpf5m380
	lpC870VL6nff52PupCuhgBMb3FSOf7/2qjNYUogWrmOmIPrXDFk1ZPtOT+7dkp8qjZCxb8TeXOk7n
	G3vrkokLHGvWvkiuze1XmFe82OYj40eBkfbJlvS2WtUErNjsFnbFCN2n3tpWF1bmHtJIBL36EukDD
	gyl+EjvImh2u0ZDAgtMQk+qlv1rlqvs1URRnb/1NsINCYhCjg8beWCetfqzHFwf8qMDfrwpoQFiPV
	+zUUL9wsCJGkX7Cs4UdFGvgL8pvC06aT3Dy+dCm0iC2Oqs8O6GzZfXz4uhQ3leHsJjCHupNhMxKWM
	jLMUHsDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdmC-0000000FqMt-0NO5;
	Mon, 05 Oct 2026 08:10:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdmA-0000000FqMf-29cK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 08:10:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E22806022E;
	Mon,  5 Oct 2026 08:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BAE1F000FF;
	Mon,  5 Oct 2026 08:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791187821;
	bh=bmXtqj+1EA0qDhQoy1XIX6T58V/e4lq7osWmqeeZ2Hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QM6ZpukNaBa0mMOKa2As+65ti10BFgYsZUzdYn4GwdAXeBa5+9hiN7+C7QCJ9VSf0
	 OAL7AvS2NvTbWJi6ro0XjPZAsSVPeyWC/MDDhuvtAPxSy7jfereEdIMEJIFoY6x15t
	 0TRNDEDcSxbNdqSmioVDHLCUCtY3lL9g70+WTE1ILG0e1ekpxeYpAKkHKaw3fod7ys
	 54FQt/WJqXoZtjjKoRU516OcXkmGAJ2Hqfo4lmq1iwOL24LGRRXxtxyxTqXLqSfP/8
	 xoA4SnFHq/jL0jMnSB0I6FGNwu1F41LFqREKy7wNPmkFeUcp6zGn3pAy7wvkboDiAz
	 QFAQphdWKHjLA==
Date: Mon, 5 Oct 2026 09:10:15 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org, praan@google.com,
	kevin.tian@intel.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org
Subject: Re: [PATCH v10 06/13] iommu/arm-smmu-v3: Add
 ARM_SMMU_OPT_KDUMP_ADOPT for kdump kernel
Message-ID: <asNbZ93WrbGlm2c3@willie-the-truck>
References: <cover.1788130528.git.nicolinc@nvidia.com>
 <d661395d986d3aa78af200f55e43740996ee8a0f.1788130528.git.nicolinc@nvidia.com>
 <asJTsw-oWDlSqNa3@willie-the-truck>
 <asK7VILK4CgEFjdT@nvidia.com>
 <asNEmjxZ73ezL4I3@willie-the-truck>
 <asNYMpZfyMHakuZ6@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asNYMpZfyMHakuZ6@nvidia.com>
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

On Mon, Oct 05, 2026 at 12:56:34AM -0700, Nicolin Chen wrote:
> On Mon, Oct 05, 2026 at 07:32:58AM +0100, Will Deacon wrote:
> > On Sun, Oct 04, 2026 at 01:47:16PM -0700, Nicolin Chen wrote:
> > > On Sun, Oct 04, 2026 at 02:25:07PM +0100, Will Deacon wrote:
> > > > On Sun, Aug 30, 2026 at 04:18:07PM -0700, Nicolin Chen wrote:
> > > > >  drivers/iommu/arm/arm-smmu-v3/Makefile        |   1 +
> > > > >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  21 ++
> > > > >  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kdump.c | 229 ++++++++++++++++++
> > > > 
> > > > Please don't put this here. The live update / handover stuff is going to
> > > > need very similar logic (see the RFC from Pranjal) and I don't fancy
> > > > having to rename or resplit this file when that comes along.
> > > > 
> > > > Maybe just stick all of arm-smmu-v3-kexec.c and arm-smmu-v3-kdump.c into
> > > > arm-smmu-v3-handover.c or something?
> > > 
> > > Hmm, Pranjal and I already aligned that cleanly. And there is no
> > > further rename/resplit in his series.
> > > 
> > > arm-smmu-v3-kexec: common helpers for both
> > > arm-smmu-v3-kdump: kdump specific (my series)
> > > arm-smmu-v3-liveupdate: liveupdate specific (Pranj's)
> > > 
> > > Each of them is built on a separate config:
> > >  arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_KEXEC) += arm-smmu-v3-kexec.o
> > >  arm_smmu_v3-$(CONFIG_IOMMU_LIVEUPDATE) += arm-smmu-v3-liveupdate.o
> > >  arm_smmu_v3-$(CONFIG_CRASH_DUMP) += arm-smmu-v3-kdump.o
> > > 
> > > If we put everything into one big file, we'd add the two individual
> > > config guards internally, which isn't as clean as currently IMHO.
> > > 
> > > Note that the kdump file has a very long notes (kdump specific).
> > 
> > I dunno, three files seems way over the top for this imo. I'd rather have
> > one (even if it uses preprocessor guards internally) otherwise it just
> > seems inevitable that we'll have random internals exposed from one file
> > to the other, or duplication of logic or both. Even if we end up splitting
> > it eventually, I'd much rather start from a position where everything is
> > in one place.
> 
> OK. I'll merge them, maybe into arm-smmu-v3-kexec as Jason suggested?
> 
> Or do you still prefer handover?

I'm terrible at naming, so I don't mind :)

Will

