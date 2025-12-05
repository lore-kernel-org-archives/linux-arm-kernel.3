Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E54D2E00C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 06:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Mime-Version:Subject:Message-Id:Cc:Content-Type:Date:From:In-Reply-To:To:
	References:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efJE7XKSO4UauXHMwosjuUrfcnmNeBslKejP+uqxBFs=; b=mNV1cPyXCzX8iL6iQJRglfeT7c
	+TaCSPevIUi34RSGSa4YNFKlc779BQiiCev/FqsKCJQr+vaLLnuActj/LOu0VrkMmlXChF5zoPYAB
	ZqavZ6Fx7vFLGwh69LrA0WAEiGt4adCR3RLa065WoYHgBIqrbElyfuKjfWm7MvxMncbG3rcQkDIsZ
	0NbN/UKwnuIMpzkBUYNCCJHHb7BV1/i2Cf0X9/xrUXkQlT6ecqjYXJV9wReRb/1FlmrjYsb7ROXDR
	SQgAqhnL9/sQs8CPcvQIXKbbxiUrS0ZLWgVSbml/V+XVWOVitc3zIWaFx9fZ3PZkFFKnJPSlDyrxV
	d4D10RFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRPgt-000000097BE-0k8I;
	Fri, 05 Dec 2025 06:53:19 +0000
