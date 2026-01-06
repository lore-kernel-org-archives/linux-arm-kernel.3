Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8747CE9D46
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tHjn8dyUl6mKxT8UKfLFqSI/Tio7YUyFOzKt1CkDyY=; b=pcbfXLbHQ8Y8IYLKsZBbu7h5PB
	0LFRml9cZIZeNn8jLKdnmiITByyfAEknNS4vV56L00UW5GyY/U3F4rI4Y7O8elgIJsUtP2x8FHu0z
	pW7URl3/kQDg307H91v0LGIi6/50wL9FgeN+DU6jvzClC+MAQXKLivE2rhuuwt3NEh0gtFFuqOTq0
	zW5tU946AdYnY66XdHgOlmM+3Q3QX33m1iHYNN147NBqq8xkOWYY3UFQPYUp4u1n0T+iwRER6AouO
	HSBBkRtQ0nVc3rNjMo43XXX7YuCXxis3LKnMCiJDlCD6vZ9QwD7XFrlFpzf6oQv1OThv2ZUEYd0ZS
	u7rvPtLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8dZ-0000000DMFZ-1vN9;
	Tue, 06 Jan 2026 15:06:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8dW-0000000DMF3-2OhC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:06:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7304497;
	Tue,  6 Jan 2026 07:06:09 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9B7A3F5A1;
	Tue,  6 Jan 2026 07:06:14 -0800 (PST)
Date: Tue, 6 Jan 2026 15:06:12 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: Re: [PATCH v2 27/36] KVM: arm64: gic-v5: Mandate architected PPI for
 PMU emulation on GICv5
Message-ID: <20260106150612.GB1982@e124191.cambridge.arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
 <20251219155222.1383109-28-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219155222.1383109-28-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_070618_751579_2610E190 
X-CRM114-Status: GOOD (  22.99  )
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

Question,

On Fri, Dec 19, 2025 at 03:52:45PM +0000, Sascha Bischoff wrote:
> Make it mandatory to use the architected PPI when running a GICv5
> guest. Attempts to set anything other than the architected PPI (23)
> are rejected.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  arch/arm64/kvm/pmu-emul.c | 14 ++++++++++++--
>  include/kvm/arm_pmu.h     |  5 ++++-
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index afc838ea2503e..2d3b50dec6c5d 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -962,8 +962,13 @@ static int kvm_arm_pmu_v3_init(struct kvm_vcpu *vcpu)
>  		if (!vgic_initialized(vcpu->kvm))
>  			return -ENODEV;
>  
> -		if (!kvm_arm_pmu_irq_initialized(vcpu))
> -			return -ENXIO;
> +		if (!kvm_arm_pmu_irq_initialized(vcpu)) {
> +			/* Use the architected irq number for GICv5. */
> +			if (vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V5)
> +				vcpu->arch.pmu.irq_num = KVM_ARMV8_PMU_GICV5_IRQ;
> +			else
> +				return -ENXIO;
> +		}

This relaxes the KVM_ARM_VCPU_PMU_V3_INIT uAPI to not need
KVM_ARM_VCPU_PMU_V3_IRQ to be called first for gic-v5, right?

Maybe that's intentional, but it should be mentioned in the commit and maybe
even in the docs (Documentation/virt/kvm/devices/vcpu.rst)?

Thanks,
Joey

>  
>  		ret = kvm_vgic_set_owner(vcpu, vcpu->arch.pmu.irq_num,
>  					 &vcpu->arch.pmu);
> @@ -988,6 +993,11 @@ static bool pmu_irq_is_valid(struct kvm *kvm, int irq)
>  	unsigned long i;
>  	struct kvm_vcpu *vcpu;
>  
> +	/* On GICv5, the PMUIRQ is architecturally mandated to be PPI 23 */
> +	if (kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V5 &&
> +	    irq != KVM_ARMV8_PMU_GICV5_IRQ)
> +		return false;
> +
>  	kvm_for_each_vcpu(i, vcpu, kvm) {
>  		if (!kvm_arm_pmu_irq_initialized(vcpu))
>  			continue;
> diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
> index 96754b51b4116..0a36a3d5c8944 100644
> --- a/include/kvm/arm_pmu.h
> +++ b/include/kvm/arm_pmu.h
> @@ -12,6 +12,9 @@
>  
>  #define KVM_ARMV8_PMU_MAX_COUNTERS	32
>  
> +/* PPI #23 - architecturally specified for GICv5 */
> +#define KVM_ARMV8_PMU_GICV5_IRQ		0x20000017
> +
>  #if IS_ENABLED(CONFIG_HW_PERF_EVENTS) && IS_ENABLED(CONFIG_KVM)
>  struct kvm_pmc {
>  	u8 idx;	/* index into the pmu->pmc array */
> @@ -38,7 +41,7 @@ struct arm_pmu_entry {
>  };
>  
>  bool kvm_supports_guest_pmuv3(void);
> -#define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num >= VGIC_NR_SGIS)
> +#define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num != 0)
>  u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu, u64 select_idx);
>  void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx, u64 val);
>  void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu, u64 select_idx, u64 val);
> -- 
> 2.34.1

