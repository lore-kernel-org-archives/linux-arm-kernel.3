Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB870C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 16:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZyHbcEpIHcb4Jlgq55+r5DAR+ggDwdS7Cd6ZYrxC2k=; b=y+7jpfOzJKsdISwn+/0JzovDop
	Y34he4JyoVF/rIflJS7WwTwTwTRrU10peL6lXs5Afu2Qq58/FTnDYmpsL+7UxTv5lbqnof1BNLbC2
	pfUz7nXmadLI+nbrG0iPMIeAZiIMEIZnn6WPJZHK5yhLoHJjgTbB2fqf5Si8SsXLHTWSTxAGABNtP
	WHid8YQTqN3SJNI0hmrBRSZkuR0/pM9m5ndAk9bbJe/erdLiqj/K4ChnUyYZs5eInsmURHwD24V4V
	bbi9I1EPXHPSBGvfgwWN22mKpKlgOwJchGy2sRcAYYdImOfaWiPJLFXE9MpL2SOBs4I6/gyveyt/U
	+gnRYmtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYofC-0000000312I-2twa;
	Mon, 07 Jul 2025 16:25:54 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoHP-00000002xAb-2ARL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:01:20 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-73b0ea4e138so2963515a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 09:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751904078; x=1752508878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZyHbcEpIHcb4Jlgq55+r5DAR+ggDwdS7Cd6ZYrxC2k=;
        b=l3aDcrVzKQ+3YmiPLXblWyN+PQIFxHp4o3tU2I4urqJLWxafJBQ1DAUoYlgmK6QQnS
         1Z+0ZqQUhlqjeiQQC67HeenCjByOOm9I57RjU3+kebHAx7qDhAYWB+qEr8EQLPOy2EIR
         hF20fe5b+lY71OucTxy+hWkG6E2KUU5Of8KSeA/hqtJJtBT9kUAc/4bm1OZ09NSqMyWh
         P9ddjQUfmrnAFwA4+DYXn7/hbrn8XnGBpUmxHXDKJwqaChXTc3G5BKCVnLut4LLJuq+B
         Vm44Z3o56gFNkQJGZGV6bLjF26vzn6xARrJYlCi85SbaJqhNDPuKWG3fihgNtusH6fCQ
         ycZA==
X-Gm-Message-State: AOJu0YzpS9KK368R+SJDSaLCXT2xD0WeeNd2mEjACF4A4PF9DVKax3Vs
	5n4QoI2t9oY/cfsj6rin+cyHQYEoaizUY2HGmKwGCb4zlhJ3++7P/hWM
X-Gm-Gg: ASbGnctG390OzFQj8Nl+3s0usdwM9rNJHYd9ullFRxaucbURWsrO8jE0oz4gWZ16LiL
	LEMRAIn6SgFwljGxrD1QiRu3QWRJqBF8WPVYfFo+QHujAykQcgDrVRbgScX8WDp3GzmRrXXPta1
	JDPN0uXtsBhddSL+DilDw1JFd00NI1ploSG6mbvJ+rwk+lxvaHhTqgvJSp4omMbXKBh0Mg6qBge
	TQnzPq7Y2UVxcU/ChW4IGBK3LC3guxgPHLj/nbdzfXWgXGtriHfPTXKDOEQPNv03XcQAjh6cZCD
	W28wmqeRNlioe8QnQOFRvbyo9+PS80chFLymWvrwFMrHxY55mphg
X-Google-Smtp-Source: AGHT+IHt1sjKHYTGHSbsa3LdCzMj703Wfw0OjPmPEUwmP5aO/wwWD1Hxc2s+gXBcRn5ix8Gu2LXRmA==
X-Received: by 2002:a05:6830:6b04:b0:72b:782a:56d7 with SMTP id 46e09a7af769-73ca6745007mr10297544a34.23.1751904076752;
        Mon, 07 Jul 2025 09:01:16 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:2::])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a994a79d83sm65557021cf.39.2025.07.07.09.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 09:01:16 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Mon, 07 Jul 2025 09:01:08 -0700
