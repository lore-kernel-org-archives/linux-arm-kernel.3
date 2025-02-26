Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C99C021BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LAYUE/nQHJF7MH1lNIsDK0kivOUnu63GXLab/8Fi0YI=; b=PiKbtu81hOFwnUHiP3iJ56J0rr
	WbLofBfw+fFldcAQy0EbgcoRMBRGGgSZ7RmnVVVE7XZZCspp6XRXUuQHFyiTCa7dL97QjdEmiOoUg
	9F4E2oHZeStHcWXouknZ3LtpxAU0T8HiHZzie2sz8Mk7jG/6q0z2X+Q7APj8BWlg+gdWHwXZq5KCu
	nbLPOd2E/S7ZZcOFpU8wD5/N+Vp11vELHhgnNZW0084SWYhvxg9lD1dNyppl6djyizPbudIg+V+R7
	BHkQvOksX0jdEIA+p+qDUApfWj1z/cbatleEj5zRKTzzMlXeb8VLf1jE1CjVf2vzVqnAGLqKnCdFf
	pQkMgYhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHRG-00000003sWo-4Bbo;
	Wed, 26 Feb 2025 13:27:03 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGMH-00000003e81-2kqy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 12:17:51 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2211acda7f6so150524145ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 04:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740572268; x=1741177068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LAYUE/nQHJF7MH1lNIsDK0kivOUnu63GXLab/8Fi0YI=;
        b=CBsKeCCzgAkZPBBUBJt+qIPX53Opnnsnice1gDFMt17qb5APIVlRFfkgNrDhGMVIst
         DMARPNdFGyXKe703Ri46OFXECpNJi5kbV/WXOB1YBvLOqST0+T1tQsaj6AHryyNOAim7
         sG0SZZItiV63DeJbEc3zVbVvmbcySpQqdM3F8orilJRyaKjXfNVJBXzDpo1DFDn/obfY
         CsJJXx3Qfg89BvmgkJd4l/6blT0As+XM7CJKOjIuDEKemwyqD7xHXNOa1kyf3CfE+69X
         ErP9cD2JqzvA8zGnotgS3gJhJHeWmIrvqwUfO70XH/GADgkLJXmS2PS/lA66v6wrJhcD
         dtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740572268; x=1741177068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAYUE/nQHJF7MH1lNIsDK0kivOUnu63GXLab/8Fi0YI=;
        b=LkKbziFwk+ZZtfD33Oi5gFx8RAhdGIF2sBuiITGD12NEAw7oSOV+cYn2eGfVXkZ1RS
         K7gfZC2+fuiJ9TcZ/b90sJ2etM6wdio0X5o0co12drMMZWnGYzndEYfCacwsCn6NB8R4
         i+Fhw3x/hjuBQCpQYLToBmHcEBVJyoDoFJ7Hsth0grA1UMjblNRVxU27vNIaSdMmRC1z
         I3QbfVk38AKceEBFzLN5esnRneEin+iRfx6O/JWn8P7ReNeKa8HO5FKdQN/77DL5OcAd
         qrPSavFVJyIDsYbt50EQFOY4TNeKyz1QMtVNzHrZosOl1ZHcF407vQclTnPR/EWg5/7A
         +SsA==
X-Forwarded-Encrypted: i=1; AJvYcCXD4o0EdJ9JZjSOcE96x2c04Gt+IEK70S5oiBcniPmYQXs4jugmrLPjnfv3OVqPUlc8cPc1X1ICg6j31j55eJMH@lists.infradead.org
X-Gm-Message-State: AOJu0YwfCQSMWeKaCIMKr8dVwwkqvjzlCoOOqXdBPkqlLaVGKPkWwone
	RKYbkRhRn5jZqwBiQCbhIryNATwf2EqC68oI6sKKr5quMRcJQqQs
