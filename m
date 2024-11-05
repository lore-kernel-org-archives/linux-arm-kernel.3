Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAFFD36121
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 20:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+A/E6dh30+B+DuVgwcV18/qvNhG5j8MCeVP9K0OnPU=; b=jdP848FogDoYDbtAAJmorOJq77
	LPtjrs5t7rGC7MYPqQlS0LVJTSHrjowIcsAcRRESNYW77JyTSSwlKpxgblIV4qbtBQpmx3wtfGKox
	Q24GeNEQks0ne00S6WhHRHN6yCLE0/utANYCDJlaEdv0LBPPI3QnIDo8KXISRVte/PUDEeE2aTncA
	xzSaiXCg68EWPxYsP7t3y/PiLSq35hlukmFh0CCELkK8mNKARmPjL1AaD8EyBjAfpyQkzg5XKYiGx
	ha/SA1mgDY2T3KxaRZ3vA5fTfihsz/HMPlqmhBRxWiP0AtkCZ+AmBopmdn0o4PgjNoTWIFjv0c/pe
	nbsxnlvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Po6-00000000exT-28Ol;
	Tue, 05 Nov 2024 20:05:42 +0000
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PfH-00000000cWO-0rwN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 19:56:36 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-83aa904b231so626142839f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 11:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730836593; x=1731441393; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g+A/E6dh30+B+DuVgwcV18/qvNhG5j8MCeVP9K0OnPU=;
        b=dlXZQpe/iiewsrMCdl58q/gqSbFQs1ui/bd0lRmYtoqnX/OQk8HOESaEq4kaEhBzZv
         71fIWlk6gpDqvaBhuOCEJ3/qfMv/8gq+FgbXIuzXahtngAn0Ocof42RBq5wbKunc3rLQ
         Fo3dUA3VJMwSHLuopuj0JjLzKiljPoNdMEpQZuuC/QXn6DHkEfl2AJF9F/jm1DauN5DG
         gkCYbozMpYWW8bW+HLg5+kT2qWYx9/+Xo0icBeQ9FmmjFBT4GU4Q4cFcYu4WZxbyY3ne
         40WRYEW4Yi9MCznn+riSJTojkH4M4Psop1TVOYiabB4AD1bIPqygrJCHxrf8KxtquIu6
         2SnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730836593; x=1731441393;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+A/E6dh30+B+DuVgwcV18/qvNhG5j8MCeVP9K0OnPU=;
        b=jZ13/TTIdW8YoBj9/xwlgrcICKyzkuWeJhV9mimOWh84yCY2MqB+ub9e1QA704gHpB
         W6GBW5C/zWlBmotZ18s4KFWAOJvd4/DvE1+4cQehdjfJG5l/gO5/tuhYTi/RZdqCGzwB
         W0wwjeOoWlfxRRkgjgydsYjS0kq42CZqAvJNSYG968dym/J0HrhzjfCfX0C6VOpzh+5h
         3V0ujcwts4DifDYM3fGYc97C+Y7yvp6rNBcJWc2I9nuE5C9gyY9rdV2YEaUjwJbhteHZ
         u8lcjW8zQX16dlUeJ+DjB/5m8PLhfX9iKZ+8q8+WQAcbWrsXFRoUa+GgGrzMj2oO8HnV
         Heuw==
X-Forwarded-Encrypted: i=1; AJvYcCU09ZlL2Lx2RcKHiHxefqfBJ5bDw+Ktu0YowsfY1gNTr8k/b1jS9/6j0v4j/aiZwN5txkGPtE9jKgtYtBDIUmrV@lists.infradead.org
X-Gm-Message-State: AOJu0YxFJWwv8E2wmiJKqa+EyxcZoCkmpdIlwUeBn64C/YuK2eiYTLSe
	hJnpY4ZJOwbO4Cx880jxQmG+3BgjjQP5jTWoB5xjKv8NoLaD0QsJuaCxabp2wCFKtD4rO28ih7W
	aEE7uvUrNIdwOKey+UcIBMQ==
X-Google-Smtp-Source: AGHT+IHwq3hF4ElsT4RerqS5KSh2j8l+o/SOi33LC2KdnD9j/u2Nkb6pf++GYEETuSfSuC1nI4Yu4HiUAJoPcaH3GQ==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a05:6638:210d:b0:4db:e5f0:ceaf with
 SMTP id 8926c6da1cb9f-4de0257ba11mr134988173.0.1730836593213; Tue, 05 Nov
 2024 11:56:33 -0800 (PST)
Date: Tue,  5 Nov 2024 19:56:01 +0000
In-Reply-To: <20241105195603.2317483-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20241105195603.2317483-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Message-ID: <20241105195603.2317483-5-coltonlewis@google.com>
Subject: [PATCH v6 4/5] x86: perf: Refactor misc flag assignments
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
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_115635_344684_F0922E76 
X-CRM114-Status: GOOD (  15.44  )
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

Break the assignment logic for misc flags into their own respective
functions to reduce the complexity of the nested logic.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/x86/events/core.c            | 31 +++++++++++++++++++++++--------
 arch/x86/include/asm/perf_event.h |  2 ++
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index d19e939f3998..24910c625e3d 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -3011,16 +3011,34 @@ unsigned long perf_arch_instruction_pointer(struct pt_regs *regs)
 	return regs->ip + code_segment_base(regs);
 }
 
+static unsigned long common_misc_flags(struct pt_regs *regs)
+{
+	if (regs->flags & PERF_EFLAGS_EXACT)
+		return PERF_RECORD_MISC_EXACT_IP;
+
+	return 0;
+}
+
+unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
+{
+	unsigned long guest_state = perf_guest_state();
+	unsigned long flags = common_misc_flags(regs);
+
+	if (guest_state & PERF_GUEST_USER)
+		flags |= PERF_RECORD_MISC_GUEST_USER;
+	else if (guest_state & PERF_GUEST_ACTIVE)
+		flags |= PERF_RECORD_MISC_GUEST_KERNEL;
+
+	return flags;
+}
+
 unsigned long perf_arch_misc_flags(struct pt_regs *regs)
 {
 	unsigned int guest_state = perf_guest_state();
-	int misc = 0;
+	unsigned long misc = common_misc_flags(regs);
 
 	if (guest_state) {
-		if (guest_state & PERF_GUEST_USER)
-			misc |= PERF_RECORD_MISC_GUEST_USER;
-		else
-			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
+		misc |= perf_arch_guest_misc_flags(regs);
 	} else {
 		if (user_mode(regs))
 			misc |= PERF_RECORD_MISC_USER;
@@ -3028,9 +3046,6 @@ unsigned long perf_arch_misc_flags(struct pt_regs *regs)
 			misc |= PERF_RECORD_MISC_KERNEL;
 	}
 
-	if (regs->flags & PERF_EFLAGS_EXACT)
-		misc |= PERF_RECORD_MISC_EXACT_IP;
-
 	return misc;
 }
 
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index feb87bf3d2e9..d95f902acc52 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -538,7 +538,9 @@ struct x86_perf_regs {
 
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
 extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
+extern unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs);
 #define perf_arch_misc_flags(regs)	perf_arch_misc_flags(regs)
+#define perf_arch_guest_misc_flags(regs)	perf_arch_guest_misc_flags(regs)
 
 #include <asm/stacktrace.h>
 
-- 
2.47.0.199.ga7371fff76-goog


