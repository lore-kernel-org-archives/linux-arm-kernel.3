Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85C6D59F50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 21:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=2ttJ6xmtoO+TMjpy3jngL8UwbOyul+Pr/ModRoYytt4=; b=YRXdX9HKjOZ/6l
	w/DEAHvlrPlraABvkvBhSMySogbDDy15RTUz2Xw7bH7A8jKjie5mhL5B6yr6HtNtyTZm4KsWBoes1
	l9qH2bT3z4qP8rdDoe7+ev343E4JSzctVs+1eCClfzJhOWAfLFTuovTtAADATOJcC21fh2Fam2/1L
	hVnOygnsZFa9Ugt6/hhndHh1FJvHfoNDCjWbDKv6XLdL4TWCI+PHFJcxcae/+MQJVn46YaTuSolWd
	pwEpxKQjMGl9QADF1d1ee7+1XGAkwN0DGJTS5uuSPrx4CguohsALAsPVQD1pRA2HFud7oHQ6NlVT9
	jk+r2Z1ekqo+0QslVvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUB8p-00000001847-18iW;
	Fri, 12 Dec 2025 21:57:35 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUB8l-0000000183c-3ntL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 21:57:33 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-6574d3d44f9so2429326eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 13:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765576650; x=1766181450; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ttJ6xmtoO+TMjpy3jngL8UwbOyul+Pr/ModRoYytt4=;
        b=UXCHxzqAi0LeFGlydPXt49cmpAvCtmCzCVq5icJxInoe9hCmOLxZWz1u43T58rABml
         A+yLWbKNxtJ7fhSeh5QdqMNfsWysw9Q0MS2TbVCRy2FEJ+Xk+DfaZNMrsapvLfLFlvZB
         nt0opT3mqsl+WuqVFxaY5JLRChCxgdBfu4OHzD8grzEncLzOsRlBWZXF17AtBBmd53o/
         DTtvQWCwOdWU6Wbpe7Kxag+30xRGs5tfIri3FTE24+cG5sf54RRrUUdMPmk/cvax/02n
         O3gP/YFfhsmKtvbyAFSAnm8aOANLg8+t+PB+/zmgAAIvqr9GKTKgNCexRUGFEi5WBweo
         rZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765576650; x=1766181450;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ttJ6xmtoO+TMjpy3jngL8UwbOyul+Pr/ModRoYytt4=;
        b=AQdR6QbT5ZY9qkIH5X3yLoEehhPbkmNF1aE0K43Jj57pB1dqr1ZjCYZRuVTtZjfjgV
         nGXUCU2SBLVEN1rvYNjs7P2upkru+Ae/teDIvSrmpUUGDJAvsCPN2Suu6GtZhwJIIK42
         5oNcNIxQp/N0D2lWP/iRQuoFumEzpS++BGwehfhF9vw0E/wAQlQpee0c+fIAfxKNY0cl
         WML603boztDUJKoFiVzJkJjHPNrSdGrk1lzItuzdPQCDecymRRuIFaVeqFTHRBndFJb2
         8DDal2AyO7PXmLQGwmu60C2pESuuxgNES73c/Qo1HhhWWMzGeQmS76P8po1eVA7mp+u5
         FCCw==
X-Forwarded-Encrypted: i=1; AJvYcCWujEYj7jYi9wX5JlU8k7ffFvfys0gxsWok9CPHVGfGePSVPXl0z5mv7vdcfTN/UMoz2Ac3SckLDpHdkW1WYG0G@lists.infradead.org
X-Gm-Message-State: AOJu0YyqP7oU4rRekN0/96QK+PHFrEdT09CBpwmsGuHoI4AXB2bsL0VQ
	JmT8k9nBJjpO8CTzAQehmSawzDm1WeQ02MgwjeLILjTI5pHxjhRfv6pC7jA7gPQCbgIU4PLgXLO
	YRxIdf+K+kbb0KEZsDKcQzD872w==
