Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3907E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tSEs5JW8;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TMd1SwH5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X2dfVjLkrmuJSC4aZO/b8p2vQ9W6RQvFVrEQpEEdhzw=; b=tSEs5JW8PDXs86qlPBkZjHrFuz
	5+RX3OzoHp/49XwjU8uuUVuTzKItMOfOo9C/UiM80Ro5tuezEvx/8Yw8eopkzJul1hAhUhLw08yty
	mEB/Vex1YGGo01+akual5MH4FvQ2Pigil2lhjdAvT8LNGKwRDo8hSIRvbumVN3bV25DLwyFq0ioP9
	Ib+LjOXRL2Z68PJuYpqKeqK7I8HnDdQ2t+wXrAoiQPN16lrokJcg+5FZoC0hjZflLY3MpkjASekJD
	6GLAo5KFPkYeJnZVrm7N+Sr+hw7Mo+kE29r8+jlKBLDrE7kzE06NftNQx7a34APtwfPxxlrWrD936
	NCu1Bsow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQWo-00000009Qxn-0PX5;
	Thu, 29 Oct 2026 13:50:50 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQWd-00000009Qr4-2Ffn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:50:40 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a70b42bab0so8294915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793281837; x=1793886637; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2dfVjLkrmuJSC4aZO/b8p2vQ9W6RQvFVrEQpEEdhzw=;
        b=TMd1SwH56v3kEaaOtNLngiOJky+2jN5sIqfja5G7GaieysZthNdSGtEaS7x6vxbqtj
         yv6Z/5C5lf45Jov07/U6NariqE4kwEg7qEteZpT/Pn4setrWxpJee+xNtH5zxZ5atMhe
         ZevRaTVd6UEKJ3upGk+9xzDO5cf2NxW8aEPoL8bEJt4xm0IB25iQirokHCT2AKMyo7f3
         Ky94WDvfgaNOBd87uJ1FN6JeB3QB5QZK+uyrlfbg7LRT5ixBidlM6j0SafomkpgLyYbq
         CoDfe+d7oP7bZPf/xc7jqzY/BKUivCeIO7k7H14BjtCGhEG2uwmXsV5at1ITYTnQipk8
         yjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281837; x=1793886637;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2dfVjLkrmuJSC4aZO/b8p2vQ9W6RQvFVrEQpEEdhzw=;
        b=UOT4uybRz8GKDmlBEEASNV1eMW+NGRJRupqAXOhorOTE5tF2pdF249E01dJuRqeWri
         KmzMqb9MWKXGf0dulzEia0RQU+0sxg/TN8JE8Okm4+OqSrIMvASIJric6AoyW81YWLX1
         enon6skXV9yvs17CroEhWUtk6e/0ZY9a+vKeab4SA58Zkpdfpzduqrh9SaIAMYPbKINP
         gBCSdAaLBW8lWPxpK3nrLLuk91DVBp/dUkj4PaTtH4A6DlNh62YUxlRoPCrMjJgzmw3A
         QMtsRLt5v+WSP+Sb2WMc6qYfdEIVJR490rastHTvdEPdDcb//ycHbNZaQmoWehf2bqBW
         kvQg==
X-Forwarded-Encrypted: i=1; AKwUvByM6lSehW2PCSFWot3cMsMCkhYzI0Vg9iukqTmganCggDw9f3ebfgcUV0jgVdkFg0oZolyO/1kLNR5eONnovTFT@lists.infradead.org
X-Gm-Message-State: AFq9FYLVC7yguo/iTYlijYHKfDLyxIOef21EwvZqYdf1dUgrixkqdb1E
	R1awvOw8uPxsnljC++GG2PrswJAkSG+sb4P++uxtlq8XVxI2z1MJA1hYJiVc8J23zZqJt9eulQ=
	=
