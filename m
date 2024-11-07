Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370B2D5D683
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 19:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vESesoiVtbJ5CrbpH7IWeZb0ibwWP9dcTopCcxMyPyM=; b=xJDX8jGka8A1S3dm5KQRcUb9PG
	D2yvl//aqI49vo7XFHKOWM0vnWgqCPg+e0PUADihxM16bn3KE15dyC//RAB0grW9WlH+PwCVi+QIg
	z2R0p5RFnRidqCDQvRFwmKqp3LVn4zK+EmgrDxoVc2VBp5pbfKHpivU8G5ka52e5WBaQxSWdJq1ak
	zBaBCkK/uiMo9p8404Ly5rmAEiSKwLuzhtkX6Col3RbuWFyRnrnlUXp0okECQtU+6/HDrvNNSVryo
	PR0KJDtx+G4c9lPDNuDBs1NZ8/3gGd2xms8EXwz1SbCBkKtepndxHeqwYvxzokb7bwHuIMqOjWrCD
	2Mshqyig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t97wi-000000082PM-1LGl;
	Thu, 07 Nov 2024 19:13:32 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t97nx-0000000803i-47Ka
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 19:04:32 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ea95f530fdso23973227b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 11:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731006266; x=1731611066; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vESesoiVtbJ5CrbpH7IWeZb0ibwWP9dcTopCcxMyPyM=;
        b=LAlR+hUcCQa69xGUU/tUkjfkW5B/ho/xyrBusT0vibF+51hANTXBsdh16pfLzK2ZI/
         VRPJswbShX2ClTwbhmAt3WVvKY98/iIo4RZ+RkG1/+33Zg2cETebqmHdwSm9u3IhvKO4
         oGqueggKvfT4g3miR2AI6JUhkuegebGzTfgsUHJrtVXocMWZlPtw6pDHzPBpAAshCHER
         9KoxVUjTx6y+/6j6mr+sfnHp9kk+6SPErTEfL6GSoKtyMG1UF0PgTH9x9o3zCnvk25wh
         VSXgXM5csJHpwwVOLSpniuBf5k3Q2FrGwOsemPbmUkeAeUuuUp12XYH1KeAiPcIDSiNG
         tnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731006266; x=1731611066;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vESesoiVtbJ5CrbpH7IWeZb0ibwWP9dcTopCcxMyPyM=;
        b=DAQ0xq7onEk/wIiFNauO/0EW3Nz/6/Ot8SIVbDXpyoSgp0IT1kSWdwNRI/HQvx/AWC
         qzCVIvp73fT2apX/Uqq3kk02utKOzwhf0QoZRHcvcLiKBLLKnGnk0Z+jCS/9te7PcV1U
         yIZNCpuFjoKjlCrvaTNrsB3K0lDX+24U2LuDnmklynyK1nLNDkzCe3vReDS3IEDoUXkm
         c0mLNdGVeIWQVFwJT0rlBuW6+TGheB2Sg6T3cfVq4YRXN86UpahqCX/Kh1UUcuTVShae
         58XN8U+JsPNjWaX3ZlIDZRdctEI4xYgateA49oGBBBCwjO0VUap66htJbB7UMQfCGelx
         xL2g==
X-Forwarded-Encrypted: i=1; AJvYcCXz/YqFJswPwTHDmlM41KSpYWkxaFwhXVnH4X864wHJtbJ2GMIRv3eK9WxvrnNihLGdjpRQe16iYFe5zEYu+J6v@lists.infradead.org
X-Gm-Message-State: AOJu0YzEFLovukdwUhp+4O9jC3OTATEcXGWtry8D7luWNr9SciY00XDI
	D5QtRHNJgJgKa2wVtgbTWCKVVvAyJqEc4xR0ztCNHM521COx02UYezdWISAF/LlAPhWxjm34u0M
	Sg7wO9pgN4bqK70Ll+QuVyA==
X-Google-Smtp-Source: AGHT+IGXuJlEq1t5lqBLreTvAmTX3/pTRhMgd6fK8xMUDZ0hi2nsL+XYIepKn3i6v5drJSrRoyPuUdAvOZYi+BVpwA==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a25:ce0b:0:b0:e29:b6d7:20e2 with SMTP
 id 3f1490d57ef6-e337f786589mr105276.0.1731006265865; Thu, 07 Nov 2024
 11:04:25 -0800 (PST)
Date: Thu,  7 Nov 2024 19:03:33 +0000
In-Reply-To: <20241107190336.2963882-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20241107190336.2963882-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107190336.2963882-3-coltonlewis@google.com>
Subject: [PATCH v7 2/5] perf: Hoist perf_instruction_pointer() and perf_misc_flags()
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Will Deacon <will@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_110430_056916_3C329FA2 
X-CRM114-Status: GOOD (  19.64  )
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

