Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2B3FA1FDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 17:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j05evVTJoFi4nPqM9vHvWwCsjf2KXcfy9+lOE3+LEQ4=; b=M+yfF1MuQPcfV6LyMdnKjkFj+Z
	NaSZYvnwY4MazOR35BINdc16BB0CgxuwngS8h5EM7MbKHyRuhQ1tsSvv+UgNmO48yXP0OHDz1pclZ
	rvA7Jamf41Un8fcaVDM6fcfHfWYWheGIoASZmesd6i8DJq2kS5FhlYqT4l6UPouswAexcDjlmxokd
	ZMiC54/qPj/jlgMNSD55O7hrfEA6g9pwcj/uMMHzcHoSJaEcIS6/NqR9kUYddE23cpfaVD5x5vIFJ
	4By5FZG5U5P18deXIdmbf476phHnt9XT15jM+BI6yC6qMfrbj4hYtOgf5/SvLJgA10zSUPFWu7T3d
	wXqpCzhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbCa-0000000AYZ2-1ogY;
	Wed, 22 Apr 2026 17:17:28 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbCT-0000000AYTZ-430V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 17:17:24 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-488c2a4e257so44085435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 10:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776878240; x=1777483040; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j05evVTJoFi4nPqM9vHvWwCsjf2KXcfy9+lOE3+LEQ4=;
        b=KnaKJNXdt0GCfUETfDetIQs67+k+n3rSZz803D5+YYeTY3M0tgauapvwFpQkUdRe5F
         3CsangJLIhhR2eQELG6ulrG3e/YSQYVKPNG+YA2P1B6MT7YzomBpNOg9HoG9q3IlJTj/
         wO+492gwZ47za6n1BOCHedTmw3fzc0l3KSYUjjxtzkZOEGnC88RmAuKLp7IC90+i6/aj
         v2/hZ76wwFmBKhBUz64imQvEMfJIucVfyigkIOSqwYOtAeK4tIG7ALpS/spZIemY9J69
         oE1HVUVv/Yg0L0rimodxSdchLvr4eQTZOpL215DmU5xj0wgmJ2pGBGzJKZfal4FF3IxX
         raBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776878240; x=1777483040;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j05evVTJoFi4nPqM9vHvWwCsjf2KXcfy9+lOE3+LEQ4=;
        b=Ezt05fB8BniHumLr96fn5pigI9FjZNAevXfgsiENfjQCKatdrQIIa8whewgeZVSExp
         VJLXFW+8mFoONoILJj8oZeWw+DLTE5L54yNqrF7XKNBZhjLM07h5FtqxU8K6yjSWZo4a
         D/rv+arCVJ++ycqRefh4kz6c8awYsVwuxNHsu8v1EiLGae5HGZ8BUTxg/JlbgBOq8JWn
         DP0YoHSWw37n5u47ZLG2erI7T5cCeywJfyYfLz2aw22pSonPpSpy/x3LYtggflEgJoNz
         /9XZwTEmO+PDc5EYMflTUSSvNY5q0ZQfB1VHEdtQ6OsXy/LFGGtaiTXh5bgfsUhN/Cni
         h08A==
X-Gm-Message-State: AOJu0Yyn92DdSgw7JsTLgbTFYTLMcVWS0eYke0v3U4Mhj7EBrbhiGE++
	lft/TM+VrgvpwFkcvqauhtdbsSXPyRXfjE3ojJpgp8/HTjhwQysrJ87uRBoVQDQwkiaFWhHk3Fb
	g0FnHTeFph7pDbcEC6fDlJkNrcyvhAw9gpdG6biHOJQNr8QqjK5YMLX4e/zGUSGO+whkrddMkyl
	OmdogWtbfT6O22fngFZUlzxPQH58tYasL+hcqT0RWComKN
X-Received: from wmey23.prod.google.com ([2002:a05:600c:2b17:b0:489:201f:2be])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3513:b0:488:a977:8de
 with SMTP id 5b1f17b1804b1-488fb77a3a7mr340342055e9.16.1776878239419; Wed, 22
 Apr 2026 10:17:19 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:16:59 +0200
