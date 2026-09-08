Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E0AC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CianPnw9N8UEhhHcBMcHJ6evQxqMFmnummmTuv+mVuQ=; b=OEWM0yMB5VTsyvSrPw8ENx+FQ6
	6adSFT90U7adxZxwuoxjD/57qG/odkFb2C92yivEDBNLkWWzAttvGAepatMayGGh91SPKk1z7Ib/i
	Q4yKpEBEw8qDjPSySSZClgbfqL6eeC9mK73ezYuGzem7OSfCS/jZefpWG2GGluYVgzJ1GencdoRHm
	J/cbHACZwtmF4bDCnF4B3rmrUJyH1r3HcXhqyofD6VlVerD2VGgsbp4V6CE5liisM4woRSD6/FX6a
	GH1jRsG/qBfjMcCmKHHvpWqYLzQAEn3i4djGhydRwBoRMGUWkpH/xR/2ka3P8efGdpLLnJ/e+dJcL
	Nfs8B7eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rzd-00000008Y2G-34uH;
	Tue, 08 Sep 2026 09:19:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rzc-00000008Y1v-3Qcj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:19:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E8F943AB0;
	Tue,  8 Sep 2026 09:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8481F00A3A;
	Tue,  8 Sep 2026 09:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788859192;
	bh=CianPnw9N8UEhhHcBMcHJ6evQxqMFmnummmTuv+mVuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fjjfCKr7d0EwMJbwoptdjEOWPGGL3ORBnxyOBHnPxp3HGX7ENnWnlfR8HZv2N7aNA
	 I8WTfZLu8olqvOMvHkImFimZgIgRQcfk19MmVWpU2SVFvy6UExjD4y7YQ7Xiel3ZHo
	 ybf9VyOBjA14uFeBJigQmpQnv+l1ilWkEdaXfwTzvYBEZxB+PkACryif5wGnG/Rje8
	 aQvW+5i+pf7/8xHT3OW3WnFc2b6O7/IqRLwA29jPi4TO/I9hG3Mh/PY9msil3FrgsS
	 0RLGJMO8BMDtAkma1Q+GE8jd/CvUvaT699zdEpxEJIE+8Sv2wdSLCrTGnNWFBmhlxq
	 ylrylgBvtiPpw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.ams.internal (Postfix) with ESMTP id 4AC1D198004A;
	Tue,  8 Sep 2026 05:19:46 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 08 Sep 2026 05:19:49 -0400
X-ME-Sender: <xms:MdOfai9Q_3IqAyvs-g_ObgC6qMshX6-zm2mvVMRxmaaAlfg9RvFhwA>
    <xme:MdOfah__D2UpzR46XUfimK9JVNoMRkR9tJXK953FlKhzz7deSCpOO7wrXqCjwc0xX
    jf5wIJ39K7EAdTmECnUmKIT28IbNDffiInUZKjOzKmtTbOCDRptkgU>
X-ME-Received: <xmr:MdOfakMP-rdzh_oX5WFeA46rm9K0yqatcr_R0krIc24VT4u0aAhizWuntCE>
X-ME-Proxy-Cause: dmFkZTFiAXmtBayfz5G9aXyEargjHBozBK8gKU5sB51WYdK0X/Q+hfwGVozywaREAJK34/
    QHGUiEPoaTC9mywDMCsyXg28jnGhf0iirWESM0EfNrd8/WmpPqVPLmo6Rw8kVuvTWPpUx9
    0o/C4b94Rr94gLy9aFMnFzdZ8KNwDH9wCKIjyRgmu35cNzcY5yYFB93LtkqwtbrfAzRX8h
    la89oeZT/ONuGoeC2gXpJ1isSNpq1pxbRIw7fOCpoKFW2+qS0KkSqTpTQoR6xYch1rR84V
    giXfBvfWpaLQ4mHx+6UB/mJTcjiIl6olxKDZy5LUCJvGyUOdM/d+oZ4biBeiGPwAV1Qpfo
    7Ih4vUV36FmCi6rqhHHsfmBd1xVmtA6B2zBxO7asqejZE7KCdfnjCIe6TN+LCOWipu1Q47
    K5BchGr35ZqnZbZ9gK3xZuuKuPn3HFDVJ7kResqdQhroX8QY/nkqwD7UODWp3jl3wgzncl
    SSuAetbpS5H8EKWQhyPLTmTnHxxoHccr8Ps0gnvTv76X5ogde2tYi9w96DDMwT0B9V9M6L
    oSjwqy3kREez81Mjh+AN7RN3b43CoHGDbWldO7NkpL0VU/XgE3/rIO+WAZVsB2HvjWDG50
    8H0m9H7hdQmzePKHZE8o70tHXyyq2e98QAk1SgKtUQnKzsja1HiK60dV2VVg
