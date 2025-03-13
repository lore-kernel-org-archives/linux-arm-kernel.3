Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467EFC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVfO4mcI8jhRUbgBBdIWVAQveeOrUsZkcJ5GtnjIicE=; b=tULfRkB2luVbWQc/Zik6pG226A
	YFCDPC6IcDLS55IjKhTvgVDU6m1bPbUkkTsBZnZStCKrs+5sgSjvb2Ke4p4BgSwYOSwU3UQSx57pr
	W6IcAF5b4KoCrgPeoNQlHqRQZrrPvAxoH+7mUPagNvcMcSAbWBPi5SFuk1BC8iYJAxNkgYMaXFHx2
	CfrntPL3GxPRSqdB6dVcQA/oCnYe27ubX/von0zfnQjT8ejTyz1e0R9urutIiPKUGMBHHDyQf+0tH
	w9fqvR+Dhju9sYicPTfd8URg1rjkfqgLoYMtVNzF5j3SV+vWL7auop/cug26mEXL7TZCoAt2yJNGz
	fbYiFYng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnAQ-0000000CBCr-1DDH;
	Thu, 13 Mar 2025 18:20:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmz2-0000000C8wo-24kp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 18:08:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 472DD1477;
	Thu, 13 Mar 2025 11:08:50 -0700 (PDT)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECDD53F694;
	Thu, 13 Mar 2025 11:08:35 -0700 (PDT)
Date: Thu, 13 Mar 2025 18:08:33 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: suzuki.poulose@arm.com, yang@os.amperecomputing.com, corbet@lwn.net,
	catalin.marinas@arm.com, will@kernel.org, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, akpm@linux-foundation.org,
	mark.rutland@arm.com, joey.gouly@arm.com, maz@kernel.org,
	james.morse@arm.com, broonie@kernel.org, anshuman.khandual@arm.com,
	oliver.upton@linux.dev, ioworker0@gmail.com, baohua@kernel.org,
	david@redhat.com, jgg@ziepe.ca,
	shameerali.kolothum.thodi@huawei.com, nicolinc@nvidia.com,
	mshavit@google.com, jsnitsel@redhat.com, smostafa@google.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH v3 1/3] arm64: Add BBM Level 2 cpu feature
Message-ID: <20250313180833.GA40525@mazurka.cambridge.arm.com>
References: <20250313104111.24196-2-miko.lenczewski@arm.com>
 <20250313104111.24196-3-miko.lenczewski@arm.com>
 <ea10caee-59ef-4a00-9b61-37cb0a379411@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea10caee-59ef-4a00-9b61-37cb0a379411@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_110840_628846_FCAF2EBC 
X-CRM114-Status: GOOD (  21.83  )
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

On Thu, Mar 13, 2025 at 04:13:22PM +0000, Ryan Roberts wrote:
> On 13/03/2025 10:41, Mikołaj Lenczewski wrote: 
> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > index d561cf3b8ac7..b936e0805161 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -2176,6 +2176,76 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
> >  	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
> >  }
> >  
> > +static inline bool bbml2_possible(void)
> > +{
> > +	return !arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_NOBBML2);
> 
> If you're going to keep this helper, I think it really needs to be:
> 
> return IS_ENABLED(CONFIG_ARM64_BBML2_NOABORT) &&
>        !arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_NOBBML2);
> 
> Then you would simplify the caller to remove it's own
> IS_ENABLED(CONFIG_ARM64_BBML2_NOABORT) check.
> 
> But personally I would remove the helper and just fold the test into
> has_bbml2_noabort().
> 
> Thanks,
> Ryan

I was debating folding it into has_bbml2_noabort(), but went ahead and
implemented it separately to match hvhe_possible(), which was another sw
feature helper.

But I agree, folding it will be simpler and read just as easily (if not
easier). Will do so.

> > +}
> > +
> > +static bool cpu_has_bbml2_noabort(unsigned int cpu_midr)
> > +{
> > +	/* We want to allow usage of bbml2 in as wide a range of kernel contexts
> > +	 * as possible. This list is therefore an allow-list of known-good
> > +	 * implementations that both support bbml2 and additionally, fulfill the
> > +	 * extra constraint of never generating TLB conflict aborts when using
> > +	 * the relaxed bbml2 semantics (such aborts make use of bbml2 in certain
> > +	 * kernel contexts difficult to prove safe against recursive aborts).
> > +	 *
> > +	 * Note that implementations can only be considered "known-good" if their
> > +	 * implementors attest to the fact that the implementation never raises
> > +	 * TLBI conflict aborts for bbml2 mapping granularity changes.
> > +	 */
> > +	static const struct midr_range supports_bbml2_noabort_list[] = {
> > +		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
> > +		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
> > +		{}
> > +	};
> > +
> > +	return is_midr_in_range_list(cpu_midr, supports_bbml2_noabort_list);
> > +}
> > +
> > +static inline unsigned int __cpu_read_midr(int cpu)
> 
> nit: why the double underscrore prefix?

Again copying other helpers I saw that seemed to do similar things.
Didn't know if this was the expected style, so did as other helpers did.
Will remove.

Thank you for the review.

-- 
Kind regards,
Mikołaj Lenczewski

