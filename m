Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F96C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 16:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azrhXwwSRqDs6WGR50i+jG0dov5Ufcqav5n6HBzRID8=; b=J9nWmnMWlA1mEG3jwKMGOFL2W8
	bnOzKAZPNKIjVW8Ctz0SoioV3lQFDeSje7nF0pWF4hCpXAqNZIAYz3bfWpzRD7xPCrqllgkLPzM1p
	lj6CYbEWIy65BfqNeB/PML2+cEh39ajUPneWpqXLdSja/bV7cjZ9rnzJVS0SbUzpDcPKOz73PvU2k
	bJZ905aAP1BDZd3YXiSjrdkaz49NQQ7sBPBJcXFxEHVacworDQaVMif0Nkzgkf6j0LhlghBXPMr5o
	SbbNAGqfNUO47ZPaV/fqiArhV//fCdbck9w89jr67ReJmQZZ8s11B1K2iI7oiAv4qOJ0oAC//cIbb
	IrpblFJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoct-000000030l5-4AJf;
	Mon, 07 Jul 2025 16:23:31 +0000
Received: from mail-qv1-f44.google.com ([209.85.219.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoHM-00000002x8y-1v3g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:01:17 +0000
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6fa980d05a8so37139716d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 09:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751904075; x=1752508875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azrhXwwSRqDs6WGR50i+jG0dov5Ufcqav5n6HBzRID8=;
        b=YFf2KFkm5nrrgdgLQ77h/RTc2cSxTr/vX0zsCMiG8Cihor879zau3y/j/rfc6zry6W
         S9kGJ80nEbefPdr1yMOFG7CW2feBDAn/O5cQS3Dd8p7wWUgbmHBgYqYv2Xu8ai/sVLCg
         80WGt0VHNTDPSSHg9uZMSvKJUforK6K4UeBbSJK0ezwSC703Pc5B+beoZVtI11nEsDCX
         izVSCpMd1XnPYfdfg1HwAS/XQSwltUrglIuzopNKaHcep7D3FRTLrcwJwMYLuC9SsyfY
         vPKkBcbM3Ags+zQPwP2MtcscXFy3SE2m5o+gIf4vYeRt0RPa0K7Q2D3wl2Rxcxzn5goa
         WQKg==
X-Gm-Message-State: AOJu0Yywq+caa7KKeQokLHBdzzcyao8wDLChsIwbq2hiW2tjZAkB/q89
	NFUjjLSR/eihpzbk+Gb0Y7XCQ4Jk7vCb3IfnMQqGWYP4KUL1rnlkzu22
X-Gm-Gg: ASbGnct7TDTc1Epou3uA4SuLWdvVLRIfsLhZeZGh6bxTTMHaQjFuDG+KSixRv2drgIY
	Y0H6HZlhV/Vhu+Z0J4Aiha5wr1tfwEO3MKVJi3KHiGQ4yuQtaDddl+VRrUuxI4TgrspT7QMdVt+
	oZ/XbzMiUqvSF4Br10fgFFYqHPJb5R/y96KF0/h6DpI6jCzFZ2+Mn1Sx94oRqMMbgk5SfUDJBD0
	MSF+C5wdJ46f8kE1Ba2beTqcUMg1yn372MW+aBsxDF6LRfO6TA4q8jT+NzfHWfAolFRwC9XNNvJ
	sCxDoziPviUIJ54kDpDH8zomt3wXI9JXmhyFDXMRr6Opw7pDby/yUgdDf1cnIIw=
X-Google-Smtp-Source: AGHT+IEOlg/bSsDjADvTwJGpi4Y7rLBkSH9ctdKfnIYXL5M/SPU4bB68Er44RJ6wCBK+aQ3iVIv6LQ==
X-Received: by 2002:a05:6214:230f:b0:702:daca:9038 with SMTP id 6a1803df08f44-702daca90d9mr76346856d6.22.1751904074741;
        Mon, 07 Jul 2025 09:01:14 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:1::])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5af2esm60892326d6.104.2025.07.07.09.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 09:01:14 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Mon, 07 Jul 2025 09:01:06 -0700
Subject: [PATCH 6/8] arm64: remove CONFIG_VMAP_STACK checks from stacktrace
 overflow logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-arm64_vmap-v1-6-8de98ca0f91c@debian.org>
