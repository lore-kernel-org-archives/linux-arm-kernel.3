Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7317C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 23:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ifri3yR9JqPppqU+vPutRv+m7t0Xgqqx49nMkg0VTfM=; b=2Yisd1QoANW1irAzkmphQhKOv7
	Q+9W4mvhiq1e41fKFPfLhoTX/xGNOQRKPEVyjqyVpi/rfODPY0EK4KsCaknvke6xnf5WbgDgicXTr
	8KlISbMAV0P944HYzk3Xaydy/zDPxwHYQb2+ltZdak17bWJSKUjk9rDtpZOhE12LZjrhlGtioPzpT
	rnnJ/zQSj17kvcA5hgyEukaK1sdpqweWbxqjE3CbU64NSxE8vvJhJSHqM08ngXOb8CXqB0tAwBYkj
	i7VZRe0jTTGDVU5e6QaX222I8PPTRez4CD86bF7fzLu0/jtgCdFUtwu8SkHCGk7LOm4Ahlij9GU7P
	QHj7fTdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tktyV-0000000Fp8A-30OU;
	Wed, 19 Feb 2025 23:59:31 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tktx1-0000000Foo3-2I1P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 23:58:01 +0000
Date: Wed, 19 Feb 2025 15:57:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740009477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ifri3yR9JqPppqU+vPutRv+m7t0Xgqqx49nMkg0VTfM=;
	b=SvJVt76nU1JxnDfk5q+yWKrTlGCEQpfmftMqIRk2LNwtwF3rXPOo5KCVH/4hudZahpSCrl
	kENdQUpu190uiMYsZF1YjZvUmIm+G06HfMpDLX5KZ7ye41gi3xgyZxvd21Cte1xg1P9dGb
	gBNx8keDX59z3P8z5VTgrEI7cVXO9BI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
Cc: ryan.roberts@arm.com, yang@os.amperecomputing.com,
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
	broonie@kernel.org, mark.rutland@arm.com, james.morse@arm.com,
	yangyicong@hisilicon.com, robin.murphy@arm.com,
	anshuman.khandual@arm.com, maz@kernel.org, liaochang1@huawei.com,
	akpm@linux-foundation.org, david@redhat.com, baohua@kernel.org,
	ioworker0@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] arm64: Add BBM Level 2 cpu feature
Message-ID: <Z7Zv90i0DyvxFUcv@linux.dev>
References: <20250219143837.44277-3-miko.lenczewski@arm.com>
 <20250219143837.44277-5-miko.lenczewski@arm.com>
 <Z7ZqbLdlbmeVX5a0@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7ZqbLdlbmeVX5a0@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_155759_876907_ED0177CC 
X-CRM114-Status: GOOD (  25.98  )
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

On Wed, Feb 19, 2025 at 03:34:12PM -0800, Oliver Upton wrote:
> Hi Miko,
> 
> On Wed, Feb 19, 2025 at 02:38:38PM +0000, Mikołaj Lenczewski wrote:
> > +config ARM64_ENABLE_BBML2
> 
> nit: consider calling this ARM64_BBML2_NOABORT or similar, since this
> assumes behavior that exceeds the BBML2 baseline.
> 
> > +	bool "Enable support for Break-Before-Make Level 2 detection and usage"
> > +	default y
> > +	help
> > +	  FEAT_BBM provides detection of support levels for break-before-make
> > +	  sequences. If BBM level 2 is supported, some TLB maintenance requirements
> > +	  can be relaxed to improve performance. Selecting N causes the kernel to
> > +	  fallback to BBM level 0 behaviour even if the system supports BBM level 2.
> > +
> 
> [...]
> 
> > +static bool has_bbml2_noconflict(const struct arm64_cpu_capabilities *entry,
> > +				 int scope)
> > +{
> > +	if (!IS_ENABLED(CONFIG_ARM64_ENABLE_BBML2))
> > +		return false;
> > +
> > +	/* We want to allow usage of bbml2 in as wide a range of kernel contexts
> > +	 * as possible. This list is therefore an allow-list of known-good
> > +	 * implementations that both support bbml2 and additionally, fulfil the
> 
> typo: fullfill

I can't spell either ;-)

> > +	 * extra constraint of never generating TLB conflict aborts when using
> > +	 * the relaxed bbml2 semantics (such aborts make use of bbml2 in certain
> > +	 * kernel contexts difficult to prove safe against recursive aborts).
> > +	 */
> 
> We should be *very* specific of what qualifies a 'known-good'
> implementation here. Implementations shouldn't be added to this list
> based on the observed behavior, only if *the implementer* states their
> design will not generate conflict aborts for BBML2 mapping granularity
> changes.
> 
> > +	static const struct midr_range supports_bbml2_without_abort_list[] = {
> > +		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
> > +		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
> > +		{}
> > +	};
> > +
> > +	if (!is_midr_in_range_list(read_cpuid_id(), supports_bbml2_without_abort_list))
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> >  #ifdef CONFIG_ARM64_PAN
> >  static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
> >  {
> > @@ -2926,6 +2951,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
> >  		.matches = has_cpuid_feature,
> >  		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, EVT, IMP)
> >  	},
> > +	{
> > +		.desc = "BBM Level 2 without conflict abort",
> > +		.capability = ARM64_HAS_BBML2_NOCONFLICT,
> > +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
> > +		.matches = has_bbml2_noconflict,
> > +		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, BBM, 2)
> > +	},
> >  	{
> >  		.desc = "52-bit Virtual Addressing for KVM (LPA2)",
> >  		.capability = ARM64_HAS_LPA2,
> > diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> > index 1e65f2fb45bd..8d67bb4448c5 100644
> > --- a/arch/arm64/tools/cpucaps
> > +++ b/arch/arm64/tools/cpucaps
> > @@ -26,6 +26,7 @@ HAS_ECV
> >  HAS_ECV_CNTPOFF
> >  HAS_EPAN
> >  HAS_EVT
> > +HAS_BBML2_NOCONFLICT
> 
> Please add this cap to cpucap_is_possible() test for the config option.
> 
> Thanks,
> Oliver

