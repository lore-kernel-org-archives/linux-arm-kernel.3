Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68465106FD85
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 06:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/7Avksm2DO+mVglS65ohDrmnD6ZqO7r/NBeBe/i4gQI=; b=qdkCbE3se2aHPtMkH4CGokqYPi
	ADO+YH9biqjlMGFY9u8cn4yD0uXm2Gm59OS/mSx3CMyjWfg9pPI+XvN/aImO/jZxc+5M91DRZRdty
	VU7GcNLrNwkiCjPhdTQ1zp7X897IlN57F0fI4e+dZxe3N5a0ebNlAzRqTEWYnYIw7ygFl8ajKl4Yo
	po8vi4YqB2tG+ENwFsGV7fJmGmdX9vtwe/sptDxA9eur7WPqR7xZgVtg6PkTjjdQMmWoqDS7VdGRn
	VCb1IB18Lt6ZN5fEN4ZA3wAsr10TzPWEV5Vp7DQ3+DX74ZePwncG7RLGiYUL2aW9O4UT8axijLMnZ
	KKST/obQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vra-0000000GpKC-0iA7;
	Fri, 13 Mar 2026 06:19:10 +0000
Received: from mail-dl1-f73.google.com ([74.125.82.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vrX-0000000GpHp-24og
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 06:19:08 +0000
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-12737f276a2so2647534c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 23:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773382745; x=1773987545; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/7Avksm2DO+mVglS65ohDrmnD6ZqO7r/NBeBe/i4gQI=;
        b=BIzUDQ4nTrIklVon1MUXqvQvA1yvNIqkyqtTwCsftJ7JVhig3G0Qu1Ceq23+O6GK5G
         RTDDyUCNNFDDEEfnL90gN6NOelmEt3+11nQ5OmSXgIXTmbBqXfv6+KiIi2FA4OrSDUCT
         Vx0ZC0pmExVyWniz21EXNgUsFPwX2TZ9Y7j1O3gm3hgHW4iDXcdqs7WD8ySUJWbyItUR
         F1jGXvhcluYnsrL+7piBDDsQ0ORvjPqjtQjJqegxdDHjc0WOzmyxsHd3Y6uLFGOSdSeG
         qsDbUMvEW7LvVss0wJazB0PA5gefugPCQbbFdrmwJAW1RPTa2eUS9bSCunFxY/U1tlT6
         AxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773382745; x=1773987545;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/7Avksm2DO+mVglS65ohDrmnD6ZqO7r/NBeBe/i4gQI=;
        b=NU+taksTvenvT4RsLzO9xgIBpLk2eML6W6mOGfu9hD4w/UsrwTWwWvuORrOiacTRQC
         vU51vnn3dLeGrQyOE5DE8EWB2uGDB5SpGUiYIliDdbChC9yaEcVyC0SrWf4w8XOnyi9c
         d4ottFgXv8XHJ3lgl9iMEqTm5NbBqIlumXfWt3zqoogvP4obCyJMT+MqTR8BEFj4V50W
         54tDX/6QZ2asGijJ+TxYlrZwUFJj7TDBo1r9U/tvdfC7Eu5JpHkgoeSiFXNR+6Tk1jpk
         2Pf0t4jZwSfBg0iGPF8oyG9Wqu8S81dRsVrO7M0w1EaKU4tmbfLBr0kVNTgwekQEEexD
         NZoA==
X-Gm-Message-State: AOJu0YyfQHGeJyU1WHpjsskFmxlY4rMtCTuRcH/iVlWG7vgrCQ+jromR
	2g9QpkVyJqY5RO9kwN3GaUEhI0IlzJn3fzu0V8qXot0ONg1IXhVTsGfx1/LVuYmpo2lvAgseb1r
	qQCSWC8BYeGdxIVRu4Ne7ACUthKRupN7ON+Pn110UUwokt+/OxgH2qE9OtPeMSiCsuq0+s41Tsn
	xrW/MNJrMnRMKHBFSATGKiezrMxJHCarFQ+yEFRmkaqHFuYoF7ggsuZeeEC6s7d9yotA==
X-Received: from dybse11.prod.google.com ([2002:a05:7301:490b:b0:2be:12e0:e206])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:458b:b0:11d:f44d:401d with SMTP id a92af1059eb24-128f3db298emr812133c88.22.1773382744700;
 Thu, 12 Mar 2026 23:19:04 -0700 (PDT)
Date: Fri, 13 Mar 2026 06:18:52 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.880.g73c4285caa-goog
Message-ID: <20260313061852.4025964-1-cmllamas@google.com>
Subject: [PATCH v7] arm64: implement support for static call trampolines
From: Carlos Llamas <cmllamas@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Sami Tolvanen <samitolvanen@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>, 
	Quentin Perret <qperret@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Will McVicker <willmcvicker@google.com>, Sean Christopherson <seanjc@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_231907_540357_D4BEED38 
X-CRM114-Status: GOOD (  21.11  )
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

Implement arm64 support for the 'unoptimized' static call variety, which
routes all calls through a single trampoline that is patched to perform a
tail call to the selected function.

Since static call targets may be located in modules loaded out of direct
branching range, we need to use a ADRP/ADD pair to load the branch target
into R16 and use a branch-to-register (BR) instruction to perform an
indirect call. Unlike on x86, there is no pressing need on arm64 to avoid
indirect calls at all cost, but hiding it from the compiler as is done
here does have some benefits:
- the literal is located in .rodata, which gives us the same robustness
  advantage that code patching does;
- no performance hit on CFI enabled Clang builds that decorate compiler
  emitted indirect calls with branch target validity checks.

Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
v7:
  - Took Ard's v3 patch (as it leaves the code patching logic out) and
    rebased it on top  of mainline 7.0-rc3.
  - Dropped the changes to arch/arm64/lib/insn.c and instead switched to
    the (now) existing aarch64_insn_write_literal_u64().
  - Added the RET0 trampoline define which points to the generic stub
    __static_call_return0.
  - Made the HAVE_STATIC_CALL conditional on CFI as suggested by Ard.
  - Added .type and .size sections to the trampoline definition to
    support ABI tools.

 arch/arm64/Kconfig                   |  1 +
 arch/arm64/include/asm/static_call.h | 33 ++++++++++++++++++++++++++++
 arch/arm64/kernel/Makefile           |  1 +
 arch/arm64/kernel/static_call.c      | 20 +++++++++++++++++
 arch/arm64/kernel/vmlinux.lds.S      |  1 +
 5 files changed, 56 insertions(+)
 create mode 100644 arch/arm64/include/asm/static_call.h
 create mode 100644 arch/arm64/kernel/static_call.c

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 38dba5f7e4d2..9ea19b74b6c3 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -252,6 +252,7 @@ config ARM64
 	select HAVE_RSEQ
 	select HAVE_RUST if RUSTC_SUPPORTS_ARM64
 	select HAVE_STACKPROTECTOR
+	select HAVE_STATIC_CALL if CFI
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
diff --git a/arch/arm64/include/asm/static_call.h b/arch/arm64/include/asm/static_call.h
new file mode 100644
index 000000000000..331580542fd4
--- /dev/null
+++ b/arch/arm64/include/asm/static_call.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_STATIC_CALL_H
+#define _ASM_STATIC_CALL_H
+
+#define __ARCH_DEFINE_STATIC_CALL_TRAMP(name, target)			    \
+	asm("	.pushsection .static_call.text, \"ax\"			\n" \
+	    "	.align	3						\n" \
+	    "	.globl	" STATIC_CALL_TRAMP_STR(name) "			\n" \
+	    STATIC_CALL_TRAMP_STR(name) ":				\n" \
+	    "	hint	34	/* BTI C */				\n" \
+	    "	adrp	x16, 1f						\n" \
+	    "	ldr	x16, [x16, :lo12:1f]				\n" \
+	    "	cbz	x16, 0f						\n" \
+	    "	br	x16						\n" \
+	    "0:	ret							\n" \
+	    "	.type	" STATIC_CALL_TRAMP_STR(name) ", %function	\n" \
+	    "	.size	" STATIC_CALL_TRAMP_STR(name) ", . - " STATIC_CALL_TRAMP_STR(name) " \n" \
+	    "	.popsection						\n" \
+	    "	.pushsection .rodata, \"a\"				\n" \
+	    "	.align	3						\n" \
+	    "1:	.quad	" target "					\n" \
+	    "	.popsection						\n")
+
+#define ARCH_DEFINE_STATIC_CALL_TRAMP(name, func)			\
+	__ARCH_DEFINE_STATIC_CALL_TRAMP(name, #func)
+
+#define ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)			\
+	__ARCH_DEFINE_STATIC_CALL_TRAMP(name, "0x0")
+
+#define ARCH_DEFINE_STATIC_CALL_RET0_TRAMP(name)			\
+	ARCH_DEFINE_STATIC_CALL_TRAMP(name, __static_call_return0)
+
+#endif /* _ASM_STATIC_CALL_H */
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index 76f32e424065..fe627100d199 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_MODULES)			+= module.o module-plts.o
 obj-$(CONFIG_PERF_EVENTS)		+= perf_regs.o perf_callchain.o
 obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF)	+= watchdog_hld.o
 obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
+obj-$(CONFIG_HAVE_STATIC_CALL)		+= static_call.o
 obj-$(CONFIG_CPU_PM)			+= sleep.o suspend.o
 obj-$(CONFIG_KGDB)			+= kgdb.o
 obj-$(CONFIG_EFI)			+= efi.o efi-rt-wrapper.o
diff --git a/arch/arm64/kernel/static_call.c b/arch/arm64/kernel/static_call.c
new file mode 100644
index 000000000000..944ecabb821f
--- /dev/null
+++ b/arch/arm64/kernel/static_call.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/static_call.h>
+#include <linux/memory.h>
+#include <asm/text-patching.h>
+
+void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
+{
+	u64 literal;
+	int ret;
+
+	/* decode the instructions to discover the literal address */
+	literal = ALIGN_DOWN((u64)tramp + 4, SZ_4K) +
+		  aarch64_insn_adrp_get_offset(le32_to_cpup(tramp + 4)) +
+		  8 * aarch64_insn_decode_immediate(AARCH64_INSN_IMM_12,
+						    le32_to_cpup(tramp + 8));
+
+	ret = aarch64_insn_write_literal_u64((void *)literal, (u64)func);
+	WARN_ON_ONCE(ret);
+}
+EXPORT_SYMBOL_GPL(arch_static_call_transform);
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 2964aad0362e..2d1e75263f03 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -191,6 +191,7 @@ SECTIONS
 			LOCK_TEXT
 			KPROBES_TEXT
 			HYPERVISOR_TEXT
+			STATIC_CALL_TEXT
 			*(.gnu.warning)
 	}
 
-- 
2.53.0.880.g73c4285caa-goog