For clarity, rename the arch-specific definitions of these functions
to perf_arch_* to denote they are arch-specifc. Define the
generic-named functions in one place where they can call the
arch-specific ones as needed.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
Acked-by: Thomas Richter <tmricht@linux.ibm.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/include/asm/perf_event.h          |  6 +++---
 arch/arm64/kernel/perf_callchain.c           |  4 ++--
 arch/powerpc/include/asm/perf_event_server.h |  6 +++---
 arch/powerpc/perf/core-book3s.c              |  4 ++--
 arch/s390/include/asm/perf_event.h           |  6 +++---
 arch/s390/kernel/perf_event.c                |  4 ++--
 arch/x86/events/core.c                       |  4 ++--
 arch/x86/include/asm/perf_event.h            | 10 +++++-----
 include/linux/perf_event.h                   |  9 ++++++---
 kernel/events/core.c                         | 10 ++++++++++
 10 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/include/asm/perf_event.h b/arch/arm64/include/asm/perf_event.h
index eb7071c9eb34..31a5584ed423 100644
--- a/arch/arm64/include/asm/perf_event.h
+++ b/arch/arm64/include/asm/perf_event.h
@@ -11,9 +11,9 @@
 
 #ifdef CONFIG_PERF_EVENTS
 struct pt_regs;
-extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
-extern unsigned long perf_misc_flags(struct pt_regs *regs);
-#define perf_misc_flags(regs)	perf_misc_flags(regs)
+extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
+extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
+#define perf_arch_misc_flags(regs)	perf_misc_flags(regs)
 #define perf_arch_bpf_user_pt_regs(regs) &regs->user_regs
 #endif
 
diff --git a/arch/arm64/kernel/perf_callchain.c b/arch/arm64/kernel/perf_callchain.c
index e8ed5673f481..01a9d08fc009 100644
--- a/arch/arm64/kernel/perf_callchain.c
+++ b/arch/arm64/kernel/perf_callchain.c
@@ -39,7 +39,7 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 	arch_stack_walk(callchain_trace, entry, current, regs);
 }
 
-unsigned long perf_instruction_pointer(struct pt_regs *regs)
+unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
 {
 	if (perf_guest_state())
 		return perf_guest_get_ip();
@@ -47,7 +47,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
 	return instruction_pointer(regs);
 }
 
