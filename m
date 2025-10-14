Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C00DCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 19:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4JJGKTllRuMStbM/MEr20oYICKKmNVjIZIDbuLYe4G8=; b=K06MjN/CrJDPKeviok/UwLRdfd
	JlkXCptP0lSTGCPZBEi8UkCku6oyZ9EFbqmeI5lBumA0mLpL4htZim9U2imq/5aiZC6pEMfzUMnZk
	7pwvRnogZM98pD1VqqOzSFFHAXVppDLDo9zM+tH92c3KDhEg2N5QZIXB5sn2dbLu3geyCNDNoVS3F
	JsMAg8ktMKHtzjkXRfPK/pCgqo+mBpoGHqi+bWNpowSVuOBQ9f0+gEQRk/VXzOmC/ZJBvvufYLl72
	KMxR4uPZeLECUoEtPz3Psis2DTXHDg+F0HsWqCCfV7biqFK7svD/X2jAaKW7ZkGsT+fZhP9SVqZcF
	NUlocNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8kNv-0000000HETr-37jr;
	Tue, 14 Oct 2025 19:08:35 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8kNt-0000000HETP-31j6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 19:08:35 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59070c9111eso6956223e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 12:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760468911; x=1761073711; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4JJGKTllRuMStbM/MEr20oYICKKmNVjIZIDbuLYe4G8=;
        b=cvnSeWwj4f8OnHxJwfvanyImqgNvrMj5eTTCfF0wzJMpW2x13DDeCe4+1FOFdVYyO5
         kR67AsbLzY1r8wES/uaOGxLbGePxf7NwJZnq+76YF6LNp81UlJA7WjqMFA7BxZb58IR7
         JqPNviRPPVKyPk2pLBzfGN/Uqqkbd2aZZWa/a/UyMgiaCmHhs5BjKKUwEpxeDAmWBwAZ
         H66BG553eFb8Qau99UpqAZ+ITsZ4xsqnsmE82zREuzD307t3l+04uM6XrMRZ4VsRKW3y
         8kTi/4w4G1eFW3RuE1n/Q+3Qfek0B6kyez5OYj4tU8UxWWjk52I62HRGgmtdx58yLrnw
         4Xtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760468911; x=1761073711;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4JJGKTllRuMStbM/MEr20oYICKKmNVjIZIDbuLYe4G8=;
        b=qCUmOmX1WBF3a3j86Udtn7mDlyN7k4z6vVv+02fcVnqPc6FFeMOszkyihEdgdaxraX
         yrue87Dcrt9jFBU68vWJzwWss88lejmyd1OyIb5RSetcFnkwI76QIOcO7rlEvE6YnM+H
         LSG2zm9RwCo4Hl3cWv5Tv/enoixlgWrui0MMzCkH85BiKwzk/R6Voz+6BtkJJnsVmKKP
         9MyPC3+n0K0ejofXGw4ExK6JvMwaIYivuEixrlz7TdkSJs0w8shYMYpM6P76hf44BDbs
         cg4WDtVGevUvK2hcSvcrbQEhQjGadexSDmIyVapOSJRe8uO/3ienntYb0IOGXM+bcJNe
         BjwQ==
X-Gm-Message-State: AOJu0YxJczSQPuAdUMKcgNSzekKlalfXPCtlPIocA6KZQQY/8juiSrO1
	xeBYQ8jTHmf0Jd3d99+wBUFvrRxj+2QvCWPOZkOqPrlQgeev/OHIEnY6POGo0OCUH/g=
