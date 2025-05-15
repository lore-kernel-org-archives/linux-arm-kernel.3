Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA77C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 14:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IPogphGbrEpR3QBLdoY3zq221jsJuMh2u53C5NvwS2Q=; b=IcI1/vBixjx5tpREAa1FzHJCVK
	7HjbRag/w6Ti6betcu8w/px2WtJuARqHqG7CzYKmOCOBtsy7iaLor51kIYnssOwMXkxOkzhqu0Qhm
	JE1a6ahmUILMNMeUt5a9uwE775DqLwU0i1jjbIoWMqz2BNy4rx9hm3X+kulmBa4gARyJ7t0QlWAud
	GVXElGgSMCiHNyajXYLYStJg1BgWVcOLRrmNBYij1H+/RBTtwyZQkgK3nsv4YZoV1cHjnxCaXDVtI
	l6jAR0ixgoGRCS5u+QffN5H9zczCTXipaU9ZwgMDHUB3ytSPm74uEid/UY58Gy6DeFpoJ8PGyFyP2
	VkFqlwzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZjx-00000000uXP-46ha;
	Thu, 15 May 2025 14:39:17 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZYN-00000000stl-0mto
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 14:27:20 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-442e0e6eb84so7168355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 07:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747319237; x=1747924037; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IPogphGbrEpR3QBLdoY3zq221jsJuMh2u53C5NvwS2Q=;
        b=Mn+XJcJZ++hdeQoMJ3oODJPlVkg6FcOCRUA5WGagEF2RvVZ93FB9K48xuFeWfTPCR5
         YNxrSOxGy9r1r3QcyZGhdpCYwjO68gksDFi53puCrimc53WyUYs6OV8wlrJt90f5jnUB
         lXQoQhcetgEtauGQAWvPxdAYu/sCeSHKYp4neCqNxLsAs00g1UlYAsLWlgqsYamjvu3d
         JcnY8NRNPlCrBRCgdL5eGkaWnkJxdPcmJwyUNkEEQM+YbMyKeB2wrCtk7lfXA/HCxUDW
         Dpk+7lHXE004nwj8/HRU20w+FlQ6SEPvtp2OHqctpgddmaZpT+H+QvyzNzXA9PE6ejq8
         4OsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747319237; x=1747924037;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IPogphGbrEpR3QBLdoY3zq221jsJuMh2u53C5NvwS2Q=;
        b=WnncTxcQg+or7BUpSvTQgJ03uFo3W32B2wvWkG7e2HAYN56oVULqhBfC7yHF9Yvn9t
         tKtlzY8omxzIdHkkfGnzVNmJ1+NqPYuG7QHt1kOD9mBduYGngcIr0vlZUIQ2SJf94LJq
         PLJZVp1ev1bXy2CVLw+PskxEEtw+btrDvmfgU3IyXcHlb8rxXQS2paZNHcO9uo+sg2bW
         7B52XZXBPm8VlBEVSfIJFgAmf5cSTmN29Y9/DMq9uYMsuPKbrbPwJpgtYN0uKbnCAo//
         OBGP7PSB1/X/zDVAtM6QmdrHueD2Y7CSeQOtbD8pN9zwHOLPhObOWZ43Or312yGHpG8J
         5A1w==
X-Gm-Message-State: AOJu0Yxl1bShDsvY2KaO1g3CuhAwJ8ySzHdwNRgvzp35uJgjyatAP1BB
	KRl0eSwGhL+a6jFnddYRuwS6Y1n5fcjnCbQqnXZv6QMPG+W2T/L/MUpl+BaQVtqLiSpz8Q==