In-Reply-To: <20260422171655.3437334-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20260422171655.3437334-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=15841; i=ardb@kernel.org;
 h=from:subject; bh=5HxTnqdIs1fSiI9qa7d5k7esps358zo//dxEAHMwChI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfMlU2/+jyuTpVQ+ubxfznXk/FNNiWky/efi9prJCtnoP
 1TJn/ugo5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzkcTLD//Sfx1d1CJr3HNrs
 faTm+5Xs1MNzFCbOcQi5sGLeKr/3j9UYGfZZnOvrfCTtFfDBs5Bj35a3i2XeJvyvevHJQnKG0k7 TP8wA
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260422171655.3437334-13-ardb+git@google.com>
Subject: [PATCH 3/8] xor/arm64: Use shared NEON intrinsics implementation from
 32-bit ARM
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-raid@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_101723_630630_364EB5A8 
X-CRM114-Status: GOOD (  17.38  )
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

Tweak the arm64 code so that the pure NEON intrinsics implementation of
XOR is shared between arm64 and ARM. While at it, rename the arm64
specific piece xor-eor3.c to reflect that only the version based on the
EOR3 instruction is kept there.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/raid/xor/Makefile         |   7 +-
 lib/raid/xor/arm64/xor-eor3.c | 146 +++++++++
 lib/raid/xor/arm64/xor-neon.c | 312 --------------------
 lib/raid/xor/xor-neon.c       |   4 +
 4 files changed, 154 insertions(+), 315 deletions(-)

diff --git a/lib/raid/xor/Makefile b/lib/raid/xor/Makefile
index d78400f2427a..e8ecec3c09f9 100644
--- a/lib/raid/xor/Makefile
+++ b/lib/raid/xor/Makefile
@@ -19,7 +19,8 @@ xor-$(CONFIG_ARM)		+= arm/xor.o
 ifeq ($(CONFIG_ARM),y)
 xor-$(CONFIG_KERNEL_MODE_NEON)	+= xor-neon.o arm/xor-neon-glue.o
 endif
-xor-$(CONFIG_ARM64)		+= arm64/xor-neon.o arm64/xor-neon-glue.o
+xor-$(CONFIG_ARM64)		+= xor-neon.o arm64/xor-eor3.o \
+				   arm64/xor-neon-glue.o
 xor-$(CONFIG_CPU_HAS_LSX)	+= loongarch/xor_simd.o
 xor-$(CONFIG_CPU_HAS_LSX)	+= loongarch/xor_simd_glue.o
 xor-$(CONFIG_ALTIVEC)		+= powerpc/xor_vmx.o powerpc/xor_vmx_glue.o
@@ -34,8 +35,8 @@ obj-y				+= tests/
 CFLAGS_xor-neon.o		+= $(CC_FLAGS_FPU) -I$(src)/$(SRCARCH)
 CFLAGS_REMOVE_xor-neon.o	+= $(CC_FLAGS_NO_FPU)
 
-CFLAGS_arm64/xor-neon.o		+= $(CC_FLAGS_FPU)
-CFLAGS_REMOVE_arm64/xor-neon.o	+= $(CC_FLAGS_NO_FPU)
+CFLAGS_arm64/xor-eor3.o		+= $(CC_FLAGS_FPU)
+CFLAGS_REMOVE_arm64/xor-eor3.o	+= $(CC_FLAGS_NO_FPU)
 
 CFLAGS_powerpc/xor_vmx.o	+= -mhard-float -maltivec \
 				   $(call cc-option,-mabi=altivec) \
