Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D28C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+goT+hr0IrSZ4BtE6KkeA8yYjV82za9oXMdRVnVLM4=; b=y2nA23Irnsyus6+GMl31xr3Ksh
	PvesPqhxlupnDIQYRR9ya29r6LJFsuAji2lJQaCcGt4lvapBgeZLAMSPC5bU7b9rBc1pgFoz3/bGd
	y1QBHeCStE+sPml6FNsKTKOI3UZbNwN9Z/HIDnZym7F8zmy8AorhZdQQm9MFEXGhp0ho7FkoYhdi5
	Mrxl82ZH0VBjrHswFu3iDHgfM5DkWrLZuYpTzlJE+jkK/KgVD1ixdfEnD6zvDPzr5UfnbZeV365ME
	y7HsPY/2m3w2fBZgcOv9xkn00IEwfa48U6xo7WVrbw6QCMJBsuAPpR0lD9mRmeH9gsNsduITCvkyy
	RkSjB6bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCERB-0000000BKRb-0SCA;
	Tue, 06 May 2025 09:18:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDmn-0000000BBdi-18eq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 08:36:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A1E4113E;
	Tue,  6 May 2025 01:36:07 -0700 (PDT)
Received: from e133081.arm.com (unknown [10.57.75.88])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E8EC3F673;
	Tue,  6 May 2025 01:36:10 -0700 (PDT)
Date: Tue, 6 May 2025 09:36:07 +0100
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: ryan.roberts@arm.com, suzuki.poulose@arm.com,
	yang@os.amperecomputing.com, corbet@lwn.net,
	catalin.marinas@arm.com, will@kernel.org, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, akpm@linux-foundation.org,
	paulmck@kernel.org, mark.rutland@arm.com, joey.gouly@arm.com,
	maz@kernel.org, james.morse@arm.com, broonie@kernel.org,
	oliver.upton@linux.dev, baohua@kernel.org, david@redhat.com,
	ioworker0@gmail.com, jgg@ziepe.ca, nicolinc@nvidia.com,
	mshavit@google.com, jsnitsel@redhat.com, smostafa@google.com,
	kevin.tian@intel.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev
Subject: Re: [RESEND PATCH v6 1/3] arm64: Add BBM Level 2 cpu feature
Message-ID: <20250506083607.GA45762@e133081.arm.com>
References: <20250428153514.55772-2-miko.lenczewski@arm.com>
 <20250428153514.55772-4-miko.lenczewski@arm.com>
 <d03d2ea6-323b-490e-b53c-d2e6d9c31b6f@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d03d2ea6-323b-490e-b53c-d2e6d9c31b6f@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_013621_353057_EFBD560F 
X-CRM114-Status: GOOD (  17.04  )
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

Hi Alok,

Apologies for the delay.

On Mon, Apr 28, 2025 at 11:25:07PM +0530, ALOK TIWARI wrote:
> 
> 
> On 28-04-2025 21:05, Mikołaj Lenczewski wrote:
> > +config ARM64_BBML2_NOABORT
> > +	bool "Enable support for Break-Before-Make Level 2 detection and usage"
> > +	default y
> > +	help
> > +	  FEAT_BBM provides detection of support levels for break-before-make
> > +	  sequences. If BBM level 2 is supported, some TLB maintenance requirements
> > +	  can be relaxed to improve performance. We additonally require the
> 
> typo additonally  -> additionally
Yes, had missed this. Will fix.

> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > index 9c4d6d552b25..7a85a1bdc6e9 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -2200,6 +2200,70 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
> >   	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
> >   }
> > +static bool cpu_has_bbml2_noabort(unsigned int cpu_midr)
> > +{
> > +	/*
> > +	 * We want to allow usage of bbml2 in as wide a range of kernel contexts
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
> 
> use bbml2 -> BBML2 to maintain consistency
> 
OK, will go through and use BBML2 throughout for consistency.

-- 
Kind regards,
Mikołaj Lenczewski

