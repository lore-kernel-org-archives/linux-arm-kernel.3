Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B71C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 23:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a635cw9nLrz4xEWwLDwCDKTc7TDPfje3YZ/sAxcXknM=; b=cg75AQR5Tg0aV5FywzeONObPqe
	RoQpI8DhEpw6j6dY+Enw3xzFbcJkgY/KMwbbTgmDf0Dg74TPW5S77MYpmbaKM1INCpphPpxX6f9At
	jc1pUXgyssHiW1q0LX97U2JIOb2g7iMlp7koqmRfexJRpiluujUyIgas/84zJ4P1X7gFjzMkDONS2
	+njcec2aQ3O/1/gZSf8z2Ii/ZnwJm+zgxMncE07IA8FbhP6pJvGazPZRwYijwY0ocVCWGrOmPooHh
	O1KHE5WVOam0XLriGCg754uRC22NiLc0LGeLPx5W8P7dBNzD9vdy3dMChtvKgtkWqAau1aO39QB9K
	7N7Ii5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tktcR-0000000Fk2u-3j2f;
	Wed, 19 Feb 2025 23:36:43 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkta3-0000000FjSi-0Bge
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 23:34:16 +0000
Date: Wed, 19 Feb 2025 15:34:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740008052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a635cw9nLrz4xEWwLDwCDKTc7TDPfje3YZ/sAxcXknM=;
	b=bb5m1WWMAid+L52NIRs/8Mh9PS05CQdkyKx3KWXAUKWZjGMLVimkPCaZ2qvxlnZm9zbCQg
	JxovjygqB7LG+3wV5lGMZTmdLIN+pwUuhZITb7dLSiJtF/xjc1Exsn3jVzagRUxyXEj5XA
	iMt4Ls8+6+4dyzJGGLgSIU+IefNoyMQ=
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
Message-ID: <Z7ZqbLdlbmeVX5a0@linux.dev>
References: <20250219143837.44277-3-miko.lenczewski@arm.com>
 <20250219143837.44277-5-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219143837.44277-5-miko.lenczewski@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_153415_221218_E5F35F51 
X-CRM114-Status: GOOD (  21.01  )
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

Hi Miko,

On Wed, Feb 19, 2025 at 02:38:38PM +0000, Mikołaj Lenczewski wrote:
> +config ARM64_ENABLE_BBML2

nit: consider calling this ARM64_BBML2_NOABORT or similar, since this
assumes behavior that exceeds the BBML2 baseline.

> +	bool "Enable support for Break-Before-Make Level 2 detection and usage"
> +	default y
> +	help
> +	  FEAT_BBM provides detection of support levels for break-before-make
> +	  sequences. If BBM level 2 is supported, some TLB maintenance requirements
> +	  can be relaxed to improve performance. Selecting N causes the kernel to
> +	  fallback to BBM level 0 behaviour even if the system supports BBM level 2.
> +

[...]

> +static bool has_bbml2_noconflict(const struct arm64_cpu_capabilities *entry,
> +				 int scope)
> +{
> +	if (!IS_ENABLED(CONFIG_ARM64_ENABLE_BBML2))
> +		return false;
> +
> +	/* We want to allow usage of bbml2 in as wide a range of kernel contexts
> +	 * as possible. This list is therefore an allow-list of known-good
> +	 * implementations that both support bbml2 and additionally, fulfil the

typo: fullfill

> +	 * extra constraint of never generating TLB conflict aborts when using
> +	 * the relaxed bbml2 semantics (such aborts make use of bbml2 in certain
> +	 * kernel contexts difficult to prove safe against recursive aborts).
> +	 */

We should be *very* specific of what qualifies a 'known-good'
implementation here. Implementations shouldn't be added to this list
based on the observed behavior, only if *the implementer* states their
design will not generate conflict aborts for BBML2 mapping granularity
changes.

> +	static const struct midr_range supports_bbml2_without_abort_list[] = {
> +		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
> +		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
> +		{}
> +	};
> +
> +	if (!is_midr_in_range_list(read_cpuid_id(), supports_bbml2_without_abort_list))
> +		return false;
> +
> +	return true;
> +}
> +
>  #ifdef CONFIG_ARM64_PAN
>  static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
>  {
> @@ -2926,6 +2951,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		.matches = has_cpuid_feature,
>  		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, EVT, IMP)
>  	},
> +	{
> +		.desc = "BBM Level 2 without conflict abort",
> +		.capability = ARM64_HAS_BBML2_NOCONFLICT,
> +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
> +		.matches = has_bbml2_noconflict,
> +		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, BBM, 2)
> +	},
>  	{
>  		.desc = "52-bit Virtual Addressing for KVM (LPA2)",
>  		.capability = ARM64_HAS_LPA2,
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 1e65f2fb45bd..8d67bb4448c5 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -26,6 +26,7 @@ HAS_ECV
>  HAS_ECV_CNTPOFF
>  HAS_EPAN
>  HAS_EVT
> +HAS_BBML2_NOCONFLICT

Please add this cap to cpucap_is_possible() test for the config option.

Thanks,
Oliver

