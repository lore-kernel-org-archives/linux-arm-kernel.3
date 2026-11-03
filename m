Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8D7606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OuLG7rQT;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a9/m5MI8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FPwct+1U9T6oyA5Ruuz5LB/HvShMdpdhhsQD4HMVAhg=; b=OuLG7rQTUL3++Pdbr5dOq18t5a
	1BJX4UB66B8z0RZPq3jf6CkIf1hit9LQQya3aGAKam6x3BuVUZFaRVFraYa98rfbKAhGiTUfJHzrb
	AXgVjPcb4lrth7oKjhmZlW6spwt63ZoRipEofwvDhZVGemYhdxZmrdvop8x/7hUSt64mZNn/xA7gn
	OsragyEnpxHjCmJSezINOcuxI0CK+TBtH7mb4Mf8PXcQqlWxAZX8jIjcIfzO322F0w4onIZg/LCVg
	07hBF7IPAoA54xM80PjuBNY0gDpS/PsupwWzRpXQAngujh25C117ExVL5ld8ybaa5J851B/OvFHU8
	yrFejhxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOInd-00000003Lr2-2Y6m;
	Tue, 03 Nov 2026 17:59:57 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOInb-00000003Lqi-2UOd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 17:59:57 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-3adad90c894so4624888a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 09:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793728794; x=1794333594; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPwct+1U9T6oyA5Ruuz5LB/HvShMdpdhhsQD4HMVAhg=;
        b=a9/m5MI8g2sZEx74wIFfIN3gIgWGUMZfdpNxM4kwh26g3bY6qeuSFhahEB58Gc3YiO
         pkvdbqVZDjZuLBaH7+jl7ESNdKnUQ9AHEJY2AieD3pH1PmvIHDdET63jvT3T5anE2M9a
         Fi7YGjVuYNzA0WbC0O3k1NIRTjQHm6OqDwY2ls0CddhaLYwUiHmF/EyP85C//ah4aZx3
         xc4OcdLCSIkWhwbzZBHQ5g96XYCpUrQJTkMckBCCiLCzmRze+eGS/pMj+6W2OiyaUZBQ
         uUdJzpUIB1bsoUSL6ko4eRFfaWpTS+M17M7vhOxHw3Xi/T1sheQ9LeGdOZrbvNncmvs3
         L3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728794; x=1794333594;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPwct+1U9T6oyA5Ruuz5LB/HvShMdpdhhsQD4HMVAhg=;
        b=xbcmLjFcaYKQGDE5mOhY/ZQp/fThmO5unTnlWW7ybZGWbCSDIGmBl/Fhp4lkEgGBiy
         Q9fXMYwq/bToxCJXVEFjyOEiVPPNREBuUjn1YIGpqPj12TDI4QicdtZnzCicsXaY82s8
         iO6hax/Q0aa1VaeLjjH64FU7pG9Cynwb/uZW/mBukGawWxj2jbexEXAUdqKnMqA45F7y
         3buo+wq1uw87rc8vTyeW22/9tpQx370LmDplUn1fDYac0AgwbaRCStch9S3RcqfzQoEs
         /P3J9k8HjvNYSgT3tZ0Usgn8VF0vqbBiHeKAWLZyaVYNQs8DdcyizAn8UtEOV8/HUu7o
         +1sw==
X-Forwarded-Encrypted: i=1; AKwUvBwgDGzvS8hLNXZH5ww09vyflNG8yqGBY5IHIKqSd8GfOZuJCehj/zcIs5urMu827t10dB55ZGO+7ImyEZk+/mqL@lists.infradead.org
X-Gm-Message-State: APuU4Z/QRPWT3R/JkOHxBA+LK6nJuhCus0iwmibVTir+vY2E9uKzcObL
	vB95V5tdHhix7SEUt5AB0S1CJWiOIRpsCQIgLnl8EANVFU0+EsaVq4HLgcyRzC9TZwwZSw==
X-Received: from pggs9.prod.google.com ([2002:a63:dc09:0:b0:ccb:62e:3f01])
 (user=wvw job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b0d:b0:3ac:9e5e:d1a9
 with SMTP id 98e67ed59e1d1-3ae897ec5b1mr11095151a91.20.1793728793847; Tue, 03
 Nov 2026 09:59:53 -0800 (PST)
Date: Tue,  3 Nov 2026 17:59:41 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103175941.1349818-1-wvw@google.com>
Subject: [PATCH v2] arm64: suspend: Save and restore TPIDR2_EL0 across CPU suspend
From: Wei Wang <wvw@google.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: broonie@kernel.org, mark.rutland@arm.com, rafael@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, wei.vince.wang@gmail.com, 
	stable@vger.kernel.org, Wei Wang <wvw@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_095955_655806_8184273D 
X-CRM114-Status: GOOD (  12.15  )
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

TPIDR2_EL0 is a live EL0 register on systems with SME, but
cpu_do_suspend()/cpu_do_resume() don't preserve it. Its value is
UNKNOWN after a warm reset, so the task that initiates suspend can
return to userspace with a corrupted TPIDR2_EL0.

Save and restore it alongside TPIDR_EL0 and TPIDRRO_EL0. The new slot
fits in existing padding, so sizeof(struct cpu_suspend_ctx) is
unchanged.

Fixes: a9d691585950 ("arm64/sme: Implement support for TPIDR2")
Cc: stable@vger.kernel.org
Acked-by: Will Deacon <will@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Wei Wang <wvw@google.com>
---
v2:
 - Trim commit message (Will)
 - Keep mrs_s/msr_s as TPIDR2_EL0 isn't in tools/sysreg yet (Catalin)
 - Collect Acked-by/Reviewed-by tags
v1: https://lore.kernel.org/r/20261102234813.1069156-1-wvw@google.com

 arch/arm64/include/asm/suspend.h | 2 +-
 arch/arm64/mm/proc.S             | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/suspend.h b/arch/arm64/include/asm/suspend.h
index eb60c9735553..2cc5fb405769 100644
--- a/arch/arm64/include/asm/suspend.h
+++ b/arch/arm64/include/asm/suspend.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_SUSPEND_H
 #define __ASM_SUSPEND_H
 
-#define NR_CTX_REGS 14
+#define NR_CTX_REGS 15
 #define NR_CALLEE_SAVED_REGS 12
 
 /*
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 7afbece885a3..c7b7fa6491c3 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -103,6 +103,10 @@ SYM_FUNC_START(cpu_do_suspend)
 alternative_if ARM64_HAS_TCR2
 	mrs	x2, REG_TCR2_EL1
 	str	x2, [x0, #104]
+alternative_else_nop_endif
+alternative_if ARM64_SME
+	mrs_s	x2, SYS_TPIDR2_EL0
+	str	x2, [x0, #112]
 alternative_else_nop_endif
 	ret
 SYM_FUNC_END(cpu_do_suspend)
@@ -142,6 +146,10 @@ alternative_if ARM64_HAS_TCR2
 	ldr	x2, [x0, #104]
 	msr	REG_TCR2_EL1, x2
 alternative_else_nop_endif
+alternative_if ARM64_SME
+	ldr	x2, [x0, #112]
+	msr_s	SYS_TPIDR2_EL0, x2
+alternative_else_nop_endif
 
 	msr	sctlr_el1, x12
 	set_this_cpu_offset x13
-- 
2.56.0.385.gac671c819a-goog


