Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371A3CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 15:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CoQwEZYn2xB534gafivMu3yIICCA9cGEHVOt84fCk+U=; b=lQOThSjBhId15RYLtELusQM02r
	HABPICEASOJkoUFmZoczYSlcT1vaWssZRjGC23AFs5C4WkErhRkEqtNIofUCWvaFLqx4KtwWreD9D
	H7xMWRF3hpdlPZmp+pG7ADyweNcGpS5sjYb5UAewObIab+uxY7wJII5gbY5Y8XN6KovshupbjupRu
	2qJy++OmuyJRyYk+0XG7QTJKhWmlXgcdTbtX7BUipjV558N26YOk6FccXyWizBJzldrql+gac0L9U
	UzY3SZCuZRqfquF8FKY+i9uv2rjVFvRQRAPdor7gdQrS46mogwyMrbbjjzMvXiM/wKcZKDGVFuZ3y
	7traEjEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBaPA-00000003KUk-03nk;
	Wed, 22 Oct 2025 15:05:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBaP4-00000003KSg-08gh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 15:05:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 789BD1063;
	Wed, 22 Oct 2025 08:05:19 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04A603F63F;
	Wed, 22 Oct 2025 08:05:24 -0700 (PDT)
Message-ID: <c7bd3c00-ea1a-40ad-9d6e-2314217db906@arm.com>
Date: Wed, 22 Oct 2025 16:05:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/23] perf: arm_pmuv3: Introduce method to partition
 the PMU
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20250714225917.1396543-1-coltonlewis@google.com>
 <20250714225917.1396543-5-coltonlewis@google.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250714225917.1396543-5-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_080530_157998_662862E2 
X-CRM114-Status: GOOD (  37.49  )
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

