Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA55BC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 14:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UE7/jFAn49MwhEKSvcSISMlSrbk246mSQRE6/IFk4zo=; b=q2dRNUALRCED37cx63lkya/+i/
	RHS4kp/buAtfrbMBzmUOoCxpEzfhtGEMX+dadnEivtogBbfmIK3hWIiOj9xMZfLgL6w8WaZkOFmGi
	nOnCvvS8wZby4HbTA1Uw5B+8YzT3HkK0eAFW+lOHmV3szg8KSJu687K/kAbSE6O06c1nWJIc7S3tC
	rCxI+KiW4jzuCtl4gx17tWmATmVTXKMJyw6aQHeBsJNuAr6fQEJF3mH+7+q4Ypy3vCJL826fGxstF
	GPYD1eY1z7/yoGVtCv9J6A6T7qSOJADe/DPm+AW01hYspT8+zEwpKQcRseQibGBzdUsQE3MGG1lSa
	ItcOObgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28E4-0000000HUcC-24pD;
	Thu, 03 Sep 2026 14:15:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28E4-0000000HUc1-06EV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 14:15:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C2B960A58;
	Thu,  3 Sep 2026 14:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D311F00A3A;
	Thu,  3 Sep 2026 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788444935;
	bh=UE7/jFAn49MwhEKSvcSISMlSrbk246mSQRE6/IFk4zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IxGr5sBnn/BwgE3c1VWnCfnxjrsAJuxl6sS3JZPalmfVbK70Gd/6kgMHNHOhPAPsr
	 71SOs/AVXOFPUxbrpSaLULvAh1tXLYtFaiaV0fW0tib648YorOAYydvNN+EsN20iSg
	 iLtRcbb3rvgYmuWxiYwKixfClalVCe1qrnvL1+y/C02/9sPaqBLo1Fa84lSOzMLkHm
	 gAe7m4Oq7AptlmGcCe+xPrs4s4ujkKj0J8cMW6IzBC24+EuSMRUowzBA69n8cbIcax
	 pdAOIcbsP1OZWWcUq/FkYAtJttH5dosnQmcGT0oGB+Tzw0kYys0oZOFBARH7cSW0xt
	 OUqFLkjN4RXzQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 7E69D1980050;
	Thu,  3 Sep 2026 10:15:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 03 Sep 2026 10:15:32 -0400
X-ME-Sender: <xms:AIGZaiLscKq84t9mQusL2tubKQctaCsE3fjku3XF92kPgOyQtKqJbA>
    <xme:AIGZaoqr828WVqa1-2HBI11GpmruKAscwOkyF7b3V36-kGmsNBp1zgFZJhv42vXq7
    1OYfkj-9z_50TrcNX-cUDuZKdbQBHQAkN4BXEzMj1RGWQ__Xn9tpRt0>
X-ME-Received: <xmr:AIGZao4-BwLkjwwSxsKhktDFDp3hG9NL_nJ_oR68RGw4aqO5E2QwHATxJ54>
X-ME-Proxy-Cause: dmFkZTErKF92w5SraCU0RjI5fWKGdJ1jFpZ8UDsC3ehiQy3rh+22MaN3Xc61sskS5EqzAB
    r022D56DV39ZXrDjT4BaLM5p2OKuCfmU4aE3hvk3pfG56CK5K+YYs7WUX3RnPQ3qZ5Zq0D
    pm+z4LI5Mynpo3TfH15iJ6+cHXlprfVp+KQg/zi+rQ1kN9NUx7Xam52RAMWfCPdSW/tP9h
    sY3vahhqM6g9Ih5HOISLJjA1RqCvxztgIy7Lz2rbXMUF6ShZJJ7JZjM+lADeaz2cCAWodq
    sYLdYR54UTFkDktGXnSaDFaBd9bSdPWYtIRCSR+ZZX6ACDp9EVxYffNHoadIlURNvITFQ4
    LEPimdr/p7nz4uTaLDQzPPBVlGqoa7x4Wz8qBCa7tVrjsIe/76PKLAn9FrLx2EdN28S07B
    pi1u9kc8nLHK3T04HZc7dgXpt0KFgX0IjAkXDMlR10EU2p0MUXMyGo11jUQwVRDR68JVdZ
    FkuDT4uMnBsOb4HOEOsaEuiUzBH5N7x6w1XMnNAJCCPtFEPPWy9QU9OKb/AUAjQVTppQjw
    NQWU4Q6wXLbMBt+Qzv4iOrVjiChQ6LhZ9ACIWBNGn7ml//LmD7ocKFqH0pv/0nNTz7Gdod
    f7CRh0u/5iL9sVq4ghKd0/2fHBvfvoohpfxYwQJv8jzqdTI5yM0welR2woAQ