X-Gm-Gg: ASbGnct2ztBKThTBiZeMcUirypMdbO02l1MBW70XEQiffuVzenpt1TspmCV0kJ74NM1
	VFkjoe3k+T+3sM1aVTk2rYgPJPKIm3XNNZ+ix1Bw+geAzwixZVvIx7u3CmLnO6H2uWGs55TTIP8
	0FBxuoYbYPkiQOwQWAM10fwfnHzPTmqsNH8bmTB5MAxTFMhQr76Z+w6a8MaXNf7WEq1ce3/kxl6
	DQQdxqFI/cYQnli5CBlpQDbMgZXdMWpTtcQL4l6MmiTk0yR9V1uY22vo1BzsgcOQRw7QoEQNSSK
	7WOgldBvh/QKVMC/yE40Ia8Re96xXsIvL0BrmHxFl7o=
X-Google-Smtp-Source: AGHT+IE4+z3x+3Zz+tpx7mhhQReAe0knBoi3gcUczHJovdEnhMyBTbgPwh5fMnctf0x+ijD78D7wsg==
X-Received: by 2002:a17:90a:c2c7:b0:2ee:dd9b:e402 with SMTP id 98e67ed59e1d1-2fe7e2f74dcmr6094164a91.12.1740572268301;
        Wed, 26 Feb 2025 04:17:48 -0800 (PST)
Received: from localhost.localdomain ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825d302dsm1327937a91.22.2025.02.26.04.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 04:17:47 -0800 (PST)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: rostedt@goodmis.org,
	mark.rutland@arm.com,
	alexei.starovoitov@gmail.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mhiramat@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	mathieu.desnoyers@efficios.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	dongml2@chinatelecom.cn,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	graf@amazon.com,
	dan.j.williams@intel.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next v2] add function metadata support
Date: Wed, 26 Feb 2025 20:15:37 +0800
Message-Id: <20250226121537.752241-1-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_041749_710431_87160620 
X-CRM114-Status: GOOD (  37.56  )
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

For now, there isn't a way to set and get per-function metadata with
a low overhead, which is not convenient for some situations. Take
BPF trampoline for example, we need to create a trampoline for each
kernel function, as we have to store some information of the function
to the trampoline, such as BPF progs, function arg count, etc. The
performance overhead and memory consumption can be higher to create
these trampolines. With the supporting of per-function metadata storage,
we can store these information to the metadata, and create a global BPF
trampoline for all the kernel functions. In the global trampoline, we
get the information that we need from the function metadata through the
ip (function address) with almost no overhead.

Another beneficiary can be ftrace. For now, all the kernel functions that
are enabled by dynamic ftrace will be added to a filter hash if there are
more than one callbacks. And hash lookup will happen when the traced
functions are called, which has an impact on the performance, see
__ftrace_ops_list_func() -> ftrace_ops_test(). With the per-function
metadata supporting, we can store the information that if the callback is
enabled on the kernel function to the metadata.

Support per-function metadata storage in the function padding, and
previous discussion can be found in [1]. Generally speaking, we have two
way to implement this feature:

1. Create a function metadata array, and prepend a insn which can hold
the index of the function metadata in the array. And store the insn to
the function padding.

2. Allocate the function metadata with kmalloc(), and prepend a insn which
hold the pointer of the metadata. And store the insn to the function
padding.

Compared with way 2, way 1 consume less space, but we need to do more work
on the global function metadata array. And we implement this function in
the way 1.

We implement this function in the following way for x86:

With CONFIG_CALL_PADDING enabled, there will be 16-bytes(or more) padding
space before all the kernel functions. And some kernel features can use
it, such as MITIGATION_CALL_DEPTH_TRACKING, CFI_CLANG, FINEIBT, etc.

In my research, MITIGATION_CALL_DEPTH_TRACKING will consume the tail
9-bytes in the function padding, and FINEIBT + CFI_CLANG will consume
the head 7-bytes. So there will be no space for us if
MITIGATION_CALL_DEPTH_TRACKING and CFI_CLANG are both enabled.

In x86, we need 5-bytes to prepend a "mov %eax xxx" insn, which can hold
a 4-bytes index. So we have following logic:

1. use the head 5-bytes if CFI_CLANG is not enabled
2. use the tail 5-bytes if MITIGATION_CALL_DEPTH_TRACKING is not enabled
3. compile the kernel with extra 5-bytes padding if
   MITIGATION_CALL_DEPTH_TRACKING and CFI_CLANG are both enabled.

