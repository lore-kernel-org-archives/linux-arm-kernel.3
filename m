Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F1DC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 21:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWq1XbSkyOkuYcVulfJjVxpq/eHKTQbF0thAv0NyIGs=; b=cpKxKjluymcL9m2bTSPHtrOlKn
	hMlMLEZrJuw3gtbLRy0trW2MWBiQlN/SUsgdbari96MYdavyVappk0opjJR70cxdG8sXRl7EyovcW
	8VQCfHs8t/3QzV4H/GdIOtSWjVg1QQiYkbrxJpqCDH98XJaTGUNShmobbziAIPZBpITkQrAV2+uM5
	jvl9QN95wch77N6fAESr4lJyKK3q3TsQ43gl91G/5o/lWEci1bihGOOhMWLzvRNzljMoJ3+3eMMvL
	/sbB5DIN+WfFDBGEI71b68d+Bttv9BmTGrILsNKt9gPoxGr19n7pwJ1aHJVDEMZ8hpNN/pFFHGOnu
	B+yyJOyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWoD-00000003K47-2IAY;
	Mon, 27 Jan 2025 21:38:17 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWjZ-00000003J9m-11fa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 21:33:31 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef9204f898so9422900a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 13:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738013608; x=1738618408; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jWq1XbSkyOkuYcVulfJjVxpq/eHKTQbF0thAv0NyIGs=;
        b=eT4meLmHYWSn2uWvRgwp9cQx3gKc9jttznJY6U3pn3+UldfAPY98tXH01B90ZiMK1J
         IO2jIDi/MLeAjtebu03Tt2cqzZ4JR/dIAodNi7OzNTuesMrAWzsBU24qA5DuUsIDI0na
         I7siAjFkqFWJ8LW9NIFi6B5STK7e+ucydFm/89ZfjIrVZOPz8Ti1z0mtDw5gCzUlG/Xd
         25PmyDoeHY7/4iadlnb/HB2lKs2KWq6Kq/nVgh15UBekNyZmpbCvvp53CNDdLLYWbO7T
         egy69OslQcstSuze9c72W0qjvrd7bvWfFbB/K8CoU2fW4XwIJwyDChHeoeMboJ7Ennqx
         xalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738013608; x=1738618408;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jWq1XbSkyOkuYcVulfJjVxpq/eHKTQbF0thAv0NyIGs=;
        b=Dy7MacwA9h0jTI3TXrPnMxCel0ftMbQD1ZGu//8rSXm5d0x+rhg/8vmIAWhFl3eN3n
         mPy+1xba37EPpqc3EkAaaU2K4b2AkNINSo3SMEORhsF9HagnUTKUpFLLT/ctEH9tb0/c
         uV59Kj5wwN1dJPaPbyZTsiXZ509TOYcyawK8tEaiOqbmcDG9eK3YaFkDc9P+og8gRWVW
         Ilfwsz/kR18aacMqi6v/C47YsKrCv46Gfg3BKYzlHsHJKSfm600gF6x6mOKmgMC0wMwX
         9VEKcSwG2xwHhdxeX06A4aPjmrukv57GtVAPTNCliEzjAncAR8wkFqZIDua0LLfRUs7X
         9kgg==
X-Forwarded-Encrypted: i=1; AJvYcCUDPp5xPLa2P9qxUbq6tr1kZuM4jtQxB8YHaBDQQ/wG95+dTy/+wuoFTqh9OOaqoGpSZVliIttQOepK4U4jQJM0@lists.infradead.org
X-Gm-Message-State: AOJu0YwH8PxxLJ99t2hSvj3czA0paoD/JRzT/8tNpaGb8wFNC0bL1tpV
	ntBqM7/NVFuGFr1aO9QBAMotET1bJuBmAHmFdYNL4BH5FEBE3bYkdBvMyIZHBG4ZOjhyE//LqA=
	=
X-Google-Smtp-Source: AGHT+IGsA2oXsBLBU6n+vsGTmoyiK5KDPDDibU+y8Mvqe4ndlxlznHpYDael7KmNjQ8dikt+jPZ/Btay/Q==
X-Received: from pjbse3.prod.google.com ([2002:a17:90b:5183:b0:2ea:4139:e72d])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:6c6:b0:2ee:889b:b11e
 with SMTP id 98e67ed59e1d1-2f782d972eamr59541677a91.30.1738013607746; Mon, 27
 Jan 2025 13:33:27 -0800 (PST)
Date: Mon, 27 Jan 2025 21:33:04 +0000
In-Reply-To: <20250127213310.2496133-1-wnliu@google.com>
Mime-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250127213310.2496133-3-wnliu@google.com>
Subject: [PATCH 2/8] arm64: entry: add unwind info for various kernel entries
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
X-CRM114-CacheID: sfid-20250127_133329_287962_981C5829 
X-CRM114-Status: GOOD (  12.39  )
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

DWARF CFI (Call Frame Information) specifies how to recover the return
address and callee-saved registers at each PC in a given function.
Compilers are able to generate the CFI annotations when they compile
the code to assembly language. For handcrafted assembly, we need to
annotate them by hand.

Annotate CFI unwind info for assembly for interrupt and exception
handlers.

Signed-off-by: Weinan Liu <wnliu@google.com>
---
 arch/arm64/kernel/entry.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 5ae2a34b50bd..fe3e3e29ee5d 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -579,7 +579,12 @@ SYM_CODE_START_LOCAL(el\el\ht\()_\regsize\()_\label)
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
 	/* Move to the new stack and call the function there */
 	add	sp, x16, #IRQ_STACK_SIZE
 	blr	x1
+	.cfi_startproc
+	.cfi_def_cfa 29, 16
+	.cfi_offset 29, -16
+	.cfi_offset 30, -8
 
 	/*
 	 * Restore the SP from the FP, and restore the FP and LR from the frame
@@ -898,6 +907,7 @@ SYM_FUNC_START(call_on_irq_stack)
 	ldp	x29, x30, [sp], #16
 	scs_load_current
 	ret
+	.cfi_endproc
 SYM_FUNC_END(call_on_irq_stack)
 NOKPROBE(call_on_irq_stack)
 
-- 
2.48.1.262.g85cc9f2d1e-goog


