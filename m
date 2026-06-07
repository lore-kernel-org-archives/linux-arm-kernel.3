Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488C3CD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 22:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0itC2qO70gJYijc+S4/89kNYU8jUE/h/YyEMUrP+me4=; b=XikHZEld/zIUhdq15DnMGEUjhK
	ynTaxyfRkAyS7B693CaVAZcgvQWFjymSgt9KG4AINOwto+VG1plEeXjtMPQQCZ6TedIybwZA+/z/g
	muVcUwAMKHP0aIdv89T1CDljOZdKcF8eHOt/xA5oYNMxKgBWgxq76dXiWkwMeaLoxgL5u5TKcqtlk
	4rMmNuZjcvbBDJzOHwRlX+DUYHJzflZ8qiDyZQFQ+lm9eWVQbuZxESnayVocFQj9C7sZTF0uqMxIq
	PNhBtPGEz/XQhweYvsY9kZu++abKxxkSmtGQfPuuakXevEO1OS6CRfXBHk4egltF+d2KzPqp3tJnY
	RRtWbG6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWLvf-00000002Yy5-1PmW;
	Sun, 07 Jun 2026 22:25:15 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWLvc-00000002Yxe-2WhT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 22:25:13 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8423efd76c8so2458130b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 15:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780871111; x=1781475911; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0itC2qO70gJYijc+S4/89kNYU8jUE/h/YyEMUrP+me4=;
        b=qJ/Xw1jhdZGKjgM+8x4VzNBIIRZtLfYQwKrC61b8TGZCsKc6pB4ZdHXCfm2TKyU/Ia
         xZHmdJYGT1qDRsd9CtqbYri6ES88FiHjlpD85/7Fl+8mILAXipTvUwu99V40EdmpFkrq
         zNdlNmswb2VOTZP9KZ3MxKLdvTX+CLKrX9QFOmF6vbW7INoOeGs760AqeZ6YpfK6Pgp+
         9pSAQ3+9XiTwi6JgZYNKpx57o4Oi1xegWAF92qK+Gi7aOUnHUUUhtm0NmIBV3ZxVjuNV
         ItGydDyzEQLlLlAeIhAjr5JkXLdh3kWvqvirRuNcD4Qao+HdlZm0CEXGkR2IbwpMCFWs
         wevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780871111; x=1781475911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0itC2qO70gJYijc+S4/89kNYU8jUE/h/YyEMUrP+me4=;
        b=ayPEBNl2s9JNrHcDlQ2pyY70hPMj59GhM/qy9c3JQlf7waAU3Kv4ha6UoUZ3vHVZLl
         2Rd1U5i26BZFG424NTF/YcQRdKSV64b4TeYnrsOXSzTrPusO6DJNGGxONi1rwLIA/8v7
         GyUa0TVxYYO6UNfd4lHlSmHVKrYYBu8oV/ym2ez9DHnBA+VX8fKnAikUqjTFLQmmLl8N
         zKvabTs6DvdCgP3Puva6fTu8HMjIs/zai4xRWq/+2j5tS7NDXM69BStJ3IqnEBVviUNB
         BULBeONggNDBCtMRvsGX9YIc5QJpGTIRWdf1kTqHQyMDtsMTa3WA0/km5e0F292YjyOP
         tO6g==
X-Forwarded-Encrypted: i=1; AFNElJ89aIx1PpNC+tqVqd4qtz4l5gFZi57EkWXyPJwhF5ymw7IJAOvkEHwFd3GqWmLLNsxfOu4QGYFSyrb4CMa9kaHw@lists.infradead.org
X-Gm-Message-State: AOJu0YyAPr6VhPR5PgsU6BWvxhjwK8xkwaXw0zfdpxQpXc1RBe7SmLM3
	zdmTvw05tmrJheW33RZ7yidZ6WxKJArr6YfJDr8IxKx4cIyob71DQQR5
