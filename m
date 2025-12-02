Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250E4CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 08:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6B5OqMy67kr8q+11wZNONtDWMMpaPIwFbThvyADwmk=; b=rurm89RP0e0VXflxttOXrp04oB
	lQpOubfXvID2E7KCEbne6Uo6vakA4NyJYjUo2155IMazZjRJ+E+WhCq/LcoWZeLqQ7/JymirYBZAu
	CxC+CDjK4upTCYtb/X1KgBMR27neA/UrgbKlxt6LBy3X9DJ4CDlrIqLNKpH69nhBXp880pVJqE9UN
	g5Klzacbiqu9ciVtljh/MC9ZIeyE7EDVytWYQ7V1lYeeiJ/72DeIs6UlmD2fSaIVRBixh762MnXAZ
	2xj/0/Mqi5Qs7DmG3j2yvZ21g3L0TDhhrjd0VmrRbLvLnX5s5Aa1Q5AJS2P3U6rSToCAkjyNyo17c
	Rc2U7eLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLra-000000053hu-1nsW;
	Tue, 02 Dec 2025 08:35:58 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLrY-000000053hH-1P7B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 08:35:57 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-bde2d88e5e3so7793324a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 00:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764664554; x=1765269354; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W6B5OqMy67kr8q+11wZNONtDWMMpaPIwFbThvyADwmk=;
        b=gwq0zjXLu5rkcetwdgvs0xaxCNReqFfAGl/1ldYXmihtxzuq+5RuJnYHE5H4Mkrx+5
         ZIgnNfcI6316US5+eUytr+oHOHDPI+HaRF1OEeOInsyE42asL4xa7jfb8GLuborDcTDn
         tC6V62cjmVUdZ3briYG+KQ62ckTnZr4flkDNfcj8a2IsutsERAOPeb8Gp8I/dDEg64hK
         bdYSQ4QQtsuvuNwZsHN4Al+lHaMK5X0wTIIPZyt3LgU9/3ORmhWFtt8BToATepvvjVwp
         ctyx4oCsB6wHqM1xV1CMwIeqmdNarpshdZ651QfQH6j54O7iuS/gcc5TA4OTXYW0CR88
         T5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764664554; x=1765269354;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W6B5OqMy67kr8q+11wZNONtDWMMpaPIwFbThvyADwmk=;
        b=b9H30mziydQhkCC/D5j9hJF587J6T8w48q5JeePc6621/arOekUP3mDk0m0oReOZ3R
         APbpg0lwCy+HlD6KEIM0KbgfSBsvpyq28FBOiuKwBO9RAUrMbN2wRJvKXoumqtFtFtyF
         IF9N3nbzATvsoU2NeDV0CmslYoTGXLkeHiyFVWv3XWvGIFbSbaAreCPvxgm/y+7tHyi+
         cao6WplsTJPXfAOtt004LjwS4L07Qrpu3DAFByfFxoCQgo7zrum7EN6V3M/S2Sairo40
         OT5nRo+/2gIPZnbUQVW7oS2yY2bfZ459KMgNDYMWgccXgJm+6FZA/CGeaeEIck1PyvsO
         iZFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB/3TrkfJk2ZkojEEyw/PYEWgGN7V/G28lm3PbkyGVbyycfDc3LpH6bkWOXS3kBQQt/WCJvb+vcIDHigx7PZPq@lists.infradead.org
X-Gm-Message-State: AOJu0YwUjaPpvf5BG0wmuc658re2qmtL/kIBq2beErhucLHi7zxqsn93
	3Cm+siZjSo5bLKcjZ9VGxTpYn6X4oJX7rnaSjdyQ6+0NeZwpgfNywnKYrhGe3/WBLv7h2y4V43o
	oxRaC7J9J/Pikm4pvhZGrpw==
X-Google-Smtp-Source: AGHT+IGb5peSwTweL+kT4iMjAsZiwlPMM3x6CCn7fxcWmgYrU7ZMSeiv42KQvwk9tb1HT/dlWaP97KF+vN1SUw9m
X-Received: from dybph18.prod.google.com ([2002:a05:7301:4192:b0:2a4:7453:cd4e])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:6b18:b0:2a4:55ae:fbd8 with SMTP id 5a478bee46e88-2a7192f5ae0mr15983784eec.37.1764664554525;
 Tue, 02 Dec 2025 00:35:54 -0800 (PST)
Date: Tue,  2 Dec 2025 00:35:50 -0800
In-Reply-To: <20250212182558.2865232-3-maz@kernel.org>
Mime-Version: 1.0
References: <20250212182558.2865232-3-maz@kernel.org>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202083550.88668-1-changyuanl@google.com>
Subject: Re: [PATCH v2 2/2] KVM: arm64: vgic: Hoist SGI/PPI alloc from
 vgic_init() to kvm_create_vgic()
From: Changyuan Lyu <changyuanl@google.com>
To: maz@kernel.org
Cc: glider@google.com, joey.gouly@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_003556_381835_FE3F1941 
X-CRM114-Status: GOOD (  28.45  )
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

Hi Marc,

