Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE103606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G9adqxWj;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=l0nHkIAe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HHIgomAuSYfj1cAFxx866cqVmlDtzOuB8qVUxKcbrHo=; b=G9adqxWj6V9Llszi77TfRNfvi1
	DC3GJAlQK02QbKzILKZDrLGUch8ZhH1orsJYN6EDAciLrCqp9cmfePe89/BjGvgz5ZD3k+SMAegqn
	3jr1NPae/M3fuHB4GWgyee/0YDuidX2N8qIKcdlpltcRfRWM23Gc+dskN9+ab7NTjwRZodryFIbB9
	//cDw5gcYPlvqBsDpuaB32oVRBVwEKfyE5vGNKW/vuIRFEQv/X1aKYCnYqIxQF3hBWPJh4CAt2ngH
	CfsuhTCIkIqMPr3dITaGyCnnJXx1bZpZ8bgIDIPSOZXGkQArs8Med+NiLQeEClscp9Wz4i/gJMnb6
	QIF1CynQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJU4c-0000000Bgnw-1g5e;
	Wed, 21 Oct 2026 11:01:34 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJU4Z-0000000BgnT-47PF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 11:01:33 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-48e1d839ddaso391502f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 04:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792580489; x=1793185289; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HHIgomAuSYfj1cAFxx866cqVmlDtzOuB8qVUxKcbrHo=;
        b=l0nHkIAeVNrGDdg7gBafUlDaX223+vgRqo07iVHlf9nybhcHskP/kEs0nWnfJoUIbD
         sP9eveQjtBbc2BAMUC6V5eO66/gId6tUbDL4FlNpBHs18KhcIXP69CkVw7VMb0Kh4Q6s
         8kciAGP3cXYkgpUBqZ9o8bHwnp0IdZuHzwY94yqlEQZSVUakL9kGdeuj3kiWcp5XgF84
         XM6LJ5STJjDMzhNGT9nVJFWT3HTq95br17MDmZ2VT3e5kEbNag3QgGIdtlRxQjXZPw/N
         ibmeMFDLHCXTn4K0V3LhXP8DjIetXR4obnrgon9zBKnLrnLwBSnZXwyKvZVMaFYopxvJ
         iDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580489; x=1793185289;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHIgomAuSYfj1cAFxx866cqVmlDtzOuB8qVUxKcbrHo=;
        b=RBWyYM/x+pGdIm4sNL9AjiPshP/OAwzdeCooMlMwfKl9COIMTzQXY6oNBJ7JtmlteX
         wf5QlZP4lDl32rmFFnSkuJmcgCH6xSpFkbRKeq2lKeywfKegTnYFWdge0HyKduCgvCZR
         n2JYIJLvr7AU0nv0p+rbj8MMA+OYqO9C/HFqMO2otS/n17fjJQzlJ5sNQDQjhjgAkVZG
         3dpVVZqUOju+BlqRP3VqNeF4KF+8YltOhuWG2zuWo3h3HKvr62Kur2KbkleEzWu7YuYZ
         4sUB+fxMm7Hi1wqGFVUPgA2rW8ThSo/MiEkkzaveMeyOLDdFO3Z+3y/qFS/VybgIG9T6
         KtFQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/XI7het1lsEEcrZTMkJjnF6PozkkyEF5rS70EfsuqUU/5w5/SoFKLsUsidyPMMykgU1gfRt2+y/99AcrR2w3I@lists.infradead.org
X-Gm-Message-State: AFq9FYI6eWKqvnCW/XGSzAIbPzvCPxZDHS2W6spI/AIyqKP/jIysKCkH
	k+xAAYv7pu/adu5KK/oh0CSRhyvOBdlE+GRJxKG9MQAVx+sCP4i/yVWrqA5ZPmJ8LsFRPkQfQ10
	uzybuWEi4IR4homCd2u03FQ==
X-Received: from wrnv18.prod.google.com ([2002:adf:ebd2:0:b0:48d:f214:2440])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3507:b0:4a1:96cd:2f73 with SMTP id 5b1f17b1804b1-4a1fd8cd9e8mr34109435e9.1.1792580489307;
 Wed, 21 Oct 2026 04:01:29 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:00:00 +0100
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021110000.508827-1-vdonnefort@google.com>
Subject: [PATCH v1] KVM: arm64: pkvm: Clear GICv3 LRs in the hypervisor
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_040132_025046_786D21C9 
X-CRM114-Status: GOOD (  13.09  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The LR registers are architecturally UNKNOWN when the CPU boots or
resumes. However, in protected mode, only the used ones are reset.
During boot the HVC __vgic_v3_init_lrs() is never called because
vgic_present is only set in init_subsystems(), after cpu_hyp_init() was
called. Also, the PM notifier isn't registered for pKVM and the HVC
becomes unavailable after the host is deprivileged.

Let the hypervisor itself clear those registers on CPU_ON, resume and
before deprivileging the host.

Cc: stable@vger.kernel.org
Fixes: fa8c3d65538a ("KVM: arm64: Keep nVHE EL2 vector installed")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c   | 3 +++
 arch/arm64/kvm/hyp/nvhe/psci-relay.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index ac64a036b0a9..0e0ca29b224b 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -754,6 +754,9 @@ static void handle___pkvm_create_private_mapping(struct kvm_cpu_context *host_ct
 
 static void handle___pkvm_prot_finalize(struct kvm_cpu_context *host_ctxt)
 {
+	if (hyp_gicv3_nr_lr)
+		__vgic_v3_init_lrs();
+
 	cpu_reg(host_ctxt, 1) = __pkvm_prot_finalize();
 }
 
diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
index e20db999e328..a0e17e416bb5 100644
--- a/arch/arm64/kvm/hyp/nvhe/psci-relay.c
+++ b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
@@ -213,6 +213,9 @@ static void __noreturn __kvm_host_psci_cpu_entry(unsigned long pc, unsigned long
 	write_sysreg_el1(INIT_SCTLR_EL1_MMU_OFF, SYS_SCTLR);
 	write_sysreg(INIT_PSTATE_EL1, SPSR_EL2);
 
+	if (hyp_gicv3_nr_lr)
+		__vgic_v3_init_lrs();
+
 	trace_hyp_exit(host_ctxt, HYP_REASON_PSCI);
 	__host_enter(host_ctxt);
 }

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.56.0.212.g129ede20d9-goog