In the third case, we compile the kernel with a function padding of
21-bytes, which means the real function is not 16-bytes aligned any more.
And in [2], I tested the performance of the kernel with different padding,
and it seems that extra 5-bytes don't have impact on the performance.
However, it's a huge change to make the kernel function unaligned in
16-bytes, and I'm not sure if there are any other influence. So another
choice is to compile the kernel with 32-bytes aligned if there is no space
available for us in the function padding. But this will increase the text
size ~5%. (And I'm not sure with method to use.)

We implement this function in the following way for arm64:

The per-function metadata storage is already used by ftrace if
CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS is enabled, and it store the pointer
of the callback directly to the function padding, which consume 8-bytes,
in the commit
baaf553d3bc3 ("arm64: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS") [3].
So we can directly store the index to the function padding too, without
a prepending. With CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS enabled, the
function is 8-bytes aligned, and we will compile the kernel with extra
8-bytes (2 NOPS) padding space. Otherwise, the function is 4-bytes
aligned, and only extra 4-bytes (1 NOPS) is needed.

However, we have the same problem with Mark in [3]: we can't use the
function padding together with CFI_CLANG, which can make the clang
compiles a wrong offset to the pre-function type hash. He said that he was
working with others on this problem 2 years ago. Hi Mark, is there any
progress on this problem?

I tested this function by setting metadata for all the kernel function,
and it consumes 0.7s for 70k+ functions, not bad :/

Maybe we should split this patch into 3 patches :/

Link: https://lore.kernel.org/bpf/CADxym3anLzM6cAkn_z71GDd_VeKiqqk1ts=xuiP7pr4PO6USPA@mail.gmail.com/ [1]
Link: https://lore.kernel.org/bpf/CADxym3af+CU5Mx8myB8UowdXSc3wJOqWyH4oyq+eXKahXBTXyg@mail.gmail.com/ [2]
Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
v2:
- add supporting for arm64
- split out arch relevant code
- refactor the commit log
---
 arch/arm64/Kconfig              |  15 ++
 arch/arm64/Makefile             |  23 ++-
 arch/arm64/include/asm/ftrace.h |  34 +++++
 arch/arm64/kernel/ftrace.c      |  13 +-
 arch/x86/Kconfig                |  15 ++
 arch/x86/Makefile               |  17 ++-
 arch/x86/include/asm/ftrace.h   |  52 +++++++
 include/linux/kfunc_md.h        |  25 ++++
 kernel/Makefile                 |   1 +
 kernel/trace/Makefile           |   1 +
 kernel/trace/kfunc_md.c         | 239 ++++++++++++++++++++++++++++++++
 11 files changed, 425 insertions(+), 10 deletions(-)
 create mode 100644 include/linux/kfunc_md.h
 create mode 100644 kernel/trace/kfunc_md.c

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index c997b27b7da1..b4c2b5566a58 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1536,6 +1536,21 @@ config NODES_SHIFT
 	  Specify the maximum number of NUMA Nodes available on the target
 	  system.  Increases memory reserved to accommodate various tables.
 
+config FUNCTION_METADATA
+	bool "Per-function metadata storage support"
+	default y
+	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE if !FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
+	depends on !CFI_CLANG
+	help
+	  Support per-function metadata storage for kernel functions, and
+	  get the metadata of the function by its address with almost no
+	  overhead.
+
+	  The index of the metadata will be stored in the function padding,
+	  which will consume 4-bytes. If FUNCTION_ALIGNMENT_8B is enabled,
+	  extra 8-bytes function padding will be reserved during compiling.
+	  Otherwise, only extra 4-bytes function padding is needed.
+
 source "kernel/Kconfig.hz"
 
 config ARCH_SPARSEMEM_ENABLE
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 358c68565bfd..d5a124c8ded2 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -140,12 +140,31 @@ endif
 
 CHECKFLAGS	+= -D__aarch64__
 
+ifeq ($(CONFIG_FUNCTION_METADATA),y)
+  ifeq ($(CONFIG_FUNCTION_ALIGNMENT_8B),y)
+  __padding_nops := 2
+  else
+  __padding_nops := 1
+  endif
+else
+  __padding_nops := 0
+endif
+
 ifeq ($(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS),y)
+  __padding_nops  := $(shell echo $(__padding_nops) + 2 | bc)
   KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
-  CC_FLAGS_FTRACE := -fpatchable-function-entry=4,2
+  CC_FLAGS_FTRACE := -fpatchable-function-entry=$(shell echo $(__padding_nops) + 2 | bc),$(__padding_nops)
 else ifeq ($(CONFIG_DYNAMIC_FTRACE_WITH_ARGS),y)
+  CC_FLAGS_FTRACE := -fpatchable-function-entry=$(shell echo $(__padding_nops) + 2 | bc),$(__padding_nops)
   KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
-  CC_FLAGS_FTRACE := -fpatchable-function-entry=2
+else ifeq ($(CONFIG_FUNCTION_METADATA),y)
+  CC_FLAGS_FTRACE += -fpatchable-function-entry=$(__padding_nops),$(__padding_nops)
+  ifneq ($(CONFIG_FUNCTION_TRACER),y)
+    KBUILD_CFLAGS += $(CC_FLAGS_FTRACE)
+    # some file need to remove this cflag even when CONFIG_FUNCTION_TRACER
+    # is not enabled, so we need to export it here
+    export CC_FLAGS_FTRACE
+  endif
 endif
 
 ifeq ($(CONFIG_KASAN_SW_TAGS), y)
diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
index bfe3ce9df197..aa3eaa91bf82 100644
--- a/arch/arm64/include/asm/ftrace.h
+++ b/arch/arm64/include/asm/ftrace.h
@@ -24,6 +24,16 @@
 #define FTRACE_PLT_IDX		0
 #define NR_FTRACE_PLTS		1
 
+#ifdef CONFIG_FUNCTION_METADATA
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
+#define KFUNC_MD_DATA_OFFSET	(AARCH64_INSN_SIZE * 3)
+#else
+#define KFUNC_MD_DATA_OFFSET	AARCH64_INSN_SIZE
+#endif
+#define KFUNC_MD_INSN_SIZE	AARCH64_INSN_SIZE
+#define KFUNC_MD_INSN_OFFSET	KFUNC_MD_DATA_OFFSET
+#endif
+
 /*
  * Currently, gcc tends to save the link register after the local variables
  * on the stack. This causes the max stack tracer to report the function
@@ -216,6 +226,30 @@ static inline bool arch_syscall_match_sym_name(const char *sym,
 	 */
 	return !strcmp(sym + 8, name);
 }