X-Gm-Gg: ASbGncu/X3+ii+bR5wp0XtOVVWpSGeGysjANVFUiXy8EkaCMR9iHahaYmAyoti+XwpI
	HVh+55Iuz3G5OHjlT7A9NNfUiPOOTyEd6eKvPd02KIskRU/zKF48tUjWm/PWTD2e20WuZSKc0Ec
	rvFZcFMp9yz4uxazu4wV7xL5iDRfTWlWfWxrnl24578OrObsLtwJ7iUMCzVjsgnk18yrd3wbkKS
	Fp6s0UzE9MIDOH3tPsSDD0zrfeUaXQxT/soBZmLXKU+/d6JoZDTZvYa37R8/SUXSnZzQYQUoXBA
	IeWJIuOIvpnkv3x6BoeFiTnSf1uJja1/u18AaKShiyjZ1skNCnZXj5hgxmu6khSJQf7+Ano0QVm
	mwLA1mle9rvktDw13h3iTxnwdCGSCIjRIQvhyyK731GQXU4dC/wiLdkAb
X-Google-Smtp-Source: AGHT+IH4v9VCFBigouDBkD66Re/5VmuT2tbkPp6jmLYWK7yHNfpOopaDctOTA+uw/JJRJZcw7iSW+g==
X-Received: by 2002:a05:6512:b10:b0:576:d217:3f84 with SMTP id 2adb3069b0e04-5906d75f763mr7321589e87.3.1760468911429;
        Tue, 14 Oct 2025 12:08:31 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5908857802fsm5484279e87.109.2025.10.14.12.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 12:08:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 21:08:30 +0200
Subject: [PATCH] arm64: entry: Clean out some indirection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-arm64-skip-indirection-v1-1-f8ccfd9dbcb7@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK2f7mgC/x3MTQqAIBBA4avErBtQsR+6SrQQHWuILMaIILp70
 vItvvdAJmHKMFQPCF2ceU8ldF2BX1yaCTmUBqNMo5W26GRrLeaVD+QUWMifhaCNse+96VxQBgo
 +hCLf/3ic3vcDK3hKnGgAAAA=
X-Change-ID: 20251014-arm64-skip-indirection-4ff88c27ad02
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_120833_791172_CECD9663 
X-CRM114-Status: GOOD (  13.37  )
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

The conversion to generic IRQ entry left some functions
in the EL1 (kernel) IRQ entry path very shallow, so drop
the __inner_functions() where appropriate, saving some
time and stack.

This is not a fix but an optimization.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm64/kernel/entry-common.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index f546a914f04174e37bf3578490545edebb66afd1..e34dfd93c522ae58a5f1c914fe4a5bfc6522cdae 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -38,16 +38,11 @@
  * This is intended to match the logic in irqentry_enter(), handling the kernel
  * mode transitions only.
  */
-static __always_inline irqentry_state_t __enter_from_kernel_mode(struct pt_regs *regs)
-{
-	return irqentry_enter(regs);
-}
-
 static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
 {
 	irqentry_state_t state;
 
-	state = __enter_from_kernel_mode(regs);
+	state = irqentry_enter(regs);
 	mte_check_tfsr_entry();
 	mte_disable_tco_entry(current);
 
@@ -62,17 +57,11 @@ static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
  * This is intended to match the logic in irqentry_exit(), handling the kernel
  * mode transitions only, and with preemption handled elsewhere.
  */
-static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
-						  irqentry_state_t state)
-{
-	irqentry_exit(regs, state);
-}
-
 static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
 					irqentry_state_t state)
 {
 	mte_check_tfsr_exit();
-	__exit_to_kernel_mode(regs, state);
+	irqentry_exit(regs, state);
 }
 
 /*
@@ -80,17 +69,12 @@ static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
  * Before this function is called it is not safe to call regular kernel code,
  * instrumentable code, or any code which may trigger an exception.
  */
-static __always_inline void __enter_from_user_mode(struct pt_regs *regs)
+static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
 {
 	enter_from_user_mode(regs);
 	mte_disable_tco_entry(current);
 }
 
-static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
-{
-	__enter_from_user_mode(regs);
-}
-
 /*
  * Handle IRQ/context state management when exiting to user mode.
  * After this function returns it is not safe to call regular kernel code,

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251014-arm64-skip-indirection-4ff88c27ad02

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


