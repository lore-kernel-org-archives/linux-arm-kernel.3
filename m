Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E3BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 22:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMoANj4p5EHkRVZCluw47mqWJPi0FfnC4TlDJfr4IcM=; b=IQ33hLsi9976OIFEjjcYipE2D7
	fIvsbMgym07SoqJLzeIY4rvU7/J6satJ3eevUmKgy85Eo6Bo3l2Q8/kB9xWx27+2NVXg8JBnMgnYH
	ieeRWOXf3RGq0qawqEoGNXrLpawqSHXg/YiqHZ7tu66tWNr+smdbIMPlNWhBVsEStizkRwih4yPHE
	itfx5BePEYEGPOiVJhKQb8MQl9GTLzKIm1WisREd7MO/I+6sf9R6GXt8n0TnETKRP8x9jurrGD44+
	OpHq/ejGerLeR5E03ej/6G9KPNkkLyK8mLgtoOEdOwerTzWGixOv8+aqUGhT8ZxYkW9rohi0Qo8uk
	nGUXl2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPVG-00000005Y1o-1BEg;
	Wed, 26 Feb 2025 22:03:42 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPNH-00000005X89-1OBf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 21:55:28 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-38f27bddeeeso229747f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 13:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740606925; x=1741211725; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YMoANj4p5EHkRVZCluw47mqWJPi0FfnC4TlDJfr4IcM=;
        b=RLo670vf9eEwXd4SRsrwCEPcWj7AC0O5EuC02zFod/2dwB3RK7sLpQX7kb+vQvd+h0
         LT94oNH8rhcWVsA2DNFH4MLSXAcydnGHJ2ttgmGbfoHKu3IkUm/teN4MQHuNelbogwg3
         +ccmZz7lFBwOGir5lsa+NzfVb9Prpf1cWiz9OxKKwlmtcn0eaDemewlhLvUUofq7eKoz
         rsra+irIim0HdIe+4cUGoXTPMFoeEh1Hsmeijd2RrtPdVR/h445iryRllr8MrvjD21kb
         nqMbll0FB6zEmRk533v1wcWraIcN06z60ePEcSb2guoxdRKw2wwUMB38ULo+0rC4oNRn
         jxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740606925; x=1741211725;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YMoANj4p5EHkRVZCluw47mqWJPi0FfnC4TlDJfr4IcM=;
        b=MV+X7JNPrFVWvYwxuPySN8MzR7q/kiPu5SMPM4C3SLXoAKdYj9dwJEUmtVqHACYziC
         4ykOx5OTIKcZLg/TDSS0dg7ijJNmrnuktZPflQIO4mqbVE7fc6tPLvEHW7N3pFP8nFOn
         /vO6uZc2AtY9e67Z6hIncV/j4DAr+mJ3Q86nW6XSHc0iCa3JuGw2FrFvOuq2pzooB35W
         2eHcO8QlHOM/efFFyYrLIXod9ehXpDN6jF5+R6D91bgatquW3oIlfk8wtYFrGZeXKuX0
         +wPqCuOdgdY/dzY6vg+nK9hxaulYTQ36OHoHCepHqISxnFAlBzkilbVCi51jo7rxQXtF
         4KXA==
X-Forwarded-Encrypted: i=1; AJvYcCWlP9PWlXkBf+Qv4xoUoO7qAOGxd34dCZ6I5kIfY1lm7Y5Unn41XjuTXkDgtAJEG+Q6BGk/OJOZbFx2gJEbXD70@lists.infradead.org
X-Gm-Message-State: AOJu0YxB9U5O9l2apLJMlDrJtlCH/6dOkYP/hoA3ijY5B8CgejNnoE8E
	eekVFgP43GUoEhzllUG6eAQKmqh7D/dbyGxReSFqpt85FDDgOo+aEKX648usyDINGw35DFmO4A=
	=
