Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74676CD3429
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 17:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+eOMzGKKanyGN0tH11nblupgXRAzHAohg2TuWXaWxk=; b=YKEGnZCiPulZGs3aA9LStyKCBL
	ucwTrX0nfA9KVBJKRv7FVBRGLBVNo2niR5Lhtd058yH9AcSZl7YbXO/cWlst7tpnOyZ0+PkjAuLL4
	PoANQZYIBuQJ8YCjA6j1StmRXDvmNhmDwoxRlueFl4T6s/YAL6wJcjgh1oCCw/rKQ1ezRX3gtTljK
	CCinMR92lqIHcevmoce0nNQfk8/41cCoh8YCjhAuDrWd42Ns+eqmeLbZqNodrYiRotrIzr8beO95+
	Vm1nsWyHIQyrKRdE5XEjQJQU2bT4cl9Zi9KKNzAKGsvwwJlzBGB72Xm5qP/R5pP20sqFCzSvgvtsp
	UIQWVRuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJF2H-00000009HG7-0Co7;
	Wed, 12 Nov 2025 17:53:37 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJF2B-00000009HE2-3oP7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 17:53:32 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b72a95dc6d9so119345366b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 09:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762970009; x=1763574809; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L+eOMzGKKanyGN0tH11nblupgXRAzHAohg2TuWXaWxk=;
        b=WgnKmWSTDPgXvBB+gXX1THsOQvGahRlMOfHHSLUGRESMwUG13EzYgZbbRGuQUBKnzb
         bZZknYO2eOMJPvIpRtY5DAEz7a3vjnaSTaSgdxVYsrtDfdVI6SpnMP40vi1viTzGawOh
         n2fl8d8Qcjn+hMvuCAEw1dvPWfBQdfECeSYoNHUNIyN+T0wpCj8mbU/PxP+qv+LIeIZE
         gorKxdcNAqBCZScgoQJL44pDgUOIi0hAlGr+d59fSDyXf7G5U5uPpLzo0ABC9/LfNs4p
         TXVmE9QT2R2OiokN0O+7PfoBPou17joTNC/Hl1FBIfzKCi/RWU/Gi9j08s0zpOgf3vuQ
         pgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762970009; x=1763574809;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L+eOMzGKKanyGN0tH11nblupgXRAzHAohg2TuWXaWxk=;
        b=UD3U1INBSwr43yTd796aIO/KfGB4klnWi89COLodR7t26Ax2+/A+hpoJGWYqM1FFDP
         FwDzvkxRCQ6NC5O6WxXTV5peHXzX/HfS5XDS1hwNOu5ovpyp8csi0kEWUm7FUbQoFa9s
         Tkx+K4ZfALcgfSm8NOhqjN08S4XynvyPLbjp6EaBSZrc73AaKj9nBw9iwntnO7ID878e
         sKemIqBtdnqRP+Yh/X031Tz1be4wKKZi/5YskGD3ucpHe4eTpSDnZ2M12iv9j3IQJn2p
         kSwHx8ReivweFQMBC7clnP2Q05s/GSsFSAETmYeaCsr9c19nMZDNlsAhLCG/4Qccy6cY
         aqig==
X-Gm-Message-State: AOJu0YzymdxKBAQ0gJdxZeL2JeyR6MNKn2fke6BFJ3fNB9Wg7m7Pembk
	pgvJxsVP4u6/G2ktP0W/fv/fySa//HoT5vzq6PPNj3Dfei6M0NWunTEXMxGx2Pr8jZkrAX+1Dns
	495wEAkBmCwkroMpwO2qnHH4cS2NVIBk6ziCZXKiZe0wfHC6llaMSupz3gIiC6JFpfiQXBmIDHV
	H2mMe3Ea4e5YuvlaJc1xgyCK/eAtUcW+z+ICVisfr3Xo1N