+
+#ifdef CONFIG_FUNCTION_METADATA
+#include <asm/text-patching.h>
+
+static inline bool kfunc_md_arch_exist(void *ip)
+{
+	return !aarch64_insn_is_nop(*(u32 *)(ip - KFUNC_MD_INSN_OFFSET));
+}
+
+static inline void kfunc_md_arch_pretend(u8 *insn, u32 index)
+{
+	*(u32 *)insn = index;
+}
+
+static inline void kfunc_md_arch_nops(u8 *insn)
+{
+	*(u32 *)insn = aarch64_insn_gen_nop();
+}
+
+static inline int kfunc_md_arch_poke(void *ip, u8 *insn)
+{
+	return aarch64_insn_patch_text_nosync(ip, *(u32 *)insn);
+}
+#endif
 #endif /* ifndef __ASSEMBLY__ */
 
 #ifndef __ASSEMBLY__
diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index 5a890714ee2e..d829651d895b 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -88,8 +88,10 @@ unsigned long ftrace_call_adjust(unsigned long addr)
 	 * to `BL <caller>`, which is at `addr + 4` bytes in either case.
 	 *
 	 */
-	if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS))
-		return addr + AARCH64_INSN_SIZE;
+	if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS)) {
+		addr += AARCH64_INSN_SIZE;
+		goto out;
+	}
 
 	/*
 	 * When using patchable-function-entry with pre-function NOPs, addr is
@@ -139,6 +141,13 @@ unsigned long ftrace_call_adjust(unsigned long addr)
 
 	/* Skip the first NOP after function entry */
 	addr += AARCH64_INSN_SIZE;
