Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7028BFA1FDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 17:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcINISGc0KST4+Nvm9mjXv44pjIWS9tTY4a9BkZBdcs=; b=f6dWoiL+NZNI6xB9c53htOYvEn
	Bl2dcXSWPqFKNWWg6+QfuQhoPeR7K8IKSA7V2+x/sluSCazVbq76Dfv0pC4PNBL5Zv1nHgkJ1egzC
	1iblWpb43haOvoRMHU5gGEWn4VoAPw4+yXIyNRmOhPhyctJsfUQDq3iuMcwPTbtE6flGCNzXFCukV
	DBEAYPp7XtKI8psI7eS27eWP8OqmwoTtRN9Pur+6B0W3NyDDne3T1KKoVJQvlhUHg3Um4DS4V2Umf
	PR2zr9LvRjPG1w6WHyk841KsVuk6H82IC+TuPoIG5F72vg8ahceWaC/2eZNlv8ZlFMe2CryCDRion
	vy+PLblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbCo-0000000AYhy-3dRy;
	Wed, 22 Apr 2026 17:17:42 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbCV-0000000AYUn-2fOS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 17:17:26 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48a5952c635so11944905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776878241; x=1777483041; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NcINISGc0KST4+Nvm9mjXv44pjIWS9tTY4a9BkZBdcs=;
        b=Z5+P27YNsCEyWMZLztDuoCSLuyGd4xp3AzaSs48qxiSp4JgaFdfHxP38WcPZe2/6h9
         2CTnuKhyym8MR1dlifbmc+rS9Qpb+qESYdip4OrqPexxeAbQKCZnyi+/CRAgomtqbETa
         krxGKx9nT6wjYQ06GXgNVvtnAXHICEGuS27qCj95QrObKdSVojyiIl2XbmIjvC28MmXA
         zUnOUezAu5ajJFFN+io89XrmE5exvkqiaCEcq8fWbaKdR1bcpyw61rQSRrlw6oKmjy+2
         f3fped2ojRJiIkiaUd/B2zbiQEeWqLJYk7fzVJrekQcLCWU0VKi+KSje4U33zrj3G2eG
         cYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776878241; x=1777483041;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NcINISGc0KST4+Nvm9mjXv44pjIWS9tTY4a9BkZBdcs=;
        b=ntv2cGUAQ+uET7kR+m38JxofghNljW5etKdPkGaISmTuGtTGOqxulcJW2ilmPmEE5+
         5hHP13NUex5afzGaBp10sOC8J5yg5tFlYhpe2odHLgmSEen669N0bdDRUFAf9Ly38kGA
         z/zdQ+kkYvVKYWk6ZQo1VKYdtzG2ZRDYMz468i2mItKyUZ/PTuKF8/CDDAPcspz0qirt
         rBahpN22JSv29PQj5w8+iRAsGAX69/Yhj6iNv8RceB5JcsbqZrBOezQU0nmHWalwI+nv
         2nRnaPXaGBQOCecN2z4JcfbWcLOZpGJIs4ErZSGrPVajyw1J5iOyy9yRYZOlZl5sa+Js
         0nsQ==
X-Gm-Message-State: AOJu0YxriootrTXa8/ZPoyDasDIeSnu3KoGae/3M74kbf8MHpIF5IWiU
	geTXwYfYGoAHbGRa+yM6NlTBJ+CPrTEgOzQMMFqN/hlNsjtd2v9srFcfr6eQLdK/P2d23eiCTJg
	aHR0kzqD/tVuhG2zLsgvQpCVPS6yH4SYZ55Jpx37I2lvXkEw29W4guZKBmOuTTUlMwg0DCteuz5
	NVqrhk3hznIiBD+AeXJ+wqwqC8o4Z94jBNssbsvViJPIsB
X-Received: from wmbjq20.prod.google.com ([2002:a05:600c:55d4:b0:488:e127:ac83])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8587:b0:485:3f30:6250
 with SMTP id 5b1f17b1804b1-488fb7856b9mr255517905e9.20.1776878241449; Wed, 22
 Apr 2026 10:17:21 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:17:01 +0200