X-Gm-Gg: Acq92OFhvxKo+ia7rKfuIv+g6Z5euxm2jEhsqECM2PIMwgo8PBDx9EQHzNMqEu5/e8O
	DyUPmnagt7GZs73yCMSQw8GbnC5k1YarrQIBgyPHURzGu5sHHWQE8Lz5Z8d5AVU3KoWIhwdiz83
	5VTAHMYcYBBQ+Oov+T9FUbD12Abx9hoAcDb8MzLPjOBGi5jIyb2WPk7zgQYnX/lroqwb94jTNnk
	s7+qvWorBPdCtHSsYhq4Hq/ddrS7u+7xaEH/xZcIyoof5Hr70jWKmrtKQEjBpaQ7xRMrCqyFDKo
	DbTFZZZrFEbZCTeC2ZKJ0wUZex1kpwZFfB0gIqGf9+8m3jBWWLwq6sSSMR4zSaJ7tpRMKY4P/E0
	D1TY5Tmm9ApLF4AvopPnIIUVjH6W2v/nHFPuPHxV0JvKuAeFbSTyGwyf+f3LZn+ZXMTBmjDSMNC
	5bYxBV41JFBzA8+BVU1iUq0XYJIfV9wRhBCSL79OkfHIEnswGOMbmixg==
X-Received: by 2002:a05:6a00:228d:b0:842:6c02:2fa4 with SMTP id d2e1a72fcca58-842b0d60127mr12645069b3a.14.1780871111352;
        Sun, 07 Jun 2026 15:25:11 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e02f9sm15847420b3a.48.2026.06.07.15.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 15:25:09 -0700 (PDT)
Date: Mon, 8 Jun 2026 07:25:04 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Marc Zyngier <maz@kernel.org>, oupton@kernel.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	Sascha.Bischoff@arm.com, jic23@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	imv4bel@gmail.com
Subject: Re: [PATCH] KVM: arm64: vgic: Use list_del_rcu() when flushing
 pending LPIs
Message-ID: <aiXvwGD1hS6vwLEd@v4bel>
References: <aiHrGM1f8czcUby4@v4bel>
 <aiJi5a3JJ-TbWL-s@kernel.org>
 <87a4t99z9n.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4t99z9n.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_152512_691664_E13A5068 
X-CRM114-Status: GOOD (  38.58  )
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

On Fri, Jun 05, 2026 at 09:17:56AM +0100, Marc Zyngier wrote:
> On Fri, 05 Jun 2026 06:47:17 +0100,
> Oliver Upton <oupton@kernel.org> wrote:
> > 
> > Hi Hyunwoo,
> > 
> > On Fri, Jun 05, 2026 at 06:16:08AM +0900, Hyunwoo Kim wrote:
> > > vgic_v3_fold_lr_state() walks the ap_list from last_lr_irq without holding
> > > the ap_list_lock, relying on vgic_irq being freed via kfree_rcu() and on
> > > interrupts being disabled. vgic_flush_pending_lpis() removes entries with
> > > list_del(), which clobbers a node's next pointer, so when another vCPU
> > > disables LPIs via GICR_CTLR the walk can follow the clobbered next pointer
> > > from a removed node, or from the node that last_lr_irq points to.
> > > 
> > > Remove entries with list_del_rcu() so that the next pointer stays valid
> > > until the walk completes.
> > > 
> > > Fixes: 3cfd59f81e0f ("KVM: arm64: GICv3: Handle LR overflow when EOImode==0")
> > > Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> > 
> > Changing only one of the writer paths to use the rculist helpers does
> > not make the ap_list an rculist. Insertions are not RCU-safe, nor are
> > deleations from vgic_prune_ap_list().
> > 
> > And TBH, the real bug here is the fact that vgic_v3_fold_lr_state() isn't
> > taking the ap_list_lock.
> 
> Yup, that'd be more sensible. I need to convince myself that there is
> no possible path from vgic_v*_fold_lr() to vgic_irq_queue_unlock(),
> because that one does actually acquire that lock.

I did some more digging into this. What are your thoughts on this 
ap_list_lock approach? It doesn't seem like there's a deadlock problem.
Additionally, this also fixes the eventfd lock-nesting.

This is quite a substantial change, though.


Best regards,
Hyunwoo Kim

