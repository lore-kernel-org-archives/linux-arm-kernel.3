Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31792606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 06:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2gHsSICZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Y8LzFvKe;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LEH0NUDc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JINO212XZqoHkVZMBAnF93gGUq9jJ54l6n4NWOl1V5Y=; b=2gHsSICZTJUwFLUjGVU9c3WagO
	T9znxPS5V3S275scfbRPXVeVkuJ+roMYnSFrC+fTLPRlX0svDqOJgFsBn6ji6MCb+vlHg1BNQg4w/
	fCIpOW9JubhdWnZKgALCynL0OHAllNUIyd3MFJzTVRSuwGFVoKFmhcwlwEQmf3nnc/4dFc/aOT9BI
	6VLE9X3BagID5p6u7vR127NeoTbBGwnPaQgkL5uWHp6VCPswqCBqw4K5CPa/azT/4iLWAW9KzTkTs
	8kxg4B2Hv9WQVIyhoRa6TDSlbVS+3CjLwqVsVCsj3EfZBPGO3MewQrOM311tC4bE8HnXduKBEeDTZ
	ZdOo3z3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmZi-0000000DVMD-2ihw;
	Thu, 22 Oct 2026 06:46:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmZb-0000000DVK3-2Jyp
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 06:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JINO212XZqoHkVZMBAnF93gGUq9jJ54l6n4NWOl1V5Y=; b=Y8LzFvKeHEbsgjZ67MumU5ftOd
	LyIJNYFKq+/QEeo0yq6Jjm/oDrKPToJFy/wfaeK47ygXsHQnn8gn2L7uW8DhHhe+RD4++kv5dqZDS
	jZ3jfWln/Ebkk7r/ElzDTtyAk/twluTHU9mPXsdwS5XkkaDSui+DN4sh11qLlXDI6s408H1obj+Nh
	d5VbbiTdMyEAdQuQKZmTVjsPa3vNQNF/XImZk5Y9ANnpbi66sZwgJLuMp7gjqY0dYk72x6oU4k5E8
	d9h5S8lZ2M15BQm/GTxSPkHmBxOpHGOaC6qgGSvINvOg0c01dnBeuBCK9kwlntU64QWnlZCOx76B2
	fFDO7Uhw==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJmZY-00000006WiF-1EVm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 06:46:46 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1317985f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 23:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651603; x=1793256403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JINO212XZqoHkVZMBAnF93gGUq9jJ54l6n4NWOl1V5Y=;
        b=LEH0NUDcxT27KPcS0/m68qB7bRkPm6QO9bIQwc7HKJXRSep1goYOYE5ykCUcc2U6S5
         eiS0x/g4NpFJjZs3hpuMiZ7HKMK7vZcgGQAF7BbdanoEDvUoIw7mWSQcQ8Wak1uGSv+5
         wEqfTMBhirogzxmree+B48cRhPArOVdVQ8arw06wibTMywZqD8LQVrfKY13s68AQDejQ
         pniUZeUipGPT5tfhYrPsS250b62wuNYUPuRxM31J0oT6QInTn3Zg30VqdE1I51QGX7jc
         dRnOSUFoY7QOIc5BhQNGOEA3vC0thAwUUWSO415A1vs8RN0dXI2eRm5n24du6y0VD8b1
         P9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651603; x=1793256403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JINO212XZqoHkVZMBAnF93gGUq9jJ54l6n4NWOl1V5Y=;
        b=QPeHP7avlhZsB4UDSTy3Mx1hmLNw7RUZqbOlMpLmVHEMlPX7O6ShXmLlsw+5rvPt72
         D+40FhlHZGHyZr0Yd419TbJhRDlvRQexIdWyKYRhge8w/e6ELXsySloCeLtborFmLaJQ
         +sokNezLFNrJDWMtbDuuQCq7MESghLV9H86jCXj++7bJ1DMuO06AwCw0FfmE3iqX/4yN
         XFuOJo+Wyi4GfI+BZS6bkLZ6LNROI7ov7os9MvmzOpfDro57yrWdHJt8UFWxUYcjn+MH
         QeDy2c3XL3zyukWdIe/cgGXrIs9tJa6ebGTbQHrIrlaWVVH2ELJ24L5iyvtBHGNh5bsI
         TPIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIRo3woKAKzuLncnhBEXK/NOe9B1BnX8TJxwuW5k6XpMNER5ZY0QBboF5qgDb601ROYyKh3mvF+ZumpOI3UNt+@lists.infradead.org
X-Gm-Message-State: AFq9FYIl4DkU3PiswTrckyfZ5i9WQMWTGwpcozF6HZavTmNmFaAaB9ju
	g8V9bpq28Ywgel96OLOG8UYUZBX4ha3we2FF6vXpyFDQu7FsbjRvNZyR
