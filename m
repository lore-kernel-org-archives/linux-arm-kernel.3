Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A50606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 01:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LT0cXz1e;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lIUaBbrc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a5VOHmm+k0IBj8x+32bgCpnZFpHRZVbIyYT6tTI+jX8=; b=LT0cXz1ekgqxtv
	if9D6h+Y1PrWHm35n5+f6KaTNp8QMCBq7UYd6TtQKDwhQ2kvqJje22lZwOR/8LwBfn1lhuMrQGl/T
	j7QcMJn9DIQjYulC/xXMpuE45WrP3DVwyDsyqZ9EP1GGXBZPqoI/thyvWYaQzibzqP99JXNRqG16p
	dHfQyzhI+mXyXDAsEyCStnjb6PJMoON6gNjx2V9h/YjJ9ZmaWpyvsMaXqjer5AG8nLL3jaypYDU/R
	W/oYy+lwcA+SlIa3yEoS85gFSuLlmFQn2HgPPmnVMJH/hGDXjVp/+jV8S9NR8G/ZwQSkB5h3nfsOA
	AVrXQnN/xI2VdFlaMd0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4QA-0000000FHfc-0NJi;
	Fri, 23 Oct 2026 01:50:14 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Q6-0000000FHds-2wge
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 01:50:12 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-353804b591eso743094eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 18:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792720210; x=1793325010; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5VOHmm+k0IBj8x+32bgCpnZFpHRZVbIyYT6tTI+jX8=;
        b=lIUaBbrcaN01gttAbHEVksORcee3ezIqtZ/TkJj/Sy8IQ5jBHeRVxWuCDCPPclD8aI
         dg2yvhc6n9+VOu+MIWAKAWzUdBJiyFVf1mC92wEJwjyJIj08NxVSL37O0v2mWWAguSr0
         1mDepdV7j/RjBRH9X5Ly1Z8j7ZBDhZ9mpTeo5JO9tyGPhhqKL/CDAP9glGyXO6evLNZ1
         9iPqF5MNf+0fpRMZ4lKGiHcvXR3ZOi4PtZ1ZV4cqG+V+/5MYC0Z1WZDSZRN0UAZuzNs2
         yaC35uUi/ouUQe9hZKnD9Bk4HnYg/dYTei0XFfG1Y3ODdNFxQHaI625g0wttWLu6PVkE
         rT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792720210; x=1793325010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5VOHmm+k0IBj8x+32bgCpnZFpHRZVbIyYT6tTI+jX8=;
        b=CNvod4MMq7FBzUZMXHXtGr7uP3WFTLbF/PBpxLZkbI8acK0IHfuTeYNdvE0Lm5s35o
         vVQ/Uh+1HgHpW5qpqt6Sjh1N+aPnuQkskKHjBsrmlJb0cKQtkOqJ8jCHY8NCdRuWI41Z
         3VDlb/n6PmWeeiqBWqt264d4b771u36VLTNIgKIgOOvvnrmY6zZcqH39iTnw8Stzj7RL
         CGLi6QGfrjfLoCFuNgjvZcI3B5IBOc5NS3RktUuexCv5yXWeIzYJcy8x3bDykNMc6S2P
         ay8xZAaqJ2EyBBLJIDA6ZRpID/swi/0XI9IvAS+K3MR5M2LaXGPjdxibfnDNUsj9vDQg
         CfQQ==
X-Gm-Message-State: AFq9FYKkPlXhnjrHDRyS6vHMNLHUyqPjGPoRIIiNwbSARRHCpit94903
	Lpa+Yumvk6g4v0Hwf9HfD4leaeTkzQ9tYH6khbp3mJY7nIkkmn+3IRTZ
X-Gm-Gg: AYBFou0z5iJa1KnaZYfWMvM86tmhrwgJiRQNcTwaU+llZ1mOPkAqqCf+xfZ07yrWZK3
	guA3ehNgnYsKn+x4Aj/a2LKICIU9S0xOSJtyi4SNa3LF/e3EhlMxI88Pwue55eiWiGRbYXu37pR
	0hh/v6vyFawMFvBBHnxbXpau1eQCKEi4paCf+Za0zpde8e7GXnLJf9fes941ifg20UmXkM5WNrY
	QtW8FS47+zZ+r2g+ng34OG4lRCdFY56fyyGkafp0y9p8a04VoG/yyoMU6fARoBEJ10cjGI+XdDG
	ZIldH5TcdtkpyTba2MlNFONMTuBszz+xD5T6UizCGXZTzPNJDXZeYUft94b0uWyyp0Hp5srEBWk
	Z/cz2wfJgJ4fAiL1UJYTNHZU/Tf/R/awc8zBUbdr2H9r2KBRkmZLGzaqKj/AW6PkNe1Y8QML9/s
	Xgprw2OSp0pe+JOM0UwrFsxYd2c7Hiw03636mVpC3rekWuunq/ZVggwYBUhV78RP1WYCrOuZQb0
	zm+JclD8RhkG/mrpBr4VdRVxsKPTUHbxEGHyLdhe6UqdWPD7c0O