+out:
+	if (IS_ENABLED(CONFIG_FUNCTION_METADATA)) {
+		if (IS_ENABLED(CONFIG_FUNCTION_ALIGNMENT_8B))
+			addr += 2 * AARCH64_INSN_SIZE;
+		else
+			addr += AARCH64_INSN_SIZE;
+	}
 
 	return addr;
 }
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index fe2fa3a9a0fd..fa6e9c6f5cd5 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2514,6 +2514,21 @@ config PREFIX_SYMBOLS
 	def_bool y
 	depends on CALL_PADDING && !CFI_CLANG
 
+config FUNCTION_METADATA
+	bool "Per-function metadata storage support"
+	default y
+	select CALL_PADDING
+	help
+	  Support per-function metadata storage for kernel functions, and
+	  get the metadata of the function by its address with almost no
+	  overhead.
+
+	  The index of the metadata will be stored in the function padding
+	  and consumes 5-bytes. The spare space of the padding is enough
+	  with CALL_PADDING and FUNCTION_ALIGNMENT_16B if CALL_THUNKS or
+	  CFI_CLANG not enabled. Otherwise, we need extra 5-bytes in the
+	  function padding, which will increases text ~1%.
+
 menuconfig CPU_MITIGATIONS
 	bool "Mitigations for CPU vulnerabilities"
 	default y
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 5b773b34768d..2766c9d755d7 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -240,13 +240,18 @@ ifdef CONFIG_MITIGATION_SLS
 endif
 
 ifdef CONFIG_CALL_PADDING
-PADDING_CFLAGS := -fpatchable-function-entry=$(CONFIG_FUNCTION_PADDING_BYTES),$(CONFIG_FUNCTION_PADDING_BYTES)
-KBUILD_CFLAGS += $(PADDING_CFLAGS)
-export PADDING_CFLAGS
+  __padding_nops := $(CONFIG_FUNCTION_PADDING_BYTES)
+  ifneq ($(and $(CONFIG_FUNCTION_METADATA),$(CONFIG_CALL_THUNKS),$(CONFIG_CFI_CLANG)),)
+    __padding_nops := $(shell echo $(__padding_nops) + 5 | bc)
+  endif
+
+  PADDING_CFLAGS := -fpatchable-function-entry=$(__padding_nops),$(__padding_nops)
+  KBUILD_CFLAGS += $(PADDING_CFLAGS)
+  export PADDING_CFLAGS
 
-PADDING_RUSTFLAGS := -Zpatchable-function-entry=$(CONFIG_FUNCTION_PADDING_BYTES),$(CONFIG_FUNCTION_PADDING_BYTES)
-KBUILD_RUSTFLAGS += $(PADDING_RUSTFLAGS)
-export PADDING_RUSTFLAGS
+  PADDING_RUSTFLAGS := -Zpatchable-function-entry=$(__padding_nops),$(__padding_nops)
+  KBUILD_RUSTFLAGS += $(PADDING_RUSTFLAGS)
+  export PADDING_RUSTFLAGS
 endif
 
 KBUILD_LDFLAGS += -m elf_$(UTS_MACHINE)
diff --git a/arch/x86/include/asm/ftrace.h b/arch/x86/include/asm/ftrace.h
index f9cb4d07df58..cf96c990f0c1 100644
--- a/arch/x86/include/asm/ftrace.h
+++ b/arch/x86/include/asm/ftrace.h
@@ -4,6 +4,26 @@
 
 #include <asm/ptrace.h>
 
