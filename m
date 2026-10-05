Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA36CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 06:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVGMJw8PqY8Oci1Q157ZAhH5TwSNkhX3KpJyPGxALTk=; b=sj4ly9cs/Ds1+rsz3fvAircCBb
	g04BbxjW3HH7US/HjRte6++++XzhC+Y+FnIEf1oP+0gDyiCTnqJ5jCts/4x+bT8yw2v9ZsJEE2hxH
	wU8n48tpo1vZQZSsZgSoK6WhrDSQV6c8s79QJLNa0i9b7W6lzIet8acAy9Tb6FbrncoL75mKDDiKA
	7tZLGqsav40iehDGM/l7uRc3LFWNw6TZt+OwuZ99J5YncbPuWKldHAXAPQ0meSx54BSXPpxS/amN3
	I0X5tYs+elOQkQZz0gBjjmhQ7Makwstsqh34cpSaQEC1EgBgUoaNcO+w4gM1FwVfKRNISZf+L0nrz
	ZxhymlNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcG2-0000000FjCK-2VQc;
	Mon, 05 Oct 2026 06:33:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcG1-0000000FjCD-1LDg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 06:33:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B7D28417B7;
	Mon,  5 Oct 2026 06:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38AC41F00893;
	Mon,  5 Oct 2026 06:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791181983;
	bh=UVGMJw8PqY8Oci1Q157ZAhH5TwSNkhX3KpJyPGxALTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h+6yWGp2Jdf8rMNyCknP0aNz/beGedLstv378nrhHzbwaL6Ym2DUnQfJpwJ4HgpGh
	 mk9SBQORedClfQznX1LlnjjlZVcKmRZb4qhHeombzNasV+C+2f/PrJEMKg4GTg93rA
	 JJ6/Lb5lZyUeYqDvREHLz8pMqngEMurofaIXyQqOMUGRLQtso2jOd4X1p9X4VTGtfS
	 9Pwo3olMQ02/6hyXlLBdTNUmywots57v5xlWZQrApw1F9nf6Yc48FIpnUlcxlGLdl7
	 bL33ZQz0DIQVd19cZVkRo2ZcGBhaWGAsqCc6s0Stw5g3A7F1GDgaE4on3eSyUqn2ve
	 WcMyOXR6CEK2w==
Date: Mon, 5 Oct 2026 07:32:58 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org, praan@google.com,
	kevin.tian@intel.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org
Subject: Re: [PATCH v10 06/13] iommu/arm-smmu-v3: Add
 ARM_SMMU_OPT_KDUMP_ADOPT for kdump kernel
Message-ID: <asNEmjxZ73ezL4I3@willie-the-truck>
References: <cover.1788130528.git.nicolinc@nvidia.com>
 <d661395d986d3aa78af200f55e43740996ee8a0f.1788130528.git.nicolinc@nvidia.com>
 <asJTsw-oWDlSqNa3@willie-the-truck>
 <asK7VILK4CgEFjdT@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asK7VILK4CgEFjdT@nvidia.com>
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

On Sun, Oct 04, 2026 at 01:47:16PM -0700, Nicolin Chen wrote:
> On Sun, Oct 04, 2026 at 02:25:07PM +0100, Will Deacon wrote:
> > On Sun, Aug 30, 2026 at 04:18:07PM -0700, Nicolin Chen wrote:
> > >  drivers/iommu/arm/arm-smmu-v3/Makefile        |   1 +
> > >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  21 ++
> > >  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kdump.c | 229 ++++++++++++++++++
> > 
> > Please don't put this here. The live update / handover stuff is going to
> > need very similar logic (see the RFC from Pranjal) and I don't fancy
> > having to rename or resplit this file when that comes along.
> > 
> > Maybe just stick all of arm-smmu-v3-kexec.c and arm-smmu-v3-kdump.c into
> > arm-smmu-v3-handover.c or something?
> 
> Hmm, Pranjal and I already aligned that cleanly. And there is no
> further rename/resplit in his series.
> 
> arm-smmu-v3-kexec: common helpers for both
> arm-smmu-v3-kdump: kdump specific (my series)
> arm-smmu-v3-liveupdate: liveupdate specific (Pranj's)
> 
> Each of them is built on a separate config:
>  arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_KEXEC) += arm-smmu-v3-kexec.o
>  arm_smmu_v3-$(CONFIG_IOMMU_LIVEUPDATE) += arm-smmu-v3-liveupdate.o
>  arm_smmu_v3-$(CONFIG_CRASH_DUMP) += arm-smmu-v3-kdump.o
> 
> If we put everything into one big file, we'd add the two individual
> config guards internally, which isn't as clean as currently IMHO.
> 
> Note that the kdump file has a very long notes (kdump specific).

I dunno, three files seems way over the top for this imo. I'd rather have
one (even if it uses preprocessor guards internally) otherwise it just
seems inevitable that we'll have random internals exposed from one file
to the other, or duplication of logic or both. Even if we end up splitting
it eventually, I'd much rather start from a position where everything is
in one place.

Will


