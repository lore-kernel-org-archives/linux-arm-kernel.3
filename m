Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D6760A2601
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 05:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LCnmzUcF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JEx8GJ6r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R107460VN/9Lpa+clFPqIU2LdqoiAh3lsBpjR3ojfMo=; b=LCnmzUcF1NRw1j
	ivWju3zhya4tnCOYAwunijakrjrxwc2ky6MOaWNOdhHJA72obLVM10I1W+zdoKwedNsjDhVHH1sCd
	ZYE2ZSsLrXEgJZB3A1XHAhCPaqWhIL5tcFH7pVRXRa0t7sLzdeQ5LbTOXJDmnX/4YUib5yq35zgAU
	8uF0309G+Ymt7tmPX3q7uUOlgXiV++hrMbftgHoDOCaML9D3RVBVra5O3ebFRayqUcUDOpfXxda2v
	30zgb+Wcz09Gn0lcNyWHeFg481geJSvkk2dMsL8wbFIN5cLqSbAP32BBVK3WE3DGTQ+KadfHS/h6K
	jBTYKyTl/DuzfT23VBvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvn9-00000006JVS-1yzH;
	Wed, 28 Oct 2026 05:01:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvn5-00000006JRp-11EP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 05:01:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a215e64962so5554435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 22:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793163691; x=1793768491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R107460VN/9Lpa+clFPqIU2LdqoiAh3lsBpjR3ojfMo=;
        b=JEx8GJ6r8l44xrr7h3NBGoyzSXK1AAxbMl1iVl/MQOtZd51BbK/OwUsz+MABlXcVWz
         jprXRLASPWG41oWJ55Arc5RIrG2z0sYztVONF8zvFs6BSKOPxMAcnRaoNM7xd7xqgCtN
         n6Kx9Rny0ZSGFqzy3d3QypXYVmOrkNJ92WqhNd2UIh3oOs9kWANxCbIXnSV6NwN1S8rq
         QhCOgg2Nr0A/JVVeTrJsdXS7YXLps0+2WEidxd7Z39N7uwCCPfXh35SDQ3EiEtE3x3Yw
         5K/RD5SviSsrjq2rSdyfREUwaPfqAnt0y5dYVs/Us0auLheDMsQO9NEt553WsaJZEv8O
         uLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793163691; x=1793768491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R107460VN/9Lpa+clFPqIU2LdqoiAh3lsBpjR3ojfMo=;
        b=U+Rj6EZzEdMbD6V6iSOtMUFE3H8XsqiRNaOs/TohN0sU/xkLhdATR4dbOwVDnAB8Wf
         Qex4Xc8u4P7UklcMampMdp6+TuPzwkSt7ZLkkx/w2yZfD+N34qS2VCxciO/3mWoWd078
         +NG5CYsFcDRzE/vL+SkYEhAJH7xD4nULyjN3lR3tZYsPry6RHeiOzZz39H6pdFzFnnQv
         g6Edpc/PTQcmKion5ymnWJm36nHEgaIln4TMqhbWNyMVHmUo/ZyzLbck496XD9zYJDLZ
         G1EOVIlH5m22kOBoYhtqhUtvWb5Yc3OKQpaHu42dKkfPFAE78+OrSAvHfPtz1XFv6PUq
         Rx5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxCZDwNWf1prkQDzWEgWi2PatgY0n6gQ8c0Hht943Nd/vzsUI2EnKwIKWYTcIFugtyD23AATuocJycrTheJajPV@lists.infradead.org
X-Gm-Message-State: AFq9FYLIb4KWWphe6idis0VcnhVZM9qm7rSt+dQifa+uULdIshd52Qni
	mxbLVc5uHzc4IPp1cm8S+GsQumApzVkN5zzlZaFexlZY06rTfFDKoXtYk0MPxt87yEI=