X-Google-Smtp-Source: AGHT+IEm+deGA2n4ENvCjeg0FnRMCCHXrVIT4UaweA5DEki0464Z4e8+WEQzh+GM4v+3iZ8npegFP/EaEw==
X-Received: from wroa1.prod.google.com ([2002:adf:ed01:0:b0:38f:3703:662f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1845:b0:390:d82d:6d4f
 with SMTP id ffacd0b85a97d-390d82d71cemr4013404f8f.52.1740606925196; Wed, 26
 Feb 2025 13:55:25 -0800 (PST)
Date: Wed, 26 Feb 2025 21:55:17 +0000
In-Reply-To: <20250226215520.1759218-1-tabba@google.com>
Mime-Version: 1.0
References: <20250226215520.1759218-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250226215520.1759218-2-tabba@google.com>
Subject: [PATCH v2 1/4] KVM: arm64: Factor out setting HCRX_EL2 traps into
 separate function
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, mark.rutland@arm.com, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_135527_369399_9A51B5B6 
X-CRM114-Status: GOOD (  14.78  )
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

Factor out the code for setting a vcpu's HCRX_EL2 traps in to a
separate inline function. This allows us to share the logic with
pKVM when setting the traps in protected mode.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h | 24 ++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c            | 20 +-------------------
 2 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 78ec1ef2cfe8..31c8497372d0 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -649,4 +649,28 @@ static inline bool guest_hyp_sve_traps_enabled(const struct kvm_vcpu *vcpu)
 {
 	return __guest_hyp_cptr_xen_trap_enabled(vcpu, ZEN);
 }
+
+static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+
+	if (cpus_have_final_cap(ARM64_HAS_HCX)) {
+		/*
+		 * In general, all HCRX_EL2 bits are gated by a feature.
+		 * The only reason we can set SMPME without checking any
+		 * feature is that its effects are not directly observable
+		 * from the guest.
+		 */
+		vcpu->arch.hcrx_el2 = HCRX_EL2_SMPME;
+
+		if (kvm_has_feat(kvm, ID_AA64ISAR2_EL1, MOPS, IMP))
+			vcpu->arch.hcrx_el2 |= (HCRX_EL2_MSCEn | HCRX_EL2_MCE2);
+
+		if (kvm_has_tcr2(kvm))
+			vcpu->arch.hcrx_el2 |= HCRX_EL2_TCR2En;
+
+		if (kvm_has_fpmr(kvm))
+			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnFPM;
+	}
+}
 #endif /* __ARM64_KVM_EMULATE_H__ */
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82430c1e1dd0..16ce5f584e7c 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4971,25 +4971,7 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 	mutex_lock(&kvm->arch.config_lock);
 	vcpu_set_hcr(vcpu);
 	vcpu_set_ich_hcr(vcpu);
-
-	if (cpus_have_final_cap(ARM64_HAS_HCX)) {
-		/*
-		 * In general, all HCRX_EL2 bits are gated by a feature.
-		 * The only reason we can set SMPME without checking any
-		 * feature is that its effects are not directly observable
-		 * from the guest.
-		 */
-		vcpu->arch.hcrx_el2 = HCRX_EL2_SMPME;
-
-		if (kvm_has_feat(kvm, ID_AA64ISAR2_EL1, MOPS, IMP))
-			vcpu->arch.hcrx_el2 |= (HCRX_EL2_MSCEn | HCRX_EL2_MCE2);
-
-		if (kvm_has_tcr2(kvm))
-			vcpu->arch.hcrx_el2 |= HCRX_EL2_TCR2En;
-
-		if (kvm_has_fpmr(kvm))
-			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnFPM;
-	}
+	vcpu_set_hcrx(vcpu);
 
 	if (test_bit(KVM_ARCH_FLAG_FGU_INITIALIZED, &kvm->arch.flags))
 		goto out;
-- 
2.48.1.711.g2feabab25a-goog