+#ifdef CONFIG_FUNCTION_METADATA
+#ifdef CONFIG_CFI_CLANG
+  #ifdef CONFIG_CALL_THUNKS
+    /* use the extra 5-bytes that we reserve */
+    #define KFUNC_MD_INSN_OFFSET	(CONFIG_FUNCTION_PADDING_BYTES + 5)
+    #define KFUNC_MD_DATA_OFFSET	(CONFIG_FUNCTION_PADDING_BYTES + 4)
+  #else
+    /* use the space that CALL_THUNKS suppose to use */
+    #define KFUNC_MD_INSN_OFFSET	(5)
+    #define KFUNC_MD_DATA_OFFSET	(4)
+  #endif
+#else
+  /* use the space that CFI_CLANG suppose to use */
+  #define KFUNC_MD_INSN_OFFSET		(CONFIG_FUNCTION_PADDING_BYTES)
+  #define KFUNC_MD_DATA_OFFSET		(CONFIG_FUNCTION_PADDING_BYTES - 1)
+#endif
+
+#define KFUNC_MD_INSN_SIZE		(5)
+#endif
+
 #ifdef CONFIG_FUNCTION_TRACER
 #ifndef CC_USING_FENTRY
 # error Compiler does not support fentry?
@@ -168,4 +188,36 @@ static inline bool arch_trace_is_compat_syscall(struct pt_regs *regs)
 #endif /* !COMPILE_OFFSETS */
 #endif /* !__ASSEMBLY__ */
 
+#if !defined(__ASSEMBLY__) && defined(CONFIG_FUNCTION_METADATA)
+#include <asm/text-patching.h>
+
+static inline bool kfunc_md_arch_exist(void *ip)
+{
+	return *(u8 *)(ip - KFUNC_MD_INSN_OFFSET) == 0xB8;
+}
+
+static inline void kfunc_md_arch_pretend(u8 *insn, u32 index)
+{
+	*insn = 0xB8;
+	*(u32 *)(insn + 1) = index;
+}
+
+static inline void kfunc_md_arch_nops(u8 *insn)
+{
+	*(insn++) = BYTES_NOP1;
+	*(insn++) = BYTES_NOP1;
+	*(insn++) = BYTES_NOP1;
+	*(insn++) = BYTES_NOP1;
+	*(insn++) = BYTES_NOP1;
+}
+
+static inline int kfunc_md_arch_poke(void *ip, u8 *insn)
+{
+	text_poke(ip, insn, KFUNC_MD_INSN_SIZE);
+	text_poke_sync();
+	return 0;
+}
+
+#endif
+
 #endif /* _ASM_X86_FTRACE_H */
diff --git a/include/linux/kfunc_md.h b/include/linux/kfunc_md.h
new file mode 100644
index 000000000000..df616f0fcb36
--- /dev/null
+++ b/include/linux/kfunc_md.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_KFUNC_MD_H
+#define _LINUX_KFUNC_MD_H
+
+#include <linux/kernel.h>
+
+struct kfunc_md {
+	int users;
+	/* we can use this field later, make sure it is 8-bytes aligned
+	 * for now.
+	 */
+	int pad0;
+	void *func;
+};
+
+extern struct kfunc_md *kfunc_mds;
+
+struct kfunc_md *kfunc_md_find(void *ip);
+struct kfunc_md *kfunc_md_get(void *ip);
+void kfunc_md_put(struct kfunc_md *meta);
+void kfunc_md_put_by_ip(void *ip);
+void kfunc_md_lock(void);
+void kfunc_md_unlock(void);
+
+#endif
diff --git a/kernel/Makefile b/kernel/Makefile
index cef5377c25cd..79d63f0f2496 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -109,6 +109,7 @@ obj-$(CONFIG_TRACE_CLOCK) += trace/
 obj-$(CONFIG_RING_BUFFER) += trace/
 obj-$(CONFIG_TRACEPOINTS) += trace/
 obj-$(CONFIG_RETHOOK) += trace/
+obj-$(CONFIG_FUNCTION_METADATA) += trace/
 obj-$(CONFIG_IRQ_WORK) += irq_work.o
 obj-$(CONFIG_CPU_PM) += cpu_pm.o
 obj-$(CONFIG_BPF) += bpf/
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index 057cd975d014..9780ee3f8d8d 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -106,6 +106,7 @@ obj-$(CONFIG_FTRACE_RECORD_RECURSION) += trace_recursion_record.o
 obj-$(CONFIG_FPROBE) += fprobe.o
 obj-$(CONFIG_RETHOOK) += rethook.o
 obj-$(CONFIG_FPROBE_EVENTS) += trace_fprobe.o