---

vgic_v3_fold_lr_state() and vgic_v2_fold_lr_state() walk the tail of the
ap_list starting from last_lr_irq to replay EOIcount-based deactivations.
This walk runs without the ap_list_lock, yet the other paths that touch the
ap_list (vgic_flush_state, vgic_flush_pending_lpis, vgic_prune_ap_list,
vgic_queue_irq_unlock) all take that lock.

Another vCPU can therefore change the ap_list during the walk. For example,
clearing ENABLE_LPIS in GICR_CTLR makes vgic_flush_pending_lpis() remove an
LPI with list_del(), and prune and interrupt injection also add and remove
entries. A lock-free walk can follow the next pointer of a node that has
already been removed. last_lr_irq is also recorded at flush time and
consumed at fold time, so it spans the guest run and may be unlinked from
the ap_list or released in the meantime.

Take the ap_list_lock in vgic_fold_state(), as vgic_flush_state() does, to
serialize the walk against the ap_list modifiers.

vgic_put_irq() takes lpi_xa, and the lock order places lpi_xa above the
ap_list_lock, so calling it while the fold holds the ap_list_lock inverts
that order. The fold therefore only drops the reference with
vgic_put_irq_norelease() and reclaims the LPIs with
vgic_release_deleted_lpis() after dropping the lock, the same way
vgic_flush_pending_lpis() and vgic_prune_ap_list() already do.

Pin last_lr_irq with vgic_get_irq_ref() in vgic_flush_lr_state() so it is
not released during the guest run, continue the tail walk only while it is
still on this vCPU's ap_list, and drop the reference at the end of the
fold.

kvm_notify_acked_irq() takes a regular spinlock via eventfd_signal()
through a registered irqfd resampler, and can re-enter the vgic via
kvm_set_irq() to reach vgic_queue_irq_unlock(), which takes the
ap_list_lock. Neither may run under the raw ap_list_lock, so during the
fold, record only the SPI in question and notify after dropping the
ap_list_lock. The vgic_v3_deactivate() and vgic_v2_deactivate() paths,
which do not take the ap_list_lock, notify directly as before.

---

diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index cafa3cb32bda6..fd3db099e1fe9 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -53,7 +53,7 @@ static bool lr_signals_eoi_mi(u32 lr_val)
 	       !(lr_val & GICH_LR_HW);
 }

-static void vgic_v2_fold_lr(struct kvm_vcpu *vcpu, u32 val)
+static bool vgic_v2_fold_lr(struct kvm_vcpu *vcpu, u32 val, unsigned long *eoi_spis)
 {
 	u32 cpuid, intid = val & GICH_LR_VIRTUALID;
 	struct vgic_irq *irq;
@@ -63,9 +63,13 @@ static void vgic_v2_fold_lr(struct kvm_vcpu *vcpu, u32 val)
 	cpuid = FIELD_GET(GICH_LR_PHYSID_CPUID, val) & 7;

 	/* Notify fds when the guest EOI'ed a level-triggered SPI */
-	if (lr_signals_eoi_mi(val) && vgic_valid_spi(vcpu->kvm, intid))
-		kvm_notify_acked_irq(vcpu->kvm, 0,
-				     intid - VGIC_NR_PRIVATE_IRQS);
+	if (lr_signals_eoi_mi(val) && vgic_valid_spi(vcpu->kvm, intid)) {
+		if (eoi_spis)
+			__set_bit(intid - VGIC_NR_PRIVATE_IRQS, eoi_spis);
+		else
+			kvm_notify_acked_irq(vcpu->kvm, 0,
+					     intid - VGIC_NR_PRIVATE_IRQS);
+	}

 	irq = vgic_get_vcpu_irq(vcpu, intid);

@@ -98,7 +102,7 @@ static void vgic_v2_fold_lr(struct kvm_vcpu *vcpu, u32 val)
 		irq->on_lr = false;
 	}

-	vgic_put_irq(vcpu->kvm, irq);
+	return vgic_put_irq_norelease(vcpu->kvm, irq);
 }

 static u32 vgic_v2_compute_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq);