Subject: [PATCH 8/8] arm64: remove CONFIG_VMAP_STACK checks from entry code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-arm64_vmap-v1-8-8de98ca0f91c@debian.org>
References: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
In-Reply-To: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-efi@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 leo.yan@arm.com, kernel-team@meta.com, mark.rutland@arm.com
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=3002; i=leitao@debian.org;
 h=from:subject:message-id; bh=SpJY3fhXbav7+6i1hQjyLYm6it6IH1zUVNjqCbrE6Do=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBoa+9DK2XBJNN33VPVxsbIlAeoiErIg0yYi/CMe
 lbtcKhUf7OJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaGvvQwAKCRA1o5Of/Hh3
 baczEACH+7Iy/gS1E569TTC0JPxylOD1BvTxKYcTuK79Epss+CVFf/Ya8UxX5y5+3Cj9I/ifUjK
 IC8Xqa0Es/gvsQITiiALeWarykzD2PX/l1NRUMg4HSYLPrfRkfGgVv5DGw37+11gGXcivx4mORr
 l8mvcTYTFA6baG1/9vNRUEYqNOVEz5YmLIgxGb3Ht1LvgEdu7sEsMl3GywiWXONKRtWrL2iOrUP
 6AAb/F01FmxHgrXuW+KKBuw9nspPxcjwtBTmsc4xES1eD3zfcYNnHLCgR5osr7mxkw61x4PpgLH
 hF5ps2JgWxZWXYd4ep55SvUWSZlx6m21FDNT7hB91xQi0VjLOiAejob1cUuzfXPNIk7EDeRL7FO
 Ofyc3nytJWBpD7BvJ2IFRxBaK7r4dEQmc795w2GlVE4XuczhHeXNHQZMNip9/ZLzs4GaHqqKk5n
 S3MGjT/i1WNlKlEN1NwVP7Qn5MTUnhGyz997u5+71zomYeKObrZxRx8UjGYv4AAvwYDpm4RQGNe
 HqNdIWsouz2uwEW41YMzVN8dog6MYHIhx4WXc74GXa36y4v9ImK8fx1fNvLGkXpVMNz7UesNLA7
 uxKgwLNTVRVZcGvmKdCUIVkR0uxIa/MA4W8hZnWl3rp6If2jTMkg8hrpOP14RyLcBZAFFwqSbXM
 MEJMj0ToT+IrnTw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_090119_563821_E96919CA 
X-CRM114-Status: GOOD (  12.66  )
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
conditionals from entry handling in arch/arm64/kernel/entry-common.c and
arch/arm64/kernel/entry.S.

This change unconditionally includes the bad stack handling and overflow
detection logic, simplifying the code and reflecting the mandatory use of
VMAP_STACK for all arm64 kernel builds.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/kernel/entry-common.c | 2 --
 arch/arm64/kernel/entry.S        | 6 ------
 2 files changed, 8 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 7c1970b341b8..99a341ee7131 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -977,7 +977,6 @@ UNHANDLED(el0t, 32, fiq)
 UNHANDLED(el0t, 32, error)
 #endif /* CONFIG_COMPAT */
 
-#ifdef CONFIG_VMAP_STACK
 asmlinkage void noinstr __noreturn handle_bad_stack(struct pt_regs *regs)
 {
 	unsigned long esr = read_sysreg(esr_el1);
@@ -986,7 +985,6 @@ asmlinkage void noinstr __noreturn handle_bad_stack(struct pt_regs *regs)
 	arm64_enter_nmi(regs);
 	panic_bad_stack(regs, esr, far);
 }
-#endif /* CONFIG_VMAP_STACK */
 
 #ifdef CONFIG_ARM_SDE_INTERFACE
 asmlinkage noinstr unsigned long
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 5ae2a34b50bd..ea74cb7aac5b 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -55,7 +55,6 @@
 	.endif
 
 	sub	sp, sp, #PT_REGS_SIZE
-#ifdef CONFIG_VMAP_STACK
 	/*
 	 * Test whether the SP has overflowed, without corrupting a GPR.
 	 * Task and IRQ stacks are aligned so that SP & (1 << THREAD_SHIFT)
@@ -97,7 +96,6 @@
 	/* We were already on the overflow stack. Restore sp/x0 and carry on. */
 	sub	sp, sp, x0
 	mrs	x0, tpidrro_el0
-#endif
 	b	el\el\ht\()_\regsize\()_\label
 .org .Lventry_start\@ + 128	// Did we overflow the ventry slot?
 	.endm
@@ -540,7 +538,6 @@ SYM_CODE_START(vectors)
 	kernel_ventry	0, t, 32, error		// Error 32-bit EL0
 SYM_CODE_END(vectors)
 
-#ifdef CONFIG_VMAP_STACK
 SYM_CODE_START_LOCAL(__bad_stack)
 	/*
 	 * We detected an overflow in kernel_ventry, which switched to the
@@ -568,7 +565,6 @@ SYM_CODE_START_LOCAL(__bad_stack)
 	bl	handle_bad_stack
 	ASM_BUG()
 SYM_CODE_END(__bad_stack)
-#endif /* CONFIG_VMAP_STACK */
 
 
 	.macro entry_handler el:req, ht:req, regsize:req, label:req
@@ -1003,7 +999,6 @@ SYM_CODE_START(__sdei_asm_handler)
 1:	adr_this_cpu dst=x5, sym=sdei_active_critical_event, tmp=x6
 2:	str	x19, [x5]
 
-#ifdef CONFIG_VMAP_STACK
 	/*
 	 * entry.S may have been using sp as a scratch register, find whether
 	 * this is a normal or critical event and switch to the appropriate
@@ -1016,7 +1011,6 @@ SYM_CODE_START(__sdei_asm_handler)
 2:	mov	x6, #SDEI_STACK_SIZE
 	add	x5, x5, x6
 	mov	sp, x5
-#endif
 
 #ifdef CONFIG_SHADOW_CALL_STACK
 	/* Use a separate shadow call stack for normal and critical events */

-- 
2.47.1


