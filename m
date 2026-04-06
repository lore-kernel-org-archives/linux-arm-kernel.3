Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2F9F46C74
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 18:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8HXbZLR5ZhYSlqgeT0xflWnaF053OqDtzxDl5bISse0=; b=e221otkpt6MM+l24HC15vYBI4R
	SNRFKrRHqDfFyf+I32O5JE7+GtfkH1T87KmY8E6R1pRy+DgnUUAhzflC70tXt3MWnCGFyeZ1DeaI4
	51zHhznwNXor5MELklxoS5ood8oh2ZH9bGna4mHHo/EYSOr2Mjzlx9VhIYbEHy+ohwwHXeD6eEbCc
	ZpY/kC4Zt/c90Rv0G8BaOhUxoQ+LbDBWO73CJWoRK8AZWLH0oJOCaYqlGNofJGhnib3GSXzaHssS/
	WzsKTfoAt0dF4cpNyBQE8RhYBcuwfdQPD7y02evxKCCGmnhw5J8ajR5/z/BXGW3qUYcobfyabeHkV
	dkS1Lcog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9p1m-00000005PPw-3aPd;
	Mon, 06 Apr 2026 18:50:26 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9p1j-00000005PNd-3kzM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 18:50:24 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82cd9fa608bso7530781b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 11:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775501423; x=1776106223; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8HXbZLR5ZhYSlqgeT0xflWnaF053OqDtzxDl5bISse0=;
        b=ISKqweNz4ji77fn3/pRThKSdRe42EIZhDbcHpW/aKv3dlaTjTV/o8qfvdFUk3V29hW
         gjwutaWeKx4KTyNouWRFISc/7UAR6R/+dhPuf6oUa4ftoN8b7WmkhdOxlM+KAui2MNbf
         ZxtuDirobf94Nt5nyHju2dHpUtzSOOyMF+XE0hWFxQfLRhwJJjKEmm5eVnL+q9fJMUoz
         lgJOk2oHqj3i5P6QUvY50GUOZN+XXRIiPpoeQP4PI9dbqiDbHmQrIRQEiv01FdAqdx/a
         z8sOTkR3Eb2OiYjwWKHkAFOkw/G7G68cDjXqVULn2KiVuYOEdt2ROAoFhf7RbYGk8dkE
         lXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775501423; x=1776106223;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8HXbZLR5ZhYSlqgeT0xflWnaF053OqDtzxDl5bISse0=;
        b=b4MBC3P+eSGf0fI0W4wiFcUS3S5DSaE/4Psxo2zbNoFpyI0PIUqxOv6kqr1nGrzbo6
         bp3/71Wi4nicZycXaAUPNfI1cp2R8hlkE+v95UpKyEJDe2e4DpSSvkkVv/2LflJufo07
         CJHdiRxsN073l5I8XpAJIFmF/jrym8AZ/7HdJYu747V22Li6jA5TVIdIHah1AtComtPh
         ufyTch0XsuXgikvs+LAgzmRCk7cJ1vImxDzhiGrXybCy2PLsxCct4UlMX+ARM6V5GRae
         i2+xQu6MKZ/U50sOFAGHoG8i9wRS49YeIQl8oGBDx5/X1USwJjJQ8A9hDSspz0Dy4L9l
         cQaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn8y0rtXtoDeJEbVY8w7lmCfU93c030soSSexaw7qVocXRUYB9+H0tM5a5aXUXExZ+0QDX/uZKVTSBWvNELwEi@lists.infradead.org
X-Gm-Message-State: AOJu0YyAF+rczrnd0Jszs7RBf3S12yqUp6QZuihAJ0r2WT1eSpMtmON4
	Y1loeyigWcOtOmRZzrbI3t+lKz0bLRnoY52HjomZ+7oWCMbLCapeYgC/c3L2jnN6D/SPA3tKWeX
	ipNVxCcbKH1gpVEI5taZy70G9og==
X-Received: from pfx19.prod.google.com ([2002:a05:6a00:a453:b0:82a:5e62:7b95])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:800a:b0:82a:6461:6d15 with SMTP id d2e1a72fcca58-82d0dbbc24dmr13636080b3a.46.1775501422424;
 Mon, 06 Apr 2026 11:50:22 -0700 (PDT)
Date: Mon,  6 Apr 2026 18:49:55 +0000
In-Reply-To: <20260406185000.1378082-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260406185000.1378082-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260406185000.1378082-4-dylanbhatch@google.com>
Subject: [PATCH v3 3/8] arm64: entry: add unwind info for various kernel entries
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>
Cc: Dylan Hatch <dylanbhatch@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	Jens Remus <jremus@linux.ibm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_115023_935296_6613FF67 
X-CRM114-Status: GOOD (  11.27  )
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

From: Weinan Liu <wnliu@google.com>

DWARF CFI (Call Frame Information) specifies how to recover the return
address and callee-saved registers at each PC in a given function.
Compilers are able to generate the CFI annotations when they compile
the code to assembly language. For handcrafted assembly, we need to
annotate them by hand.

Annotate CFI unwind info for assembly for interrupt and exception
handlers.

Signed-off-by: Weinan Liu <wnliu@google.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/kernel/entry.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index f8018b5c1f9a..3148ede8c2c6 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -575,7 +575,12 @@ SYM_CODE_START_LOCAL(el\el\ht\()_\regsize\()_\label)
 	.if \el == 0
 	b	ret_to_user
 	.else
+	.cfi_startproc
+	.cfi_def_cfa_offset PT_REGS_SIZE
+	.cfi_offset 29, S_FP - PT_REGS_SIZE
+	.cfi_offset 30, S_LR - PT_REGS_SIZE
 	b	ret_to_kernel
+	.cfi_endproc
 	.endif
 SYM_CODE_END(el\el\ht\()_\regsize\()_\label)
 	.endm
@@ -889,6 +894,10 @@ SYM_FUNC_START(call_on_irq_stack)
 	add	sp, x16, #IRQ_STACK_SIZE
 	restore_irq x9
 	blr	x1
+	.cfi_startproc
+	.cfi_def_cfa 29, 16
+	.cfi_offset 29, -16
+	.cfi_offset 30, -8
 
 	save_and_disable_daif x9
 	/*
@@ -900,6 +909,7 @@ SYM_FUNC_START(call_on_irq_stack)
 	scs_load_current
 	restore_irq x9
 	ret
+	.cfi_endproc
 SYM_FUNC_END(call_on_irq_stack)
 NOKPROBE(call_on_irq_stack)
 
-- 
2.53.0.1213.gd9a14994de-goog


