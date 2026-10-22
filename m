Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0440606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yci/Iwht;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=MipGdAG5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DDcj+XA234WUvgr54FY6eq3G8Ym1mfS+MXix3z476cY=; b=Yci/Iwht5afW3ipgA2W1wdaE2D
	tDCsZ+m5twRAJyd4TCj2U6NadnkEXGZzjokAgzC57Nb9ZzVbaonkaFy2C1LzgxXzA/gTpk/abPVkw
	DjZtpjNsXxDolyv5JXpdv6wCNrIdl0o3GrVMm2IVRqleGsLQnR0FibOktSLpW+y8bsdrfVH4ItVAs
	G1gG+3xYXzgDKdxuur0Kz4NQcExpg59sjpJg0gEhu4aEuIUWhJ3QHEUyIstAPH3o6eIvVaTbctBSh
	v96KE4LpIY0Cr481ZG24uTIKnGrWBcxwYnqk3tAyfXC4/OUFLpa8ZVfdvcJCuBrKR3ZQogZk0JeT0
	geXTVX8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtN6-0000000EFmP-0QnA;
	Thu, 22 Oct 2026 14:02:20 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtN0-0000000EFjk-18Aa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:02:15 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so15079875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792677731; x=1793282531; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDcj+XA234WUvgr54FY6eq3G8Ym1mfS+MXix3z476cY=;
        b=MipGdAG5ECRIMsst3+SfTParZtTtLuZM+4ZTySQXW2d7r7+tEI2bUueKWGN3EXHgoz
         O3e7RYX+fd2sYIoi6Umhtvu6Br8YQjKRNvX1nl5EbGGedPvx6KOKPtzibnhh+DXyAn9e
         cuVaiexIyZvcdPiIXsZKtyZNclqrfDRm52S9wKfy+v8PpfBXRwdJZY1btzBo5asuMvvl
         xuVmX83mZ6dF/2naLgKnoNqyb7+Pdi4fWBTce6DTHA9bsY6o+gfmkY7zgZ5627dyKBwu
         7nZCatZqiYaiy3G5UP74OawpIYecJVi999gc8rTafjJK8447iDkyYjA6fGtnO7BlSYnj
         V0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677731; x=1793282531;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDcj+XA234WUvgr54FY6eq3G8Ym1mfS+MXix3z476cY=;
        b=K1JGKZChTk9d3ysc924WkIcCKrkNKVrffAV7ZBezRgFC9/sZZX1nmG60mLnayl4sYp
         oLhsvHjQ5OEdzC+nxBxNEGX77YNVIAzbz/Sj/GAKGfed3LPUtRZ2sk77fvdCLuRdhPyO
         YCt8QrYOVXRK598XgbEy2QPj6mRirmjL5whdad1L7mzCqgRbrXlGdD81nENIIHaduJD1
         EtD3t76EuV+B4JELURwJ1PDg4XrYzEmg5DmtkCukbRQA4ON0eZj9S8dxhbZHhHi2O/7b
         w56HCpEzaMsWFz55MaS7OB85bitZCxf947siQOLu4FI3s2EPACz+20ldSy4mV+ony2Pn
         yQZA==
X-Forwarded-Encrypted: i=1; AKwUvByk6X0Q3LQMvVwqxBi3pTY0eRari+BaegFHN13YeaJxN9IY+3DkMxdhTEiREHS1Y3BsGs+C+2IJL2NjhBD3Zrxh@lists.infradead.org
X-Gm-Message-State: AFq9FYIncDKJGGjpuzLDnROnQ7OWfSUv52k5mZv+8epcCDJ+60a9efFI
	kpelptmCkCOA0DqfAo7Ubw04qYfafH0GwfsAW1FLMsLLX86vA9OsjQTtWqOsHSuuFUgcl/h8wRK
	NyVEgOBweLZiBwZCcSwtCFQ==
X-Received: from wmbf2.prod.google.com ([2002:a05:600c:5942:b0:4a1:a7f8:c12f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6309:b0:4a0:1f90:594b with SMTP id 5b1f17b1804b1-4a1fdd293d6mr93006725e9.22.1792677731088;
 Thu, 22 Oct 2026 07:02:11 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:00:45 +0100
In-Reply-To: <20261022140048.2522787-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261022140048.2522787-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022140048.2522787-2-vdonnefort@google.com>
Subject: [PATCH v2 1/4] KVM: arm64: Make __vgic_v3_init_lrs HVC always available
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_070214_323305_8A809975 
X-CRM114-Status: GOOD (  13.20  )
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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


