Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF39EA3C55
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 11:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFGPXXDO5Qs7zdZxT8hLPVa+m/HFux3xI7M/xg68NOg=; b=RtwwF/hAvxZsTnS0kOGAWVZ9Ko
	B15BIBpOp5mJOVk+7aPGRIe8XJsMyEqEttx7g1TQ6dAra5DPorsjmoh50KTUQGRwwu58njj6EmIMY
	4Z0mfJCYr1aIpUYy0kJoyhccqwUIF+aFS6S+73rrhOdjJEK9W4FgldiGwk1chSc/dWpf7WZWTYKH0
	+BlzZfPBRCPhEmdMc2c02Q/28f4KlCC8EcUkgGrEd5HJqoorn+J0ntCT+PM0FCMyw7VJO02y2NS8l
	LHE/kRwEFQYovbOggA3VxBMZ/oTTe1bPYu3yFuCm6auFJktcgKZXBzC6wthzgPmqvWGnm4g/hZHYf
	lUA5YGGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAo0r-0000000AKE7-2i7k;
	Thu, 09 Apr 2026 11:57:33 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAo0m-0000000AKAy-3dSc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 11:57:32 +0000
Date: Thu, 9 Apr 2026 13:57:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1775735843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BFGPXXDO5Qs7zdZxT8hLPVa+m/HFux3xI7M/xg68NOg=;
	b=m8px0pa4oDHJtsNk67FPcWrtxJeJL/+yzfNUBnSjINro0E7q9OFfyG/ExZxkJlUfT0UCyp
	VIvz7jjaM5Xexsc/01v4C0OlM6g9GaD4xP1pdkLi//MzTRoUVWd3NDV5mvsG9efNPSQKW6
	wugKQU0tfFHBsvSHy6lqhxXJR+ShYAo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] soc: samsung: exynos-pmu: add Exynos850 CPU
 hotplug support
Message-ID: <20260409115630.GA15706@localhost>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-5-c5a760a3e259@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-5-c5a760a3e259@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_045731_212628_FAD499BA 
X-CRM114-Status: GOOD (  25.54  )
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

Hi Alexey,

This patch breaks compilation for arm(32) exynos devices. Compiling
with exynos_defconfig I get:

[ ... ]
  CC      drivers/soc/samsung/exynos850-pmu.o
  CC [M]  fs/squashfs/page_actor.o
../drivers/soc/samsung/exynos850-pmu.c:17:21: error: call to undeclared function 'MPIDR_AFFINITY_LEVEL'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   17 |         u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
      |                            ^
../drivers/soc/samsung/exynos850-pmu.c:17:42: error: call to undeclared function 'read_cpuid_mpidr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   17 |         u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
      |                                                 ^
../drivers/soc/samsung/exynos850-pmu.c:48:21: error: call to undeclared function 'MPIDR_AFFINITY_LEVEL'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   48 |         u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
      |                            ^
../drivers/soc/samsung/exynos850-pmu.c:48:42: error: call to undeclared function 'read_cpuid_mpidr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   48 |         u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
      |                                                 ^
