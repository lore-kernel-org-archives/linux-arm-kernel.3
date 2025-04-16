Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD681C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 18:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWRjEDjHgnGUTAO1fUxX0nlQ73sblTBfWxiyoAckCmI=; b=kvvnxH9tMKvQ3+EK4/52CtJow6
	WlvKd1Y1CnHcarPMkRyJzNDaur94kQhS6oKYLfGJy/NwU1rObtoyKr3t+yh0G8AD2NXHFZFqB1Mll
	f+BWiLIV4xW8Nm0yeJUCprfnmp9kycg+htUCgE0UYYg1wclbnmChO9d3jwa8kJHPpLvikKOJmVj+d
	5irXQfLkFQEBYgtFWGHFuPOjCGGFu2/ttxbL1wKexE+xU++xppgUA51EogQECD+nvQVPTn/8vm5Ip
	7zo8gCo+DVoOnkKSpprD35W1p//ZcbDDJCShlMasvfaV04OELPgYkaMWvLZO0mCefCxA33zXGWc3b
	wpAxmDhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57FJ-0000000AWqf-43D9;
	Wed, 16 Apr 2025 18:12:25 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u578V-0000000AVE5-3AP1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 18:05:26 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43cf446681cso46641305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 11:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744826721; x=1745431521; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EWRjEDjHgnGUTAO1fUxX0nlQ73sblTBfWxiyoAckCmI=;
        b=D7b8Udz1YatGkaGcSmzB0XlxS9cFxN00A8PDplynHk0t2Nk97lF+4spjhHzQIKtKv6
         RlO1RWa4f4YWr9qMzl9WsUmGrIhxsf/faam+s45pyJ2D4w0M2150YXFr3NDJhOpVBZN0
         yUyMQHnYl/u+ttnGSQUU1nTisbw4jGpclsL/A6l7TnWO7K/wQupdAvyj3F/Hz7T1PPIB
         CvXoLXPsfPi0Eo+hRczeG5TYljDC6MAXrJU2RWf3ETHUNnSkN6upyoVWrBDqMB6dbZjt
         grNmoLMMsGxxDOWr3pPlu9hbatkWg0fDSbiLaI8ox0t5EKsGvOrorUub22aCkPIh8C97
         l0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744826721; x=1745431521;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EWRjEDjHgnGUTAO1fUxX0nlQ73sblTBfWxiyoAckCmI=;
        b=oBK6uhnCwPuU19Ukoc/uHfMB+aSu1kyQPKi1tGXfXIsN8IoDjX0qezIMH0GICXJDuT
         odiYDHaWQyKumLa/DpcEC30jWX0ITubeHEBkCz5W3cb9WfOgWYWzjKpHG4oj/CPkMsli
         BYD9rjYnHuFxJUgalQCpPWR2QYh8bWm9zvlXM6wynAe8vxzgi6an+BzVSL00jOdU9dN2
         sREWhJ1IibXvxF/IDpk3Su4ASswzaT827Iz2jKyjlU1VMRPZhkbl0sdWA9Rrb+mwIBwK
         PbYYQOe3dK4teAusLLQWDahLyMrJS/jUsiIfDY+aNl2VvCci8Z364TT02Nz2jALhwplu
         brhw==
X-Forwarded-Encrypted: i=1; AJvYcCWwOMaCKxrJmdPsSNXUmraZw52vUy+sid96MBxcDq4fEydaL28pGqpX52dCMKan4dV9NaWoNMnGvKkRFRCdMfOL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm6K7mHQMo2Lowvkw4k1pTLjwJObRf3gyWwmzNUmugqXAXFBK8
	9qR2W2oRKkRfhfzrr9nlu5k6QMFSScssaDE3Yhq47BVfQ+FkNLZ1wO0ORBBzRzXAl4J+pXoX12O
	zGCZgxT7/cA==