X-ME-Proxy: <xmx:MdOfalPq48biYqJp6XL4XGA-Z_7wbq8Jh_XLeY1rrnwCA8kVCgoe4Q>
    <xmx:MdOfaqMDWm9U8X8iUq7XFuqMbsPqH1oECWzGsDgdeEJ5hj8bc_DpLw>
    <xmx:MdOfakUdGxtDaym9TbXD2IgXJqfXoMbaWa7f7LyualfiYNlZ_j8Ing>
    <xmx:MdOfaqp6JOXdUIRmM-ziM8eitAbJHuUNlzX_fvAQ3xpWrAtDNTMChQ>
    <xmx:MdOfaic-4EprC7jtnqgD9LrOjkByJia5YgB109mJm3kGN8Rt-elVFbRr>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 05:19:45 -0400 (EDT)
Date: Tue, 8 Sep 2026 10:19:44 +0100
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
Message-ID: <ap_Rktiv5hms9IvH@thinkstation>
References: <20260907095835.1233352-1-kas@kernel.org>
 <20260907095835.1233352-2-kas@kernel.org>
 <ap8zCvk8zUPZAJpH@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap8zCvk8zUPZAJpH@nvidia.com>
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

On Mon, Sep 07, 2026 at 02:56:26PM -0700, Nicolin Chen wrote:
> On Mon, Sep 07, 2026 at 10:58:34AM +0100, Kiryl Shutsemau (Meta) wrote:
> 
> I still think that cmdq_max_n_shift can slightly tidy things here.
> 
> > +static u32 arm_smmu_queue_max_n_shift(u32 ceiling, u32 ent_sz_shift,
> > +				      u32 entries)
> 
> Here, all three inputs would have been "shifts", instead of two
> "shifts" and one "number of entries".
> 
> > +{
> > +	u32 floor = PAGE_SHIFT - ent_sz_shift;
> > +
> > +	if (!entries)
> > +		return ceiling;
> > +
> > +	return min(ceiling, max(ilog2(entries), floor));
> 
> And I see Sashiko keeps complaining against the ilog2 here:

It does build: GCC 15 and clang 21, at -O2 and -Os, without a warning.

But the reason is not obvious.

ilog2() on a runtime u32 returns int, and minmax.h only accepts an int
against a u32 when __is_nonneg() can prove it non-negative at compile
time.

__ilog2_u32() is fls(n) - 1, so that proof only exists because the
if (entries) guard lets the compiler see entries != 0 through the inlined
fls().

But this is fragile. If a compiler does not get there, or a later change
that moves the guard, it turns it into a BUILD_BUG_ON.

Rather than a max_t() cast, we can give the shift its type first:

	if (entries) {
		new_ceiling = ilog2(entries);
		new_ceiling = max(new_ceiling, floor);
	} else if (is_kdump_kernel()) {

Two u32s, nothing left for the compiler to prove, same result.

If it looks good, I can re-spin v6 with the change.

Thanks for the review and the test!

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