@@ -110,19 +114,25 @@ static u32 vgic_v2_compute_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq);
  *   - transferred as is in case of edge sensitive IRQs
  *   - set to the line-level (resample time) for level sensitive IRQs
  */
-void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu)
+bool vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu, unsigned long *eoi_spis)
 {
 	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
 	struct vgic_v2_cpu_if *cpuif = &vgic_cpu->vgic_v2;
 	u32 eoicount = FIELD_GET(GICH_HCR_EOICOUNT, cpuif->vgic_hcr);
-	struct vgic_irq *irq = *host_data_ptr(last_lr_irq);
+	struct vgic_irq *last = *host_data_ptr(last_lr_irq);
+	struct vgic_irq *irq = last;
+	bool deleted = false;

 	DEBUG_SPINLOCK_BUG_ON(!irqs_disabled());
+	lockdep_assert_held(&vgic_cpu->ap_list_lock);

 	for (int lr = 0; lr < vgic_cpu->vgic_v2.used_lrs; lr++)
-		vgic_v2_fold_lr(vcpu, cpuif->vgic_lr[lr]);
+		deleted |= vgic_v2_fold_lr(vcpu, cpuif->vgic_lr[lr], eoi_spis);

 	/* See the GICv3 equivalent for the EOIcount handling rationale */
+	if (!last || last->vcpu != vcpu)
+		goto done;
+
 	list_for_each_entry_continue(irq, &vgic_cpu->ap_list_head, ap_list) {
 		u32 lr;

@@ -141,11 +151,17 @@ void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu)
 		if (lr & GICH_LR_HW)
 			writel_relaxed(FIELD_GET(GICH_LR_PHYSID_CPUID, lr),
 				       kvm_vgic_global_state.gicc_base + GIC_CPU_DEACTIVATE);
-		vgic_v2_fold_lr(vcpu, lr);
+		deleted |= vgic_v2_fold_lr(vcpu, lr, eoi_spis);
 		eoicount--;
 	}

+done:
+	if (last)
+		deleted |= vgic_put_irq_norelease(vcpu->kvm, last);
+
 	cpuif->used_lrs = 0;
+
+	return deleted;
 }

 void vgic_v2_deactivate(struct kvm_vcpu *vcpu, u32 val)
@@ -205,7 +221,7 @@ void vgic_v2_deactivate(struct kvm_vcpu *vcpu, u32 val)
 		writel_relaxed(FIELD_GET(GICH_LR_PHYSID_CPUID, lr),
 			       kvm_vgic_global_state.gicc_base + GIC_CPU_DEACTIVATE);

-	vgic_v2_fold_lr(vcpu, lr);
+	vgic_v2_fold_lr(vcpu, lr, NULL);

 put:
 	vgic_put_irq(vcpu->kvm, irq);
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 9e841e7afd4a7..f019edf574c3e 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -71,7 +71,7 @@ static bool lr_signals_eoi_mi(u64 lr_val)
 	       !(lr_val & ICH_LR_HW);
 }

-static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
+static bool vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val, unsigned long *eoi_spis)
 {
 	struct vgic_irq *irq;
 	bool is_v2_sgi = false;
@@ -87,7 +87,7 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)

 	irq = vgic_get_vcpu_irq(vcpu, intid);
 	if (!irq)	/* An LPI could have been unmapped. */
-		return;
+		return false;

 	scoped_guard(raw_spinlock, &irq->irq_lock) {
 		/* Always preserve the active bit for !LPIs, note deactivation */
@@ -125,12 +125,15 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)

 	/* Notify fds when the guest EOI'ed a level-triggered SPI, and drop the refcount */
 	if (deactivated && lr_signals_eoi_mi(val) && vgic_valid_spi(vcpu->kvm, intid)) {
-		kvm_notify_acked_irq(vcpu->kvm, 0,
-				     intid - VGIC_NR_PRIVATE_IRQS);
+		if (eoi_spis)
+			__set_bit(intid - VGIC_NR_PRIVATE_IRQS, eoi_spis);
+		else
+			kvm_notify_acked_irq(vcpu->kvm, 0,
+					     intid - VGIC_NR_PRIVATE_IRQS);
 		atomic_dec_if_positive(&vcpu->kvm->arch.vgic.active_spis);
 	}