X-ME-Proxy: <xmx:AIGZasLidSv0DXFxh5JPvrH5Ux1qY_aQl4u22nbqCF9GZ3kucGim6A>
    <xmx:AIGZanj3AtD1m37ZXq-jKYDCRqWooy_CblfBEDB6TmhDV7OkK3MKwg>
    <xmx:AIGZamE06pqtIuoh4IP8aQr-5RT7BbR0q5gg9Ole010yWLx2NRa7WQ>
    <xmx:AIGZahK7njsyz9hMrYSumJcVgs6cd7-LBvmsCrhVZ6tx29XgaE3zGQ>
    <xmx:AYGZau-96BT_qVQxXb8inT1hClOKq08StbYnWVF-ykZPH1tJdu53fNbT>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Sep 2026 10:15:28 -0400 (EDT)
Date: Thu, 3 Sep 2026 15:15:27 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Krishna Reddy <vdumpa@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Breno Leitao <leitao@debian.org>, Kyle McMartin <jkkm@meta.com>, 
	Usama Arif <usama.arif@linux.dev>, kernel-team@meta.com, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] iommu/arm-smmu-v3: Add a cmdq_entries module
 parameter
Message-ID: <aplvJIuarj_ZrAx9@thinkstation>
References: <20260902121724.3494954-1-kas@kernel.org>
 <20260902121724.3494954-2-kas@kernel.org>
 <aphbV1FSoop1YGOQ@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aphbV1FSoop1YGOQ@nvidia.com>
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

On Wed, Sep 02, 2026 at 10:22:31AM -0700, Nicolin Chen wrote:
> On Wed, Sep 02, 2026 at 01:17:23PM +0100, Kiryl Shutsemau (Meta) wrote:
> > +/**
> > + * arm_smmu_queue_max_n_shift() - pick the log2 depth of a queue
> > + * @hw_shift: log2 depth the hardware allows, capped for natural alignment
> > + * @ent_sz_shift: log2 of the queue entry size in bytes
> > + * @want: number of entries asked for, or zero to use @hw_shift
> > + *
> > + * @want is rounded down to a power of two. It never sizes a queue below one
> > + * page, because coherent DMA is page granular: a shallower queue occupies the
> > + * same memory as one that fills the page, and arm_smmu_init_one_queue() stops
> > + * shrinking at a page too.
> 
> Well, since we want the cmdq depth, why not name the parameter
> "max_cmdq_depth"? Then, no rounding and more straightforward.

The max_ prefix is better, thanks. cmdq_entries does not say it is a
ceiling.

On the units, the page floor has to stay whatever we call the parameter.

Ask for 8 entries and max_n_shift comes out as 3, which the
CMDQ_BATCH_ENTRIES check in arm_smmu_device_hw_probe() rejects with
-ENXIO. The floor gives you 256 entries on a 4K kernel instead of a failed
probe.

So log2 removes the rounding but not the flooring, and the number asked for
still is not always the number you get. I would rather keep entries than
make people convert.

The rounding is not silent, either: arm_smmu_init_one_queue() already
prints "allocated %u entries for cmdq", so the effective depth lands in
dmesg whichever unit the parameter takes.

On the name itself, "depth" reads to me as a number of entries rather than
its log2, so max_cmdq_depth=8 meaning 256 seems more surprising than the
rounding it replaces.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