X-Gm-Gg: AYBFou1wroYt0s2x8KwX5r6oMijY0CRzBdGLGKCjTTXt5NsRBz3VwUwkBNgM2v+ogbE
	JQNppA72ovOoKsN6XW1A23mAOKBmmbh63RSAL5D1urz8QJVbRuXw1W9v0oUUofHDX0yJl/8No06
	0k12qCSTgrhA20sHDb+Lgq40oGYnmT059YgzeaJ0DPRseoWySdPgkm8Ye+B8S+kzGnC0pUrxFt8
	qGc1zeJBXSZhS3eRDAjusBW7pS11fFZf17qCk2BFHv+LuxGtDl0gwLTfHwgq4azxHsJNukUjlRJ
	gYjp4/DIh6JYt3zdcSM08c84oKO/s+yQILbKml4zbEHCZDMsOVgeW5yd6ObOAQA4N2RNUPtGmZB
	W4NzFskjLixrt32WKLEs4ug9qAf1aUs/3Txt5aE+QCuXOAvPG2Tb2yLl1yAMyN3CrUwdcl66uAd
	vOqWkXXceNHw2OJ9vnrufyn9XPwF0tPdhcWyDRd2ouLqL97iCLMcFpPfRJ5zSXKHMUftxeu7pq+
	/o91sShnMYsGOaLsqlDcs5p9fJtqN9RVEnQmujz4ZkuzugZ9K/G4vlQmRnWnG6EgBx+uSo/cgrv
	PFSzgM4zndWjgUS811YYFbPJc6O3IdqN7Uvclb7dSNmQzpuCRr58lTMDeoxV4pu/VuENBxkyHDP
	FOZqRCnesC0YdG6Rau0D+tC46DcvD4AGGq8jDOEl1Jg4oV7wjMFN5RdapipiGij+PkhyR2VpBn3
	Ctd8ca2/6Lb8WHN/f0xCemjfJPiSi1QI8+I8Lg8/SmiB3mPi0czEt3tuIV+C4=
X-Received: by 2002:a05:600c:4e03:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4a963ffcf87mr21560375e9.2.1793163690594;
        Tue, 27 Oct 2026 22:01:30 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94eb8a60fsm13523365e9.3.2026.10.27.22.01.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 22:01:30 -0700 (PDT)
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
Subject: [PATCH v2 2/3] KVM: arm64: vgic-v3: Don't drop pending writes to active level IRQs
Date: Wed, 28 Oct 2026 06:01:12 +0100
Message-Id: <20261028050113.10046-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028050113.10046-1-kmehltretter@gmail.com>
References: <20261028050113.10046-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220135_493124_B8B1FD38 
X-CRM114-Status: GOOD (  16.14  )
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

The GICv3 backend also loses a level interrupt set pending through
GICD_ISPENDR or GICR_ISPENDR0 while it is active. Its LR handling has
the same split between pending_latch and an Active-only LR as GICv2,
and clears the new pending state after deactivation.

With vgic_mmio_write_spending() synchronizing the target vCPU's LRs
before setting pending_latch (which is a no-op when a vCPU writes its
own GICR_ISPENDR0), apply the GICv2 fold rule to vgic_v3_fold_lr().
Clear the old latch when an LR populated for an inactive interrupt
reports that the interrupt has been acknowledged, and preserve a latch
written while the interrupt was active.

GICv3 permits an implementation to clear register-set pending state on
ack. Doing so matches the GICv2 backend and makes a later ISPENDR write
a distinct pending state.

Fixes: 67b5b673ad4d ("KVM: arm/arm64: vgic: Disallow Active+Pending for level interrupts")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 726e20a1da6e7..4d802fc9c6dd5 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -75,7 +75,7 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 {
 	struct vgic_irq *irq;
 	bool is_v2_sgi = false;
-	bool deactivated;
+	bool deactivated, was_active;
 	u32 intid;
 
 	if (vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3) {
@@ -93,7 +93,8 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 		/* Always preserve the active bit for !LPIs, note deactivation */
 		if (irq->intid >= VGIC_MIN_LPI)
 			val &= ~ICH_LR_ACTIVE_BIT;
-		deactivated = irq->active && !(val & ICH_LR_ACTIVE_BIT);
+		was_active = irq->active;
+		deactivated = was_active && !(val & ICH_LR_ACTIVE_BIT);
 		irq->active = !!(val & ICH_LR_ACTIVE_BIT);
 
 		/* Edge is the only case where we preserve the pending bit */
@@ -103,8 +104,11 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 
 		/*
 		 * Clear soft pending state when level irqs have been acked.
+		 * A latch written while the irq was active is a new pending
+		 * state and was not represented in the LR, so preserve it.
 		 */
-		if (irq->config == VGIC_CONFIG_LEVEL && !(val & ICH_LR_STATE))
+		if (irq->config == VGIC_CONFIG_LEVEL &&
+		    !(val & ICH_LR_PENDING_BIT) && !was_active)
 			irq->pending_latch = false;
 
 		if (is_v2_sgi) {
-- 
2.39.5 (Apple Git-154)