On 14/07/2025 23:58, Colton Lewis wrote:
> For PMUv3, the register field MDCR_EL2.HPMN partitiones the PMU
> counters into two ranges where counters 0..HPMN-1 are accessible by
> EL1 and, if allowed, EL0 while counters HPMN..N are only accessible by
> EL2.
> 
> Create module parameter reserved_host_counters to reserve a number of
> counters for the host. This number is set at boot because the perf
> subsystem assumes the number of counters will not change after the PMU
> is probed.
> 
> Introduce the function armv8pmu_partition() to modify the PMU driver's
> cntr_mask of available counters to exclude the counters being reserved
> for the guest and record reserved_guest_counters as the maximum
> allowable value for HPMN.
> 
> Due to the difficulty this feature would create for the driver running
> in nVHE mode, partitioning is only allowed in VHE mode. In order to
> support a partitioned on nVHE we'd need to explicitly disable guest
> counters on every exit and reset HPMN to place all counters in the
> first range.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>   arch/arm/include/asm/arm_pmuv3.h   | 14 ++++++
>   arch/arm64/include/asm/arm_pmuv3.h |  5 ++
>   arch/arm64/include/asm/kvm_pmu.h   |  6 +++
>   arch/arm64/kvm/Makefile            |  2 +-
>   arch/arm64/kvm/pmu-direct.c        | 22 +++++++++
>   drivers/perf/arm_pmuv3.c           | 74 +++++++++++++++++++++++++++++-
>   include/linux/perf/arm_pmu.h       |  1 +
>   7 files changed, 121 insertions(+), 3 deletions(-)
>   create mode 100644 arch/arm64/kvm/pmu-direct.c
> 
> diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
> index 2ec0e5e83fc9..49b1f2d7842d 100644
> --- a/arch/arm/include/asm/arm_pmuv3.h
> +++ b/arch/arm/include/asm/arm_pmuv3.h
> @@ -221,6 +221,10 @@ static inline bool kvm_pmu_counter_deferred(struct perf_event_attr *attr)
>   	return false;
>   }
>   
> +static inline bool kvm_pmu_partition_supported(void)
> +{
> +	return false;
> +}
>   static inline bool kvm_set_pmuserenr(u64 val)
>   {
>   	return false;
> @@ -228,6 +232,11 @@ static inline bool kvm_set_pmuserenr(u64 val)
>   
>   static inline void kvm_vcpu_pmu_resync_el0(void) {}
>   
> +static inline bool has_vhe(void)
> +{
> +	return false;
> +}
> +
>   /* PMU Version in DFR Register */
>   #define ARMV8_PMU_DFR_VER_NI        0
>   #define ARMV8_PMU_DFR_VER_V3P1      0x4
> @@ -242,6 +251,11 @@ static inline bool pmuv3_implemented(int pmuver)
>   		 pmuver == ARMV8_PMU_DFR_VER_NI);
>   }
>   
> +static inline bool is_pmuv3p1(int pmuver)
> +{
> +	return pmuver >= ARMV8_PMU_DFR_VER_V3P1;
> +}
> +
>   static inline bool is_pmuv3p4(int pmuver)
>   {
>   	return pmuver >= ARMV8_PMU_DFR_VER_V3P4;
> diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
> index cf2b2212e00a..27c4d6d47da3 100644
> --- a/arch/arm64/include/asm/arm_pmuv3.h
> +++ b/arch/arm64/include/asm/arm_pmuv3.h
> @@ -171,6 +171,11 @@ static inline bool pmuv3_implemented(int pmuver)
>   		 pmuver == ID_AA64DFR0_EL1_PMUVer_NI);
>   }
>   
> +static inline bool is_pmuv3p1(int pmuver)
> +{
> +	return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P1;
> +}
> +
>   static inline bool is_pmuv3p4(int pmuver)
>   {
>   	return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P4;
> diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
> index 6c961e877804..8a2ed02e157d 100644
> --- a/arch/arm64/include/asm/kvm_pmu.h
> +++ b/arch/arm64/include/asm/kvm_pmu.h
> @@ -46,6 +46,7 @@ struct arm_pmu_entry {
>   };
>   
>   bool kvm_supports_guest_pmuv3(void);
> +bool kvm_pmu_partition_supported(void);
>   #define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num >= VGIC_NR_SGIS)
>   u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu, u64 select_idx);
>   void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx, u64 val);
> @@ -115,6 +116,11 @@ static inline bool kvm_supports_guest_pmuv3(void)
>   	return false;
>   }
>   
> +static inline bool kvm_pmu_partition_supported(void)
> +{
> +	return false;
> +}
> +
>   #define kvm_arm_pmu_irq_initialized(v)	(false)
>   static inline u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu,
>   					    u64 select_idx)
> diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
> index 86035b311269..7ce842217575 100644
> --- a/arch/arm64/kvm/Makefile
> +++ b/arch/arm64/kvm/Makefile
> @@ -23,7 +23,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
>   	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
>   	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o
>   
> -kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
> +kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu-direct.o pmu.o
>   kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
>   kvm-$(CONFIG_PTDUMP_STAGE2_DEBUGFS) += ptdump.o
>   
> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
> new file mode 100644
> index 000000000000..9423d6f65059
> --- /dev/null
> +++ b/arch/arm64/kvm/pmu-direct.c
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 Google LLC
> + * Author: Colton Lewis <coltonlewis@google.com>
> + */
> +
> +#include <linux/kvm_host.h>
> +
> +#include <asm/kvm_pmu.h>
> +
> +/**
> + * kvm_pmu_partition_supported() - Determine if partitioning is possible
> + *
> + * Partitioning is only supported in VHE mode (with PMUv3, assumed
> + * since we are in the PMUv3 driver)
> + *
> + * Return: True if partitioning is possible, false otherwise
> + */
> +bool kvm_pmu_partition_supported(void)
> +{
> +	return has_vhe();
> +}
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index c2e3672e1228..294ccbdc3816 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -40,6 +40,12 @@
>   #define ARMV8_THUNDER_PERFCTR_L1I_CACHE_PREF_ACCESS		0xEC
>   #define ARMV8_THUNDER_PERFCTR_L1I_CACHE_PREF_MISS		0xED
>   
> +static int reserved_host_counters __read_mostly = -1;
> +
> +module_param(reserved_host_counters, int, 0);
> +MODULE_PARM_DESC(reserved_host_counters,
> +		 "PMU Partition: -1 = No partition; +N = Reserve N counters for the host");
> +
>   /*
>    * ARMv8 Architectural defined events, not all of these may
>    * be supported on any given implementation. Unsupported events will
> @@ -505,6 +511,11 @@ static void armv8pmu_pmcr_write(u64 val)
>   	write_pmcr(val);
>   }
>   
> +static u64 armv8pmu_pmcr_n_read(void)
> +{
> +	return FIELD_GET(ARMV8_PMU_PMCR_N, armv8pmu_pmcr_read());
> +}
> +
>   static int armv8pmu_has_overflowed(u64 pmovsr)
>   {
>   	return !!(pmovsr & ARMV8_PMU_OVERFLOWED_MASK);
> @@ -1200,6 +1211,58 @@ struct armv8pmu_probe_info {
>   	bool present;
>   };
>   
> +/**
> + * armv8pmu_reservation_is_valid() - Determine if reservation is allowed
> + * @host_counters: Number of host counters to reserve
> + *
> + * Determine if the number of host counters in the argument is an
> + * allowed reservation, 0 to NR_COUNTERS inclusive.
> + *
> + * Return: True if reservation allowed, false otherwise
> + */
> +static bool armv8pmu_reservation_is_valid(int host_counters)
> +{
> +	return host_counters >= 0 &&
> +		host_counters <= armv8pmu_pmcr_n_read();
> +}
> +
> +/**
> + * armv8pmu_partition() - Partition the PMU
> + * @pmu: Pointer to pmu being partitioned
> + * @host_counters: Number of host counters to reserve
> + *
> + * Partition the given PMU by taking a number of host counters to
> + * reserve and, if it is a valid reservation, recording the
> + * corresponding HPMN value in the hpmn_max field of the PMU and
> + * clearing the guest-reserved counters from the counter mask.
> + *
> + * Return: 0 on success, -ERROR otherwise
> + */
> +static int armv8pmu_partition(struct arm_pmu *pmu, int host_counters)
> +{
> +	u8 nr_counters;
> +	u8 hpmn;
> +
> +	if (!armv8pmu_reservation_is_valid(host_counters))
> +		return -EINVAL;
> +
> +	nr_counters = armv8pmu_pmcr_n_read();
> +	hpmn = nr_counters - host_counters;
> +
> +	pmu->hpmn_max = hpmn;
> +
> +	bitmap_clear(pmu->cntr_mask, 0, hpmn);
> +	bitmap_set(pmu->cntr_mask, hpmn, host_counters);
> +	clear_bit(ARMV8_PMU_CYCLE_IDX, pmu->cntr_mask);
> +
> +	if (pmuv3_has_icntr())
> +		clear_bit(ARMV8_PMU_INSTR_IDX, pmu->cntr_mask);
> +
> +	pr_info("Partitioned PMU with HPMN %u", hpmn);
> +
> +	return 0;
> +}
> +
>   static void __armv8pmu_probe_pmu(void *info)
>   {
>   	struct armv8pmu_probe_info *probe = info;
> @@ -1214,10 +1277,10 @@ static void __armv8pmu_probe_pmu(void *info)
>   
>   	cpu_pmu->pmuver = pmuver;
>   	probe->present = true;
> +	cpu_pmu->hpmn_max = -1;
>   
>   	/* Read the nb of CNTx counters supported from PMNC */
> -	bitmap_set(cpu_pmu->cntr_mask,
> -		   0, FIELD_GET(ARMV8_PMU_PMCR_N, armv8pmu_pmcr_read()));
> +	bitmap_set(cpu_pmu->cntr_mask, 0, armv8pmu_pmcr_n_read());
>   
>   	/* Add the CPU cycles counter */
>   	set_bit(ARMV8_PMU_CYCLE_IDX, cpu_pmu->cntr_mask);
> @@ -1226,6 +1289,13 @@ static void __armv8pmu_probe_pmu(void *info)
>   	if (pmuv3_has_icntr())
>   		set_bit(ARMV8_PMU_INSTR_IDX, cpu_pmu->cntr_mask);
>   
> +	if (reserved_host_counters >= 0) {
> +		if (kvm_pmu_partition_supported())
> +			WARN_ON(armv8pmu_partition(cpu_pmu, reserved_host_counters));

Does this really warrant a WARN_ON ? Given we

1. This can be easily triggered by a user (e.g. with modprobe)
2. We gracefully handle it and init to a safe setting.

A pr_warn is sufficient ?

Otherwise looks good to me.

Suzuki