X-Google-Smtp-Source: AGHT+IGKfernDkJiPcq9aGD5Ngb6rDQ85prFSXMtxNjAKHAqgi+juJeLLNi5fr5EDrdbF7a6RZez8kPLKAZvew==
X-Received: from wmbev17.prod.google.com ([2002:a05:600c:8011:b0:43d:4055:98e3])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3487:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-4405d62a49cmr36178345e9.16.1744826721678;
 Wed, 16 Apr 2025 11:05:21 -0700 (PDT)
Date: Wed, 16 Apr 2025 18:04:32 +0000
In-Reply-To: <20250416180440.231949-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250416180440.231949-1-smostafa@google.com>
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250416180440.231949-3-smostafa@google.com>
Subject: [PATCH 2/4] ubsan: Remove regs from report_ubsan_failure()
From: Mostafa Saleh <smostafa@google.com>
To: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, kees@kernel.org, elver@google.com, andreyknvl@gmail.com, 
	ryabinin.a.a@gmail.com, akpm@linux-foundation.org, yuzenghui@huawei.com, 
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org, 
	nathan@kernel.org, nicolas.schier@linux.dev, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_110523_798878_479139B5 
X-CRM114-Status: GOOD (  12.91  )
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

report_ubsan_failure() doesn't use argument regs, and soon it will
be called from the hypervisor context were regs are not available.
So, remove the unused argument.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kernel/traps.c | 2 +-
 arch/x86/kernel/traps.c   | 2 +-
 include/linux/ubsan.h     | 4 ++--
 lib/ubsan.c               | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 224f927ac8af..9bfa5c944379 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -1118,7 +1118,7 @@ static struct break_hook kasan_break_hook = {
 #ifdef CONFIG_UBSAN_TRAP
 static int ubsan_handler(struct pt_regs *regs, unsigned long esr)
 {
-	die(report_ubsan_failure(regs, esr & UBSAN_BRK_MASK), regs, esr);
+	die(report_ubsan_failure(esr & UBSAN_BRK_MASK), regs, esr);
 	return DBG_HOOK_HANDLED;
 }
 
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 9f88b8a78e50..4b5a7a1a8dde 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -351,7 +351,7 @@ static noinstr bool handle_bug(struct pt_regs *regs)
 	case BUG_UD1_UBSAN:
 		if (IS_ENABLED(CONFIG_UBSAN_TRAP)) {
 			pr_crit("%s at %pS\n",
-				report_ubsan_failure(regs, ud_imm),
+				report_ubsan_failure(ud_imm),
 				(void *)regs->ip);
 		}
 		break;
diff --git a/include/linux/ubsan.h b/include/linux/ubsan.h
index d8219cbe09ff..c843816f5f68 100644
--- a/include/linux/ubsan.h
+++ b/include/linux/ubsan.h
@@ -3,9 +3,9 @@
 #define _LINUX_UBSAN_H
 
 #ifdef CONFIG_UBSAN_TRAP
-const char *report_ubsan_failure(struct pt_regs *regs, u32 check_type);
+const char *report_ubsan_failure(u32 check_type);
 #else
-static inline const char *report_ubsan_failure(struct pt_regs *regs, u32 check_type)
+static inline const char *report_ubsan_failure(u32 check_type)
 {
 	return NULL;
 }
diff --git a/lib/ubsan.c b/lib/ubsan.c
index cdc1d31c3821..17993727fc96 100644
--- a/lib/ubsan.c
+++ b/lib/ubsan.c
@@ -25,7 +25,7 @@
  * The mappings of struct SanitizerKind (the -fsanitize=xxx args) to
  * enum SanitizerHandler (the traps) in Clang is in clang/lib/CodeGen/.
  */
-const char *report_ubsan_failure(struct pt_regs *regs, u32 check_type)
+const char *report_ubsan_failure(u32 check_type)
 {
 	switch (check_type) {
 #ifdef CONFIG_UBSAN_BOUNDS
-- 
2.49.0.604.gff1f9ca942-goog