-	vgic_put_irq(vcpu->kvm, irq);
+	return vgic_put_irq_norelease(vcpu->kvm, irq);
 }

 static u64 vgic_v3_compute_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq);
@@ -143,17 +146,20 @@ static void vgic_v3_deactivate_phys(u32 intid)
 		gic_write_dir(intid);
 }

-void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
+bool vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu, unsigned long *eoi_spis)
 {
 	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
 	struct vgic_v3_cpu_if *cpuif = &vgic_cpu->vgic_v3;
 	u32 eoicount = FIELD_GET(ICH_HCR_EL2_EOIcount, cpuif->vgic_hcr);
-	struct vgic_irq *irq = *host_data_ptr(last_lr_irq);
+	struct vgic_irq *last = *host_data_ptr(last_lr_irq);
+	struct vgic_irq *irq = last;
+	bool deleted = false;

 	DEBUG_SPINLOCK_BUG_ON(!irqs_disabled());
+	lockdep_assert_held(&vgic_cpu->ap_list_lock);

 	for (int lr = 0; lr < cpuif->used_lrs; lr++)
-		vgic_v3_fold_lr(vcpu, cpuif->vgic_lr[lr]);
+		deleted |= vgic_v3_fold_lr(vcpu, cpuif->vgic_lr[lr], eoi_spis);

 	/*
 	 * EOIMode=0: use EOIcount to emulate deactivation. We are
@@ -161,8 +167,12 @@ void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
 	 * just pick one active interrupt after the other in the tail part
 	 * of the ap_list, past the LRs, and replay the deactivation as if
 	 * the CPU was doing it. We also rely on priority drop to have taken
-	 * place, and the list to be sorted by priority.
+	 * place, and the list to be sorted by priority. Skip if a remote
+	 * flush/prune unlinked last_lr_irq during the guest run.
 	 */
+	if (!last || last->vcpu != vcpu)
+		goto done;
+
 	list_for_each_entry_continue(irq, &vgic_cpu->ap_list_head, ap_list) {
 		u64 lr;

@@ -185,11 +195,17 @@ void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
 		if (lr & ICH_LR_HW)
 			vgic_v3_deactivate_phys(FIELD_GET(ICH_LR_PHYS_ID_MASK, lr));

-		vgic_v3_fold_lr(vcpu, lr);
+		deleted |= vgic_v3_fold_lr(vcpu, lr, eoi_spis);
 		eoicount--;
 	}

+done:
+	if (last)
+		deleted |= vgic_put_irq_norelease(vcpu->kvm, last);
+
 	cpuif->used_lrs = 0;
+
+	return deleted;
 }

 void vgic_v3_deactivate(struct kvm_vcpu *vcpu, u64 val)
@@ -278,7 +294,7 @@ void vgic_v3_deactivate(struct kvm_vcpu *vcpu, u64 val)
 	if (lr & ICH_LR_HW)
 		vgic_v3_deactivate_phys(FIELD_GET(ICH_LR_PHYS_ID_MASK, lr));

-	vgic_v3_fold_lr(vcpu, lr);
+	vgic_v3_fold_lr(vcpu, lr, NULL);

 put:
 	vgic_put_irq(vcpu->kvm, irq);
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 1e9fe8764584d..2461a77576a2b 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -145,7 +145,7 @@ static __must_check bool __vgic_put_irq(struct kvm *kvm, struct vgic_irq *irq)
 	return refcount_dec_and_test(&irq->refcount);
 }

