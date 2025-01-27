Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510D4C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 21:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcMmLMqjQF9870LrAMy1ogNf6Ad9PcDDaPxJ25OGjiY=; b=HuWA9PuRVMRJqlJw/4vTdbBWC3
	5acIkDz5UroOzFvc4TfWf6tMTkgsjowtBwORJ6X6WhnRvzo4/CED5fszdOEJtV5xu2eO/WHUVXq9J
	xoBsSA35hGGs0q/j/FnOP5Uu5f+Yho57voC/jNJz209NJTCBH7VBpYhTm1aR08k8tIYgUrT3aZZQf
	cfokBNOFdGmnHVSmlQ9r+5MDe16itJ0P6gv56+n95YOOOzPFhGzmhfqAmRCwUIxpZeBV/r98Em9Lt
	oTRBi0ZMNvrIRBRZtzXhrjsg17515bDReqxfqixwBEQVJOGs+vIje8wRfC/t/LsUtnvZ+9dDsGpKq
	oiwWOhyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWtS-00000003Kjy-2LTj;
	Mon, 27 Jan 2025 21:43:42 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWjk-00000003JFZ-2TSe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 21:33:42 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2164fad3792so82086295ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 13:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738013619; x=1738618419; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FcMmLMqjQF9870LrAMy1ogNf6Ad9PcDDaPxJ25OGjiY=;
        b=ShM+XGCFwDCWOEvSJ6jW9uUbrB0RkWur7OSKqTJAsXSu1dXP6TuPx3IXDEPE9Ygalx
         vtpPTUhywc+P4QzArUdIS6bXL7yM9so0OJgN9Q9CvDqSHrQuvrPhXfgHtR2LhnslrRJM
         eyLxzf0AZkBPnl5BHLWauMCIDPR0F5PeELqv+KOpkoCkzJacQQddnpI8NmnrujCP9pSa
         6mPD42wUzcZbHZotlIBFjXL1MoU+hyiv7DmPQJlHg1VeA7PBbax0cjjcuM/+Yc6RWQDK
         YfoWSPerkEebuZPvoycPxMEl3xruN46N8Nvod/23bawvkYX2nTEyKsGtscLIV/Ua5p0C
         K/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738013619; x=1738618419;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FcMmLMqjQF9870LrAMy1ogNf6Ad9PcDDaPxJ25OGjiY=;
        b=eZGRddrrR2DKCO2LK8f7zKPVuTG6euDE6nohwNrmcEKTI5kUK2aQZqS/+kf8YshWmd
         KUCPEiYWDsKm0SbDvaaCaecexxmYcGTpQVkWDKl/Yn17pMhaksc5x8CmQfZr9o2tuSTR
         sPZIFTTucp+e3OS1G9pS/9KHMYWLvMt1SC28rZI62qp+RPOCy1m6KEzVZKDsqmuvKx0D
         cX+CXYanBJfCt8dTclFhSmPVdq2aC0r4yMyJRTgNDzgNVIUNF+V9dlroOBkNcFfgikuF
         GTlcWtCucrsDTKJbku6rk6JqdQqMbNTolOtZzR0YRzJMXzP4HfQ1xjr59xm9+1bDL9SR
         rIGw==
X-Forwarded-Encrypted: i=1; AJvYcCXc9rtIE3JtkJQj+lSssM5CIiIWEB7zKYzb9sR8mBDthlFaZO9Trye/6a9XLEOCWfJYheDVDbOIU4qBo3ESfFcA@lists.infradead.org
X-Gm-Message-State: AOJu0YwkSeFsxhmkeEa06bw/uWbKtrkG+kddkmXlcZbmwnKjBFwRDoyY
	ZIfGU8Uety683BvZVituJgV+6wlUBtwkp9g8TLSYNztnXnIfriKfXxAUusdSfPm3FVamHVHcOQ=
	=
X-Google-Smtp-Source: AGHT+IENqQ4a+JpNNuEyJE6twpdJLH79mb1KDwUiISYTqFmJctu2Pc5D2j5e3Ta7eQhNemgumBMfeJjRgA==
X-Received: from pgbbg17.prod.google.com ([2002:a05:6a02:111:b0:7fc:2b57:38f5])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:841c:b0:1e0:d9a0:4ff7
 with SMTP id adf61e73a8af0-1eb21599eecmr80987482637.32.1738013619557; Mon, 27
 Jan 2025 13:33:39 -0800 (PST)