X-Received: by 2002:a05:7300:fe81:b0:33c:e74:4624 with SMTP id 5a478bee46e88-369d977beeamr1247908eec.27.1792720209507;
        Thu, 22 Oct 2026 18:50:09 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c0e60dsm1971091eec.2.2026.10.22.18.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 18:50:09 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 23 Oct 2026 09:49:48 +0800
Subject: [PATCH v2 1/2] word-at-a-time: check the first byte in
 load_unaligned_zeropad()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-bug-word-at-a-time-zeropad-kasan-v2-1-be0ecfbae847@gmail.com>
References: <20261023-bug-word-at-a-time-zeropad-kasan-v2-0-be0ecfbae847@gmail.com>
In-Reply-To: <20261023-bug-word-at-a-time-zeropad-kasan-v2-0-be0ecfbae847@gmail.com>
To: Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Qiliang Yuan <odys.yuan@gmail.com>, Peter Collingbourne <peter@pcc.me.uk>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_185010_767857_F354FF14 
X-CRM114-Status: GOOD (  21.51  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

load_unaligned_zeropad() reads a word that may run into an unmapped
page and recovers through an exception fixup. It does the word loads of
sized_strscpy() and of the name compare in dentry_string_cmp(), path
components in hash_name() and hashlen_string(), and the trailing bytes
in x86's csum_partial().

It is inline assembly on every architecture that implements it, so
KASAN and KCSAN never see these loads, while read_word_at_a_time() at
least checks the first byte of each word. A use-after-free or
out-of-bounds read of a name handed to path lookup goes unreported, and
so does strscpy() reading from a bad source, which the kasan_strings
KUnit case expects to be reported. On x86_64 with generic KASAN:

  KASAN and string KUnit suites      failures
                                  before    after
  CONFIG_FORTIFY_SOURCE=n              1        0
  CONFIG_FORTIFY_SOURCE=y              1        0

Check the first byte with instrument_read() at the start of
load_unaligned_zeropad() on every architecture, as read_word_at_a_time()
does. All callers only load a word whose first byte belongs to the
string or buffer they read, so the check does not flag their intended
reads past the end. Add a no-op instrument_read() for the powerpc
selftest that builds the header in user space.

Suggested-by: Peter Collingbourne <peter@pcc.me.uk>
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
Reviewed-by: Marco Elver <elver@google.com>
---
 arch/arm/include/asm/word-at-a-time.h                           | 5 +++++
 arch/arm64/include/asm/word-at-a-time.h                         | 4 ++++
 arch/powerpc/include/asm/word-at-a-time.h                       | 4 ++++
 arch/riscv/include/asm/word-at-a-time.h                         | 4 ++++
 arch/s390/include/asm/word-at-a-time.h                          | 4 ++++
 arch/x86/include/asm/word-at-a-time.h                           | 4 ++++
 tools/testing/selftests/powerpc/primitives/linux/instrumented.h | 3 +++
 7 files changed, 28 insertions(+)

diff --git a/arch/arm/include/asm/word-at-a-time.h b/arch/arm/include/asm/word-at-a-time.h
index 5023f98d8293d..361771f178699 100644
--- a/arch/arm/include/asm/word-at-a-time.h
+++ b/arch/arm/include/asm/word-at-a-time.h
@@ -56,6 +56,8 @@ static inline unsigned long find_zero(unsigned long mask)
 #include <asm-generic/word-at-a-time.h>
 #endif
 
+#include <linux/instrumented.h>
+
 #ifdef CONFIG_DCACHE_WORD_ACCESS
 
 /*
@@ -69,6 +71,9 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret, tmp;
 
+	/* Check only the first byte, the rest may lie past the object */
+	instrument_read(addr, 1);
+
 	/* Load word from unaligned pointer addr */
 	asm(
 	"1:	ldr	%0, [%2]\n"
diff --git a/arch/arm64/include/asm/word-at-a-time.h b/arch/arm64/include/asm/word-at-a-time.h
index d7a3b69dc8c6f..37d45e716c11a 100644
--- a/arch/arm64/include/asm/word-at-a-time.h
+++ b/arch/arm64/include/asm/word-at-a-time.h
@@ -8,6 +8,7 @@
 #include <linux/uaccess.h>
 
 #include <linux/bitops.h>
+#include <linux/instrumented.h>
 #include <linux/wordpart.h>
 
 struct word_at_a_time {
@@ -45,6 +46,9 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret;
 
+	/* Check only the first byte, the rest may lie past the object */
+	instrument_read(addr, 1);
+
 	__mte_enable_tco_async();
 
 	/* Load word from unaligned pointer addr */
diff --git a/arch/powerpc/include/asm/word-at-a-time.h b/arch/powerpc/include/asm/word-at-a-time.h
index 54653a8634149..1660b2e3e3a8f 100644
--- a/arch/powerpc/include/asm/word-at-a-time.h
+++ b/arch/powerpc/include/asm/word-at-a-time.h
@@ -5,6 +5,7 @@
  * Word-at-a-time interfaces for PowerPC.
  */
 #include <linux/bitops.h>
+#include <linux/instrumented.h>
 #include <linux/wordpart.h>
 #include <asm/asm-compat.h>
 #include <asm/extable.h>
@@ -168,6 +169,9 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret, offset, tmp;
 
+	/* Check only the first byte, the rest may lie past the object */
+	instrument_read(addr, 1);
+
 	asm(
 	"1:	" PPC_LL "%[ret], 0(%[addr])\n"
 	"2:\n"
diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 3802cda71ab7e..761fa2734b7f5 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -11,6 +11,7 @@
 
 #include <asm/asm-extable.h>
 #include <linux/bitops.h>
+#include <linux/instrumented.h>
 #include <linux/wordpart.h>
 
 struct word_at_a_time {
@@ -60,6 +61,9 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret;
 
+	/* Check only the first byte, the rest may lie past the object */
+	instrument_read(addr, 1);
+
 	/* Load word from unaligned pointer addr */
 	asm(
 	"1:	" REG_L " %0, %2\n"
diff --git a/arch/s390/include/asm/word-at-a-time.h b/arch/s390/include/asm/word-at-a-time.h
index 0b7779c8d5a4e..f3caa4959cc87 100644
--- a/arch/s390/include/asm/word-at-a-time.h
+++ b/arch/s390/include/asm/word-at-a-time.h
@@ -3,6 +3,7 @@
 #define _ASM_WORD_AT_A_TIME_H
 
 #include <linux/bitops.h>
+#include <linux/instrumented.h>
 #include <linux/wordpart.h>
 #include <asm/asm-extable.h>
 #include <asm/bitsperlong.h>
@@ -52,6 +53,9 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long data;
 
+	/* Check only the first byte, the rest may lie past the object */
+	instrument_read(addr, 1);
+
 	asm_inline volatile(
 		"0:	lg	%[data],0(%[addr])\n"
 		"1:\n"
diff --git a/arch/x86/include/asm/word-at-a-time.h b/arch/x86/include/asm/word-at-a-time.h
index 422a47746657a..5374e08372253 100644
--- a/arch/x86/include/asm/word-at-a-time.h
+++ b/arch/x86/include/asm/word-at-a-time.h
@@ -3,6 +3,7 @@
 #define _ASM_WORD_AT_A_TIME_H
 
 #include <linux/bitops.h>
+#include <linux/instrumented.h>
 #include <linux/wordpart.h>
 
 struct word_at_a_time {
@@ -71,6 +72,9 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret;
 
+	/* Check only the first byte, the rest may lie past the object */
+	instrument_read(addr, 1);
+
 	asm volatile(
 		"1:	mov %[mem], %[ret]\n"
 		"2:\n"
diff --git a/tools/testing/selftests/powerpc/primitives/linux/instrumented.h b/tools/testing/selftests/powerpc/primitives/linux/instrumented.h
new file mode 100644
index 0000000000000..114ef9284f69b
--- /dev/null
+++ b/tools/testing/selftests/powerpc/primitives/linux/instrumented.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* There is nothing for KASAN or KCSAN to check in user space. */
+#define instrument_read(p, size)	((void)(p), (void)(size))

-- 
2.43.0