4 errors generated.
make[6]: *** [../scripts/Makefile.build:289: drivers/soc/samsung/exynos850-pmu.o] Error 1
make[5]: *** [../scripts/Makefile.build:548: drivers/soc/samsung] Error 2
make[4]: *** [../scripts/Makefile.build:548: drivers/soc] Error 2
make[3]: *** [../scripts/Makefile.build:548: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
[ ... ]

Best regards,
Henrik Grimler

On Wed, Apr 01, 2026 at 05:51:58AM +0100, Alexey Klimov wrote:
> Add cpuhotplug support for Exynos850 platforms. This SoC requires
> its own specific set of writes/updates to PMU and PMU interrupts
> generation block in order to put a CPU or a group of CPUs into
> a different sleep states or prepare these entities for a CPU_OFF
> or wake-up out of idle state or after CPU online.
> Without these writes/updates the CPU(s) wake-up or online fails.
> While at this, also add description of Exynos850 PMU registers.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/soc/samsung/Makefile                |  2 +-
>  drivers/soc/samsung/exynos-pmu.c            |  1 +
>  drivers/soc/samsung/exynos-pmu.h            |  1 +
>  drivers/soc/samsung/exynos850-pmu.c         | 78 +++++++++++++++++++++++++++++
>  include/linux/soc/samsung/exynos-regs-pmu.h |  5 ++
>  5 files changed, 86 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile
> index 636a762608c9..7f544e3c1fcc 100644
> --- a/drivers/soc/samsung/Makefile
> +++ b/drivers/soc/samsung/Makefile
> @@ -7,7 +7,7 @@ exynos_chipid-y			+= exynos-chipid.o exynos-asv.o
>  obj-$(CONFIG_EXYNOS_USI)	+= exynos-usi.o
>  
>  obj-$(CONFIG_EXYNOS_PMU)	+= exynos_pmu.o
> -exynos_pmu-y			+= exynos-pmu.o gs101-pmu.o
> +exynos_pmu-y			+= exynos-pmu.o gs101-pmu.o exynos850-pmu.o
>  
>  obj-$(CONFIG_EXYNOS_PMU_ARM_DRIVERS)	+= exynos3250-pmu.o exynos4-pmu.o \
>  					exynos5250-pmu.o exynos5420-pmu.o
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index 4e5fcc01e5e0..daa870ba88f5 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -133,6 +133,7 @@ static const struct of_device_id exynos_pmu_of_device_ids[] = {
>  		.compatible = "samsung,exynos7-pmu",
>  	}, {
>  		.compatible = "samsung,exynos850-pmu",
> +		.data = &exynos850_pmu_data,
>  	},
>  	{ /*sentinel*/ },
>  };
> diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
> index 186299a049a8..4202d3cd94c9 100644
> --- a/drivers/soc/samsung/exynos-pmu.h
> +++ b/drivers/soc/samsung/exynos-pmu.h
> @@ -102,6 +102,7 @@ extern const struct exynos_pmu_data exynos5250_pmu_data;
>  extern const struct exynos_pmu_data exynos5420_pmu_data;
>  #endif
>  extern const struct exynos_pmu_data gs101_pmu_data;
> +extern const struct exynos_pmu_data exynos850_pmu_data;
>  
>  extern void pmu_raw_writel(u32 val, u32 offset);
>  extern u32 pmu_raw_readl(u32 offset);
> diff --git a/drivers/soc/samsung/exynos850-pmu.c b/drivers/soc/samsung/exynos850-pmu.c
> new file mode 100644
> index 000000000000..b3841547577a
> --- /dev/null
> +++ b/drivers/soc/samsung/exynos850-pmu.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2026 Linaro Ltd.
> + *
> + * Exynos850 PMU support
> + */
> +
> +#include <linux/soc/samsung/exynos-pmu.h>
> +#include <linux/soc/samsung/exynos-regs-pmu.h>
> +#include <linux/regmap.h>
> +
> +#include "exynos-pmu.h"
> +
> +static int exynos850_cpu_pmu_offline(struct exynos_pmu_context *pmu_context, unsigned int cpu)
> +	__must_hold(&pmu_context->cpupm_lock)
> +{
> +	u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
> +	u32 cluster_cpu = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 1);
> +	unsigned int cpuhint = smp_processor_id();
> +	u32 reg, mask;
> +
> +	/* set cpu inform hint */
> +	regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpuhint),
> +		     CPU_INFORM_C2);
> +
> +	mask = BIT(cpu);
> +	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
> +			   mask, BIT(cpu));
> +
> +	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
> +	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR,
> +		     reg & mask);
> +
> +	mask = (BIT(cpu + 8));
> +	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
> +	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR,
> +		     reg & mask);
> +
> +	regmap_update_bits(pmu_context->pmureg,
> +			   EXYNOS850_CLUSTER_CPU_INT_EN(this_cluster, cluster_cpu),
> +			   1 << 3, 1 << 3);
> +	return 0;
> +}
> +
> +static int exynos850_cpu_pmu_online(struct exynos_pmu_context *pmu_context, unsigned int cpu)
> +	__must_hold(&pmu_context->cpupm_lock)
> +{
> +	u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
> +	u32 cluster_cpu = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 1);
> +	unsigned int cpuhint = smp_processor_id();
> +	u32 reg, mask;
> +
> +	/* clear cpu inform hint */
> +	regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpuhint),
> +		     CPU_INFORM_CLEAR);
> +
> +	mask = BIT(cpu);
> +
> +	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
> +			   mask, (0 << cpu));
> +
> +	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_UPEND, &reg);
> +
> +	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_CLEAR,
> +		     reg & mask);
> +
> +	regmap_update_bits(pmu_context->pmureg,
> +			   EXYNOS850_CLUSTER_CPU_INT_EN(this_cluster, cluster_cpu),
> +			   1 << 3, 0 << 3);
> +	return 0;
> +}
> +
> +const struct exynos_pmu_data exynos850_pmu_data = {
> +	.pmu_cpuhp = true,
> +	.cpu_pmu_offline = exynos850_cpu_pmu_offline,
> +	.cpu_pmu_online = exynos850_cpu_pmu_online,
> +};
> +
> diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
> index 9c4d3da41dbf..93c4d724c8ea 100644
> --- a/include/linux/soc/samsung/exynos-regs-pmu.h
> +++ b/include/linux/soc/samsung/exynos-regs-pmu.h
> @@ -1015,6 +1015,11 @@
>  #define EXYNOS_GRP2_INTR_BID_UPEND				(0x0208)
>  #define EXYNOS_GRP2_INTR_BID_CLEAR				(0x020c)
>  
> +/* Exynos850 PMU Alive */
> +#define EXYNOS850_CPU_INFORM(cpu)		(0x0860 + ((cpu) & 7) * 4)
> +#define EXYNOS850_CLUSTER_CPU_OFFSET(cl, cpu)	(0x1000 + ((cl * 0x400) + ((cpu) * 0x80)))
> +#define EXYNOS850_CLUSTER_CPU_INT_EN(cl, cpu)	(EXYNOS850_CLUSTER_CPU_OFFSET(cl, cpu) + 0x44)
> +
>  /* exynosautov920 */
>  #define EXYNOSAUTOV920_PHY_CTRL_USB20				(0x0710)
>  #define EXYNOSAUTOV920_PHY_CTRL_USB31				(0x0714)
> 
> -- 
> 2.51.0
> 
> 