X-Received: from wmby1.prod.google.com ([2002:a05:600c:c041:b0:4a5:a768:cd6c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f84:b0:4a7:72b1:c8bd
 with SMTP id 5b1f17b1804b1-4aa8823d762mr60543425e9.15.1793281835085; Thu, 29
 Oct 2026 06:50:35 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:50:22 +0100
In-Reply-To: <20261029135020.272082-6-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261029135020.272082-6-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029135020.272082-8-ardb+git@google.com>
Subject: [PATCH 2/4] xor: arm/arm64: Move NEON xor_gen() dispatch into the
 glue code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_065039_634982_FB86E080 
X-CRM114-Status: GOOD (  13.43  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The NEON intrinsics code in xor-neon.c and arm64/xor-eor3.c includes xor_impl.h
for the definition of __DO_XOR_BLOCKS(), which pulls in <linux/types.h> via
<linux/init.h> and <linux/minmax.h>. This only works because
asm/neon-intrinsics.h overrides the compiler's predefined macros that
<stdint.h> uses to define the C99 types, so that they match the kernel's
definitions in <linux/types.h>.

So instead, follow the approach taken by LoongArch, and instantiate the
dispatch routines using DO_XOR_BLOCKS() in the glue code, which already
includes the kernel headers, and does not use NEON intrinsics itself.  This
requires the NEON routines that handle a fixed number of sources to be exposed
to the glue code, which means that the arm64 glue code can use __xor_neon_2()
directly for the EOR3 flavor as well, and so the __xor_eor3_2() alias can be
dropped.

This makes the NEON intrinsics code independent of the kernel's own headers,
which will allow the macro overrides in asm/neon-intrinsics.h to be removed.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/raid/xor/arm/xor-neon-glue.c   |  3 ++
 lib/raid/xor/arm/xor-neon.h        | 16 ++++++++--
 lib/raid/xor/arm64/xor-eor3.c      | 15 ++--------
 lib/raid/xor/arm64/xor-neon-glue.c |  5 ++++
 lib/raid/xor/arm64/xor-neon.h      | 31 +++++++++++++++++---
 lib/raid/xor/xor-neon.c            | 16 +++-------
 6 files changed, 56 insertions(+), 30 deletions(-)

diff --git a/lib/raid/xor/arm/xor-neon-glue.c b/lib/raid/xor/arm/xor-neon-glue.c
index cea39e019904..783474bfe81e 100644
--- a/lib/raid/xor/arm/xor-neon-glue.c
+++ b/lib/raid/xor/arm/xor-neon-glue.c
@@ -5,6 +5,9 @@
 #include "xor_impl.h"
 #include "xor_arch.h"
 
+DO_XOR_BLOCKS(neon_inner, __xor_neon_2, __xor_neon_3, __xor_neon_4,
+		__xor_neon_5);
+
 static void xor_gen_neon(void *dest, void **srcs, unsigned int src_cnt,
 		unsigned int bytes)
 {
diff --git a/lib/raid/xor/arm/xor-neon.h b/lib/raid/xor/arm/xor-neon.h
index 406e0356f05b..5592dec4de50 100644
--- a/lib/raid/xor/arm/xor-neon.h
+++ b/lib/raid/xor/arm/xor-neon.h
@@ -3,5 +3,17 @@
 extern struct xor_block_template xor_block_arm4regs;
 extern struct xor_block_template xor_block_neon;
 
-void xor_gen_neon_inner(void *dest, void **srcs, unsigned int src_cnt,
-		unsigned int bytes);
+void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2);
+void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3);
+void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3,
+		const unsigned long * __restrict p4);
+void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3,
+		const unsigned long * __restrict p4,
+		const unsigned long * __restrict p5);
diff --git a/lib/raid/xor/arm64/xor-eor3.c b/lib/raid/xor/arm64/xor-eor3.c
index e44016c363f1..41bb577b63eb 100644
--- a/lib/raid/xor/arm64/xor-eor3.c
+++ b/lib/raid/xor/arm64/xor-eor3.c
@@ -1,14 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-#include <linux/cache.h>
 #include <asm/neon-intrinsics.h>
-#include "xor_impl.h"
-#include "xor_arch.h"
 #include "xor-neon.h"
 
-extern void __xor_eor3_2(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2);
-
 static inline uint64x2_t eor3(uint64x2_t p, uint64x2_t q, uint64x2_t r)
 {
 	uint64x2_t res;
@@ -19,7 +13,7 @@ static inline uint64x2_t eor3(uint64x2_t p, uint64x2_t q, uint64x2_t r)
 	return res;
 }
 