References: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
In-Reply-To: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-efi@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 leo.yan@arm.com, kernel-team@meta.com, mark.rutland@arm.com
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266; i=leitao@debian.org;
 h=from:subject:message-id; bh=HEsP6FRhBLVsu5oOeJ6JaIHNIKgCQ3Ji3HXcaP0CFGo=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBoa+9DeToTKZ9P9+l4x99+gzDIF6u9TTjOCkFDY
 Dc8qs14QyWJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaGvvQwAKCRA1o5Of/Hh3
 bWGAD/wJAeOJY3J6xunWAWqNpO5kw4i663+Pxz8t1QmMI8SVOuASVwr0bVT5JYUpwMg5GXptiiy
 G1NokEQE/VG3X5pPG27SkTY1Q3Eoo1oU14xrk7sVxSQ9J5CnGEupty2+xDRpIeglWJEzmaJVKhR
 uMVldMmluY64L6UJm3e0+44rxUmMM8OW/DsI3+8CfX/xLALlkAOQ03r1JqaisYAtCEu6D0CrLyX
 iZaXIRWyVS6QPrgnEBDkzednMXLfVrrTG6aV+d5dFVWGI3FnIBcAu8PV1mc7r2BxhU+s+FAYA2e
 xxEmeac6GWZR4mcs3VYborzABwVpk4w6Skhttn/kyjH4qpK2wv+fjBLpderLOhDz+1FhFib478c
 a4BeUWhhzpvyxGxLLS9zyeRUpHj1n5LxETvagnWEm4FyeOrD8/C1QV2Z+tCKj02/4cBEHXMJ3zE
 m50pLQH/fuEKSuKM6j3nVm+rrG/sjYYlXgx658uMYdwhEbgzAPchIplLMJ9zw+zcmIFgPvs5HlB
 EnUrD4TeLY/2ukhHHCXUha6E6KqB1mJAbLsj+hacQXvvaXkSly2i16Aow9RlFRPrXeXqBcaAsIE
 3qed4v6QJpmXS/hDIYhxPwUhqObY0wzXWYQyOdXP7ETpwfsHKDo2Fu2eE2YjJTib6PYM/STkRj6
 vpLPlwIGJ9clv5g==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_090116_499549_B7CF0DCF 
X-CRM114-Status: GOOD (  11.89  )
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

With VMAP_STACK now always enabled on arm64, remove all CONFIG_VMAP_STACK
conditionals from overflow stack handling in stacktrace code.

This change unconditionally defines the per-CPU overflow_stack and
stackinfo_get_overflow() helper in arch/arm64/include/asm/stacktrace.h,
and always includes the overflow stack in the stack_info array in
arch/arm64/kernel/stacktrace.c. Also, drop redundant CONFIG_VMAP_STACK
checks from SDEI stack declarations.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/include/asm/stacktrace.h | 6 +-----
 arch/arm64/kernel/stacktrace.c      | 4 +---
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/stacktrace.h b/arch/arm64/include/asm/stacktrace.h
index 66ec8caa6ac0..6d3280932bf5 100644
--- a/arch/arm64/include/asm/stacktrace.h
+++ b/arch/arm64/include/asm/stacktrace.h
@@ -59,7 +59,6 @@ static inline bool on_task_stack(const struct task_struct *tsk,
 
 #define on_thread_stack()	(on_task_stack(current, current_stack_pointer, 1))
 
-#ifdef CONFIG_VMAP_STACK
 DECLARE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack);
 
 static inline struct stack_info stackinfo_get_overflow(void)
@@ -72,11 +71,8 @@ static inline struct stack_info stackinfo_get_overflow(void)
 		.high = high,
 	};
 }
-#else
-#define stackinfo_get_overflow()	stackinfo_get_unknown()
-#endif
 
-#if defined(CONFIG_ARM_SDE_INTERFACE) && defined(CONFIG_VMAP_STACK)
+#if defined(CONFIG_ARM_SDE_INTERFACE)
 DECLARE_PER_CPU(unsigned long *, sdei_stack_normal_ptr);
 DECLARE_PER_CPU(unsigned long *, sdei_stack_critical_ptr);
 
diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index 1d9d51d7627f..e823320fe031 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -332,10 +332,8 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
 	struct stack_info stacks[] = {
 		stackinfo_get_task(task),
 		STACKINFO_CPU(irq),
-#if defined(CONFIG_VMAP_STACK)
 		STACKINFO_CPU(overflow),
-#endif
-#if defined(CONFIG_VMAP_STACK) && defined(CONFIG_ARM_SDE_INTERFACE)
+#if defined(CONFIG_ARM_SDE_INTERFACE)
 		STACKINFO_SDEI(normal),
 		STACKINFO_SDEI(critical),
 #endif

-- 
2.47.1


