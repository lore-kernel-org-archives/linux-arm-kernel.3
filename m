Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5F4606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mVUcgdlW;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=m+co55mb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j+pgUU2lCypiF+bjpCYVvnGGlayFnQSVpYHqlC0Ubm8=; b=mVUcgdlWU36eZa43zUuTbr0BnT
	m1JBCF0ZXRnshfZeXf/cwX+rSMZnswccpR+txkwvVi8FXJI9HhOPuwV9XCWMTyEfUh1TQe5cNLuvb
	w6W8En0NRSg0c5rMhHcfhyFrJwvwlr3Ky1JkLWoZlpuAZXJiClnSo8crGu5u/4+mR+eQqCGIZfrKX
	fS1T5zkIPPPMIug2ndR/fx0YqvY9rEM1WxRD8yQjXplvDP5mfngpIMEZHm3+RUzoGNJofA+seBRZn
	iu2GJmcUsgVaeKCfBJ53M+W7Ut4f8DpVbRFZ88kqQ9/Nsjgp29w63tLIftV5wNXcqaNXk82P+b7kR
	NHyWQuzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNjs-00000002uD2-1Mlr;
	Mon, 26 Oct 2026 16:40:00 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNjk-00000002u9j-1F3m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:39:53 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4a1d1f26a63so32647055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793032790; x=1793637590; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+pgUU2lCypiF+bjpCYVvnGGlayFnQSVpYHqlC0Ubm8=;
        b=m+co55mbZAwhdvYV72IvUsrHylHKDGQOk2GXsfTclAa6BhT++gaP62Z91FDo/TZn36
         Ft+D4ti/R2M42SgMTrBXEcbe48mEKfs+6OlCPBLcXotqhf3CuzaobKcz47XdILLwbnXb
         vCZn/Yy2C1gFA67gdAUFZL6gDRXqVBj0DApQo02V6H6uyWJNuX2R1ClZjxh3E8dPyRuJ
         CCk+rBRt6Xw7P6bFRyhgQO9C9ioj79aKaUZ1/98eF3wzsdpewzlv5hWx6i5KMIYC74A3
         3uCYle6oFdikZ6fGkm07jI8M7wHw1j1Cg5jylyELvx5EwvjFxmk1bjoqiCdVMD64CWS2
         ZGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032790; x=1793637590;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j+pgUU2lCypiF+bjpCYVvnGGlayFnQSVpYHqlC0Ubm8=;
        b=wmAd3AHIeiop3g1pfyUyE77AEzub8Nw1KQtx/jpnDRb6urwjkLHYiu4EShWY7aAbVm
         7+Lh/arWXlovpRAujjD7qpNC3SuxfYlpoVo7gjyRZa88LJeqTKdT2cuZVlbiqsmg66NH
         nCWDHQ26HP35+/DWr6jyoKgUHj/+8flLQcEU28slvtj0j9uDxrBMcqL0fjmEVDsV8y5g
         i6aIiGqcKEoa9KxkIglMiW566H/l4H7cIIDGKvANceKupiATTcddq5o8yrMn5wrt9x/P
         zQR5cFTji5mT5ms6/RtrnIl9rUHPH3vcxB+YKIuev+H7Qy1To9UQS7u4/UmpiT5D9IOW
         nZSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzf/wHrOlCgHvXUioH0s1OAlzsWUWLDnhBk6vSM4eFrtIPzJaHfY6QrVOO96Cc3j3UTGZfjgrYUsJu5WeLO++Bi@lists.infradead.org
X-Gm-Message-State: AFq9FYLlNS0uT4PpayyuVWE+a5ufAwrLi72/hR5797BR530fdUHQktkZ
	3F6042qSqo6jEDdCXuSSpAQt3XbHaROIxHnyg1ynBBaOU6yTtmAm/HIQje/xKP/lEqpCMGLSWOE
	YnCfraAcmNiqIWNTwjoLtCQ==
X-Received: from wmv5.prod.google.com ([2002:a05:600c:26c5:b0:4a2:c1:cb3f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c0c8:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4a4de702b8bmr87155095e9.22.1793032789761;
 Mon, 26 Oct 2026 09:39:49 -0700 (PDT)
Date: Mon, 26 Oct 2026 16:39:35 +0000
In-Reply-To: <20261026163937.963087-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261026163937.963087-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261026163937.963087-2-vdonnefort@google.com>
Subject: [PATCH v3 1/3] KVM: arm64: Make __vgic_v3_init_lrs HVC always available
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_093952_355018_0498478C 
X-CRM114-Status: GOOD (  12.92  )
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

The __vgic_v3_init_lrs hypercall only resets the vGIC LRs. Those
registers are expected to be 0 when the host is running. As a
consequence, it is completely safe to make it available at all times,
even when pKVM is enabled and the host was deprivileged.

Fixes: 057bed206f70 ("KVM: arm64: Disable privileged hypercalls after pKVM finalisation")
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_asm.h   | 2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index e5b92ac09e69..ca7e55d8eec3 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -60,7 +60,6 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_create_private_mapping,
 	__KVM_HOST_SMCCC_FUNC___pkvm_cpu_set_vector,
 	__KVM_HOST_SMCCC_FUNC___kvm_enable_ssbs,
-	__KVM_HOST_SMCCC_FUNC___vgic_v3_init_lrs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_get_gic_config,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_MIN_PKVM),
@@ -85,6 +84,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___tracing_reset,
 	__KVM_HOST_SMCCC_FUNC___tracing_enable_event,
 	__KVM_HOST_SMCCC_FUNC___tracing_write_event,
+	__KVM_HOST_SMCCC_FUNC___vgic_v3_init_lrs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_save_aprs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index ac64a036b0a9..c1f0de3ec43f 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -627,7 +627,8 @@ static void handle___vgic_v3_get_gic_config(struct kvm_cpu_context *host_ctxt)
 
 static void handle___vgic_v3_init_lrs(struct kvm_cpu_context *host_ctxt)
 {
-	__vgic_v3_init_lrs();
+	if (hyp_gicv3_nr_lr)
+		__vgic_v3_init_lrs();
 }
 
 static void handle___vgic_v3_save_aprs(struct kvm_cpu_context *host_ctxt)
@@ -910,7 +911,6 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_create_private_mapping),
 	HANDLE_FUNC(__pkvm_cpu_set_vector),
 	HANDLE_FUNC(__kvm_enable_ssbs),
-	HANDLE_FUNC(__vgic_v3_init_lrs),
 	HANDLE_FUNC(__vgic_v3_get_gic_config),
 	HANDLE_FUNC(__pkvm_prot_finalize),
 
@@ -931,6 +931,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__tracing_reset),
 	HANDLE_FUNC(__tracing_enable_event),
 	HANDLE_FUNC(__tracing_write_event),
+	HANDLE_FUNC(__vgic_v3_init_lrs),
 	HANDLE_FUNC(__vgic_v3_save_aprs),
 	HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
 	HANDLE_FUNC(__vgic_v5_save_apr),
-- 
2.56.0.257.gf7497c7d27-goog