Received: from sg-1-38.ptr.blmpb.com ([118.26.132.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRPgo-000000097AB-2VJS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 06:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=picoheart-com.20200927.dkim.feishu.cn; t=1764917586;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=efJE7XKSO4UauXHMwosjuUrfcnmNeBslKejP+uqxBFs=;
 b=kP/qGH38UArd20i63V+LckPLFluv9168rV/1kL4PkIRSSJ81+rQvkBtBcVlve+zyap8jgI
 kW6kKAWPPA+WIL5JjDVY3M7+5HK7y6peWELyx6s6MBFBmmsKNFR1AlLQB1/kirZUCD52wS
 L2X69D+BD8wkhMiJTKG43RCnp8kYCubeY/o2DMfV5FdHfGhrqdUH3cPhKCfFcuhpoJ+0+C
 0uTgkQaoFg0nxB/QTj/1lY9OAg5KeGNoZTGhKJiPiifVCoKAK7aq+aPNP/O6zhC+omyfzt
 wIJb1N70cLNeTaqtZgwKxfHIjTKNfmmKPJJ4Iw3+wSbERJNxLAl5uRcTVNeoNg==
X-Lms-Return-Path: <lba+269328150+757db4+lists.infradead.org+yang.yicong@picoheart.com>
References: <20251114033243.76509-1-cuiyunhui@bytedance.com> <20251114033243.76509-2-cuiyunhui@bytedance.com>
To: "Yunhui Cui" <cuiyunhui@bytedance.com>
Content-Language: en-US
In-Reply-To: <20251114033243.76509-2-cuiyunhui@bytedance.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Date: Fri, 5 Dec 2025 14:53:00 +0800
Content-Type: text/plain; charset=UTF-8
Cc: <akpm@linux-foundation.org>, <alex@ghiti.fr>, <anup@brainfault.org>, 
	<aou@eecs.berkeley.edu>, <atish.patra@linux.dev>, 
	<catalin.marinas@arm.com>, <dianders@chromium.org>, 
	<johannes@sipsolutions.net>, <lihuafei1@huawei.com>, 
	<mark.rutland@arm.com>, <masahiroy@kernel.org>, <maz@kernel.org>, 
	<mingo@kernel.org>, <nicolas.schier@linux.dev>, <palmer@dabbelt.com>, 
	<paul.walmsley@sifive.com>, <suzuki.poulose@arm.com>, 
	<thorsten.blum@linux.dev>, <wangjinchao600@gmail.com>, <will@kernel.org>, 
	<yangyicong@hisilicon.com>, <zhanjie9@hisilicon.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<linux-perf-users@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<yang.yicong@picoheart.com>, <geshijian@picoheart.com>
Message-Id: <af5765d2-ba72-481c-8c7a-6fb09fe44709@picoheart.com>
Received: from [100.86.226.133] ([61.141.241.105]) by smtp.feishu.cn with ESMTPS; Fri, 05 Dec 2025 14:53:03 +0800
User-Agent: Mozilla Thunderbird
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Subject: Re: [PATCH v6 1/2] watchdog: move arm64 watchdog_hld into common code
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_225315_604386_49A48641 
X-CRM114-Status: GOOD (  33.47  )
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

On 2025/11/14 11:32, Yunhui Cui wrote:
> Move the contents of arch/arm64/watchdog_hld.c to kernel/watchdog_perf.c
> to create a generic implementation that can be reused by other arch,
> such as RISC-V.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  arch/arm64/Kconfig               |  1 +
>  arch/arm64/kernel/Makefile       |  1 -
>  arch/arm64/kernel/watchdog_hld.c | 94 --------------------------------
>  drivers/perf/arm_pmu.c           | 10 +++-
>  include/linux/perf/arm_pmu.h     |  2 -
>  kernel/watchdog_perf.c           | 83 ++++++++++++++++++++++++++++
>  lib/Kconfig.debug                |  8 +++
>  7 files changed, 101 insertions(+), 98 deletions(-)
>  delete mode 100644 arch/arm64/kernel/watchdog_hld.c
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 6663ffd23f252..6614ff45b1e06 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -231,6 +231,7 @@ config ARM64
>  	select HAVE_GCC_PLUGINS
>  	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && \
>  		HW_PERF_EVENTS && HAVE_PERF_EVENTS_NMI
> +	select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR_PERF
>  	select HAVE_HW_BREAKPOINT if PERF_EVENTS
>  	select HAVE_IOREMAP_PROT
>  	select HAVE_IRQ_TIME_ACCOUNTING
> diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
> index 76f32e424065e..12d77f373fea4 100644
> --- a/arch/arm64/kernel/Makefile
> +++ b/arch/arm64/kernel/Makefile
> @@ -44,7 +44,6 @@ obj-$(CONFIG_KUSER_HELPERS)		+= kuser32.o
>  obj-$(CONFIG_FUNCTION_TRACER)		+= ftrace.o entry-ftrace.o
>  obj-$(CONFIG_MODULES)			+= module.o module-plts.o
>  obj-$(CONFIG_PERF_EVENTS)		+= perf_regs.o perf_callchain.o
> -obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF)	+= watchdog_hld.o
>  obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
>  obj-$(CONFIG_CPU_PM)			+= sleep.o suspend.o
>  obj-$(CONFIG_KGDB)			+= kgdb.o
> diff --git a/arch/arm64/kernel/watchdog_hld.c b/arch/arm64/kernel/watchdog_hld.c
> deleted file mode 100644
> index 3093037dcb7be..0000000000000
> --- a/arch/arm64/kernel/watchdog_hld.c
> +++ /dev/null
> @@ -1,94 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <linux/nmi.h>
> -#include <linux/cpufreq.h>
> -#include <linux/perf/arm_pmu.h>
> -
> -/*
> - * Safe maximum CPU frequency in case a particular platform doesn't implement
> - * cpufreq driver. Although, architecture doesn't put any restrictions on
> - * maximum frequency but 5 GHz seems to be safe maximum given the available
> - * Arm CPUs in the market which are clocked much less than 5 GHz. On the other
> - * hand, we can't make it much higher as it would lead to a large hard-lockup
> - * detection timeout on parts which are running slower (eg. 1GHz on
> - * Developerbox) and doesn't possess a cpufreq driver.
> - */
> -#define SAFE_MAX_CPU_FREQ	5000000000UL // 5 GHz
> -u64 hw_nmi_get_sample_period(int watchdog_thresh)
> -{
> -	unsigned int cpu = smp_processor_id();
> -	unsigned long max_cpu_freq;
> -
> -	max_cpu_freq = cpufreq_get_hw_max_freq(cpu) * 1000UL;
> -	if (!max_cpu_freq)
> -		max_cpu_freq = SAFE_MAX_CPU_FREQ;
> -
> -	return (u64)max_cpu_freq * watchdog_thresh;
> -}
> -
> -bool __init arch_perf_nmi_is_available(void)
> -{
> -	/*
> -	 * hardlockup_detector_perf_init() will success even if Pseudo-NMI turns off,
> -	 * however, the pmu interrupts will act like a normal interrupt instead of
> -	 * NMI and the hardlockup detector would be broken.
> -	 */
> -	return arm_pmu_irq_is_nmi();
> -}
> -
> -static int watchdog_perf_update_period(void *data)
> -{
> -	int cpu = smp_processor_id();
> -	u64 max_cpu_freq, new_period;
> -
> -	max_cpu_freq = cpufreq_get_hw_max_freq(cpu) * 1000UL;
> -	if (!max_cpu_freq)
> -		return 0;
> -
> -	new_period = watchdog_thresh * max_cpu_freq;
> -	hardlockup_detector_perf_adjust_period(new_period);
> -
> -	return 0;
> -}
> -
> -static int watchdog_freq_notifier_callback(struct notifier_block *nb,
> -					   unsigned long val, void *data)
> -{
> -	struct cpufreq_policy *policy = data;
> -	int cpu;
> -
> -	if (val != CPUFREQ_CREATE_POLICY)
> -		return NOTIFY_DONE;
> -
> -	/*
> -	 * Let each online CPU related to the policy update the period by their
> -	 * own. This will serialize with the framework on start/stop the lockup
> -	 * detector (softlockup_{start,stop}_all) and avoid potential race
> -	 * condition. Otherwise we may have below theoretical race condition:
> -	 * (core 0/1 share the same policy)
> -	 * [core 0]                      [core 1]
> -	 *                               hardlockup_detector_event_create()
> -	 *                                 hw_nmi_get_sample_period()
> -	 * (cpufreq registered, notifier callback invoked)
> -	 * watchdog_freq_notifier_callback()
> -	 *   watchdog_perf_update_period()
> -	 *   (since core 1's event's not yet created,
> -	 *    the period is not set)
> -	 *                                 perf_event_create_kernel_counter()
> -	 *                                 (event's period is SAFE_MAX_CPU_FREQ)
> -	 */
> -	for_each_cpu(cpu, policy->cpus)
> -		smp_call_on_cpu(cpu, watchdog_perf_update_period, NULL, false);
> -
> -	return NOTIFY_DONE;
> -}
> -
> -static struct notifier_block watchdog_freq_notifier = {
> -	.notifier_call = watchdog_freq_notifier_callback,
> -};
> -
> -static int __init init_watchdog_freq_notifier(void)
> -{
> -	return cpufreq_register_notifier(&watchdog_freq_notifier,
> -					 CPUFREQ_POLICY_NOTIFIER);
> -}
> -core_initcall(init_watchdog_freq_notifier);
> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index 973a027d90639..294a5c3438ad1 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -17,6 +17,7 @@
>  #include <linux/cpu_pm.h>
>  #include <linux/export.h>
>  #include <linux/kernel.h>
> +#include <linux/nmi.h>
>  #include <linux/perf/arm_pmu.h>
>  #include <linux/slab.h>
>  #include <linux/sched/clock.h>
> @@ -703,10 +704,17 @@ static int armpmu_get_cpu_irq(struct arm_pmu *pmu, int cpu)
>  	return per_cpu(hw_events->irq, cpu);
>  }
>  
> -bool arm_pmu_irq_is_nmi(void)
> +#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
> +bool arch_perf_nmi_is_available(void)
>  {
> +	/*
> +	 * watchdog_hardlockup_probe() will success even if Pseudo-NMI turns off,
> +	 * however, the pmu interrupts will act like a normal interrupt instead of
> +	 * NMI and the hardlockup detector would be broken.
> +	 */

the comment makes me a bit confused. we'll only declare the NMI support if we successfully
registered the PMU interrupt as NMI interrupt. If pseudo-nmi is turned off, we'll
failed to register the NMI interrupt since neither the gicv3 irqchip will declare NMI
suppport [1] nor the irq_chip::irq_nmi_setup() will success [2], then the has_nmi will
be false. In this case the hardlockup detector is not probed at all [3].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-gic-v3.c#n1956
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-gic-v3.c#n602
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/watchdog_perf.c#n268

>  	return has_nmi;
>  }
> +#endif
>  
>  /*
>   * PMU hardware loses all context when a CPU goes offline.
> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
> index 52b37f7bdbf9e..8f06751f1e176 100644
> --- a/include/linux/perf/arm_pmu.h
> +++ b/include/linux/perf/arm_pmu.h
> @@ -183,8 +183,6 @@ void kvm_host_pmu_init(struct arm_pmu *pmu);
>  #define kvm_host_pmu_init(x)	do { } while(0)
>  #endif
>  
> -bool arm_pmu_irq_is_nmi(void);
> -
>  /* Internal functions only for core arm_pmu code */
>  struct arm_pmu *armpmu_alloc(void);
>  void armpmu_free(struct arm_pmu *pmu);
> diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
> index d3ca70e3c256a..8aa5e9a0ba20a 100644
> --- a/kernel/watchdog_perf.c
> +++ b/kernel/watchdog_perf.c
> @@ -15,6 +15,7 @@
>  #include <linux/panic.h>
>  #include <linux/nmi.h>
>  #include <linux/atomic.h>
> +#include <linux/cpufreq.h>
>  #include <linux/module.h>
>  #include <linux/sched/debug.h>
>  
> @@ -306,3 +307,85 @@ void __init hardlockup_config_perf_event(const char *str)
>  	wd_hw_attr.type = PERF_TYPE_RAW;
>  	wd_hw_attr.config = config;
>  }
> +
> +#ifdef CONFIG_WATCHDOG_PERF_ADJUST_PERIOD
> +/*
> + * Safe maximum CPU frequency in case a particular platform doesn't implement
> + * cpufreq driver. Although, architecture doesn't put any restrictions on
> + * maximum frequency but 5 GHz seems to be safe maximum given the available
> + * CPUs in the market which are clocked much less than 5 GHz. On the other
> + * hand, we can't make it much higher as it would lead to a large hard-lockup
> + * detection timeout on parts which are running slower (eg. 1GHz on
> + * Developerbox) and doesn't possess a cpufreq driver.
> + */
> +#define SAFE_MAX_CPU_FREQ	5000000000UL // 5 GHz
> +u64 hw_nmi_get_sample_period(int watchdog_thresh)
> +{
> +	unsigned int cpu = smp_processor_id();
> +	unsigned long max_cpu_freq;
> +
> +	max_cpu_freq = cpufreq_get_hw_max_freq(cpu) * 1000UL;
> +	if (!max_cpu_freq)
> +		max_cpu_freq = SAFE_MAX_CPU_FREQ;
> +
> +	return (u64)max_cpu_freq * watchdog_thresh;
> +}
> +
> +static int watchdog_perf_update_period(void *data)
> +{
> +	int cpu = smp_processor_id();
> +	u64 max_cpu_freq, new_period;
> +
> +	max_cpu_freq = cpufreq_get_hw_max_freq(cpu) * 1000UL;
> +	if (!max_cpu_freq)
> +		return 0;
> +
> +	new_period = watchdog_thresh * max_cpu_freq;
> +	hardlockup_detector_perf_adjust_period(new_period);
> +
> +	return 0;
> +}
> +
> +static int watchdog_freq_notifier_callback(struct notifier_block *nb,
> +					   unsigned long val, void *data)
> +{
> +	struct cpufreq_policy *policy = data;
> +	int cpu;
> +
> +	if (val != CPUFREQ_CREATE_POLICY)
> +		return NOTIFY_DONE;
> +
> +	/*
> +	 * Let each online CPU related to the policy update the period by their
> +	 * own. This will serialize with the framework on start/stop the lockup
> +	 * detector (softlockup_{start,stop}_all) and avoid potential race
> +	 * condition. Otherwise we may have below theoretical race condition:
> +	 * (core 0/1 share the same policy)
> +	 * [core 0]                      [core 1]
> +	 *                               hardlockup_detector_event_create()
> +	 *                                 hw_nmi_get_sample_period()
> +	 * (cpufreq registered, notifier callback invoked)
> +	 * watchdog_freq_notifier_callback()
> +	 *   watchdog_perf_update_period()
> +	 *   (since core 1's event's not yet created,
> +	 *    the period is not set)
> +	 *                                 perf_event_create_kernel_counter()
> +	 *                                 (event's period is SAFE_MAX_CPU_FREQ)
> +	 */
> +	for_each_cpu(cpu, policy->cpus)
> +		smp_call_on_cpu(cpu, watchdog_perf_update_period, NULL, false);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block watchdog_freq_notifier = {
> +	.notifier_call = watchdog_freq_notifier_callback,
> +};
> +
> +static int __init init_watchdog_freq_notifier(void)
> +{
> +	return cpufreq_register_notifier(&watchdog_freq_notifier,
> +					 CPUFREQ_POLICY_NOTIFIER);
> +}
> +core_initcall(init_watchdog_freq_notifier);
> +#endif
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 2cbfa3dead0be..85fdfa9b52346 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1193,6 +1193,14 @@ config HARDLOCKUP_DETECTOR_PERF
>  	depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
>  	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
>  
> +config WATCHDOG_PERF_ADJUST_PERIOD
> +	bool

it's reasonable to make it depends on HARDLOCKUP_DETECTOR_PERF.

otherwise looks good to me :)

Thanks.

> +	help
> +	  Adjust the watchdog hardlockup detector's period based on CPU max
> +	  frequency. Uses cpufreq if available; falls back to a safe 5 GHz
> +	  default otherwise. Registers a cpufreq notifier to update the period
> +	  automatically.
> +
>  config HARDLOCKUP_DETECTOR_BUDDY
>  	bool
>  	depends on HARDLOCKUP_DETECTOR

