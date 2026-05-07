Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596A8CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 14:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXNl0w1+NngwBpR+Sh+WBD2QAysxvnVM9dG2kbcA6qE=; b=rsGi06ZFWtclndrX35GdGV7jWX
	7rxWK1IBsR2MNT4EpaGvdfHWnRswQJpDNdfLZ+JJbi/30YKj0njqeWMaAFzYHWmXf8YQVaJMZBfpl
	0RhRE6Sv3Nd0C+ru4bmeXo78TYpXUPk4Z2zR3NMkd5jLvE1Nt9yzmFHSGztRGdgxd/AaigFXZSRpw
	WSrROoN9LZWTQ4TpmPfCu/DHN9CiNKB4szV7ESUzkrnUcEMFED5aJz757ElB/V+jJASZ+onvwE6sJ
	UyN1YIvJC0v/SkfUgZNCHMLEvqYweQOfKIKzXh/UY/sIGZ6bcqtiW84E0s/ATvQ3zUeHCh0AkFhrG
	AeZ/DaJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzPv-0000000417T-0QYS;
	Thu, 07 May 2026 14:09:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzPq-00000004161-4813
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 14:09:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BFCB2641;
	Thu,  7 May 2026 07:09:17 -0700 (PDT)
Received: from [10.1.196.96] (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D7803F763;
	Thu,  7 May 2026 07:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778162962; bh=Angl1c1Izwq6EukNkMuDPGBnBFS4iMvENihyV7fPm3I=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=kqsMAozL/70V5AhJa3e5hh+i5znehLrQzU1y5/1uoRXZJk6vchHKLu4y3VYi1v5Fc
	 UyvbNLfpBTLea0dBh8opFEwc5ONGhUVyC0soFnaK4iAQzuqAZeGj4lZTTE4UdVKTgB
	 1gaWZYbWFGJZtvOBlHDoqMmi94IGrSqR8ZpVAkDI=
Message-ID: <5869e7ef-fb07-414b-8bf3-359e74444c76@arm.com>
Date: Thu, 7 May 2026 15:09:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: James Morse <james.morse@arm.com>
Subject: Re: [PATCH v2 1/2] arm64: cpufeature: Add support for the MPAM v0.1
 architecture version
To: Zeng Heng <zengheng4@huawei.com>, xry111@xry111.site,
 catalin.marinas@arm.com, maz@kernel.org, ardb@kernel.org,
 yang@os.amperecomputing.com, ryan.roberts@arm.com, kevin.brodsky@arm.com,
 reinette.chatre@intel.com, miko.lenczewski@arm.com, will@kernel.org,
 suzuki.poulose@arm.com, thuth@redhat.com, ben.horgan@arm.com,
 james.clark@linaro.org, lpieralisi@kernel.org, broonie@kernel.org,
 oupton@kernel.org, anshuman.khandual@arm.com, yeoreum.yun@arm.com,
 leo.yan@arm.com, mrigendra.chaubey@gmail.com, fenghuay@nvidia.com,
 ahmed.genidi@arm.com, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 wangkefeng.wang@huawei.com
References: <20260203095406.6437-1-zengheng4@huawei.com>
 <20260203095406.6437-2-zengheng4@huawei.com>
Content-Language: en-GB
In-Reply-To: <20260203095406.6437-2-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_070927_121100_1082C261 
X-CRM114-Status: GOOD (  24.26  )
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

Hi Zeng,

(sorry for the delay - arm silently blocked your original mail. I've added you
 to the whitelist, we'll see if that actually does anything!)

On 03/02/2026 09:54, Zeng Heng wrote:
> According to the MPAM spec [1], the supported architecture versions are
> v1.0, v1.1 and v0.1. MPAM versions v0.1 and v1.1 are functionally
> identical, but v0.1 additionally supports the FORCE_NS feature.
> 
> ID_AA64PR | ID_AA64PR | MPAM Extension | Notes
> F0_EL1.   | F1_EL1.   | Architecture   |
> MPAM      | MPAM_frac | version        |
> ---------------------------------------------------------------------------
> 0b0000    | 0b0001    | v0.1           | MPAM v0.1 is implemented.
>           |           |                | MPAM v0.1 is the same as MPAM v1.1
>           |           |                | with FORCE_NS which is
>           |           |                | incompatible with MPAM v1.0.
> ---------------------------------------------------------------------------
> 0b0001    | 0b0000    | v1.0           | MPAM v1.0 is implemented.
> ---------------------------------------------------------------------------
> 0b0001    | 0b0001    | v1.1           | MPAM v1.1 is implemented.
>           |           |                | MPAM v1.1 includes all features of
>           |           |                | MPAM v1.0.
>           |           |                | It must not include FORCE_NS.
> 
> FORCE_NS is a feature that operates in EL3 mode. Consequently, the current
> Linux MPAM driver is also compatible with MPAM v0.1. To support v0.1, the
> existing driver which only checks ID_AA64PFR0_EL1.MPAM for the major
> version needs to examine ID_AA64PFR1_EL1.MPAM_frac for the minor version
> as well.
> 
> [1] https://developer.arm.com/documentation/ddi0598/db/?lang=en


> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index cacd20df1786..606cf14e4044 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -501,7 +501,9 @@
>  #endif
>  
>  .macro finalise_el2_state
> -	check_override id_aa64pfr0, ID_AA64PFR0_EL1_MPAM_SHIFT, .Linit_mpam_\@, .Lskip_mpam_\@, x1, x2
> +	check_override id_aa64pfr0, ID_AA64PFR0_EL1_MPAM_SHIFT, .Linit_mpam_\@, .Lmpam_minor_\@, x1, x2
> +.Lmpam_minor_\@:
> +	check_override id_aa64pfr1, ID_AA64PFR1_EL1_MPAM_frac_SHIFT, .Linit_mpam_\@, .Lskip_mpam_\@, x1, x2

Heh, I see the 'frac' field already has an override.


> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index c840a93b9ef9..e8fa6f7cf2a2 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -1159,6 +1159,14 @@ static __init void detect_system_supports_pseudo_nmi(void)
>  static inline void detect_system_supports_pseudo_nmi(void) { }
>  #endif
>  
> +static bool detect_ftr_has_mpam(void)
> +{
> +	u64 pfr0 = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
> +	u64 pfr1 = read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1);
> +
> +	return id_aa64pfr0_mpam(pfr0) || id_aa64pfr1_mpamfrac(pfr1);
> +}
> +
>  void __init init_cpu_features(struct cpuinfo_arm64 *info)
>  {
>  	/* Before we start using the tables, make sure it is sorted */
> @@ -2473,7 +2481,7 @@ cpucap_panic_on_conflict(const struct arm64_cpu_capabilities *cap)
>  static bool
>  test_has_mpam(const struct arm64_cpu_capabilities *entry, int scope)
>  {
> -	if (!has_cpuid_feature(entry, scope))
> +	if (!detect_ftr_has_mpam())
>  		return false;
>  
>  	/* Check firmware actually enabled MPAM on this cpu. */
> @@ -3078,7 +3086,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		.capability = ARM64_MPAM,
>  		.matches = test_has_mpam,
>  		.cpu_enable = cpu_enable_mpam,
> -		ARM64_CPUID_FIELDS(ID_AA64PFR0_EL1, MPAM, 1)
>  	},
>  	{
>  		.desc = "Memory Partitioning And Monitoring Virtualisation",

I think this is preferable to a 'metacap' as the pointer auth code does - we never need
to expose the difference between MPAM v0.1 and v1.x to anything.

Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James