X-Google-Smtp-Source: AGHT+IG3WpSlSfg4uPyoIkKPRJzL2gMsw3+TvqLsZPR6R0Vcjs/oN1S1khI3YeVjrDNr+bCuGt/vCHZ4HeQH6JCXGw==
X-Received: from ilbbs17.prod.google.com ([2002:a05:6e02:2411:b0:434:972f:bf8f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:4d0a:b0:659:9a49:8fdf with SMTP id 006d021491bc7-65b4516d5aemr1505706eaf.12.1765576650099;
 Fri, 12 Dec 2025 13:57:30 -0800 (PST)
Date: Fri, 12 Dec 2025 21:57:29 +0000
In-Reply-To: <aTia74R74upcsMEA@kernel.org> (message from Oliver Upton on Tue,
 9 Dec 2025 13:55:59 -0800)
Mime-Version: 1.0
Message-ID: <gsntjyyr2wja.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 17/24] KVM: arm64: Context swap Partitioned PMU guest registers
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_135731_961259_49007B94 
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

Oliver Upton <oupton@kernel.org> writes:

> On Tue, Dec 09, 2025 at 08:51:14PM +0000, Colton Lewis wrote:
>> +/**
>> + * kvm_pmu_load() - Load untrapped PMU registers
>> + * @vcpu: Pointer to struct kvm_vcpu
>> + *
>> + * Load all untrapped PMU registers from the VCPU into the PCPU. Mask
>> + * to only bits belonging to guest-reserved counters and leave
>> + * host-reserved counters alone in bitmask registers.
>> + */
>> +void kvm_pmu_load(struct kvm_vcpu *vcpu)
>> +{
>> +	struct arm_pmu *pmu;
>> +	u64 mask;
>> +	u8 i;
>> +	u64 val;
>> +

> Assert that preemption is disabled.

Will do.

>> +	/*
>> +	 * If we aren't using FGT then we are trapping everything
>> +	 * anyway, so no need to bother with the swap.
>> +	 */
>> +	if (!kvm_vcpu_pmu_use_fgt(vcpu))
>> +		return;

> Uhh... Then how do events count in this case?

> The absence of FEAT_FGT shouldn't affect the residence of the guest PMU
> context. We just need to handle the extra traps, ideally by reading the
> PMU registers directly as a fast path exit handler.

Agreed. Yeah I fixed this in my internal backports but looks like I
skipped incorperating the fix here.

>> +	pmu = vcpu->kvm->arch.arm_pmu;
>> +
>> +	for (i = 0; i < pmu->hpmn_max; i++) {
>> +		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
>> +		write_pmevcntrn(i, val);
>> +	}
>> +
>> +	val = __vcpu_sys_reg(vcpu, PMCCNTR_EL0);
>> +	write_pmccntr(val);
>> +
>> +	val = __vcpu_sys_reg(vcpu, PMUSERENR_EL0);
>> +	write_pmuserenr(val);

> What about the host's value for PMUSERENR?
>> +	val = __vcpu_sys_reg(vcpu, PMSELR_EL0);
>> +	write_pmselr(val);

> PMSELR_EL0 needs to be switched late, e.g. at  
> sysreg_restore_guest_state_vhe().
> Even though the host doesn't currently use the selector-based accessor,
> I'd prefer we not load things that'd affect the host context until we're
> about to enter the guest.


There's a spot in __activate_traps_common() where the host value for
PMUSERENR is saved and PMSELR is zeroed. I stopped that branch when
partitioning because it was clobbering my loaded values, but I can
modify instead to handle these things as they should be handled.

>> +	/* Save only the stateful writable bits. */
>> +	val = __vcpu_sys_reg(vcpu, PMCR_EL0);
>> +	mask = ARMV8_PMU_PMCR_MASK &
>> +		~(ARMV8_PMU_PMCR_P | ARMV8_PMU_PMCR_C);
>> +	write_pmcr(val & mask);
>> +
>> +	/*
>> +	 * When handling these:
>> +	 * 1. Apply only the bits for guest counters (indicated by mask)
>> +	 * 2. Use the different registers for set and clear
>> +	 */
>> +	mask = kvm_pmu_guest_counter_mask(pmu);
>> +
>> +	val = __vcpu_sys_reg(vcpu, PMCNTENSET_EL0);
>> +	write_pmcntenset(val & mask);
>> +	write_pmcntenclr(~val & mask);
>> +
>> +	val = __vcpu_sys_reg(vcpu, PMINTENSET_EL1);
>> +	write_pmintenset(val & mask);
>> +	write_pmintenclr(~val & mask);

> Is this safe? What happens if we put the PMU into an overflow condition?

It gets handled by the host same as any other PMU interrupt. Though I
remember from our conversation you don't want the latency of an
additional interrupt so I can handle that here.

>> +}
>> +
>> +/**
>> + * kvm_pmu_put() - Put untrapped PMU registers
>> + * @vcpu: Pointer to struct kvm_vcpu
>> + *
>> + * Put all untrapped PMU registers from the VCPU into the PCPU. Mask
>> + * to only bits belonging to guest-reserved counters and leave
>> + * host-reserved counters alone in bitmask registers.
>> + */
>> +void kvm_pmu_put(struct kvm_vcpu *vcpu)
>> +{
>> +	struct arm_pmu *pmu;
>> +	u64 mask;
>> +	u8 i;
>> +	u64 val;
>> +
>> +	/*
>> +	 * If we aren't using FGT then we are trapping everything
>> +	 * anyway, so no need to bother with the swap.
>> +	 */
>> +	if (!kvm_vcpu_pmu_use_fgt(vcpu))
>> +		return;
>> +
>> +	pmu = vcpu->kvm->arch.arm_pmu;
>> +
>> +	for (i = 0; i < pmu->hpmn_max; i++) {
>> +		val = read_pmevcntrn(i);
>> +		__vcpu_assign_sys_reg(vcpu, PMEVCNTR0_EL0 + i, val);
>> +	}
>> +
>> +	val = read_pmccntr();
>> +	__vcpu_assign_sys_reg(vcpu, PMCCNTR_EL0, val);
>> +
>> +	val = read_pmuserenr();
>> +	__vcpu_assign_sys_reg(vcpu, PMUSERENR_EL0, val);
>> +
>> +	val = read_pmselr();
>> +	__vcpu_assign_sys_reg(vcpu, PMSELR_EL0, val);
>> +
>> +	val = read_pmcr();
>> +	__vcpu_assign_sys_reg(vcpu, PMCR_EL0, val);
>> +
>> +	/* Mask these to only save the guest relevant bits. */
>> +	mask = kvm_pmu_guest_counter_mask(pmu);
>> +
>> +	val = read_pmcntenset();
>> +	__vcpu_assign_sys_reg(vcpu, PMCNTENSET_EL0, val & mask);
>> +
>> +	val = read_pmintenset();
>> +	__vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);

> What if the PMU is in an overflow state at this point?

Is this a separate concern from the point above? It gets loaded back
that way and the normal interrupt machinery handles it.