Date: Mon, 27 Jan 2025 21:33:08 +0000
In-Reply-To: <20250127213310.2496133-1-wnliu@google.com>
Mime-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250127213310.2496133-7-wnliu@google.com>
Subject: [PATCH 6/8] unwind: arm64: add reliable stacktrace support for arm64
From: Weinan Liu <wnliu@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org, 
	Weinan Liu <wnliu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_133340_671696_FDD0B976 
X-CRM114-Status: GOOD (  16.93  )
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

To support livepatch, we need to add arch_stack_walk_reliable to
support reliable stacktrace according to
https://docs.kernel.org/livepatch/reliable-stacktrace.html#requirements

report stacktrace is not reliable if we are not able to unwind the stack
by sframe unwinder and fallback to FP based unwinder

Signed-off-by: Weinan Liu <wnliu@google.com>
---
 arch/arm64/include/asm/stacktrace/common.h |  2 +
 arch/arm64/kernel/stacktrace.c             | 47 +++++++++++++++++++++-
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/stacktrace/common.h b/arch/arm64/include/asm/stacktrace/common.h
index 19edae8a5b1a..26449cd402db 100644
--- a/arch/arm64/include/asm/stacktrace/common.h
+++ b/arch/arm64/include/asm/stacktrace/common.h
@@ -26,6 +26,7 @@ struct stack_info {
  * @stacks:      An array of stacks which can be unwound.
  * @nr_stacks:   The number of stacks in @stacks.
  * @cfa:         The sp value at the call site of the current function.
+ * @unreliable:  Stacktrace is unreliable.
  */
 struct unwind_state {
 	unsigned long fp;
@@ -36,6 +37,7 @@ struct unwind_state {
 	int nr_stacks;
 #ifdef CONFIG_SFRAME_UNWINDER
 	unsigned long cfa;
+	bool unreliable;
 #endif
 };
 
diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index c035adb8fe8a..eab16dc05bb5 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -310,11 +310,16 @@ kunwind_next(struct kunwind_state *state)
 	case KUNWIND_SOURCE_TASK:
 	case KUNWIND_SOURCE_REGS_PC:
 #ifdef CONFIG_SFRAME_UNWINDER
-	err = unwind_next_frame_sframe(&state->common);
+	if (!state->common.unreliable)
+		err = unwind_next_frame_sframe(&state->common);
 
 	/* Fallback to FP based unwinder */
-	if (err)
+	if (err || state->common.unreliable) {
 		err = kunwind_next_frame_record(state);
+		/* Mark its stacktrace result as unreliable if it is unwindable via FP */
+		if (!err)
+			state->common.unreliable = true;
+	}
 #else
 	err = kunwind_next_frame_record(state);
 #endif
@@ -446,6 +451,44 @@ noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry,
 	kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, regs);
 }
 
+#ifdef CONFIG_SFRAME_UNWINDER
+struct kunwind_reliable_consume_entry_data {
+	stack_trace_consume_fn consume_entry;
+	void *cookie;
+	bool unreliable;
+};
+
+static __always_inline bool
+arch_kunwind_reliable_consume_entry(const struct kunwind_state *state, void *cookie)
+{
+	struct kunwind_reliable_consume_entry_data *data = cookie;
+
+	if (state->common.unreliable) {
+		data->unreliable = true;
+		return false;
+	}
+	return data->consume_entry(data->cookie, state->common.pc);
+}
+
+noinline notrace int arch_stack_walk_reliable(
+				stack_trace_consume_fn consume_entry,
+				void *cookie, struct task_struct *task)
+{
+	struct kunwind_reliable_consume_entry_data data = {
+		.consume_entry = consume_entry,
+		.cookie = cookie,
+		.unreliable = false,
+	};
+
+	kunwind_stack_walk(arch_kunwind_reliable_consume_entry, &data, task, NULL);
+
+	if (data.unreliable)
+		return -EINVAL;
+
+	return 0;
+}
+#endif
+
 struct bpf_unwind_consume_entry_data {
 	bool (*consume_entry)(void *cookie, u64 ip, u64 sp, u64 fp);
 	void *cookie;
-- 
2.48.1.262.g85cc9f2d1e-goog