X-Gm-Gg: AYBFou2ktBc7J5Uh6PBft5MQ7Inu4towlqkyPVLp7+H8UGhM3VBCKzQqCzGeaJfN6yv
	4MGn1R6RhmiFjNPwR1x3s8w4HR6CSuTiCWiM2tvmMgFvc4FwGLswBe42lVl7YhGNX+00E7yo4wq
	8eUcFFps90xUeTYLYfY5cxzSnpNnCZz+nUnC33Ppi6P72XtV0yjz+g/m+cFvHZggV9zM+0sBoRO
	9AWMth0VXnhYjhy7DVYQ3+bgJXlZMZX4wjOLXcYE1Vy2yVr+DnuMFfDFLT2hNMDcLzPH1rKNQ29
	dusqfM8/QZbXb4IdZn3aSYZYsZZgj7eUWHuDUIpuQT/y2XYobDnwV5AFAgivX/G8D9eDdWfWhtq
	nSBDyYkYVXMTBuNnHxiCAOKzd8iX/bVD/hXxwFbbQK335iTAJujvzQN4czmEx+rqSX40mPz/99c
	JCD6m3zbb3B9TVvyEwC4F1my0tUCEY67NIC9PlIZd7yc9Vd8/IceS0o2GpDdg652l2aOwpL1D7Z
	Xxf4t/cMfe0WVfGxvRP4oog9xmeH0KPg/mqvWeh16Z1ra6uRlIIER2T0IWm2F3dgcnQod2z1QcD
	D/zgTABeA7fGqHo3w1ogfRDc2aFAgLBIeSCuj3XYIOoJsRqFwJtIE6M+ywewpDF5uMYvcna6TT8
	9EoQVw435KZbabRdbXbbsKAiN/lH1OkwwC8a1wfO4zyycmgAaFUaayLl8aY1CFh6y
X-Received: by 2002:a05:6000:26c5:b0:48c:8126:a260 with SMTP id ffacd0b85a97d-48e26427bd6mr9490490f8f.6.1792651602673;
        Wed, 21 Oct 2026 23:46:42 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm10215624f8f.22.2026.10.21.23.46.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 23:46:42 -0700 (PDT)
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
Subject: [RFC PATCH 1/3] KVM: arm64: vgic-v2: Don't drop pending writes to active level IRQs
Date: Thu, 22 Oct 2026 08:46:26 +0200
Message-Id: <20261022064628.4206-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022064628.4206-1-kmehltretter@gmail.com>
References: <20261022064628.4206-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_074644_769619_234FD2CF 
X-CRM114-Status: GOOD (  22.37  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
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

Clear the original latch when the LR first reports no pending state.
Keep a latch which was not represented in the LR, either because the
interrupt was already active or because the guest wrote ISPENDR while
the interrupt was in an LR. Clear the marker together with the latch
on an ICPENDR write.

A remote ISPENDR write can race with the guest ack. KVM cannot tell
which happened first without synchronizing the target vCPU. Preserve
the write, which may cause one extra delivery if it preceded the ack
but avoids losing a write that followed it.

Fixes: 67b5b673ad4d ("KVM: arm/arm64: vgic: Disallow Active+Pending for level interrupts")
Assisted-by: LLM
---
 arch/arm64/kvm/vgic/vgic-mmio.c |  9 +++++++++
 arch/arm64/kvm/vgic/vgic-v2.c   | 13 ++++++++++---
 include/kvm/arm_vgic.h          |  1 +
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
index fddb9da0403d5..1728c78f99cfd 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio.c
@@ -341,6 +341,13 @@ static void __set_pending(struct kvm_vcpu *vcpu, gpa_t addr, unsigned int len,
 			continue;
 		}
 
+		/*
+		 * The guest may already have acked what is in the LR,
+		 * in which case this is a new pending state.
+		 */
+		if (irq->on_lr)
+			irq->latch_written = true;
+
 		irq->pending_latch = true;
 		if (irq->hw && !is_user)
 			vgic_irq_set_phys_active(irq, true);
@@ -427,6 +434,8 @@ static void __clear_pending(struct kvm_vcpu *vcpu,
 			continue;
 		}
 
+		irq->latch_written = false;
+
 		if (irq->hw && !is_user)
 			vgic_hw_irq_cpending(vcpu, irq);
 		else
diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 7182f63fc9382..37474ea2431c5 100644
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
@@ -88,9 +89,15 @@ static void vgic_v2_fold_lr(struct kvm_vcpu *vcpu, u32 val)
 
 		/*
 		 * Clear soft pending state when level irqs have been acked.
+		 * A latch written while the irq was active is a new pending
+		 * state. A write while the irq was in the LR may also have
+		 * followed the ack, so preserve it too.
 		 */
-		if (irq->config == VGIC_CONFIG_LEVEL && !(val & GICH_LR_STATE))
+		if (irq->config == VGIC_CONFIG_LEVEL &&
+		    !(val & GICH_LR_PENDING_BIT) &&
+		    !was_active && !irq->latch_written)
 			irq->pending_latch = false;
+		irq->latch_written = false;
 
 		/* Handle resampling for mapped interrupts if required */
 		vgic_irq_handle_resampling(irq, deactivated, val & GICH_LR_PENDING_BIT);
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 7be81b936bf10..28ed27d982dfc 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -292,6 +292,7 @@ struct vgic_irq {
 	bool active:1;
 	bool hw:1;			/* Tied to HW IRQ */
 	bool on_lr:1;			/* Present in a CPU LR */
+	bool latch_written:1;		/* Level only: latch set while on_lr */
 	refcount_t refcount;		/* Used for LPIs */
 	u32 hwintid;			/* HW INTID number */
 	unsigned int host_irq;		/* linux irq corresponding to hwintid */
-- 
2.39.5 (Apple Git-154)


