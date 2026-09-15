Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE06C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tz3AZMGcxx7KEDHkQDwBIzmCVSV/P8yGMrcOOooV8Bg=; b=m4Qt6GzRZWsctGcUFmtFIOsn8Z
	pOljbY7FHHaPLjt8FOy2JGk7alEGnrfbfKgnuW+/PhBfeWtp6MdxvBBWZUBMxh5JUWmccBVamMKzS
	NF8zDhu6wwq82pRnFuiXHeYz3OyImN7QkPVq/WSjSAdokDMGKHzShxnD4TPApZeYgZEQq0xrIvnz7
	7LdqRlNNj7O0M1737t/1zLoNahcMLe9i41V/XlovKwQzf2hW8QvyKiveYynIrASJjgjURVS5lUIm+
	6I7CkA9nYJ698tWMnu8W9bVDwcuv/Zm+yGONatWVz/qQsdY0VPXAMd9mt/JdlLndjMyN6u6XARSL1
	BPAYETfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6S5z-00000006S9P-2A0h;
	Tue, 15 Sep 2026 12:17:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6S5y-00000006S9B-3az9
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 12:17:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tz3AZMGcxx7KEDHkQDwBIzmCVSV/P8yGMrcOOooV8Bg=; b=Om5CZtvkaEVtlYN+zm1TbTCWx5
	5jOxBQlk3O6gglreTh+tW6Iey9hM3oOcflfCTiX6zQaI8JRL8uNRFlEb5Jkw7ElEK9LBXHO6xkZ9f
	Rtl+IcsG6QvhxuRZ/a1Uy5VKQEdU2EGv3wcJNPZTGYcnKkK1vbiyeyCGCI0c++JiAjVmXX7c943Ln
	f00ajdYLvKpJhu4nA/F+Ni7Lj8v0+1X3RbnYeq5NavhLMC/vzEJ7iNnsAfmgIMOR6NqJ8/qyuEvEg
	fSKSVVeqdddIshHtNodP8AtjRIm6oVvGnGXcE02koLWnqE04+CcRL4fxarD4WfSFHGiOSj351r3ga
	QYD6+dlA==;
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6S5v-00000006ilS-3j8X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tz3AZMGcxx7KEDHkQDwBIzmCVSV/P8yGMrcOOooV8Bg=; b=D/aI1texgnZkg/xRoBRNqdwpEZ
	tffyZ6F1NuQ1p4eAo4OcSVI8Xn8jEwqWNrkoK6x4hkz6tPH9kynX9SU7GPVS1McyJXK4rg35C0HlQ
	1jxWXcZxoHDXcF7MsB3TlvhYdG3liQdyKIVUYT+nRt0lzXYpCl8O3GacUidkg9XMoEZ682Z5cDWBm
	DhlYhaSzdJL9lAUTvq5Viju6oD2Lo7muIDoNst3duu+8lPJ6s7dsdA01MyqgX9y6OvgXc8rQ+OfWB
	8A0FDcy+Hwd/QSp3XoDHlQ1VxWJ8eSm9SB80K/CFnsaYoFBBqv+s8TXE6w9jhDTehkKkEsPTJLwfY
	jUFQRcBQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x6S5g-004NqD-14;
	Tue, 15 Sep 2026 12:16:48 +0000
Date: Tue, 15 Sep 2026 05:16:42 -0700
From: Breno Leitao <leitao@debian.org>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Nicolin Chen <nicolinc@nvidia.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Pranjal Shrivastava <praan@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Krishna Reddy <vdumpa@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kyle McMartin <jkkm@meta.com>, Usama Arif <usama.arif@linux.dev>, kernel-team@meta.com, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] iommu/arm-smmu-v3: Add a cmdq_max_n_shift module
 parameter
Message-ID: <aqk207UQxQF1leEm@gmail.com>
References: <20260909095228.2174031-1-kas@kernel.org>
 <20260909095228.2174031-2-kas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909095228.2174031-2-kas@kernel.org>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_131704_004518_94F95A13 
X-CRM114-Status: GOOD (  14.69  )
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

On Wed, Sep 09, 2026 at 10:52:27AM +0100, Kiryl Shutsemau (Meta) wrote:
> The command queue depth comes straight from the maximum the hardware
> advertises in IDR1, which reaches megabytes of coherent DMA per queue.
> A system with several SMMUv3 instances pays that per instance, and the
> Tegra241 CMDQV pays it again for every VCMDQ it preallocates.

Thanks. I've seen this issue while investigating another SMMU issue[1].
Thanks for fixing it.

Link: https://lore.kernel.org/all/20260911-smmu_fix_aws-v1-0-75870bf9655b@debian.org/ [1]

> Queue depth only bounds how many commands may be in flight before a sync.
> A machine driving a handful of devices, or one with a tight memory budget,
> has no use for the maximum, and no way to say so.
> 
> Add cmdq_max_n_shift, a cap on the depth given as the log2 of the entry
> count, the form the hardware itself takes in the LOG2SIZE field of
> CMDQ_BASE. Decide the depth in arm_smmu_cmdq_max_n_shift(), which caps the
> IDR1 value for natural alignment and then applies the parameter, so the
> queue is allocated at the requested size. The Tegra241 CMDQV sizes its
> VCMDQs from IDR1 itself, so route that through the same helper.
> 
> Floor the request at one page worth of entries. Without the floor, a small
> request trips the CMDQ_BATCH_ENTRIES check in arm_smmu_device_hw_probe()
> and the SMMU fails to probe. The floor also costs nothing: coherent DMA is
> page granular, so a shallower queue occupies the same memory as one that
> fills the page.
> 
> Assisted-by: LLM
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Reviewed-by: Breno Leitao <leitao@debian.org>


