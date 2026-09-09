Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F498C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApnG4gbQkWPzhtygCDB/k1nzV4DoinDV+hXxwsOMNyc=; b=Z88lUBXFZ/tuLRIHMFq467X3JQ
	jNg3LlzMpOup1tNdCJxJLU02M5QgUmqr2ASd5ElDiZLdSVfz+NsvNs7ekpMY6mdW/RmtE4bcMwXZp
	iKOv0jUFEU/aHgD0XTO1AsNhZEh0R+ORZ0exce4b42Z35SBojxWMQ+mgAzA4QYE/uDt7qBlEOwHiV
	AkTmY4OxsrH9PKLBFz6yx/GBOR/4x6p0x7fyWFFwYdvWRxGdyVQPYmun41HBUrI+TjXafkfyC2Yo/
	ncKRV21pY3dSDW0QqJzWIhosZSq8x8z9tC9ERPsPun7SkS/pds+PnMtf6Wk7Hp9SJnBD9Cuxm0viU
	tnBMU26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EwZ-0000000BLWv-0nqE;
	Wed, 09 Sep 2026 09:50:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EwY-0000000BLWh-0hPp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:50:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F186404AD;
	Wed,  9 Sep 2026 09:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B0C1F00A3A;
	Wed,  9 Sep 2026 09:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788947413;
	bh=ApnG4gbQkWPzhtygCDB/k1nzV4DoinDV+hXxwsOMNyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WrHYJjAlk8lzvKRzLrZHSWJSIjAxbsCur2fRPSHmLqa56woiuepdifabrqQsLdFvj
	 +kSwWoZwfD7VYciPEW9J7q+UEWIPUrMYMBry/Lqxt3RGwN+9B6wXU6F7e2HIpbBL2h
	 iaqbna7Jf14qJeFWvNBbL5kSkbC/UrJII3ArPcl6avlfvwRrHZDFtFpk7n2b1q82Bv
	 Gvxs56ZEM84knNwDuYeymu1k02PF/8/njWW00cFiHtDWKWsKSAJ7n+1n7/7VkVSlbQ
	 FfAhbhWU7cukLucHLDcDu01NJVhVaOiGgpa8AWK/UqDRwqxE9veIUMHOelbOfJMqJn
	 Zg2U5zAnFaANQ==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id 53081198004A;
	Wed,  9 Sep 2026 05:50:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 09 Sep 2026 05:50:10 -0400
X-ME-Sender: <xms:ziuhajsMi9FPGjZrOGtzg7_eNL7EDsLpK4VnBkuvRCGwHRDJvT165Q>
    <xme:ziuhautvhjFpNOcfjnB8gnUSyf46AyreVfFAg2npHbYn0-7DEsUztQr6isGztNbuA
    294-hrti1w5-BWe8fCCA2qFbI09CGAu1-oZO9xZwD73vILpd54SjWLM>
X-ME-Received: <xmr:ziuhalt1s9J_INx7rg8QxEyZtlB4eQkqEwWZASGhjagvpPw4J5a6-T6YvOI>
X-ME-Proxy-Cause: dmFkZTFem7G3Ne1q6IC+vXmmQWHwDejS0VSp4tATdSPU4b0RTONhBMg4e3iWlREif2K+1O
    ebkHT2ZM86YIfVSA82RZXKKwiJ5j1/gPpqk1wVlj+hQQIEgXDd+gdU6dO4kCbxe5T4Vid7
    rjZhezuKsu8K1qhI3Q+j6B+G9qqMyuidQ+g80FjdeWDAlTsr2UcfzSTkrm7CGo34bLSAnb
    UNjz2PQ7/3rcFs32nDzNLG7teJoa+MyNk4tYSRgSHLoxe7OYfP20OMz6aruz3qUSdmJOGs
    aqhvdN/haL+CQENusNsZIPjdXOJxOwAsGMGWCSYZ9O0FVkbiyUMpWcl7I4+jlCYDd0Q6em
    +REN0PnxueCUm7yFWbmUTv0iQ/5MwlpqWkGfdls4KNjET2VJpRQHqVymaWWVBdaVd6mQmt
    lFaVI6uru/nAWLxIDLhfH9wPqeheNCXopCumDrxVKVLcXvdr8GrulsGVezh3jCBxFZzX6o
    RJbhfY/RbVDPoc1GvgONzAYT1FCNyYghdiZ+I/E3nPDOm6oJ/gl7tDbrvn8CWo2IGzbNYb
    iMqYb2NhvqvmaIyScjPXJgGXt67F3CgR3YBgGa0Nn1U+Pvn9I/qFBsVreNtN6kxAljSRao
    biepisuOQZuasTKARP3Mq6zFw2ZRvup/dMatBIxI812XLV6L91zZyX7aiCcQ
