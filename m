Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA02C60A2638
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 05:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1faAwLaW;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKMJARIW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4PPjtqMp1V58uGYejGtWodvU/HeeS5pvfYydRAC9x9I=; b=1faAwLaWU5sLOm
	Yb8ClmHi8Pes7gmCoRVzMFYqXZoAlCr82l6E3oAwo7ZZ1v7GVcOh8tgW0bcyiaKqa3jpu521HugVd
	zZ/sMdaYtZrpt1o6N/vkumey4mZG0ZA2TJL+8QOp4kx2RSCjV3Yu2iZYbgJCDLmQ3h96SAr2tMPYF
	Wcg5gEBSfo2TbTDPvJsAu8HdDlJ4HKTyHn5neMvUivLoT44m5f1WpVsSNq7n8FHT53ktoI0+EHXZU
	qyjTXNqabh1Fd6CCGZ7tOR/5l1Zen2P6SZ/c0eAO91Pj1zxJDu2KxV6KdKPXusFGc7odwyaAe2zX5
	mdqdAvVmKa66vqVPrecQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvn9-00000006JV7-1Hjr;
	Wed, 28 Oct 2026 05:01:39 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvn2-00000006JOv-0u70
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 05:01:33 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so4740135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 22:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793163689; x=1793768489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4PPjtqMp1V58uGYejGtWodvU/HeeS5pvfYydRAC9x9I=;
        b=dKMJARIWsVWKEVK/RhNL0A53PErkm6qsd1wS7F/68+bf7roF25/EUBK8YiofaoCuft
         nIVX3Jm2Xs+Sxl+HAXbXVt9HHNV5P3cTCpyXhfVsTuqXxUpR07Ut1HQNTPmamKJhumka
         PbQamdVEc6PA7qERl7SmhCuklmO6daqKFHqbu5XBMYxfdbuq0vATHRAhsvXHhnt8GGkV
         mqX6BoW9auzzkiSzjzkdFshCQD3vtUZDgDHm5oMUM8q4XHowEu0UeaiY56eXgBPae3dF
         b0rhvVx9j73NiR36Px36ka6+2f41brc8PFmfp23wA68sObjmhWTSvQJ2xbKkWjaQMHOS
         r0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793163689; x=1793768489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4PPjtqMp1V58uGYejGtWodvU/HeeS5pvfYydRAC9x9I=;
        b=d+tSLUhHYniVqQp9aSpRgIzJkjqgCL8guv3+axJ6h6kUgJMPDlYBOTFnZ3H5vNPhuF
         MWSB6zvUGMphbTk+ZLtamvHXEfxl9ZNRZqQ9HAyh+FJ7TXMrT0VQktl7uAHQXu2JX/R6
         VfNeD9BbaKOUZ2MmfOcTPFi/LqVSZZy4/BG32iAJYx7OyjcksjHfKhcm6Ci1hdDwKicd
         fkrVkoAvdy9f5Z7otRZzMSbcMJpf7XKuOYHnji2Szcgxo9EqdgqmSX3CqsFQgdoFvUE4
         npVRz56RmXFJgAGcvk3WKO+e/2fom0BkiwsZebSr8lst6mNvTkOaHWAd0dX6bPtaViTV
         WiJg==
X-Forwarded-Encrypted: i=1; AKwUvBzNskhNfQXf3JuObYzILCTC4c0pi7j5ZD3F5E86vh/md7GhLcspgjxvNoFZCf0LnTlp/IqnB+3wI2T9CUqfXo/X@lists.infradead.org
X-Gm-Message-State: AFq9FYKJhR7o2LJeLkRrxmpUV8q0GewWpuTYFgU+Q0UklYXmLKtKt+/k
	xYNRsSU2lXJPCddwJCOswV01qYL78q+6RyOh2sdR0+gVX+6FR2yzkPyP
