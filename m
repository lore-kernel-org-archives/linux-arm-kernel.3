Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D4AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 08:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hytoeGuBGhQsTErvMf3yZxZWvdEkxkHmgM5PMFEUtg=; b=c855Qkz7GOC1BP33HrYRZiRtUt
	AefcJ3XSWIySyhLq4MXSDE35xXI0yfuDTnavCVCS3kaDubfitvG+QLN2SRBqhza9r2FnHj74QpU+X
	spnB8v8IdWkX8sOlNKIFgemKdoF0cBE1jyQGb0JQSNBJDnYgulnsXXC29Pn9RoqEsR1+4yMB/gGvr
	Ed5/NL++8kPZ9xAMX47kX5eUKIvku8XmGtr39VxveMzALLaC6iztB06fSOYeFizShQF/HO+PCa6Ux
	eQzUkPB+VbDLxsbU/fV2dByYXeVT+IFo+oQcOehXTsG1C3USFPkHCyeXFyZpO/fnRLG8+e9SUiwVz
	Z9wDfxnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeTI-0000000HHlo-2bff;
	Thu, 12 Dec 2024 08:22:56 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLePW-0000000HGjC-42JD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 08:19:04 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4359eb032c9so2524235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 00:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733991541; x=1734596341; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2hytoeGuBGhQsTErvMf3yZxZWvdEkxkHmgM5PMFEUtg=;
        b=lfJNeMRlLd3k1ktDqVv+wFDofoBreG8mwjcMkpiBleLZhapDNfs86dpbMTse9y6AvX
         +fFVLhOiN/S0zi97GetZhdv/y0QqHDhvaa/3A41ncARqJO2hpV8QNq/rcNtTBnR66pSL
         iEE0GmtQ0e53ZE/t5hktjsDiSgUtJ7EhZYAsyxn3e9Ty0WAeYQg7fwWZfbuDvXru1z8O
         hOl1spQzGgNzosd78x16S1ipm6QCzHX3m49cFcCSctF7hSOrdMP3/d/sy+BpD4H+Uo9O
         jKn4DJxUhAQY/00FQZ/3W0fBhl0E5iEowd1qtmteCgvqZ7fj3aErv0bh83zbrDYdGSh6
         4rNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733991541; x=1734596341;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2hytoeGuBGhQsTErvMf3yZxZWvdEkxkHmgM5PMFEUtg=;
        b=iIsvRCU0owQg/62mE3FAHr3YLu6IPCH+978GtsKt+xvEYLlBNglZknUSNZaTJMncmo
         rijQEsVwMMBNb5zUdvxrL+pWetruguXQwIA4nZLLO1jYPUXt+Dr/J/akaWiRjJr5ftD7
         3aoAZMpiHKebywYcrQFWRFR5kWzjAVZZA/nOTZt9p6v+dnu4hJORtxrJCxsVLQKVs+dW
         aPNE2W0EWOhez68ODFQrAzC1yixFNNCElCzN9h71NSfpbqOzHV8fOFcziUPpSaUTabkN
         6l5SQq3PJC82imFyMuJJLAB+x0O7O2lcr2+JogkXDz/6/ia1yZHTCLPsrNq58sJv+dUN
         m24g==
X-Gm-Message-State: AOJu0YxkbXPx6QEoerf22zonQ0tBMxFgVJuRNO5mKwUxED79BYUFLRtl
	/Axc8oPoguTqKtbfgt4lyQg9JpwqcGWbQVXp1MKz2T983UUbEl8dqwq2C3AzxsrSJLfQlK17kvU
	D5KqKT5rjYYiJluxWECWB06XtfR242/U4LfHN5Gf8QMDB3R7ERG1arvG4L68dakcNtQYhYCmSTN
	PqtSj9ErdRfW4pKkPksd6/7KvtFczMxjA2xaIXQHba
X-Google-Smtp-Source: AGHT+IEGYsYtFhuo1M+mXxwr1oPLrb4FHzvmxqJpmKzmSM6VR7FR039Eo4mTnt9ojOSbZqHRyAKca3wz
X-Received: from wmee4.prod.google.com ([2002:a05:600c:2184:b0:434:f2eb:aa72])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:190c:b0:434:fe62:28c1
 with SMTP id 5b1f17b1804b1-43622842fe4mr19916235e9.18.1733991541383; Thu, 12
 Dec 2024 00:19:01 -0800 (PST)
Date: Thu, 12 Dec 2024 09:18:44 +0100
In-Reply-To: <20241212081841.2168124-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241212081841.2168124-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4458; i=ardb@kernel.org;
 h=from:subject; bh=sxVQfPUsQxyoLylOvN26XLQadF9/wxwUb33vSk2ahfI=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIT1qTur1D0H+U+c0Oh3k/7fY2m9Tvtv6JrPF/g+Z/q4oz
 2tbGnKoo5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEykxIXhf/BxLV/To+f/h2of
 CzpiU5aroGt51O/cxPIvmscNVMwOP2Bk+F9k6SMTXssv+fCnKHMSz4GvK3OWVls23FAM+LvUb8o KBgA=
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212081841.2168124-10-ardb+git@google.com>
Subject: [PATCH v3 2/6] arm64/mm: Override PARange for !LPA2 and use it consistently
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>, 
	Quentin Perret <qperret@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_001903_010953_9D850F4A 
