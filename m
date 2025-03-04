Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8698C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87JNKDEwMbuthqLhw/P0e8/mvUHlBARXqPkKG3nDcNA=; b=vrt5nv3/GJF+/VfQKe30A5GDoW
	EzRiCBKeB0M5hkHbkulXcoBismhk518CGd4IKGGC9o4EaG5Yu3US1A56w1fJttotJjOhdiJrEAkYF
	q9eu6bfYrqoXdYUYdSQOaRjWp1Jy+Q8RaA+kCDZ2U9seE6fiizNE84+cu6JbVpjQbHtKna7qZCrDS
	CMobhkD+g/aJZq5TGX3NSgMaEMLbUrUQ5sOHScH3pD6WNzm/sHWCme/0dXrNIyNk6DvDQsRn1he7Z
	A1U1/81GXpc07BnBcwcC8aDslVfkh1XeDCJUkEmz8P8j/7fVw7PdO7DJpNrRi6f8ZEct0cyedlQzn
	l8u36Hew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpY1R-000000061uk-0L7t;
	Tue, 04 Mar 2025 19:33:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWY9-00000005k0y-2jzz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:59:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23A042F;
	Tue,  4 Mar 2025 09:59:38 -0800 (PST)
Received: from [10.57.39.179] (unknown [10.57.39.179])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E329B3F5A1;
	Tue,  4 Mar 2025 09:59:20 -0800 (PST)
Message-ID: <d3181dde-1070-4101-a5f7-7e42d0ec2f99@arm.com>
Date: Tue, 4 Mar 2025 17:59:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 15/45] KVM: arm64: Support timers in realm RECs
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-16-steven.price@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250213161426.102987-16-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_095925_781407_DD3BF3BE 
X-CRM114-Status: GOOD (  20.42  )
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

On 13/02/2025 16:13, Steven Price wrote:
> The RMM keeps track of the timer while the realm REC is running, but on
> exit to the normal world KVM is responsible for handling the timers.
> 
> A later patch adds the support for propagating the timer values from the
> exit data structure and calling kvm_realm_timers_update().
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/arch_timer.c  | 45 ++++++++++++++++++++++++++++++++----
>   include/kvm/arm_arch_timer.h |  2 ++
>   2 files changed, 43 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index d3d243366536..06b68bcd244f 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -148,6 +148,13 @@ static void timer_set_cval(struct arch_timer_context *ctxt, u64 cval)
>   
>   static void timer_set_offset(struct arch_timer_context *ctxt, u64 offset)
>   {
> +	struct kvm_vcpu *vcpu = ctxt->vcpu;
> +
> +	if (kvm_is_realm(vcpu->kvm)) {
> +		WARN_ON(offset);
> +		return;
> +	}
> +
>   	if (!ctxt->offset.vm_offset) {
>   		WARN(offset, "timer %ld\n", arch_timer_ctx_index(ctxt));
>   		return;
> @@ -464,6 +471,21 @@ static void kvm_timer_update_irq(struct kvm_vcpu *vcpu, bool new_level,
>   	}
>   }
>   
> +void kvm_realm_timers_update(struct kvm_vcpu *vcpu)
> +{
> +	struct arch_timer_cpu *arch_timer = &vcpu->arch.timer_cpu;
> +	int i;
> +
> +	for (i = 0; i < NR_KVM_EL0_TIMERS; i++) {
> +		struct arch_timer_context *timer = &arch_timer->timers[i];
> +		bool status = timer_get_ctl(timer) & ARCH_TIMER_CTRL_IT_STAT;
> +		bool level = kvm_timer_irq_can_fire(timer) && status;
> +
> +		if (level != timer->irq.level)
> +			kvm_timer_update_irq(vcpu, level, timer);
> +	}
> +}
> +
>   /* Only called for a fully emulated timer */
>   static void timer_emulate(struct arch_timer_context *ctx)
>   {
> @@ -889,6 +911,8 @@ void kvm_timer_vcpu_load(struct kvm_vcpu *vcpu)
>   	if (unlikely(!timer->enabled))
>   		return;
>   
> +	kvm_timer_unblocking(vcpu);
> +
>   	get_timer_map(vcpu, &map);
>   
>   	if (static_branch_likely(&has_gic_active_state)) {
> @@ -902,8 +926,6 @@ void kvm_timer_vcpu_load(struct kvm_vcpu *vcpu)
>   		kvm_timer_vcpu_load_nogic(vcpu);
>   	}
>   
> -	kvm_timer_unblocking(vcpu);
> -
>   	timer_restore_state(map.direct_vtimer);
>   	if (map.direct_ptimer)
>   		timer_restore_state(map.direct_ptimer);
> @@ -1094,7 +1116,9 @@ static void timer_context_init(struct kvm_vcpu *vcpu, int timerid)
>   
>   	ctxt->vcpu = vcpu;
>   
> -	if (timerid == TIMER_VTIMER)
> +	if (kvm_is_realm(vcpu->kvm))
> +		ctxt->offset.vm_offset = NULL;
> +	else if (timerid == TIMER_VTIMER)
>   		ctxt->offset.vm_offset = &kvm->arch.timer_data.voffset;

I think we need to disable the KVM_CAP_COUNTER_OFFSET for Realms and
also deny KVM_ARM_SET_COUNTER_OFFSET vm_ioctl.

Suzuki