X-Google-Smtp-Source: AGHT+IG9WP11h9VdD0dZFi4qlzvNDIv2CKBVpmrA5lbfV8P6grjSJNkODFrARGIB/GbmRH1vdjS2Wf4Y
X-Received: from ejbd2.prod.google.com ([2002:a17:906:3442:b0:b72:2a7f:6a3f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:60cf:b0:b0c:b51b:81f6
 with SMTP id a640c23a62f3a-b7331aa4ff3mr414862166b.43.1762970009118; Wed, 12
 Nov 2025 09:53:29 -0800 (PST)
Date: Wed, 12 Nov 2025 18:53:18 +0100
In-Reply-To: <20251112175316.2841017-4-ardb+git@google.com>
Mime-Version: 1.0
References: <20251112175316.2841017-4-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2361; i=ardb@kernel.org;
 h=from:subject; bh=HTJBxTs9yVOT5hDnqvVphswVoRlVz8UfGhOKDMbc6GM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIVPkZF9PYl7hyXUtBtWJ/rGG1ZpJrE0GOzUYhXhTSx9P4
 dA+YNpRysIgxsUgK6bIIjD777udpydK1TrPkoWZw8oEMoSBi1MAJlLswvDPJHjeuY1RH+UD4hl4
 Lh928TKJmnv94Oa0/Vb22x/K/vKRYmR4XRXFKyQ96cQKzUd5crZdZobf3W5pvKms7DqkFyLrksg LAA==
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251112175316.2841017-5-ardb+git@google.com>
Subject: [PATCH 1/2] lkdtm/bugs: Add cases for BUG and PANIC occurring in
 hardirq context
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-efi@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_095331_965502_292D618E 
X-CRM114-Status: GOOD (  12.43  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Add lkdtm cases to trigger a BUG() or panic() from hardirq context. This
is useful for testing pstore behavior being invoked from such contexts.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/misc/lkdtm/bugs.c | 53 ++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 376047beea3d..fa05d77acb55 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -8,6 +8,7 @@
 #include "lkdtm.h"
 #include <linux/cpu.h>
 #include <linux/list.h>
+#include <linux/hrtimer.h>
 #include <linux/sched.h>
 #include <linux/sched/signal.h>
 #include <linux/sched/task_stack.h>
@@ -100,11 +101,61 @@ static void lkdtm_PANIC_STOP_IRQOFF(void)
 	stop_machine(panic_stop_irqoff_fn, &v, cpu_online_mask);
 }
 
+static bool wait_for_panic;
+
+static enum hrtimer_restart panic_in_hardirq(struct hrtimer *timer)
+{
+	panic("from hard IRQ context");
+
+	wait_for_panic = false;
+	return HRTIMER_NORESTART;
+}
+
+static void lkdtm_PANIC_IN_HARDIRQ(void)
+{
+	struct hrtimer timer;
+
+	wait_for_panic = true;
+	hrtimer_setup_on_stack(&timer, panic_in_hardirq,
+			       CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
+	hrtimer_start(&timer, us_to_ktime(100), HRTIMER_MODE_REL_HARD);
+
+	while (wait_for_panic)
+		;
+
+	hrtimer_cancel(&timer);
+}
+
 static void lkdtm_BUG(void)
 {
 	BUG();
 }
 
+static bool wait_for_bug;
+
+static enum hrtimer_restart bug_in_hardirq(struct hrtimer *timer)
+{
+	BUG();
+
+	wait_for_bug = false;
+	return HRTIMER_NORESTART;
+}
+
+static void lkdtm_BUG_IN_HARDIRQ(void)
+{
+	struct hrtimer timer;
+
+	wait_for_bug = true;
+	hrtimer_setup_on_stack(&timer, bug_in_hardirq,
+			       CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
+	hrtimer_start(&timer, us_to_ktime(100), HRTIMER_MODE_REL_HARD);
+
+	while (wait_for_bug)
+		;
+
+	hrtimer_cancel(&timer);
+}
+
 static int warn_counter;
 
 static void lkdtm_WARNING(void)
@@ -696,7 +747,9 @@ static noinline void lkdtm_CORRUPT_PAC(void)
 static struct crashtype crashtypes[] = {
 	CRASHTYPE(PANIC),
 	CRASHTYPE(PANIC_STOP_IRQOFF),
+	CRASHTYPE(PANIC_IN_HARDIRQ),
 	CRASHTYPE(BUG),
+	CRASHTYPE(BUG_IN_HARDIRQ),
 	CRASHTYPE(WARNING),
 	CRASHTYPE(WARNING_MESSAGE),
 	CRASHTYPE(EXCEPTION),
-- 
2.52.0.rc1.455.g30608eb744-goog


