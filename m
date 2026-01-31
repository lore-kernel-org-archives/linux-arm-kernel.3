Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57A4D79767
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 13:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goZ+MaQKy7l7B7ncr3K66S9aihGDrIDC3mypa0RPtIo=; b=e44jBuHNEjEYXw5o5kpqyGdVue
	T0ozUnACgQYGQoU/HKRD3fnBX/myrjflg+jael20kw0/1nFuhA5FO5EKFsehUfs26Rcw9JQ4dGVk/
	EFdlZOZgP6IeSn2qjSYOClAAm9JoQNk4cHyq07UrFAA7yHMOUcYxO7Z+faqIsVyUxplwXdtHSYjXq
	8w3cE481SueGeDPc9wySxUfl6RUtDgxMbOspNJLS0+VsCc8pkFEouG6Tt7vRJNxNoB0+CnVlVpsD8
	btD9G+UKKXQCcva0jv+zYdHakX6DXs+/qEmsHVpoJjX8/ELNXDMwnh3R/XmJxPna3chx/mw7vJppB
	hWezrBfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB3i-00000002cfJ-0mg7;
	Sat, 31 Jan 2026 13:30:42 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2k-00000002c02-04ca
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 13:29:44 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-482d8e6e13aso15113285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 05:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769866180; x=1770470980; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=goZ+MaQKy7l7B7ncr3K66S9aihGDrIDC3mypa0RPtIo=;
        b=L7NoF1pcgkj9eQC47KWd29eP/Mk/n8JkHqCobAFWtMlQRdZ5WdRLINRIhQMUyEQwzd
         bqXbw97x0RcKwY4mTlu+RGoL3DgHuk/L5auYkwhkoLQmsK26Tn/TXhwOEAqitblTpHq3
         rd/vdx3mY1MbsBMjjJ9lEjoM/Qu6ertthIdmLMOhAr7xijSaPj2TwQj9gMJwAghygh7Q
         eDPISobt5HCGtai50zLyi1FK7PDePPpCNTqu7tBZZiRGWSmgwrqStjMfguu7DpTsi1lO
         LvD6KjyEOdSUZPBPVIsBWlHqMWCpsP5MTbh8d66wOVOq9Z4L5iD2xNjf52HWwJqpsVO5
         68Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769866180; x=1770470980;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=goZ+MaQKy7l7B7ncr3K66S9aihGDrIDC3mypa0RPtIo=;
        b=J4IDaBiQJc80YXx5nEnLkl5GZ5Cp610Rruvg/Sz8talQMwgUxl0ECD4gRnAKt51qiy
         wgY/j86HgAZ0+0g3KLflApcekhBYGpim2NJif3SvHnkfnFLetgkP/ah9sy0xjMnCVE/g
         Fg6LR/e5sNKCoOmk03zJJ6XvnkPyR4SyzHEplYSenwQU8SnuFsEKSozo8+S2/GYlCFyt
         5ki+FkohUVXH4X2Rz8R/Wza8O45SZspt4nTphXal5Im/Eq6URMrMP8Q+1BD4bswsDF9a
         U6asoFcpa7vxZGjnu84nUFztOmmKAlqGrWiorHGmNlRzoWmZ1OTRIvIZdhsyIThfVP8F
         +Clg==
X-Forwarded-Encrypted: i=1; AJvYcCUN+cebCoayYDjDa4EyO0p7xjqw766e3nRbMhEwoxhV3Euhcwe0Rr8Ob9dY5mW2kAGuSbWujT3z0hEleM9W2N8H@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4d/63B3nYoev9UkaNOOYBWC6kWNKkDO9ZaL8hFYIX1FbyOXiR
	TsT40uwfCveqJ3vgY9VDUu6+ToxOIDPN/1gq0waYmqRJSLIuKX8acXK7bBuD8eoS27r33Q0KHf9
	/kOZl3ZQnmZkjUFnBHo/w5Q==