-static void __xor_eor3_3(unsigned long bytes, unsigned long * __restrict p1,
+void __xor_eor3_3(unsigned long bytes, unsigned long * __restrict p1,
 		const unsigned long * __restrict p2,
 		const unsigned long * __restrict p3)
 {
@@ -53,7 +47,7 @@ static void __xor_eor3_3(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-static void __xor_eor3_4(unsigned long bytes, unsigned long * __restrict p1,
+void __xor_eor3_4(unsigned long bytes, unsigned long * __restrict p1,
 		const unsigned long * __restrict p2,
 		const unsigned long * __restrict p3,
 		const unsigned long * __restrict p4)
@@ -96,7 +90,7 @@ static void __xor_eor3_4(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-static void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,
+void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,
 		const unsigned long * __restrict p2,
 		const unsigned long * __restrict p3,
 		const unsigned long * __restrict p4,
@@ -141,6 +135,3 @@ static void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,
 		dp5 += 8;
 	} while (--lines > 0);
 }
-
-__DO_XOR_BLOCKS(eor3_inner, __xor_eor3_2, __xor_eor3_3, __xor_eor3_4,
-		__xor_eor3_5);
diff --git a/lib/raid/xor/arm64/xor-neon-glue.c b/lib/raid/xor/arm64/xor-neon-glue.c
index f0284f86feb4..ae133d699649 100644
--- a/lib/raid/xor/arm64/xor-neon-glue.c
+++ b/lib/raid/xor/arm64/xor-neon-glue.c
@@ -9,6 +9,11 @@
 #include "xor_arch.h"
 #include "xor-neon.h"
 
+DO_XOR_BLOCKS(neon_inner, __xor_neon_2, __xor_neon_3, __xor_neon_4,
+		__xor_neon_5);
+DO_XOR_BLOCKS(eor3_inner, __xor_neon_2, __xor_eor3_3, __xor_eor3_4,
+		__xor_eor3_5);
+
 #define XOR_TEMPLATE(_name)						\
 static void xor_gen_##_name(void *dest, void **srcs, unsigned int src_cnt, \
 		unsigned int bytes)					\
diff --git a/lib/raid/xor/arm64/xor-neon.h b/lib/raid/xor/arm64/xor-neon.h
index 514699ba8f5f..7d7fb96343df 100644
--- a/lib/raid/xor/arm64/xor-neon.h
+++ b/lib/raid/xor/arm64/xor-neon.h
@@ -1,6 +1,29 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-void xor_gen_neon_inner(void *dest, void **srcs, unsigned int src_cnt,
-		unsigned int bytes);
-void xor_gen_eor3_inner(void *dest, void **srcs, unsigned int src_cnt,
-		unsigned int bytes);
+void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2);
+void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3);
+void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3,
+		const unsigned long * __restrict p4);
+void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3,
+		const unsigned long * __restrict p4,
+		const unsigned long * __restrict p5);
+
+void __xor_eor3_3(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3);
+void __xor_eor3_4(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3,
+		const unsigned long * __restrict p4);
+void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3,
+		const unsigned long * __restrict p4,
+		const unsigned long * __restrict p5);
diff --git a/lib/raid/xor/xor-neon.c b/lib/raid/xor/xor-neon.c
index c7c3cf634e23..6b2fd14f5041 100644
--- a/lib/raid/xor/xor-neon.c
+++ b/lib/raid/xor/xor-neon.c
@@ -4,12 +4,11 @@
  * Copyright (C) 2018,Tianjin KYLIN Information Technology Co., Ltd.
  */
 
-#include "xor_impl.h"
 #include "xor-neon.h"
 
 #include <asm/neon-intrinsics.h>
 
-static void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
+void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
 		const unsigned long * __restrict p2)
 {
 	uint64_t *dp1 = (uint64_t *)p1;
@@ -36,7 +35,7 @@ static void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-static void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
+void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
 		const unsigned long * __restrict p2,
 		const unsigned long * __restrict p3)
 {
@@ -72,7 +71,7 @@ static void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-static void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
+void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
 		const unsigned long * __restrict p2,
 		const unsigned long * __restrict p3,
 		const unsigned long * __restrict p4)
@@ -117,7 +116,7 @@ static void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-static void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
+void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
 		const unsigned long * __restrict p2,
 		const unsigned long * __restrict p3,
 		const unsigned long * __restrict p4,
@@ -170,10 +169,3 @@ static void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
 		dp5 += 8;
 	} while (--lines > 0);
 }
-
-__DO_XOR_BLOCKS(neon_inner, __xor_neon_2, __xor_neon_3, __xor_neon_4,
-		__xor_neon_5);
-
-#ifdef CONFIG_ARM64
-extern typeof(__xor_neon_2) __xor_eor3_2 __alias(__xor_neon_2);
-#endif
-- 
2.56.0.313.g2479322e68-goog