X-Google-Smtp-Source: AGHT+IFFsCgdakG5u4bEFXO2J5LKqOHIG9Zn7He//Wb/roAQpWxVzwumPw1uqPb5QXelrTfoVthC6PGR
X-Received: from wmbhj24.prod.google.com ([2002:a05:600c:5298:b0:442:cd17:732c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1e84:b0:43c:f64c:44a4
 with SMTP id 5b1f17b1804b1-442f97a5d2amr27534375e9.8.1747319236918; Thu, 15
 May 2025 07:27:16 -0700 (PDT)
Date: Thu, 15 May 2025 16:27:03 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6048; i=ardb@kernel.org;
 h=from:subject; bh=qvxJ+h9gMcNlJUb5JcUPXfq+gkLOGOQD7jPdNNZG/eU=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUP157bEGwvfiEtuXG0n+WJpYkLa1y+PstQCvhVuE87eF
 fGk+o1eRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIiVqGf0qGlx7ecXp289W/
 NSYznmh2r1vP+FON1/4b3xJH35o5TY8ZGTZsdPu//BhHz0nujWmy09pL5eYmh5zzOfXVqNxcLlH 4NgcA
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250515142702.2592942-2-ardb+git@google.com>
Subject: [PATCH] crypto: arm64 - Drop asm fallback macros for older binutils
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, ebiggers@kernel.org, 
	herbert@gondor.apana.org.au, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_072719_244372_D66C540A 
X-CRM114-Status: GOOD (  11.10  )
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

Now that the oldest supported binutils version is 2.30, the asm macros
to implement the various crypto opcodes for SHA-512, SHA-3, SM-3 and
SM-4 are no longer needed. So drop them.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
The binutils version bump is queued up in -next, so I suppose this could
be queued up for the next cycle too.

 arch/arm64/crypto/sha3-ce-core.S    | 24 +------------
 arch/arm64/crypto/sha512-ce-core.S  | 21 +-----------
 arch/arm64/crypto/sm3-ce-core.S     | 36 ++------------------
 arch/arm64/crypto/sm4-ce-ccm-core.S | 10 +-----
 arch/arm64/crypto/sm4-ce-core.S     | 15 +-------
 arch/arm64/crypto/sm4-ce-gcm-core.S | 10 +-----
 6 files changed, 8 insertions(+), 108 deletions(-)

diff --git a/arch/arm64/crypto/sha3-ce-core.S b/arch/arm64/crypto/sha3-ce-core.S
index 9c77313f5a60..61623c7ad3a1 100644
--- a/arch/arm64/crypto/sha3-ce-core.S
+++ b/arch/arm64/crypto/sha3-ce-core.S
@@ -12,29 +12,7 @@
 #include <linux/linkage.h>
 #include <asm/assembler.h>
 
-	.irp	b,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
-	.set	.Lv\b\().2d, \b
-	.set	.Lv\b\().16b, \b
-	.endr
-
-	/*
-	 * ARMv8.2 Crypto Extensions instructions
-	 */
-	.macro	eor3, rd, rn, rm, ra
-	.inst	0xce000000 | .L\rd | (.L\rn << 5) | (.L\ra << 10) | (.L\rm << 16)
-	.endm
-
-	.macro	rax1, rd, rn, rm
-	.inst	0xce608c00 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
-	.endm
-
-	.macro	bcax, rd, rn, rm, ra
-	.inst	0xce200000 | .L\rd | (.L\rn << 5) | (.L\ra << 10) | (.L\rm << 16)
-	.endm
-
-	.macro	xar, rd, rn, rm, imm6
-	.inst	0xce800000 | .L\rd | (.L\rn << 5) | ((\imm6) << 10) | (.L\rm << 16)
-	.endm
+	.arch	armv8-a+sha3
 
 	/*
 	 * int sha3_ce_transform(u64 *st, const u8 *data, int blocks, int dg_size)
diff --git a/arch/arm64/crypto/sha512-ce-core.S b/arch/arm64/crypto/sha512-ce-core.S
index 91ef68b15fcc..deb2469ab631 100644
--- a/arch/arm64/crypto/sha512-ce-core.S
+++ b/arch/arm64/crypto/sha512-ce-core.S
@@ -12,26 +12,7 @@
 #include <linux/linkage.h>
 #include <asm/assembler.h>
 
-	.irp		b,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
-	.set		.Lq\b, \b
-	.set		.Lv\b\().2d, \b
-	.endr
-
-	.macro		sha512h, rd, rn, rm
-	.inst		0xce608000 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
-	.endm
-
-	.macro		sha512h2, rd, rn, rm
-	.inst		0xce608400 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
-	.endm
-
-	.macro		sha512su0, rd, rn
-	.inst		0xcec08000 | .L\rd | (.L\rn << 5)
-	.endm
-
-	.macro		sha512su1, rd, rn, rm
-	.inst		0xce608800 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
-	.endm
+	.arch	armv8-a+sha3
 
 	/*
 	 * The SHA-512 round constants
diff --git a/arch/arm64/crypto/sm3-ce-core.S b/arch/arm64/crypto/sm3-ce-core.S
index ca70cfacd0d0..94a97ca367f0 100644
--- a/arch/arm64/crypto/sm3-ce-core.S
+++ b/arch/arm64/crypto/sm3-ce-core.S
@@ -9,44 +9,14 @@
 #include <linux/cfi_types.h>
 #include <asm/assembler.h>
 
-	.irp		b, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
-	.set		.Lv\b\().4s, \b
-	.endr
-
-	.macro		sm3partw1, rd, rn, rm
-	.inst		0xce60c000 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
-	.endm
-
-	.macro		sm3partw2, rd, rn, rm
-	.inst		0xce60c400 | .L\rd | (.L\rn << 5) | (.L\rm << 16)
-	.endm
-
-	.macro		sm3ss1, rd, rn, rm, ra
-	.inst		0xce400000 | .L\rd | (.L\rn << 5) | (.L\ra << 10) | (.L\rm << 16)
-	.endm
-
-	.macro		sm3tt1a, rd, rn, rm, imm2
-	.inst		0xce408000 | .L\rd | (.L\rn << 5) | ((\imm2) << 12) | (.L\rm << 16)
-	.endm
-
-	.macro		sm3tt1b, rd, rn, rm, imm2
-	.inst		0xce408400 | .L\rd | (.L\rn << 5) | ((\imm2) << 12) | (.L\rm << 16)
-	.endm
-
-	.macro		sm3tt2a, rd, rn, rm, imm2
-	.inst		0xce408800 | .L\rd | (.L\rn << 5) | ((\imm2) << 12) | (.L\rm << 16)
-	.endm
-
-	.macro		sm3tt2b, rd, rn, rm, imm2
-	.inst		0xce408c00 | .L\rd | (.L\rn << 5) | ((\imm2) << 12) | (.L\rm << 16)
-	.endm
+	.arch		armv8-a+sm4
 
 	.macro		round, ab, s0, t0, t1, i
 	sm3ss1		v5.4s, v8.4s, \t0\().4s, v9.4s
 	shl		\t1\().4s, \t0\().4s, #1
 	sri		\t1\().4s, \t0\().4s, #31
-	sm3tt1\ab	v8.4s, v5.4s, v10.4s, \i
-	sm3tt2\ab	v9.4s, v5.4s, \s0\().4s, \i
+	sm3tt1\ab	v8.4s, v5.4s, v10.s[\i]
+	sm3tt2\ab	v9.4s, v5.4s, \s0\().s[\i]
 	.endm
 
 	.macro		qround, ab, s0, s1, s2, s3, s4
diff --git a/arch/arm64/crypto/sm4-ce-ccm-core.S b/arch/arm64/crypto/sm4-ce-ccm-core.S
index fa85856f33ce..b658cf2577d1 100644
--- a/arch/arm64/crypto/sm4-ce-ccm-core.S
+++ b/arch/arm64/crypto/sm4-ce-ccm-core.S
@@ -12,15 +12,7 @@
 #include <asm/assembler.h>
 #include "sm4-ce-asm.h"
 
-.arch	armv8-a+crypto
-
-.irp b, 0, 1, 8, 9, 10, 11, 12, 13, 14, 15, 16, 24, 25, 26, 27, 28, 29, 30, 31
-	.set .Lv\b\().4s, \b
-.endr
-
-.macro sm4e, vd, vn
-	.inst 0xcec08400 | (.L\vn << 5) | .L\vd
-.endm
+.arch	armv8-a+sm4
 
 /* Register macros */
 
diff --git a/arch/arm64/crypto/sm4-ce-core.S b/arch/arm64/crypto/sm4-ce-core.S
index 1f3625c2c67e..dd4e86b0a526 100644
--- a/arch/arm64/crypto/sm4-ce-core.S
+++ b/arch/arm64/crypto/sm4-ce-core.S
@@ -12,20 +12,7 @@
 #include <asm/assembler.h>
 #include "sm4-ce-asm.h"
 
-.arch	armv8-a+crypto
-
-.irp b, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, \
-		20, 24, 25, 26, 27, 28, 29, 30, 31
-	.set .Lv\b\().4s, \b
-.endr
-
-.macro sm4e, vd, vn
-	.inst 0xcec08400 | (.L\vn << 5) | .L\vd
-.endm
-
-.macro sm4ekey, vd, vn, vm
-	.inst 0xce60c800 | (.L\vm << 16) | (.L\vn << 5) | .L\vd
-.endm
+.arch	armv8-a+sm4
 
 /* Register macros */
 
diff --git a/arch/arm64/crypto/sm4-ce-gcm-core.S b/arch/arm64/crypto/sm4-ce-gcm-core.S
index 347f25d75727..92d26d8a9254 100644
--- a/arch/arm64/crypto/sm4-ce-gcm-core.S
+++ b/arch/arm64/crypto/sm4-ce-gcm-core.S
@@ -13,15 +13,7 @@
 #include <asm/assembler.h>
 #include "sm4-ce-asm.h"
 
-.arch	armv8-a+crypto
-
-.irp b, 0, 1, 2, 3, 24, 25, 26, 27, 28, 29, 30, 31
-	.set .Lv\b\().4s, \b
-.endr
-
-.macro sm4e, vd, vn
-	.inst 0xcec08400 | (.L\vn << 5) | .L\vd
-.endm
+	.arch		armv8-a+sm4+aes
 
 /* Register macros */
 
-- 
2.49.0.1101.gccaa498523-goog