On Wed, Feb 12, 2025 at 18:25:58 +0000, Marc Zyngier <maz@kernel.org> wrote:
> If userspace creates vcpus, then a vgic, we end-up in a situation
> where irqchip_in_kernel() will return true, but no private interrupt
> has been allocated for these vcpus. This situation will continue
> until userspace initialises the vgic, at which point we fix the
> early vcpus. Should a vcpu run or be initialised in the interval,
> bad things may happen.
>
> An obvious solution is to move this fix-up phase to the point where
> the vgic is created. This ensures that from that point onwards,
> all vcpus have their private interrupts, as new vcpus will directly
> allocate them.

I have a concern that this patch might cause an issue if userspace creates
VCPUs *after* a VGIC is created but *before* it has been initialized via
`KVM_DEV_ARM_VGIC_CTRL_INIT`.

For example, consider the following call sequence:

1.  Create VGIC via `KVM_CREATE_DEVICE`.
2.  Create all VCPUs.
3.  Issue `KVM_ARM_VCPU_INIT` to all VCPUs.
4.  Issue `KVM_DEV_ARM_VGIC_CTRL_INIT` to the VGIC.

> With that, we have the invariant that when irqchip_in_kernel() is
> true, all vcpus have their private interrupts.
>
> Reported-by: Alexander Potapenko <glider@google.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/vgic/vgic-init.c | 74 ++++++++++++++++-----------------
>  1 file changed, 37 insertions(+), 37 deletions(-)
>
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> index bc7e22ab5d812..775461cf2d2db 100644
> --- a/arch/arm64/kvm/vgic/vgic-init.c
> +++ b/arch/arm64/kvm/vgic/vgic-init.c
> [...]
>
> -static int vgic_allocate_private_irqs_locked(struct kvm_vcpu *vcpu)
> +static int vgic_allocate_private_irqs_locked(struct kvm_vcpu *vcpu, u32 type)
>  {
>  	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
>  	int i;
> @@ -218,17 +236,28 @@ static int vgic_allocate_private_irqs_locked(struct kvm_vcpu *vcpu)
>  			/* PPIs */
>  			irq->config = VGIC_CONFIG_LEVEL;
>  		}
> +
> +		switch (type) {
> +		case KVM_DEV_TYPE_ARM_VGIC_V3:
> +			irq->group = 1;
> +			irq->mpidr = kvm_vcpu_get_mpidr_aff(vcpu);
> +			break;

`vgic_allocate_private_irqs_locked()` appears to be called in two scenarios:

a) When the VGIC is created, in `kvm_vgic_create()`.
b) When a VCPU is created, in `kvm_vm_ioctl_create_vcpu()`.

For scenario (b), the call path is:

`kvm_vm_ioctl_create_vcpu()`
-> `kvm_arch_vcpu_create()`
  -> `kvm_vgic_vcpu_init()`
    -> `vgic_allocate_private_irqs()`
      -> `vgic_allocate_private_irqs_locked()`

However, since the VCPU has just been created, its `MPIDR_EL1` register
value has not been assigned at this point. The VCPU's `MPIDR_EL1`
register is populated later when `KVM_ARM_VCPU_INIT` is issued, via
the following call path:

`kvm_arch_vcpu_ioctl_vcpu_init()`
-> `kvm_vcpu_set_target()`
  -> `__kvm_vcpu_set_target()`
    -> `kvm_reset_vcpu()`
      -> `kvm_reset_sys_regs()`
        -> `reset_mpidr()`

Therefore, with the call sequence I mentioned at the beginning,
`irq->mpidr` would be assigned an uninitialized value. This suggests that
for `irq->mpidr = kvm_vcpu_get_mpidr_aff(vcpu)` to work correctly, we
must rely on the code path from scenario (a). This would imply that
with this patch, all VCPUs must be created and initialized before the
VGIC is created.

> +		case KVM_DEV_TYPE_ARM_VGIC_V2:
> +			irq->group = 0;
> +			irq->targets = BIT(vcpu->vcpu_id);
> +			break;
> +		}
>  	}
>
>  	return 0;
>  }
>
> -static int vgic_allocate_private_irqs(struct kvm_vcpu *vcpu)
> +static int vgic_allocate_private_irqs(struct kvm_vcpu *vcpu, u32 type)
>  {
>  	int ret;
>
>  	mutex_lock(&vcpu->kvm->arch.config_lock);
> -	ret = vgic_allocate_private_irqs_locked(vcpu);
> +	ret = vgic_allocate_private_irqs_locked(vcpu, type);
>  	mutex_unlock(&vcpu->kvm->arch.config_lock);
>
>  	return ret;
> @@ -258,7 +287,7 @@ int kvm_vgic_vcpu_init(struct kvm_vcpu *vcpu)
>  	if (!irqchip_in_kernel(vcpu->kvm))
>  		return 0;
>
> -	ret = vgic_allocate_private_irqs(vcpu);
> +	ret = vgic_allocate_private_irqs(vcpu, dist->vgic_model);
>  	if (ret)
>  		return ret;
>
> [...]

Please let me know if my understanding is incorrect. Thank you!

Best,
Changyuan

