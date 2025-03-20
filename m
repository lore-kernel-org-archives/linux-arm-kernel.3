Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAD2C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 17:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NaqTuqTwsQZzUecuSkiWd/0/dOFPVhvfKMOWLDHeyr8=; b=a9XNogSzvIzJkf3f9zfzFArmNk
	r415WJwDBM6UTtq0jUC0t18J9xaNVALZA0I3ST5cRDURFGr228msxFN4I0hTNSYw82SKxuBGzTYsk
	K+O9BKDOCqSCqi0tbYGDuegRYmHD1ny9F7A57khInTSCvs+sumfJ+65dS5f5fmuTArH/JUNC+P3Ms
	0fEG4RBGuNk9RfDK3COLFfMlWFN1CjVXJk1YFFxqyVneB7tkeYLDwrnG4w99CspWGJmdraAJjZ7Ov
	wcQFSxkMXBxfnNzvQRZFLlUl+n02sX0zfAnapBc0gLv+IxJbTOJ2JLSngo7rutJHEiEDAp30JPMN6
	97FJcA8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJQZ-0000000ClU5-1AzW;
	Thu, 20 Mar 2025 17:11:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJOr-0000000ClKV-1131
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 17:09:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02CF1113E;
	Thu, 20 Mar 2025 10:09:52 -0700 (PDT)
Received: from e133081.arm.com (unknown [10.57.15.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EE7C3F673;
	Thu, 20 Mar 2025 10:09:39 -0700 (PDT)
Date: Thu, 20 Mar 2025 17:09:36 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: ryan.roberts@arm.com, yang@os.amperecomputing.com, corbet@lwn.net,
	catalin.marinas@arm.com, will@kernel.org, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, akpm@linux-foundation.org,
	ardb@kernel.org, mark.rutland@arm.com, joey.gouly@arm.com,
	maz@kernel.org, james.morse@arm.com, broonie@kernel.org,
	oliver.upton@linux.dev, baohua@kernel.org, david@redhat.com,
	ioworker0@gmail.com, jgg@ziepe.ca, nicolinc@nvidia.com,
	mshavit@google.com, jsnitsel@redhat.com, smostafa@google.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH v4 1/3] arm64: Add BBM Level 2 cpu feature
Message-ID: <20250320170936.GB487465@e133081.arm.com>
References: <20250319150533.37440-2-miko.lenczewski@arm.com>
 <20250319150533.37440-3-miko.lenczewski@arm.com>
 <f9c5839e-5d55-497e-9df3-ab778c4eae72@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9c5839e-5d55-497e-9df3-ab778c4eae72@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_100945_371415_BC22CCD3 
X-CRM114-Status: GOOD (  25.18  )
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

On Thu, Mar 20, 2025 at 01:24:25PM +0000, Suzuki K Poulose wrote:
> On 19/03/2025 15:05, Mikołaj Lenczewski wrote:
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index fb8752b42ec8..3e4cc917a07e 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -453,6 +453,9 @@
> >   	arm64.no32bit_el0 [ARM64] Unconditionally disable the execution of
> >   			32 bit applications.
> > +	arm64.nobbml2	[ARM64] Unconditionally disable Break-Before-Make Level
> > +			2 support
> > +
> >   	arm64.nobti	[ARM64] Unconditionally disable Branch Target
> >   			Identification support
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 940343beb3d4..49deda2b22ae 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -2057,6 +2057,17 @@ config ARM64_TLB_RANGE
> >   	  The feature introduces new assembly instructions, and they were
> >   	  support when binutils >= 2.30.
> > +config ARM64_BBML2_NOABORT
> > +	bool "Enable support for Break-Before-Make Level 2 detection and usage"
> > +	default y
> > +	help
> > +	  FEAT_BBM provides detection of support levels for break-before-make
> > +	  sequences. If BBM level 2 is supported, some TLB maintenance requirements
> > +	  can be relaxed to improve performance. We additonally require the
> > +	  property that the implementation cannot ever raise TLB Conflict Aborts.
> > +	  Selecting N causes the kernel to fallback to BBM level 0 behaviour
> > +	  even if the system supports BBM level 2.
> 
> minor nit: Should we mention that the feature can be disabled at runtime
> using a kernel parameter ?

Yes, this sounds very reasonable, I should have thought of that. Will
mention the commandline parameter in the kconfig option documentation.

> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > index d561cf3b8ac7..1a4adcda267b 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -2176,6 +2176,67 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
> >   	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
> >   }
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
> > +static inline unsigned int cpu_read_midr(int cpu)
> > +{
> > +	WARN_ON_ONCE(!cpu_online(cpu));
> > +
> > +	return per_cpu(cpu_data, cpu).reg_midr;
> > +}
> > +
> > +static bool has_bbml2_noabort(const struct arm64_cpu_capabilities *caps, int scope)
> > +{
> > +	if (!IS_ENABLED(CONFIG_ARM64_BBML2_NOABORT))
> > +		return false;
> > +
> > +	if (scope & SCOPE_SYSTEM) {
> > +		int cpu;
> > +
> > +		/* We are a boot CPU, and must verify that all enumerated boot
> 
> minor nit: See Documentation/process/coding-style.rst,
> Section 8 Commenting.

My bad, had skimmed the coding style at one point but clearly missed or
forgot the section on comments. Will fix up this and all other instances
of the same issue.

-- 
Kind regards,
Mikołaj Lenczewski

