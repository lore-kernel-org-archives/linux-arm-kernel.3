Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A62C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wh5TsUgEdwd71UEG0lQA/H+rQuGVAsSR+aEY7VhmMiU=; b=XicHulfNJFb4Et5tg6pif6o4xz
	Xx4EfpKiBkmbEsG6wuOG6ImeTdSRd0easkBDfD+HR4szSFMNQPaAEQd15LOPHQiJggK44OFJpclGY
	pnBoOU3U1xNiwMdNB8KaWptBO9LP3towKFDWR+j/VsV5FOOSsfuXvg2UiitUx2i8MHNTCISQheMV5
	cagEHKFRuq+VYlkA5+N3T07gmqCo2QVorknPjnmk3ljW0Xf5gQ73GLJIRruvRvIAfDChwY9JgNSU7
	PRHsEQatulpDN3SjSrcZUCspdZlTeDU2eonaxrGmiXC1//+14A4ZYB2iHPAhJLhsovC2LLs9I6HQF
	fBZtHzLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fLE-00000005j5Y-2bd1;
	Tue, 15 Apr 2025 12:24:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dzI-00000005RJ8-2bcV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 10:57:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA31415A1;
	Tue, 15 Apr 2025 03:57:53 -0700 (PDT)
Received: from [10.1.33.173] (e137867.arm.com [10.1.33.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19D503F66E;
	Tue, 15 Apr 2025 03:57:51 -0700 (PDT)
Message-ID: <3d97e45a-23cf-419b-9b6f-140b4d88de7b@arm.com>
Date: Tue, 15 Apr 2025 11:57:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG][PATCH v8 4/6] arm64: Make _midr_in_range_list() an exported
 function
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 kvmarm@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 cohuck@redhat.com, eric.auger@redhat.com, sebott@redhat.com,
 yuzenghui@huawei.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, anthony.jebson@huawei.com,
 linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
References: <20250221140229.12588-1-shameerali.kolothum.thodi@huawei.com>
 <20250221140229.12588-5-shameerali.kolothum.thodi@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250221140229.12588-5-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_035756_745072_1E32628F 
X-CRM114-Status: GOOD (  17.99  )
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

Hello,

I discovered that this patch breaks boot for some CPUs when building the 
default defconfig plus KASAN. This is still the case in v6.15-rc1 and rc2.

This patch marks `is_midr_in_range_list` as position independent but it 
isn't, breaking early boot when instrumented with KASAN and 
`CONFIG_RANDOMIZE_BASE` enabled.

The breaking usage seems to be in `kaslr_requires_kpti()` called in 
`early_map_kernel()`.
My testing on an AMD Seattle board does crash, but newer machines 
implementing E0PD do not crash as they do not need to check MIDRs in 
`kaslr_requires_kpti()`.
`is_mdr_in_range_list` did work in PI code previously because it was 
`inline`, which this patch changes.

Best regards,
Ada Couprie Diaz

On 21/02/2025 14:02, Shameer Kolothum wrote:
> Subsequent patch will add target implementation CPU support and that
> will require _midr_in_range_list() to access new data. To avoid
> exporting the data make _midr_in_range_list() a normal function and
> export it.
>
> No functional changes intended.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>   arch/arm64/include/asm/cputype.h | 15 +--------------
>   arch/arm64/kernel/cpu_errata.c   | 15 +++++++++++++++
>   arch/arm64/kernel/image-vars.h   |  1 +
>   3 files changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> index 2a76f0e30006..ccb4a155d118 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -276,20 +276,7 @@ static inline bool midr_is_cpu_model_range(u32 midr, u32 model, u32 rv_min,
>   	return _model == model && rv >= rv_min && rv <= rv_max;
>   }
>   
> -static inline bool is_midr_in_range(struct midr_range const *range)
> -{
> -	return midr_is_cpu_model_range(read_cpuid_id(), range->model,
> -				       range->rv_min, range->rv_max);
> -}
> -
> -static inline bool
> -is_midr_in_range_list(struct midr_range const *ranges)
> -{
> -	while (ranges->model)
> -		if (is_midr_in_range(ranges++))
> -			return true;
> -	return false;
> -}
> +bool is_midr_in_range_list(struct midr_range const *ranges);
>   
>   static inline u64 __attribute_const__ read_cpuid_mpidr(void)
>   {
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 99b55893fc4e..1f51cf6378c5 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -14,6 +14,21 @@
>   #include <asm/kvm_asm.h>
>   #include <asm/smp_plat.h>
>   
> +static inline bool is_midr_in_range(struct midr_range const *range)
> +{
> +	return midr_is_cpu_model_range(read_cpuid_id(), range->model,
> +				       range->rv_min, range->rv_max);
> +}
> +
> +bool is_midr_in_range_list(struct midr_range const *ranges)
> +{
> +	while (ranges->model)
> +		if (is_midr_in_range(ranges++))
> +			return true;
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(is_midr_in_range_list);
> +
>   static bool __maybe_unused
>   __is_affected_midr_range(const struct arm64_cpu_capabilities *entry,
>   			 u32 midr, u32 revidr)
> diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> index ef3a69cc398e..de3d081e5a57 100644
> --- a/arch/arm64/kernel/image-vars.h
> +++ b/arch/arm64/kernel/image-vars.h
> @@ -49,6 +49,7 @@ PROVIDE(__pi_arm64_sw_feature_override	= arm64_sw_feature_override);
>   PROVIDE(__pi_arm64_use_ng_mappings	= arm64_use_ng_mappings);
>   #ifdef CONFIG_CAVIUM_ERRATUM_27456
>   PROVIDE(__pi_cavium_erratum_27456_cpus	= cavium_erratum_27456_cpus);
> +PROVIDE(__pi_is_midr_in_range_list	= is_midr_in_range_list);
>   #endif
>   PROVIDE(__pi__ctype			= _ctype);
>   PROVIDE(__pi_memstart_offset_seed	= memstart_offset_seed);

