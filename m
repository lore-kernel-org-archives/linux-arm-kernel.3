Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DB0E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSmMzjbQjkryanRY9ZazdGejohWYD6afgp49C2Ru5Dk=; b=D2BAa21BoqBAvTEMNJ644PCf8w
	dvIKMO+JbcGbTrBeOH4owHvyEAFdrDoaAar7R6rybk1pzAcb3+XTLwD2BFhECZaQACjX3vUMJmgr7
	hIhO9H8CLJucZXnjTP1yOmM9b28J0v35jxi7in4H4puP7kDXghMCaT6R9yQu6EUDvXmDDGFc6tRn7
	jvI06vVg1knn1PguZ3tZn9lfhfKEIzfU5b5FJCoIkUw0a6KAS+QhQYsVKZc+N60Y/F3P2nOzrwU0H
	dFUWhDVqHsZoXYGziTTD+HHl818C/kAUnvLJT68B88rfcqyfiLU0XfaSy+64DwXupD9hNx9KEbHOw
	t8pYrqSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDQx-0000000GSO3-0GlZ;
	Thu, 05 Dec 2024 15:06:27 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDNz-0000000GRhS-34WU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:03:24 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-385df115288so514103f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 07:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733411001; x=1734015801; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MSmMzjbQjkryanRY9ZazdGejohWYD6afgp49C2Ru5Dk=;
        b=zohTAfkqt0Fr3sqI41vmsi1c2zh0mxSE0XR8z5BTtw8ZZhKQfIGRHMWAp4NL/hZRt/
         27Jah3XQuo8+FXqVn9PqpZ+4EuGvuyK1+xD5KX8Hml2QDItHYvrlp43sDVILFtV939EI
         2lRSrnSBP+KX8BBra+gX5/utqNO3+1y0vtNBKcuKmXEM0I2QNyjqha6PPWXGz8y9Um3J
         n8RdsQJpxgzr0GM3sZSeVnkZ8SOqCbwvX+8Ny7uxvCEwbsfyoSByTCWF3XcCmJn1TXuZ
         cKzwyP0of1WPNLx07uhVUYf8/6VIVl8R2Yd8u4LI4wcBceQzBnBJR5dSowMFzRJJz3qF
         phkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733411001; x=1734015801;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSmMzjbQjkryanRY9ZazdGejohWYD6afgp49C2Ru5Dk=;
        b=E8x59HWHBXcR9BDbJFntKFGk0Naf1Z5+azP8RYWa/kvXKArDkpswNWVOnMnNnBDPs+
         P5gqyQhsc7w42ALbgmHfMqjewVczierCW8M/bVS5fdgVBh8jUOQg3eosJ+W9RzTITRoS
         JczeqI5x9y6yi0s1zTP+QM3r/mBiSqheQAoFz3F7Rc/veuHLDo/JA5T5VturXWDxSnmQ
         MxSn9ivqaku15k5dOSKPr3/z+JCAeyAWHsAxmnLDy3c8kec1uI8WPEJV3Sfn4FGgK5B3
         WCYJDgODAfLY6flTedUC1ZfZSF1cBoJ6UvBxfYul4EbefNuJcgWfs0DbXHBlr7+pw4oz
         iugQ==
X-Gm-Message-State: AOJu0YxHwe/Xvlt6HkT+mb8zFx1Am2v3RUZPQddmQF0JVMq8HM4IYQGB
	YaYKf8tCg0ITWPk1uoZpbjm4nS2bHsJKwBYS/sNwyJfphF6pBicst54ARbwyZLiPj5Z+Ab39+V8
	n+wDvjB+4pKM6nQEYT2/c0mwPf5ZMHvhWsIzmXp2zwMe9/BqsCw5aY/BT/UrifBAgTMbLXC61Jn
	tVIwJfUfWAf8l4sAxH/Tg+EM6/52KUAeigr8ks/5QX
X-Google-Smtp-Source: AGHT+IGeyIS11CyHaOaxzh7fmzkABKWg8TLqFcdiY2/yzqapgMZvhTcty/d5/9mQdd+Tbhk0hutQNOin
X-Received: from wrco4.prod.google.com ([2002:a5d:47c4:0:b0:37d:3332:8544])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1866:b0:385:dc45:ea06
 with SMTP id ffacd0b85a97d-385fd3e7b28mr10077509f8f.13.1733411001451; Thu, 05
 Dec 2024 07:03:21 -0800 (PST)
Date: Thu,  5 Dec 2024 16:02:32 +0100
In-Reply-To: <20241205150229.3510177-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241205150229.3510177-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4458; i=ardb@kernel.org;
 h=from:subject; bh=V2Mgw1B4fdeIa/VDXTw8dxEemYc3zLOlxi/YHPnanpA=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIT3wQGf5Bd4Hn53srYxftN/4VjjXbSLLleot29JX/i0I8
 bGQ/VbaUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZS3Mnwzzj7+c40sVwXvmCx
 rJiTv3USRC9ve9SrNMXqoG5Gyo3TBxkZdvLoqTcm3WLunn+y2i+ucbnKnc1vZrlp+U41E1jGIxr ECAA=
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241205150229.3510177-10-ardb+git@google.com>
Subject: [PATCH v2 2/6] arm64/mm: Override PARange for !LPA2 and use it consistently
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>, 
	Quentin Perret <qperret@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_070323_774785_ED581378 
X-CRM114-Status: GOOD (  16.45  )
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
2.47.0.338.g60cca15819-goog