-static __must_check bool vgic_put_irq_norelease(struct kvm *kvm, struct vgic_irq *irq)
+__must_check bool vgic_put_irq_norelease(struct kvm *kvm, struct vgic_irq *irq)
 {
 	if (!__vgic_put_irq(kvm, irq))
 		return false;
@@ -855,6 +855,11 @@ static void vgic_prune_ap_list(struct kvm_vcpu *vcpu)

 static void vgic_fold_state(struct kvm_vcpu *vcpu)
 {
+	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
+	DECLARE_BITMAP(eoi_spis, VGIC_MAX_SPI - VGIC_NR_PRIVATE_IRQS + 1);
+	bool deleted = false;
+	int spi;
+
 	if (vgic_is_v5(vcpu->kvm)) {
 		vgic_v5_fold_ppi_state(vcpu);
 		return;
@@ -863,10 +868,21 @@ static void vgic_fold_state(struct kvm_vcpu *vcpu)
 	if (!*host_data_ptr(last_lr_irq))
 		return;

-	if (kvm_vgic_global_state.type == VGIC_V2)
-		vgic_v2_fold_lr_state(vcpu);
-	else
-		vgic_v3_fold_lr_state(vcpu);
+	bitmap_zero(eoi_spis, VGIC_MAX_SPI - VGIC_NR_PRIVATE_IRQS + 1);
+
+	scoped_guard(raw_spinlock, &vgic_cpu->ap_list_lock) {
+		if (kvm_vgic_global_state.type == VGIC_V2)
+			deleted = vgic_v2_fold_lr_state(vcpu, eoi_spis);
+		else
+			deleted = vgic_v3_fold_lr_state(vcpu, eoi_spis);
+	}
+
+	if (unlikely(deleted))
+		vgic_release_deleted_lpis(vcpu->kvm);
+
+	/* kvm_notify_acked_irq() grabs regular spinlocks; call after unlock. */
+	for_each_set_bit(spi, eoi_spis, VGIC_MAX_SPI - VGIC_NR_PRIVATE_IRQS + 1)
+		kvm_notify_acked_irq(vcpu->kvm, 0, spi);
 }

 /* Requires the irq_lock to be held. */
@@ -1023,6 +1039,10 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
 			break;
 	}

+	/* Pin the EOIcount walk start; it may be freed during the guest run. */
+	if (*host_data_ptr(last_lr_irq))
+		vgic_get_irq_ref(*host_data_ptr(last_lr_irq));
+
 	/* Nuke remaining LRs */
 	for (int i = count ; i < kvm_vgic_global_state.nr_lr; i++)
 		vgic_clear_lr(vcpu, i);
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 9d941241c8a2b..e52012f4bdec9 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -262,6 +262,7 @@ vgic_get_mmio_region(struct kvm_vcpu *vcpu, struct vgic_io_device *iodev,
 struct vgic_irq *vgic_get_irq(struct kvm *kvm, u32 intid);
 struct vgic_irq *vgic_get_vcpu_irq(struct kvm_vcpu *vcpu, u32 intid);
 void vgic_put_irq(struct kvm *kvm, struct vgic_irq *irq);
+__must_check bool vgic_put_irq_norelease(struct kvm *kvm, struct vgic_irq *irq);
 struct kvm_vcpu *vgic_target_oracle(struct vgic_irq *irq);
 bool vgic_get_phys_line_level(struct vgic_irq *irq);
 void vgic_irq_set_phys_pending(struct vgic_irq *irq, bool pending);
@@ -276,7 +277,7 @@ int vgic_check_iorange(struct kvm *kvm, phys_addr_t ioaddr,
 		       phys_addr_t addr, phys_addr_t alignment,
 		       phys_addr_t size);

-void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu);
+bool vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu, unsigned long *eoi_spis);
 void vgic_v2_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr);
 void vgic_v2_deactivate(struct kvm_vcpu *vcpu, u32 val);
 void vgic_v2_clear_lr(struct kvm_vcpu *vcpu, int lr);
@@ -317,7 +318,7 @@ static inline void vgic_get_irq_ref(struct vgic_irq *irq)
 	WARN_ON_ONCE(!vgic_try_get_irq_ref(irq));
 }

-void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu);
+bool vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu, unsigned long *eoi_spis);
 void vgic_v3_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr);
 void vgic_v3_clear_lr(struct kvm_vcpu *vcpu, int lr);
 void vgic_v3_deactivate(struct kvm_vcpu *vcpu, u64 val);