-unsigned long perf_misc_flags(struct pt_regs *regs)
+unsigned long perf_arch_misc_flags(struct pt_regs *regs)
 {
 	unsigned int guest_state = perf_guest_state();
 	int misc = 0;
diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
index 5995614e9062..af0f46e2373b 100644
--- a/arch/powerpc/include/asm/perf_event_server.h
+++ b/arch/powerpc/include/asm/perf_event_server.h
@@ -102,8 +102,8 @@ struct power_pmu {
 int __init register_power_pmu(struct power_pmu *pmu);
 
 struct pt_regs;
-extern unsigned long perf_misc_flags(struct pt_regs *regs);
-extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
+extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
+extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
 extern unsigned long int read_bhrb(int n);
 
 /*
@@ -111,7 +111,7 @@ extern unsigned long int read_bhrb(int n);
  * if we have hardware PMU support.
  */
 #ifdef CONFIG_PPC_PERF_CTRS
-#define perf_misc_flags(regs)	perf_misc_flags(regs)
+#define perf_arch_misc_flags(regs)	perf_arch_misc_flags(regs)
 #endif
 
 /*
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 42867469752d..dc01aa604cc1 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2332,7 +2332,7 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
  * Called from generic code to get the misc flags (i.e. processor mode)
  * for an event_id.
  */
-unsigned long perf_misc_flags(struct pt_regs *regs)
+unsigned long perf_arch_misc_flags(struct pt_regs *regs)
 {
 	u32 flags = perf_get_misc_flags(regs);
 
@@ -2346,7 +2346,7 @@ unsigned long perf_misc_flags(struct pt_regs *regs)
  * Called from generic code to get the instruction pointer
  * for an event_id.
  */
-unsigned long perf_instruction_pointer(struct pt_regs *regs)
+unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
 {
 	unsigned long siar = mfspr(SPRN_SIAR);
 
diff --git a/arch/s390/include/asm/perf_event.h b/arch/s390/include/asm/perf_event.h
index 29ee289108c5..e53894cedf08 100644
--- a/arch/s390/include/asm/perf_event.h
+++ b/arch/s390/include/asm/perf_event.h
@@ -37,9 +37,9 @@ extern ssize_t cpumf_events_sysfs_show(struct device *dev,
 
 /* Perf callbacks */
 struct pt_regs;
-extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
-extern unsigned long perf_misc_flags(struct pt_regs *regs);
-#define perf_misc_flags(regs) perf_misc_flags(regs)
+extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
+extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
+#define perf_arch_misc_flags(regs) perf_arch_misc_flags(regs)
 #define perf_arch_bpf_user_pt_regs(regs) &regs->user_regs
 
 /* Perf pt_regs extension for sample-data-entry indicators */
diff --git a/arch/s390/kernel/perf_event.c b/arch/s390/kernel/perf_event.c
index 5fff629b1a89..f9000ab49f4a 100644
--- a/arch/s390/kernel/perf_event.c
+++ b/arch/s390/kernel/perf_event.c
@@ -57,7 +57,7 @@ static unsigned long instruction_pointer_guest(struct pt_regs *regs)
 	return sie_block(regs)->gpsw.addr;
 }
 
-unsigned long perf_instruction_pointer(struct pt_regs *regs)
+unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
 {
 	return is_in_guest(regs) ? instruction_pointer_guest(regs)
 				 : instruction_pointer(regs);
@@ -84,7 +84,7 @@ static unsigned long perf_misc_flags_sf(struct pt_regs *regs)
 	return flags;
 }
 
-unsigned long perf_misc_flags(struct pt_regs *regs)
+unsigned long perf_arch_misc_flags(struct pt_regs *regs)
 {
 	/* Check if the cpum_sf PMU has created the pt_regs structure.
 	 * In this case, perf misc flags can be easily extracted.  Otherwise,
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 65ab6460aed4..d19e939f3998 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -3003,7 +3003,7 @@ static unsigned long code_segment_base(struct pt_regs *regs)
 	return 0;
 }
 
-unsigned long perf_instruction_pointer(struct pt_regs *regs)
+unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
 {
 	if (perf_guest_state())
 		return perf_guest_get_ip();
@@ -3011,7 +3011,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
 	return regs->ip + code_segment_base(regs);
 }
 
-unsigned long perf_misc_flags(struct pt_regs *regs)
+unsigned long perf_arch_misc_flags(struct pt_regs *regs)
 {
 	unsigned int guest_state = perf_guest_state();
 	int misc = 0;
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 91b73571412f..feb87bf3d2e9 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -536,15 +536,15 @@ struct x86_perf_regs {
 	u64		*xmm_regs;
 };
 
-extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
-extern unsigned long perf_misc_flags(struct pt_regs *regs);
-#define perf_misc_flags(regs)	perf_misc_flags(regs)
+extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
+extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
+#define perf_arch_misc_flags(regs)	perf_arch_misc_flags(regs)
 
 #include <asm/stacktrace.h>
 
 /*
- * We abuse bit 3 from flags to pass exact information, see perf_misc_flags
- * and the comment with PERF_EFLAGS_EXACT.
+ * We abuse bit 3 from flags to pass exact information, see
+ * perf_arch_misc_flags() and the comment with PERF_EFLAGS_EXACT.
  */
 #define perf_arch_fetch_caller_regs(regs, __ip)		{	\
 	(regs)->ip = (__ip);					\
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index fb908843f209..772ad352856b 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1655,10 +1655,13 @@ extern void perf_tp_event(u16 event_type, u64 count, void *record,
 			  struct task_struct *task);
 extern void perf_bp_event(struct perf_event *event, void *data);
 
-#ifndef perf_misc_flags
-# define perf_misc_flags(regs) \
+extern unsigned long perf_misc_flags(struct pt_regs *regs);
+extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
+
+#ifndef perf_arch_misc_flags
+# define perf_arch_misc_flags(regs) \
 		(user_mode(regs) ? PERF_RECORD_MISC_USER : PERF_RECORD_MISC_KERNEL)
-# define perf_instruction_pointer(regs)	instruction_pointer(regs)
+# define perf_arch_instruction_pointer(regs)	instruction_pointer(regs)
 #endif
 #ifndef perf_arch_bpf_user_pt_regs
 # define perf_arch_bpf_user_pt_regs(regs) regs
diff --git a/kernel/events/core.c b/kernel/events/core.c
index df27d08a7232..2c44ffd6f4d8 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7022,6 +7022,16 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
 #endif
 
+unsigned long perf_misc_flags(struct pt_regs *regs)
+{
+	return perf_arch_misc_flags(regs);
+}
+
+unsigned long perf_instruction_pointer(struct pt_regs *regs)
+{
+	return perf_arch_instruction_pointer(regs);
+}
+
 static void
 perf_output_sample_regs(struct perf_output_handle *handle,
 			struct pt_regs *regs, u64 mask)
-- 
2.47.0.277.g8800431eea-goog


