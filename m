Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB60C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 08:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMuHcDEItV0s3xXGiAYSnQg+SA2oqFzWroLf7oJ3J/Y=; b=bQK2VNBnGZO3EV7td6078zOgb1
	OPjNu8r08g+9gmfnSFMbxCk8EBGAuWHbQYGiYAS/wp8Qsa0P32f4CZyhJlGylHMJkwEdDOsTMyUvm
	qm7QvXJQ3YG74hd9srOOYVKAq051t2UV13WV9QypvAuv5U4ZuEw/T1iwHTyTTpG5GMQURR6isI5Vp
	EW97eGpeCXgzfc1oR1FJ1E5uF+KboKbyN3ou57BWFN5lnzNnCrvRdEbgPLqGAE4oWgiQvSaxXLlw+
	FL7JZQdBwwiyqT59+16+GYl0dlZ+lB3HF6/gX0tCHJYUIeEdNWETGfaJSZQVdqg+g+R2ev/juzgL8
	PT1d7GhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcw6-0000000CYAN-2qkk;
	Thu, 12 Jun 2025 08:05:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcTK-0000000CSs9-2Jbl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:35:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B280F1595;
	Thu, 12 Jun 2025 00:35:17 -0700 (PDT)
Received: from [10.163.33.129] (unknown [10.163.33.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F4223F66E;
	Thu, 12 Jun 2025 00:35:29 -0700 (PDT)
Message-ID: <10f63976-afa7-4e1c-bec1-d9f2447d9c13@arm.com>
Date: Thu, 12 Jun 2025 13:05:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] perf: arm_spe: Support FEAT_SPEv1p4 filters
To: James Clark <james.clark@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-2-71b0c9f98093@linaro.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-2-71b0c9f98093@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_003538_843907_5AF7A9EC 
X-CRM114-Status: GOOD (  20.04  )
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

On 05/06/25 4:19 PM, James Clark wrote:
> FEAT_SPEv1p4 (optional from Armv8.8) adds some new filter bits, so
> remove them from the previous version's RES0 bits using
> PMSEVFR_EL1_RES0_V1P4_EXCL. It also makes some previously available bits
> unavailable again, so add those back using PMSEVFR_EL1_RES0_V1P4_INCL.

Just wondering - why cannot all the new applicable filter bits be added
explicitly for PMSEVFR_EL1_RES0_V1P4 without using exclude and include
intermediaries.

> E.g:
> 
>   E[30], bit [30]
>   When FEAT_SPEv1p4 is _not_ implemented ...
> 
> FEAT_SPE_V1P3 has the same filters as V1P2 so explicitly add it to the
> switch.
A small nit - should FEAT_SPE_V1P3 addition be done in a previous patch
as it is an already existing thing ?

> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  arch/arm64/include/asm/sysreg.h | 7 +++++++
>  drivers/perf/arm_spe_pmu.c      | 5 ++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index f1bb0d10c39a..880090df3efc 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -358,6 +358,13 @@
>  	(PMSEVFR_EL1_RES0_IMP & ~(BIT_ULL(18) | BIT_ULL(17) | BIT_ULL(11)))
>  #define PMSEVFR_EL1_RES0_V1P2	\
>  	(PMSEVFR_EL1_RES0_V1P1 & ~BIT_ULL(6))
> +#define PMSEVFR_EL1_RES0_V1P4_EXCL \
> +	(BIT_ULL(2) | BIT_ULL(4) | GENMASK_ULL(10, 8) | GENMASK_ULL(23, 19))
> +#define PMSEVFR_EL1_RES0_V1P4_INCL \
> +	(GENMASK_ULL(31, 26))> +#define PMSEVFR_EL1_RES0_V1P4	\
> +	(PMSEVFR_EL1_RES0_V1P4_INCL | \
> +	(PMSEVFR_EL1_RES0_V1P2 & ~PMSEVFR_EL1_RES0_V1P4_EXCL))
>  
>  /* Buffer error reporting */
>  #define PMBSR_EL1_FAULT_FSC_SHIFT	PMBSR_EL1_MSS_SHIFT
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index 3efed8839a4e..d9f6d229dce8 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -701,9 +701,12 @@ static u64 arm_spe_pmsevfr_res0(u16 pmsver)
>  	case ID_AA64DFR0_EL1_PMSVer_V1P1:
>  		return PMSEVFR_EL1_RES0_V1P1;
>  	case ID_AA64DFR0_EL1_PMSVer_V1P2:
> +	case ID_AA64DFR0_EL1_PMSVer_V1P3:
> +		return PMSEVFR_EL1_RES0_V1P2;
> +	case ID_AA64DFR0_EL1_PMSVer_V1P4:
>  	/* Return the highest version we support in default */
>  	default:
> -		return PMSEVFR_EL1_RES0_V1P2;
> +		return PMSEVFR_EL1_RES0_V1P4;
>  	}
>  }
>  
> 