X-CRM114-Status: GOOD (  16.80  )
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

From: Ard Biesheuvel <ardb@kernel.org>

When FEAT_LPA{,2} are not implemented, the ID_AA64MMFR0_EL1.PARange and
TCR.IPS values corresponding with 52-bit physical addressing are
reserved.

Setting the TCR.IPS field to 0b110 (52-bit physical addressing) has side
effects, such as how the TTBRn_ELx.BADDR fields are interpreted, and so
it is important that disabling FEAT_LPA2 (by overriding the
ID_AA64MMFR0.TGran fields) also presents a PARange field consistent with
that.

So limit the field to 48 bits unless LPA2 is enabled, and update
existing references to use the override consistently.

Fixes: 352b0395b505 ("arm64: Enable 52-bit virtual addressing for 4k and 16k granule configs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/assembler.h    | 5 +++++
 arch/arm64/kernel/cpufeature.c        | 2 +-
 arch/arm64/kernel/pi/idreg-override.c | 9 +++++++++
 arch/arm64/kernel/pi/map_kernel.c     | 6 ++++++
 arch/arm64/mm/init.c                  | 7 ++++++-
 5 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 3d8d534a7a77..ad63457a05c5 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -343,6 +343,11 @@ alternative_cb_end
 	// Narrow PARange to fit the PS field in TCR_ELx
 	ubfx	\tmp0, \tmp0, #ID_AA64MMFR0_EL1_PARANGE_SHIFT, #3
 	mov	\tmp1, #ID_AA64MMFR0_EL1_PARANGE_MAX
+#ifdef CONFIG_ARM64_LPA2
+alternative_if_not ARM64_HAS_VA52
+	mov	\tmp1, #ID_AA64MMFR0_EL1_PARANGE_48
+alternative_else_nop_endif
+#endif
 	cmp	\tmp0, \tmp1
 	csel	\tmp0, \tmp1, \tmp0, hi
 	bfi	\tcr, \tmp0, \pos, #3
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6ce71f444ed8..f8cb8a6ab98a 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3478,7 +3478,7 @@ static void verify_hyp_capabilities(void)
 		return;
 
 	safe_mmfr1 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR1_EL1);
-	mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
+	mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
 	mmfr1 = read_cpuid(ID_AA64MMFR1_EL1);
 
 	/* Verify VMID bits */
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index 22159251eb3a..c6b185b885f7 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -83,6 +83,15 @@ static bool __init mmfr2_varange_filter(u64 val)
 		id_aa64mmfr0_override.val |=
 			(ID_AA64MMFR0_EL1_TGRAN_LPA2 - 1) << ID_AA64MMFR0_EL1_TGRAN_SHIFT;
 		id_aa64mmfr0_override.mask |= 0xfU << ID_AA64MMFR0_EL1_TGRAN_SHIFT;
+
+		/*
+		 * Override PARange to 48 bits - the override will just be
+		 * ignored if the actual PARange is smaller, but this is
+		 * unlikely to be the case for LPA2 capable silicon.
+		 */
+		id_aa64mmfr0_override.val |=
+			ID_AA64MMFR0_EL1_PARANGE_48 << ID_AA64MMFR0_EL1_PARANGE_SHIFT;
+		id_aa64mmfr0_override.mask |= 0xfU << ID_AA64MMFR0_EL1_PARANGE_SHIFT;
 	}
 #endif
 	return true;
diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
index f374a3e5a5fe..e57b043f324b 100644
--- a/arch/arm64/kernel/pi/map_kernel.c
+++ b/arch/arm64/kernel/pi/map_kernel.c
@@ -136,6 +136,12 @@ static void noinline __section(".idmap.text") set_ttbr0_for_lpa2(u64 ttbr)
 {
 	u64 sctlr = read_sysreg(sctlr_el1);
 	u64 tcr = read_sysreg(tcr_el1) | TCR_DS;
+	u64 mmfr0 = read_sysreg(id_aa64mmfr0_el1);
+	u64 parange = cpuid_feature_extract_unsigned_field(mmfr0,
+							   ID_AA64MMFR0_EL1_PARANGE_SHIFT);
+
+	tcr &= ~TCR_IPS_MASK;
+	tcr |= parange << TCR_IPS_SHIFT;
 
 	asm("	msr	sctlr_el1, %0		;"
 	    "	isb				;"
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index d21f67d67cf5..2b2289d55eaa 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -280,7 +280,12 @@ void __init arm64_memblock_init(void)
 
 	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
 		extern u16 memstart_offset_seed;
-		u64 mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
+
+		/*
+		 * Use the sanitised version of id_aa64mmfr0_el1 so that linear
+		 * map randomization can be enabled by shrinking the IPA space.
+		 */
+		u64 mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
 		int parange = cpuid_feature_extract_unsigned_field(
 					mmfr0, ID_AA64MMFR0_EL1_PARANGE_SHIFT);
 		s64 range = linear_region_size -
-- 
2.47.1.613.gc27f4b7a9f-goog