X-ME-Proxy: <xmx:ziuhap3Y-ylLYOPb-XbB9NXwkwz5JMJ7K494ehfgNdsSCqeDVs6zwQ>
    <xmx:ziuhaiJPRSjTeSFhR5W7wHUYNcrZuDlwUsHgqccaR9I6EAMeLgk9Yw>
    <xmx:ziuhaj-FXk3QALZLLBjQGV_ZQjlpD48SyOWLieKVXVZpF4km7o4mdA>
    <xmx:ziuhahhBslrFpnxCJf2CYirlBJ9YW3qLufRZ1f_qpMbL4pPL6D0ZCQ>
    <xmx:ziuhaixx5jQJebuSqQCzevDGobzoPUgXRkMlyNFTvfmAPBGH_yVilwsF>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 05:50:06 -0400 (EDT)
Date: Wed, 9 Sep 2026 10:50:05 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Krishna Reddy <vdumpa@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Breno Leitao <leitao@debian.org>, Kyle McMartin <jkkm@meta.com>, 
	Usama Arif <usama.arif@linux.dev>, kernel-team@meta.com, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] iommu/arm-smmu-v3: Add a cmdq_max_entries module
 parameter
Message-ID: <aqErsLREudADNSGS@thinkstation>
References: <20260907095835.1233352-1-kas@kernel.org>
 <20260907095835.1233352-2-kas@kernel.org>
 <ap8zCvk8zUPZAJpH@nvidia.com>
 <ap_Rktiv5hms9IvH@thinkstation>
 <aqCEhG6NA3Ho5noV@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqCEhG6NA3Ho5noV@nvidia.com>
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

On Tue, Sep 08, 2026 at 02:56:20PM -0700, Nicolin Chen wrote:
> On Tue, Sep 08, 2026 at 10:19:44AM +0100, Kiryl Shutsemau wrote:
> > On Mon, Sep 07, 2026 at 02:56:26PM -0700, Nicolin Chen wrote:
> > > On Mon, Sep 07, 2026 at 10:58:34AM +0100, Kiryl Shutsemau (Meta) wrote:
> > > 
> > > I still think that cmdq_max_n_shift can slightly tidy things here.
> > > 
> > > > +static u32 arm_smmu_queue_max_n_shift(u32 ceiling, u32 ent_sz_shift,
> > > > +				      u32 entries)
> > > 
> > > Here, all three inputs would have been "shifts", instead of two
> > > "shifts" and one "number of entries".
> > > 
> > > > +{
> > > > +	u32 floor = PAGE_SHIFT - ent_sz_shift;
> > > > +
> > > > +	if (!entries)
> > > > +		return ceiling;
> > > > +
> > > > +	return min(ceiling, max(ilog2(entries), floor));
> > > 
> > > And I see Sashiko keeps complaining against the ilog2 here:
> > 
> > It does build: GCC 15 and clang 21, at -O2 and -Os, without a warning.
> > 
> > But the reason is not obvious.
> > 
> > ilog2() on a runtime u32 returns int, and minmax.h only accepts an int
> > against a u32 when __is_nonneg() can prove it non-negative at compile
> > time.
> > 
> > __ilog2_u32() is fls(n) - 1, so that proof only exists because the
> > if (entries) guard lets the compiler see entries != 0 through the inlined
> > fls().
> > 
> > But this is fragile. If a compiler does not get there, or a later change
> > that moves the guard, it turns it into a BUILD_BUG_ON.
> > 
> > Rather than a max_t() cast, we can give the shift its type first:
> > 
> > 	if (entries) {
> > 		new_ceiling = ilog2(entries);
> > 		new_ceiling = max(new_ceiling, floor);
> > 	} else if (is_kdump_kernel()) {
> > 
> > Two u32s, nothing left for the compiler to prove, same result.
> > 
> > If it looks good, I can re-spin v6 with the change.
> 
> It looks probably okay.. though I still don't get why you aren't
> picking the straightforward "max_n_shift" over "max_entries".
> 
> max_n_shift is used by both HW and SW, and it does not have such
> converting problem or need min/max, making the code cleaner :-/

Okay, fair enough. max_n_shift it is. Will post v6.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