X-Gm-Gg: AYBFou1VwAVLHyFa5vdDg5GG/AEzkfnQKhSpH2uiiiN6chP+5WPUDJKN5IcRntJG0hZ
	kbuJi0ZuHO/miSbhNkettWQ4tDm5b8utzYXLNjJsBmhPZZECgHpif4CEHLQqIzj6SXyWUboxjIZ
	t8VHA/rzhvNwHw2RjUYLcMUOzJgXdD2q08EBOAIa+JrdKMK27RsMVWNoEzYQN+vowX44ZnXh3fJ
	jl55moFbDZKf2rekWfU0xulavlA9i9mBAJghXw7py4OlQNbrt8StdbixC3ecwCm629aVQrO3EhZ
	7mcVl/ASENCU0rjDd8mCiFTGb43uHIQdPtbY4yZan6a0F9DUtNoFdGfMI4BN0y1SeqK/kY7haQi
	Y1OkMhBdXWqH+zN3bPvP5iWlr4iHpF4xvAw5GafrcOHY0ZCX7cSqhGzdYeQBfIgLWIm1e6+Gnwg
	FeNOmIxUadhNZ7HEAx07hwvCR6GDZV4ofN6wipRN8h5cuOtP03NnXTeaaO1TVtHT+zECYrBj5nd
	3tvW3J/ohuJiM4xfkGJtOpoyKiGdQeuQav18ol12MgxB5g2sXFdigvpZ9a7XRyR3X7VlGpVh5LA
	L3zds4yOcnxjZaT7nsDPM/rAcEmi/S9wLJNlS3ThwnFdK340YhZ0nWD5xHcvyd9sWvxo2TF6z19
	gbXFI9eACfy5v/L97EoQNPu10ZcJo5DKzn7BQ+X5v4JRZNmU1kamF/5kqHzYwuOEYzOiG5nH0Qs
	9JrDR3jdY/AqFSxBipCSVUVIkXXuRTi7Zd2ttqfw==
X-Received: by 2002:a05:600c:154e:b0:4a1:7bd4:d07d with SMTP id 5b1f17b1804b1-4a967e8d5a3mr18553845e9.34.1793163689112;
        Tue, 27 Oct 2026 22:01:29 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94eb8a60fsm13523365e9.3.2026.10.27.22.01.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 22:01:28 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] KVM: arm64: vgic-v2: Don't drop pending writes to active level IRQs
Date: Wed, 28 Oct 2026 06:01:11 +0100
Message-Id: <20261028050113.10046-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028050113.10046-1-kmehltretter@gmail.com>
References: <20261028050113.10046-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220132_498820_BE03A96C 
X-CRM114-Status: GOOD (  22.78  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A write to GICD_ISPENDR for an active level interrupt makes the
interrupt Active and Pending. It must be delivered again after it is
deactivated.

KVM loses the second pending state. vgic_v2_populate_lr() leaves
pending_latch set for a level interrupt, while vgic_v2_compute_lr()
keeps Pending and Active out of the same LR. vgic_v2_fold_lr() clears
the latch after the LR becomes empty. At that point it cannot tell the
original latch from one written while the interrupt was active, and
clears both.

Synchronize the target vCPU's LRs in vgic_mmio_write_spending() with
vgic_access_active_prepare() and vgic_access_active_finish() under
config_lock before setting pending_latch. When the interrupt is in an
LR on another vCPU, this folds any prior ack into the VGIC state before
the new pending state is recorded.

In vgic_v2_fold_lr(), clear the original latch when an LR populated for
an inactive interrupt no longer reports a pending state, and preserve a
latch written while the interrupt was active.

Fixes: 67b5b673ad4d ("KVM: arm/arm64: vgic: Disallow Active+Pending for level interrupts")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-mmio.c | 76 +++++++++++++++++++--------------
 arch/arm64/kvm/vgic/vgic-v2.c   | 10 +++--
 2 files changed, 50 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
index fddb9da0403d5..e42eb10d502b2 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio.c
@@ -350,11 +350,54 @@ static void __set_pending(struct kvm_vcpu *vcpu, gpa_t addr, unsigned int len,
 	}
 }
 