In-Reply-To: <20260422171655.3437334-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20260422171655.3437334-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5409; i=ardb@kernel.org;
 h=from:subject; bh=ca3n2psIM2wJk1WPOo/STNIlxMD5Xef04Kw+2CG+jJ8=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfMl04SqXWqv7RQbNd9bCZgty7y0/xw3a853fXV5vdD9g
 dtXTJPuKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPRbGD4H3dZaT7P/CDj4jfh
 CRldKeuPCB5Un3qN69bHOhf2dVpnnRkZdjb8WFxtr7Z7rVfZ9Lt8PjNNnrf0by629J8/9a3xeae LrAA=
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260422171655.3437334-15-ardb+git@google.com>
Subject: [PATCH 5/8] lib/crc: arm: Enable arm64's NEON intrinsics
 implementation of crc64
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-raid@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_101723_755243_B7678AD0 
X-CRM114-Status: GOOD (  19.92  )
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

Tweak the NEON intrinsics crc64 code written for arm64 so it can be
built for 32-bit ARM as well. The only workaround needed is to provide
alternatives for vmull_p64() and vmull_high_p64() on Clang, which only
defines those when building for the AArch64 or arm64ec ISA. Use the same
helpers for GCC too, to avoid doubling the size of the test/validation
matrix.

KUnit benchmark results (Cortex-A53 @ 1 Ghz)

Before:

   # crc64_nvme_benchmark: len=1: 35 MB/s
   # crc64_nvme_benchmark: len=16: 78 MB/s
   # crc64_nvme_benchmark: len=64: 87 MB/s
   # crc64_nvme_benchmark: len=127: 88 MB/s
   # crc64_nvme_benchmark: len=128: 88 MB/s
   # crc64_nvme_benchmark: len=200: 89 MB/s
   # crc64_nvme_benchmark: len=256: 89 MB/s
   # crc64_nvme_benchmark: len=511: 89 MB/s
   # crc64_nvme_benchmark: len=512: 89 MB/s
   # crc64_nvme_benchmark: len=1024: 90 MB/s
   # crc64_nvme_benchmark: len=3173: 90 MB/s
   # crc64_nvme_benchmark: len=4096: 90 MB/s
   # crc64_nvme_benchmark: len=16384: 90 MB/s

After:

   # crc64_nvme_benchmark: len=1: 32 MB/s
   # crc64_nvme_benchmark: len=16: 76 MB/s
   # crc64_nvme_benchmark: len=64: 71 MB/s
   # crc64_nvme_benchmark: len=127: 88 MB/s
   # crc64_nvme_benchmark: len=128: 618 MB/s
   # crc64_nvme_benchmark: len=200: 542 MB/s
   # crc64_nvme_benchmark: len=256: 920 MB/s
   # crc64_nvme_benchmark: len=511: 836 MB/s
   # crc64_nvme_benchmark: len=512: 1261 MB/s
   # crc64_nvme_benchmark: len=1024: 1531 MB/s
   # crc64_nvme_benchmark: len=3173: 1731 MB/s
   # crc64_nvme_benchmark: len=4096: 1851 MB/s
   # crc64_nvme_benchmark: len=16384: 1858 MB/s

Don't bother with big-endian, as it doesn't work correctly on Clang, and
is barely used these days.

Note that ARM disables preemption and softirq processing when using
kernel mode SIMD, so take care not to hog the CPU for too long.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/crc/Kconfig          |  1 +
 lib/crc/Makefile         |  5 ++-
 lib/crc/arm/crc64-neon.h | 34 ++++++++++++++++++
 lib/crc/arm/crc64.h      | 36 ++++++++++++++++++++
 4 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index 31038c8d111a..86a0e4bfec77 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -82,6 +82,7 @@ config CRC64
 config CRC64_ARCH
 	bool
 	depends on CRC64 && CRC_OPTIMIZATIONS
+	default y if ARM && KERNEL_MODE_NEON && !CPU_BIG_ENDIAN
 	default y if ARM64
 	default y if RISCV && RISCV_ISA_ZBC && 64BIT
 	default y if X86_64