X-Received: from wmz6.prod.google.com ([2002:a05:600c:6b66:b0:480:1b84:b6e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1da8:b0:480:3a71:92b2 with SMTP id 5b1f17b1804b1-482db498227mr71271215e9.26.1769866180081;
 Sat, 31 Jan 2026 05:29:40 -0800 (PST)
Date: Sat, 31 Jan 2026 13:28:38 +0000
In-Reply-To: <20260131132848.254084-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260131132848.254084-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131132848.254084-21-vdonnefort@google.com>
Subject: [PATCH v11 20/30] KVM: arm64: Add clock support to nVHE/pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_052942_125144_583E22B9 
X-CRM114-Status: GOOD (  14.69  )
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

In preparation for supporting tracing from the nVHE hyp, add support to
generate timestamps with a clock fed by the CNTCVT counter. The clock
can be kept in sync with the kernel's by updating the slope values. This
will be done later.

As current we do only create a trace clock, make the whole support
dependent on the upcoming CONFIG_NVHE_EL2_TRACING.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp/include/nvhe/clock.h
new file mode 100644
index 000000000000..9f429f5c0664
--- /dev/null
+++ b/arch/arm64/kvm/hyp/include/nvhe/clock.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ARM64_KVM_HYP_NVHE_CLOCK_H
+#define __ARM64_KVM_HYP_NVHE_CLOCK_H
+#include <linux/types.h>
+
+#include <asm/kvm_hyp.h>
+
+#ifdef CONFIG_NVHE_EL2_TRACING
+void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc);
+u64 trace_clock(void);
+#else
+static inline void
+trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
+static inline u64 trace_clock(void) { return 0; }
+#endif
+#endif
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index a244ec25f8c5..8dc95257c291 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -17,7 +17,7 @@ ccflags-y += -fno-stack-protector	\
 hostprogs := gen-hyprel
 HOST_EXTRACFLAGS += -I$(objtree)/include
 
-lib-objs := clear_page.o copy_page.o memcpy.o memset.o
+lib-objs := clear_page.o copy_page.o memcpy.o memset.o tishift.o
 lib-objs := $(addprefix ../../../lib/, $(lib-objs))
 
 CFLAGS_switch.nvhe.o += -Wno-override-init
@@ -29,6 +29,7 @@ hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
 hyp-obj-y += ../../../kernel/smccc-call.o
 hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
+hyp-obj-$(CONFIG_NVHE_EL2_TRACING) += clock.o
 hyp-obj-y += $(lib-objs)
 
 ##
diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/clock.c
new file mode 100644
index 000000000000..32fc4313fe43
--- /dev/null
+++ b/arch/arm64/kvm/hyp/nvhe/clock.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Vincent Donnefort <vdonnefort@google.com>
+ */
+
+#include <nvhe/clock.h>
+
+#include <asm/arch_timer.h>
+#include <asm/div64.h>
+
+static struct clock_data {
+	struct {
+		u32 mult;
+		u32 shift;
+		u64 epoch_ns;
+		u64 epoch_cyc;
+		u64 cyc_overflow64;
+	} data[2];
+	u64 cur;
+} trace_clock_data;
+
+static u64 __clock_mult_uint128(u64 cyc, u32 mult, u32 shift)
+{
+	__uint128_t ns = (__uint128_t)cyc * mult;
+
+	ns >>= shift;
+
+	return (u64)ns;
+}
+
+/* Does not guarantee no reader on the modified bank. */
+void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)
+{
+	struct clock_data *clock = &trace_clock_data;
+	u64 bank = clock->cur ^ 1;
+
+	clock->data[bank].mult			= mult;
+	clock->data[bank].shift			= shift;
+	clock->data[bank].epoch_ns		= epoch_ns;
+	clock->data[bank].epoch_cyc		= epoch_cyc;
+	clock->data[bank].cyc_overflow64	= ULONG_MAX / mult;
+
+	smp_store_release(&clock->cur, bank);
+}
+
+/* Use untrusted host data */
+u64 trace_clock(void)
+{
+	struct clock_data *clock = &trace_clock_data;
+	u64 bank = smp_load_acquire(&clock->cur);
+	u64 cyc, ns;
+
+	cyc = __arch_counter_get_cntvct() - clock->data[bank].epoch_cyc;
+
+	if (likely(cyc < clock->data[bank].cyc_overflow64)) {
+		ns = cyc * clock->data[bank].mult;
+		ns >>= clock->data[bank].shift;
+	} else {
+		ns = __clock_mult_uint128(cyc, clock->data[bank].mult,
+					  clock->data[bank].shift);
+	}
+
+	return (u64)ns + clock->data[bank].epoch_ns;
+}
-- 
2.53.0.rc1.225.gd81095ad13-goog