+/*
+ * If we are fiddling with an IRQ's active state, we have to make sure the IRQ
+ * is not queued on some running VCPU's LRs, because then the change to the
+ * active state can be overwritten when the VCPU's state is synced coming back
+ * from the guest. Setting an IRQ pending also requires the target VCPU's LRs
+ * to be synced first so that any prior ack in the LR is folded
+ * before pending_latch is set.
+ *
+ * For shared interrupts as well as GICv3 private interrupts accessed from the
+ * non-owning CPU, we have to stop all the VCPUs because interrupts can be
+ * migrated while we don't hold the IRQ locks and we don't want to be chasing
+ * moving targets.
+ *
+ * For GICv2 private interrupts we don't have to do anything because
+ * userspace accesses to the VGIC state already require all VCPUs to be
+ * stopped, and only the VCPU itself can modify its private interrupts
+ * active state, which guarantees that the VCPU is not running.
+ */
+static void vgic_access_active_prepare(struct kvm_vcpu *vcpu, u32 intid)
+{
+	if ((vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3 &&
+	     vcpu != kvm_get_running_vcpu()) ||
+	    intid >= VGIC_NR_PRIVATE_IRQS)
+		kvm_arm_halt_guest(vcpu->kvm);
+}
+
+/* See vgic_access_active_prepare */
+static void vgic_access_active_finish(struct kvm_vcpu *vcpu, u32 intid)
+{
+	if ((vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3 &&
+	     vcpu != kvm_get_running_vcpu()) ||
+	    intid >= VGIC_NR_PRIVATE_IRQS)
+		kvm_arm_resume_guest(vcpu->kvm);
+}
+
 void vgic_mmio_write_spending(struct kvm_vcpu *vcpu,
 			      gpa_t addr, unsigned int len,
 			      unsigned long val)
 {
+	u32 intid = VGIC_ADDR_TO_INTID(addr, 1);
+
+	mutex_lock(&vcpu->kvm->arch.config_lock);
+	vgic_access_active_prepare(vcpu, intid);
+
 	__set_pending(vcpu, addr, len, val, false);
+
+	vgic_access_active_finish(vcpu, intid);
+	mutex_unlock(&vcpu->kvm->arch.config_lock);
 }
 
 int vgic_uaccess_write_spending(struct kvm_vcpu *vcpu,
@@ -452,39 +495,6 @@ int vgic_uaccess_write_cpending(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
-/*
- * If we are fiddling with an IRQ's active state, we have to make sure the IRQ
- * is not queued on some running VCPU's LRs, because then the change to the
- * active state can be overwritten when the VCPU's state is synced coming back
- * from the guest.
- *
- * For shared interrupts as well as GICv3 private interrupts accessed from the
- * non-owning CPU, we have to stop all the VCPUs because interrupts can be
- * migrated while we don't hold the IRQ locks and we don't want to be chasing
- * moving targets.
- *
- * For GICv2 private interrupts we don't have to do anything because
- * userspace accesses to the VGIC state already require all VCPUs to be
- * stopped, and only the VCPU itself can modify its private interrupts
- * active state, which guarantees that the VCPU is not running.
- */
-static void vgic_access_active_prepare(struct kvm_vcpu *vcpu, u32 intid)
-{
-	if ((vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3 &&
-	     vcpu != kvm_get_running_vcpu()) ||
-	    intid >= VGIC_NR_PRIVATE_IRQS)
-		kvm_arm_halt_guest(vcpu->kvm);
-}
-
-/* See vgic_access_active_prepare */
-static void vgic_access_active_finish(struct kvm_vcpu *vcpu, u32 intid)
-{
-	if ((vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3 &&
-	     vcpu != kvm_get_running_vcpu()) ||
-	    intid >= VGIC_NR_PRIVATE_IRQS)
-		kvm_arm_resume_guest(vcpu->kvm);
-}
-
 static unsigned long __vgic_mmio_read_active(struct kvm_vcpu *vcpu,
 					     gpa_t addr, unsigned int len)
 {
diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 7182f63fc9382..f3ba3177dd97b 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -57,7 +57,7 @@ static void vgic_v2_fold_lr(struct kvm_vcpu *vcpu, u32 val)
 {
 	u32 cpuid, intid = val & GICH_LR_VIRTUALID;
 	struct vgic_irq *irq;
-	bool deactivated;
+	bool deactivated, was_active;
 
 	/* Extract the source vCPU id from the LR */
 	cpuid = FIELD_GET(GICH_LR_PHYSID_CPUID, val) & 7;
@@ -71,7 +71,8 @@ static void vgic_v2_fold_lr(struct kvm_vcpu *vcpu, u32 val)
 
 	scoped_guard(raw_spinlock, &irq->irq_lock) {
 		/* Always preserve the active bit, note deactivation */
-		deactivated = irq->active && !(val & GICH_LR_ACTIVE_BIT);
+		was_active = irq->active;
+		deactivated = was_active && !(val & GICH_LR_ACTIVE_BIT);
 		irq->active = !!(val & GICH_LR_ACTIVE_BIT);
 
 		if (irq->active && vgic_irq_is_sgi(intid))
@@ -88,8 +89,11 @@ static void vgic_v2_fold_lr(struct kvm_vcpu *vcpu, u32 val)
 
 		/*
 		 * Clear soft pending state when level irqs have been acked.
+		 * A latch written while the irq was active is a new pending
+		 * state and was not represented in the LR, so preserve it.
 		 */
-		if (irq->config == VGIC_CONFIG_LEVEL && !(val & GICH_LR_STATE))
+		if (irq->config == VGIC_CONFIG_LEVEL &&
+		    !(val & GICH_LR_PENDING_BIT) && !was_active)
 			irq->pending_latch = false;
 
 		/* Handle resampling for mapped interrupts if required */
-- 
2.39.5 (Apple Git-154)