diff --git a/lib/crc/Makefile b/lib/crc/Makefile
index 193257ae466f..386e9c175263 100644
--- a/lib/crc/Makefile
+++ b/lib/crc/Makefile
@@ -39,8 +39,11 @@ crc64-y := crc64-main.o
 ifeq ($(CONFIG_CRC64_ARCH),y)
 CFLAGS_crc64-main.o += -I$(src)/$(SRCARCH)
 
+crc64-cflags-$(CONFIG_ARM) += -march=armv8-a -mfpu=crypto-neon-fp-armv8
+crc64-cflags-$(CONFIG_ARM64) += -march=armv8-a+crypto
 CFLAGS_REMOVE_crc64-neon.o += $(CC_FLAGS_NO_FPU)
-CFLAGS_crc64-neon.o += $(CC_FLAGS_FPU) -I$(src)/$(SRCARCH) -march=armv8-a+crypto
+CFLAGS_crc64-neon.o += $(CC_FLAGS_FPU) -I$(src)/$(SRCARCH) $(crc64-cflags-y)
+crc64-$(CONFIG_ARM) += crc64-neon.o
 crc64-$(CONFIG_ARM64) += crc64-neon.o
 
 crc64-$(CONFIG_RISCV) += riscv/crc64_lsb.o riscv/crc64_msb.o
diff --git a/lib/crc/arm/crc64-neon.h b/lib/crc/arm/crc64-neon.h
new file mode 100644
index 000000000000..645f553220ff
--- /dev/null
+++ b/lib/crc/arm/crc64-neon.h
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+static inline uint64x2_t pmull64(uint64x2_t a, uint64x2_t b)
+{
+	uint64_t l = vgetq_lane_u64(a, 0);
+	uint64_t m = vgetq_lane_u64(b, 0);
+	uint64x2_t result;
+
+	asm("vmull.p64	%q0, %P1, %P2" : "=w"(result) : "w"(l), "w"(m));
+
+	return result;
+}
+
+static inline uint64x2_t pmull64_high(uint64x2_t a, uint64x2_t b)
+{
+	uint64_t l = vgetq_lane_u64(a, 1);
+	uint64_t m = vgetq_lane_u64(b, 1);
+	uint64x2_t result;
+
+	asm("vmull.p64	%q0, %P1, %P2" : "=w"(result) : "w"(l), "w"(m));
+
+	return result;
+}
+
+static inline uint64x2_t pmull64_hi_lo(uint64x2_t a, uint64x2_t b)
+{
+	uint64_t l = vgetq_lane_u64(a, 1);
+	uint64_t m = vgetq_lane_u64(b, 0);
+	uint64x2_t result;
+
+	asm("vmull.p64	%q0, %P1, %P2" : "=w"(result) : "w"(l), "w"(m));
+
+	return result;
+}
diff --git a/lib/crc/arm/crc64.h b/lib/crc/arm/crc64.h
new file mode 100644
index 000000000000..de274288af61
--- /dev/null
+++ b/lib/crc/arm/crc64.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * CRC64 using ARM PMULL instructions
+ */
+
+#include <asm/simd.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
+
+u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len);
+
+#define crc64_be_arch crc64_be_generic
+
+static inline u64 crc64_nvme_arch(u64 crc, const u8 *p, size_t len)
+{
+	if (len >= 128 && static_branch_likely(&have_pmull) &&
+	    likely(may_use_simd())) {
+		do {
+			size_t chunk = min_t(size_t, len & ~15, SZ_4K);
+
+			scoped_ksimd()
+				crc = crc64_nvme_neon(crc, p, chunk);
+
+			p += chunk;
+			len -= chunk;
+		} while (len >= 128);
+	}
+	return crc64_nvme_generic(crc, p, len);
+}
+
+#define crc64_mod_init_arch crc64_mod_init_arch
+static void crc64_mod_init_arch(void)
+{
+	if (elf_hwcap2 & HWCAP2_PMULL)
+		static_branch_enable(&have_pmull);
+}
-- 
2.54.0.rc1.555.g9c883467ad-goog