+obj-$(CONFIG_FUNCTION_METADATA) += kfunc_md.o
 
 obj-$(CONFIG_TRACEPOINT_BENCHMARK) += trace_benchmark.o
 obj-$(CONFIG_RV) += rv/
diff --git a/kernel/trace/kfunc_md.c b/kernel/trace/kfunc_md.c
new file mode 100644
index 000000000000..362fa78f13c8
--- /dev/null
+++ b/kernel/trace/kfunc_md.c
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/slab.h>
+#include <linux/memory.h>
+#include <linux/rcupdate.h>
+#include <linux/ftrace.h>
+#include <linux/kfunc_md.h>
+
+#define ENTRIES_PER_PAGE (PAGE_SIZE / sizeof(struct kfunc_md))
+
+static u32 kfunc_md_count = ENTRIES_PER_PAGE, kfunc_md_used;
+struct kfunc_md __rcu *kfunc_mds;
+EXPORT_SYMBOL_GPL(kfunc_mds);
+
+static DEFINE_MUTEX(kfunc_md_mutex);
+
+
+void kfunc_md_unlock(void)
+{
+	mutex_unlock(&kfunc_md_mutex);
+}
+EXPORT_SYMBOL_GPL(kfunc_md_unlock);
+
+void kfunc_md_lock(void)
+{
+	mutex_lock(&kfunc_md_mutex);
+}
+EXPORT_SYMBOL_GPL(kfunc_md_lock);
+
+static u32 kfunc_md_get_index(void *ip)
+{
+	return *(u32 *)(ip - KFUNC_MD_DATA_OFFSET);
+}
+
+static void kfunc_md_init(struct kfunc_md *mds, u32 start, u32 end)
+{
+	u32 i;
+
+	for (i = start; i < end; i++)
+		mds[i].users = 0;
+}
+
+static int kfunc_md_page_order(void)
+{
+	return fls(DIV_ROUND_UP(kfunc_md_count, ENTRIES_PER_PAGE)) - 1;
+}
+
+/* Get next usable function metadata. On success, return the usable
+ * kfunc_md and store the index of it to *index. If no usable kfunc_md is
+ * found in kfunc_mds, a larger array will be allocated.
+ */
+static struct kfunc_md *kfunc_md_get_next(u32 *index)
+{
+	struct kfunc_md *new_mds, *mds;
+	u32 i, order;
+
+	mds = rcu_dereference(kfunc_mds);
+	if (mds == NULL) {
+		order = kfunc_md_page_order();
+		new_mds = (void *)__get_free_pages(GFP_KERNEL, order);
+		if (!new_mds)
+			return NULL;
+		kfunc_md_init(new_mds, 0, kfunc_md_count);
+		/* The first time to initialize kfunc_mds, so it is not
+		 * used anywhere yet, and we can update it directly.
+		 */
+		rcu_assign_pointer(kfunc_mds, new_mds);
+		mds = new_mds;
+	}
+
+	if (likely(kfunc_md_used < kfunc_md_count)) {
+		/* maybe we can manage the used function metadata entry
+		 * with a bit map ?
+		 */
+		for (i = 0; i < kfunc_md_count; i++) {
+			if (!mds[i].users) {
+				kfunc_md_used++;
+				*index = i;
+				mds[i].users++;
+				return mds + i;
+			}
+		}
+	}
+
+	order = kfunc_md_page_order();
+	/* no available function metadata, so allocate a bigger function
+	 * metadata array.
+	 */
+	new_mds = (void *)__get_free_pages(GFP_KERNEL, order + 1);
+	if (!new_mds)
+		return NULL;
+
+	memcpy(new_mds, mds, kfunc_md_count * sizeof(*new_mds));
+	kfunc_md_init(new_mds, kfunc_md_count, kfunc_md_count * 2);
+
+	rcu_assign_pointer(kfunc_mds, new_mds);
+	synchronize_rcu();
+	free_pages((u64)mds, order);
+
+	mds = new_mds + kfunc_md_count;
+	*index = kfunc_md_count;
+	kfunc_md_count <<= 1;
+	kfunc_md_used++;
+	mds->users++;
+
+	return mds;
+}
+
+static int kfunc_md_text_poke(void *ip, void *insn, void *nop)
+{
+	void *target;
+	int ret = 0;
+	u8 *prog;
+
+	target = ip - KFUNC_MD_INSN_OFFSET;
+	mutex_lock(&text_mutex);
+	if (insn) {
+		if (!memcmp(target, insn, KFUNC_MD_INSN_SIZE))
+			goto out;
+
+		if (memcmp(target, nop, KFUNC_MD_INSN_SIZE)) {
+			ret = -EBUSY;
+			goto out;
+		}
+		prog = insn;
+	} else {
+		if (!memcmp(target, nop, KFUNC_MD_INSN_SIZE))
+			goto out;
+		prog = nop;
+	}
+
+	ret = kfunc_md_arch_poke(target, prog);
+out:
+	mutex_unlock(&text_mutex);
+	return ret;
+}
+
+static bool __kfunc_md_put(struct kfunc_md *md)
+{
+	u8 nop_insn[KFUNC_MD_INSN_SIZE];
+
+	if (WARN_ON_ONCE(md->users <= 0))
+		return false;
+
+	md->users--;
+	if (md->users > 0)
+		return false;
+
+	if (!kfunc_md_arch_exist(md->func))
+		return false;
+
+	kfunc_md_arch_nops(nop_insn);
+	/* release the metadata by recovering the function padding to NOPS */
+	kfunc_md_text_poke(md->func, NULL, nop_insn);
+	/* TODO: we need a way to shrink the array "kfunc_mds" */
+	kfunc_md_used--;
+
+	return true;
+}
+
+/* Decrease the reference of the md, release it if "md->users <= 0" */
+void kfunc_md_put(struct kfunc_md *md)
+{
+	mutex_lock(&kfunc_md_mutex);
+	__kfunc_md_put(md);
+	mutex_unlock(&kfunc_md_mutex);
+}
+EXPORT_SYMBOL_GPL(kfunc_md_put);
+
+/* Get a exist metadata by the function address, and NULL will be returned
+ * if not exist.
+ *
+ * NOTE: rcu lock should be held during reading the metadata, and
+ * kfunc_md_lock should be held if writing happens.
+ */
+struct kfunc_md *kfunc_md_find(void *ip)
+{
+	struct kfunc_md *md;
+	u32 index;
+
+	if (kfunc_md_arch_exist(ip)) {
+		index = kfunc_md_get_index(ip);
+		if (WARN_ON_ONCE(index >= kfunc_md_count))
+			return NULL;
+
+		md = &kfunc_mds[index];
+		return md;
+	}
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(kfunc_md_find);
+
+void kfunc_md_put_by_ip(void *ip)
+{
+	struct kfunc_md *md;
+
+	mutex_lock(&kfunc_md_mutex);
+	md = kfunc_md_find(ip);
+	if (md)
+		__kfunc_md_put(md);
+	mutex_unlock(&kfunc_md_mutex);
+}
+EXPORT_SYMBOL_GPL(kfunc_md_put_by_ip);
+
+/* Get a exist metadata by the function address, and create one if not
+ * exist. Reference of the metadata will increase 1.
+ *
+ * NOTE: always call this function with kfunc_md_lock held, and all
+ * updating to metadata should also hold the kfunc_md_lock.
+ */
+struct kfunc_md *kfunc_md_get(void *ip)
+{
+	u8 nop_insn[KFUNC_MD_INSN_SIZE], insn[KFUNC_MD_INSN_SIZE];
+	struct kfunc_md *md;
+	u32 index;
+
+	md = kfunc_md_find(ip);
+	if (md) {
+		md->users++;
+		return md;
+	}
+
+	md = kfunc_md_get_next(&index);
+	if (!md)
+		return NULL;
+
+	kfunc_md_arch_pretend(insn, index);
+	kfunc_md_arch_nops(nop_insn);
+
+	if (kfunc_md_text_poke(ip, insn, nop_insn)) {
+		kfunc_md_used--;
+		md->users = 0;
+		return NULL;
+	}
+	md->func = ip;
+
+	return md;
+}
+EXPORT_SYMBOL_GPL(kfunc_md_get);
-- 
2.39.5