diff --git a/lib/raid/xor/arm64/xor-eor3.c b/lib/raid/xor/arm64/xor-eor3.c
new file mode 100644
index 000000000000..e44016c363f1
--- /dev/null
+++ b/lib/raid/xor/arm64/xor-eor3.c
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/cache.h>
+#include <asm/neon-intrinsics.h>
+#include "xor_impl.h"
+#include "xor_arch.h"
+#include "xor-neon.h"
+
+extern void __xor_eor3_2(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2);
+
+static inline uint64x2_t eor3(uint64x2_t p, uint64x2_t q, uint64x2_t r)
+{
+	uint64x2_t res;
+
+	asm(ARM64_ASM_PREAMBLE ".arch_extension sha3\n"
+	    "eor3 %0.16b, %1.16b, %2.16b, %3.16b"
+	    : "=w"(res) : "w"(p), "w"(q), "w"(r));
+	return res;
+}
+
+static void __xor_eor3_3(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3)
+{
+	uint64_t *dp1 = (uint64_t *)p1;
+	uint64_t *dp2 = (uint64_t *)p2;
+	uint64_t *dp3 = (uint64_t *)p3;
+
+	register uint64x2_t v0, v1, v2, v3;
+	long lines = bytes / (sizeof(uint64x2_t) * 4);
+
+	do {
+		/* p1 ^= p2 ^ p3 */
+		v0 = eor3(vld1q_u64(dp1 + 0), vld1q_u64(dp2 + 0),
+			  vld1q_u64(dp3 + 0));
+		v1 = eor3(vld1q_u64(dp1 + 2), vld1q_u64(dp2 + 2),
+			  vld1q_u64(dp3 + 2));
+		v2 = eor3(vld1q_u64(dp1 + 4), vld1q_u64(dp2 + 4),
+			  vld1q_u64(dp3 + 4));
+		v3 = eor3(vld1q_u64(dp1 + 6), vld1q_u64(dp2 + 6),
+			  vld1q_u64(dp3 + 6));
+
+		/* store */
+		vst1q_u64(dp1 + 0, v0);
+		vst1q_u64(dp1 + 2, v1);
+		vst1q_u64(dp1 + 4, v2);
+		vst1q_u64(dp1 + 6, v3);
+
+		dp1 += 8;
+		dp2 += 8;
+		dp3 += 8;
+	} while (--lines > 0);
+}
+
+static void __xor_eor3_4(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3,
+		const unsigned long * __restrict p4)
+{
+	uint64_t *dp1 = (uint64_t *)p1;
+	uint64_t *dp2 = (uint64_t *)p2;
+	uint64_t *dp3 = (uint64_t *)p3;
+	uint64_t *dp4 = (uint64_t *)p4;
+
+	register uint64x2_t v0, v1, v2, v3;
+	long lines = bytes / (sizeof(uint64x2_t) * 4);
+
+	do {
+		/* p1 ^= p2 ^ p3 */
+		v0 = eor3(vld1q_u64(dp1 + 0), vld1q_u64(dp2 + 0),
+			  vld1q_u64(dp3 + 0));
+		v1 = eor3(vld1q_u64(dp1 + 2), vld1q_u64(dp2 + 2),
+			  vld1q_u64(dp3 + 2));
+		v2 = eor3(vld1q_u64(dp1 + 4), vld1q_u64(dp2 + 4),
+			  vld1q_u64(dp3 + 4));
+		v3 = eor3(vld1q_u64(dp1 + 6), vld1q_u64(dp2 + 6),
+			  vld1q_u64(dp3 + 6));
+
+		/* p1 ^= p4 */
+		v0 = veorq_u64(v0, vld1q_u64(dp4 + 0));
+		v1 = veorq_u64(v1, vld1q_u64(dp4 + 2));
+		v2 = veorq_u64(v2, vld1q_u64(dp4 + 4));
+		v3 = veorq_u64(v3, vld1q_u64(dp4 + 6));
+
+		/* store */
+		vst1q_u64(dp1 + 0, v0);
+		vst1q_u64(dp1 + 2, v1);
+		vst1q_u64(dp1 + 4, v2);
+		vst1q_u64(dp1 + 6, v3);
+
+		dp1 += 8;
+		dp2 += 8;
+		dp3 += 8;
+		dp4 += 8;
+	} while (--lines > 0);
+}
+
+static void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3,
+		const unsigned long * __restrict p4,
+		const unsigned long * __restrict p5)
+{
+	uint64_t *dp1 = (uint64_t *)p1;
+	uint64_t *dp2 = (uint64_t *)p2;
+	uint64_t *dp3 = (uint64_t *)p3;
+	uint64_t *dp4 = (uint64_t *)p4;
+	uint64_t *dp5 = (uint64_t *)p5;
+
+	register uint64x2_t v0, v1, v2, v3;
+	long lines = bytes / (sizeof(uint64x2_t) * 4);
+
+	do {
+		/* p1 ^= p2 ^ p3 */
+		v0 = eor3(vld1q_u64(dp1 + 0), vld1q_u64(dp2 + 0),
+			  vld1q_u64(dp3 + 0));
+		v1 = eor3(vld1q_u64(dp1 + 2), vld1q_u64(dp2 + 2),
+			  vld1q_u64(dp3 + 2));
+		v2 = eor3(vld1q_u64(dp1 + 4), vld1q_u64(dp2 + 4),
+			  vld1q_u64(dp3 + 4));
+		v3 = eor3(vld1q_u64(dp1 + 6), vld1q_u64(dp2 + 6),
+			  vld1q_u64(dp3 + 6));
+
+		/* p1 ^= p4 ^ p5 */
+		v0 = eor3(v0, vld1q_u64(dp4 + 0), vld1q_u64(dp5 + 0));
+		v1 = eor3(v1, vld1q_u64(dp4 + 2), vld1q_u64(dp5 + 2));
+		v2 = eor3(v2, vld1q_u64(dp4 + 4), vld1q_u64(dp5 + 4));
+		v3 = eor3(v3, vld1q_u64(dp4 + 6), vld1q_u64(dp5 + 6));
+
+		/* store */
+		vst1q_u64(dp1 + 0, v0);
+		vst1q_u64(dp1 + 2, v1);
+		vst1q_u64(dp1 + 4, v2);
+		vst1q_u64(dp1 + 6, v3);
+
+		dp1 += 8;
+		dp2 += 8;
+		dp3 += 8;
+		dp4 += 8;
+		dp5 += 8;
+	} while (--lines > 0);
+}
+
+__DO_XOR_BLOCKS(eor3_inner, __xor_eor3_2, __xor_eor3_3, __xor_eor3_4,
+		__xor_eor3_5);
diff --git a/lib/raid/xor/arm64/xor-neon.c b/lib/raid/xor/arm64/xor-neon.c
deleted file mode 100644
index 97ef3cb92496..000000000000
--- a/lib/raid/xor/arm64/xor-neon.c
+++ /dev/null
@@ -1,312 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Authors: Jackie Liu <liuyun01@kylinos.cn>
- * Copyright (C) 2018,Tianjin KYLIN Information Technology Co., Ltd.
- */
-
-#include <linux/cache.h>
-#include <asm/neon-intrinsics.h>
-#include "xor_impl.h"
-#include "xor_arch.h"
-#include "xor-neon.h"
-
-static void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2)
-{
-	uint64_t *dp1 = (uint64_t *)p1;
-	uint64_t *dp2 = (uint64_t *)p2;
-
-	register uint64x2_t v0, v1, v2, v3;
-	long lines = bytes / (sizeof(uint64x2_t) * 4);
-
-	do {
-		/* p1 ^= p2 */
-		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
-		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
-		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
-		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
-
-		/* store */
-		vst1q_u64(dp1 +  0, v0);
-		vst1q_u64(dp1 +  2, v1);
-		vst1q_u64(dp1 +  4, v2);
-		vst1q_u64(dp1 +  6, v3);
-
-		dp1 += 8;
-		dp2 += 8;
-	} while (--lines > 0);
-}
-
-static void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2,
-		const unsigned long * __restrict p3)
-{
-	uint64_t *dp1 = (uint64_t *)p1;
-	uint64_t *dp2 = (uint64_t *)p2;
-	uint64_t *dp3 = (uint64_t *)p3;
-
-	register uint64x2_t v0, v1, v2, v3;
-	long lines = bytes / (sizeof(uint64x2_t) * 4);
-
-	do {
-		/* p1 ^= p2 */
-		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
-		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
-		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
-		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
-
-		/* p1 ^= p3 */
-		v0 = veorq_u64(v0, vld1q_u64(dp3 +  0));
-		v1 = veorq_u64(v1, vld1q_u64(dp3 +  2));
-		v2 = veorq_u64(v2, vld1q_u64(dp3 +  4));
-		v3 = veorq_u64(v3, vld1q_u64(dp3 +  6));
-
-		/* store */
-		vst1q_u64(dp1 +  0, v0);
-		vst1q_u64(dp1 +  2, v1);
-		vst1q_u64(dp1 +  4, v2);
-		vst1q_u64(dp1 +  6, v3);
-
-		dp1 += 8;
-		dp2 += 8;
-		dp3 += 8;
-	} while (--lines > 0);
-}
-
-static void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2,
-		const unsigned long * __restrict p3,
-		const unsigned long * __restrict p4)
-{
-	uint64_t *dp1 = (uint64_t *)p1;
-	uint64_t *dp2 = (uint64_t *)p2;
-	uint64_t *dp3 = (uint64_t *)p3;
-	uint64_t *dp4 = (uint64_t *)p4;
-
-	register uint64x2_t v0, v1, v2, v3;
-	long lines = bytes / (sizeof(uint64x2_t) * 4);
-
-	do {
-		/* p1 ^= p2 */
-		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
-		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
-		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
-		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
-
-		/* p1 ^= p3 */
-		v0 = veorq_u64(v0, vld1q_u64(dp3 +  0));
-		v1 = veorq_u64(v1, vld1q_u64(dp3 +  2));
-		v2 = veorq_u64(v2, vld1q_u64(dp3 +  4));
-		v3 = veorq_u64(v3, vld1q_u64(dp3 +  6));
-
-		/* p1 ^= p4 */
-		v0 = veorq_u64(v0, vld1q_u64(dp4 +  0));
-		v1 = veorq_u64(v1, vld1q_u64(dp4 +  2));
-		v2 = veorq_u64(v2, vld1q_u64(dp4 +  4));
-		v3 = veorq_u64(v3, vld1q_u64(dp4 +  6));
-
-		/* store */
-		vst1q_u64(dp1 +  0, v0);
-		vst1q_u64(dp1 +  2, v1);
-		vst1q_u64(dp1 +  4, v2);
-		vst1q_u64(dp1 +  6, v3);
-
-		dp1 += 8;
-		dp2 += 8;
-		dp3 += 8;
-		dp4 += 8;
-	} while (--lines > 0);
-}
-
-static void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2,
-		const unsigned long * __restrict p3,
-		const unsigned long * __restrict p4,
-		const unsigned long * __restrict p5)
-{
-	uint64_t *dp1 = (uint64_t *)p1;
-	uint64_t *dp2 = (uint64_t *)p2;
-	uint64_t *dp3 = (uint64_t *)p3;
-	uint64_t *dp4 = (uint64_t *)p4;
-	uint64_t *dp5 = (uint64_t *)p5;
-
-	register uint64x2_t v0, v1, v2, v3;
-	long lines = bytes / (sizeof(uint64x2_t) * 4);
-
-	do {
-		/* p1 ^= p2 */
-		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
-		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
-		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
-		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
-
-		/* p1 ^= p3 */
-		v0 = veorq_u64(v0, vld1q_u64(dp3 +  0));
-		v1 = veorq_u64(v1, vld1q_u64(dp3 +  2));
-		v2 = veorq_u64(v2, vld1q_u64(dp3 +  4));
-		v3 = veorq_u64(v3, vld1q_u64(dp3 +  6));
-
-		/* p1 ^= p4 */
-		v0 = veorq_u64(v0, vld1q_u64(dp4 +  0));
-		v1 = veorq_u64(v1, vld1q_u64(dp4 +  2));
-		v2 = veorq_u64(v2, vld1q_u64(dp4 +  4));
-		v3 = veorq_u64(v3, vld1q_u64(dp4 +  6));
-
-		/* p1 ^= p5 */
-		v0 = veorq_u64(v0, vld1q_u64(dp5 +  0));
-		v1 = veorq_u64(v1, vld1q_u64(dp5 +  2));
-		v2 = veorq_u64(v2, vld1q_u64(dp5 +  4));
-		v3 = veorq_u64(v3, vld1q_u64(dp5 +  6));
-
-		/* store */
-		vst1q_u64(dp1 +  0, v0);
-		vst1q_u64(dp1 +  2, v1);
-		vst1q_u64(dp1 +  4, v2);
-		vst1q_u64(dp1 +  6, v3);
-
-		dp1 += 8;
-		dp2 += 8;
-		dp3 += 8;
-		dp4 += 8;
-		dp5 += 8;
-	} while (--lines > 0);
-}
-
-__DO_XOR_BLOCKS(neon_inner, __xor_neon_2, __xor_neon_3, __xor_neon_4,
-		__xor_neon_5);
-
-static inline uint64x2_t eor3(uint64x2_t p, uint64x2_t q, uint64x2_t r)
-{
-	uint64x2_t res;
-
-	asm(ARM64_ASM_PREAMBLE ".arch_extension sha3\n"
-	    "eor3 %0.16b, %1.16b, %2.16b, %3.16b"
-	    : "=w"(res) : "w"(p), "w"(q), "w"(r));
-	return res;
-}
-
-static void __xor_eor3_3(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2,
-		const unsigned long * __restrict p3)
-{
-	uint64_t *dp1 = (uint64_t *)p1;
-	uint64_t *dp2 = (uint64_t *)p2;
-	uint64_t *dp3 = (uint64_t *)p3;
-
-	register uint64x2_t v0, v1, v2, v3;
-	long lines = bytes / (sizeof(uint64x2_t) * 4);
-
-	do {
-		/* p1 ^= p2 ^ p3 */
-		v0 = eor3(vld1q_u64(dp1 + 0), vld1q_u64(dp2 + 0),
-			  vld1q_u64(dp3 + 0));
-		v1 = eor3(vld1q_u64(dp1 + 2), vld1q_u64(dp2 + 2),
-			  vld1q_u64(dp3 + 2));
-		v2 = eor3(vld1q_u64(dp1 + 4), vld1q_u64(dp2 + 4),
-			  vld1q_u64(dp3 + 4));
-		v3 = eor3(vld1q_u64(dp1 + 6), vld1q_u64(dp2 + 6),
-			  vld1q_u64(dp3 + 6));
-
-		/* store */
-		vst1q_u64(dp1 + 0, v0);
-		vst1q_u64(dp1 + 2, v1);
-		vst1q_u64(dp1 + 4, v2);
-		vst1q_u64(dp1 + 6, v3);
-
-		dp1 += 8;
-		dp2 += 8;
-		dp3 += 8;
-	} while (--lines > 0);
-}
-
-static void __xor_eor3_4(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2,
-		const unsigned long * __restrict p3,
-		const unsigned long * __restrict p4)
-{
-	uint64_t *dp1 = (uint64_t *)p1;
-	uint64_t *dp2 = (uint64_t *)p2;
-	uint64_t *dp3 = (uint64_t *)p3;
-	uint64_t *dp4 = (uint64_t *)p4;
-
-	register uint64x2_t v0, v1, v2, v3;
-	long lines = bytes / (sizeof(uint64x2_t) * 4);
-
-	do {
-		/* p1 ^= p2 ^ p3 */
-		v0 = eor3(vld1q_u64(dp1 + 0), vld1q_u64(dp2 + 0),
-			  vld1q_u64(dp3 + 0));
-		v1 = eor3(vld1q_u64(dp1 + 2), vld1q_u64(dp2 + 2),
-			  vld1q_u64(dp3 + 2));
-		v2 = eor3(vld1q_u64(dp1 + 4), vld1q_u64(dp2 + 4),
-			  vld1q_u64(dp3 + 4));
-		v3 = eor3(vld1q_u64(dp1 + 6), vld1q_u64(dp2 + 6),
-			  vld1q_u64(dp3 + 6));
-
-		/* p1 ^= p4 */
-		v0 = veorq_u64(v0, vld1q_u64(dp4 + 0));
-		v1 = veorq_u64(v1, vld1q_u64(dp4 + 2));
-		v2 = veorq_u64(v2, vld1q_u64(dp4 + 4));
-		v3 = veorq_u64(v3, vld1q_u64(dp4 + 6));
-
-		/* store */
-		vst1q_u64(dp1 + 0, v0);
-		vst1q_u64(dp1 + 2, v1);
-		vst1q_u64(dp1 + 4, v2);
-		vst1q_u64(dp1 + 6, v3);
-
-		dp1 += 8;
-		dp2 += 8;
-		dp3 += 8;
-		dp4 += 8;
-	} while (--lines > 0);
-}
-
-static void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2,
-		const unsigned long * __restrict p3,
-		const unsigned long * __restrict p4,
-		const unsigned long * __restrict p5)
-{
-	uint64_t *dp1 = (uint64_t *)p1;
-	uint64_t *dp2 = (uint64_t *)p2;
-	uint64_t *dp3 = (uint64_t *)p3;
-	uint64_t *dp4 = (uint64_t *)p4;
-	uint64_t *dp5 = (uint64_t *)p5;
-
-	register uint64x2_t v0, v1, v2, v3;
-	long lines = bytes / (sizeof(uint64x2_t) * 4);
-
-	do {
-		/* p1 ^= p2 ^ p3 */
-		v0 = eor3(vld1q_u64(dp1 + 0), vld1q_u64(dp2 + 0),
-			  vld1q_u64(dp3 + 0));
-		v1 = eor3(vld1q_u64(dp1 + 2), vld1q_u64(dp2 + 2),
-			  vld1q_u64(dp3 + 2));
-		v2 = eor3(vld1q_u64(dp1 + 4), vld1q_u64(dp2 + 4),
-			  vld1q_u64(dp3 + 4));
-		v3 = eor3(vld1q_u64(dp1 + 6), vld1q_u64(dp2 + 6),
-			  vld1q_u64(dp3 + 6));
-
-		/* p1 ^= p4 ^ p5 */
-		v0 = eor3(v0, vld1q_u64(dp4 + 0), vld1q_u64(dp5 + 0));
-		v1 = eor3(v1, vld1q_u64(dp4 + 2), vld1q_u64(dp5 + 2));
-		v2 = eor3(v2, vld1q_u64(dp4 + 4), vld1q_u64(dp5 + 4));
-		v3 = eor3(v3, vld1q_u64(dp4 + 6), vld1q_u64(dp5 + 6));
-
-		/* store */
-		vst1q_u64(dp1 + 0, v0);
-		vst1q_u64(dp1 + 2, v1);
-		vst1q_u64(dp1 + 4, v2);
-		vst1q_u64(dp1 + 6, v3);
-
-		dp1 += 8;
-		dp2 += 8;
-		dp3 += 8;
-		dp4 += 8;
-		dp5 += 8;
-	} while (--lines > 0);
-}
-
-__DO_XOR_BLOCKS(eor3_inner, __xor_neon_2, __xor_eor3_3, __xor_eor3_4,
-		__xor_eor3_5);
diff --git a/lib/raid/xor/xor-neon.c b/lib/raid/xor/xor-neon.c
index a3e2b4af8d36..c7c3cf634e23 100644
--- a/lib/raid/xor/xor-neon.c
+++ b/lib/raid/xor/xor-neon.c
@@ -173,3 +173,7 @@ static void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
 
 __DO_XOR_BLOCKS(neon_inner, __xor_neon_2, __xor_neon_3, __xor_neon_4,
 		__xor_neon_5);
+
+#ifdef CONFIG_ARM64
+extern typeof(__xor_neon_2) __xor_eor3_2 __alias(__xor_neon_2);
+#endif
-- 
2.54.0.rc1.555.g9c883467ad-goog


