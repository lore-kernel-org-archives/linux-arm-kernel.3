Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BC1C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 09:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Dv5Ac6SPOdtGgS0tmgxnxoVXUMjLjqcjHEmAbg0F2U=; b=P4YwY9eufon5IPCTwfIGuGueE8
	DDtnJOOSLGiXxTv4Ux4C85/8JtXcW9BuGNVdiIp+PsMmeFPmbAIsh7gm6+d0ba/878d6vCryioRFk
	TuK2JQAG6CpbhFb/Efv4VG+Kks0D5iv4/e4eTWeTBPFh6NQbRAYYhe3bdaTygxHRd/0A2sfHW4/Hl
	yunRTnXoAGIUtRHV81wxt9ulYhYaA8RLB11z2fW73w4X8GPAtwqTejhocarSG1CO3OWrL8ihnaIeP
	Fvqt/dPtT1juFVBr64vsgwmszWFXuollVwmLdTWjzyn68WRXqY72k8CZWuOvS9hZ5D1bTiBIPVS84
	PNw2xiUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetDk-0000000F3cn-0v11;
	Mon, 03 Feb 2025 09:58:24 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tetCP-0000000F3PG-3HCm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 09:57:02 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6f6f2db824bso36736857b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 01:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738576620; x=1739181420; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2Dv5Ac6SPOdtGgS0tmgxnxoVXUMjLjqcjHEmAbg0F2U=;
        b=ynSvw9nfVU2KAX7xO10QG8e5onQLbgFjlEwsMTM6aQambDdyJJKzYYiuP3OLQ08nF5
         2JTQrizhX3nSSNgGqf8x8Z8/ARZhWHNL3QG5uEPVX9LVtSHunK1kbJmyCVRMDsX0itN2
         mocQQFa+AyNugdyf4M6zwmKr82CCNMTc54n9sKgCJn53mH0IQC+GdGpIW6CXAAoMk4ur
         LcbUks7UuiYNa9j3uc9dIz1f2vLph3IGOzzuO2Fjdk2B6w/DFtggmBunar3JatyUceU6
         5g29dZEMns+4z+1LlbcXqW4lBNNo/xMT+XTwWRLlzeg9XKOp06ieTYuwnqef0VXHghJT
         pTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738576620; x=1739181420;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Dv5Ac6SPOdtGgS0tmgxnxoVXUMjLjqcjHEmAbg0F2U=;
        b=lTqC7aHkQZct2BNwMiu30xvaBFLmyu8TPp2nicCjRa9lwvEbaqC1PxFVwzSmRgQk1d
         GA8cC/YaHWzVq+J1IqYDYYj/3/G34c1D6+rDElMiR2RKBaLl9ty+79mKUKAL1URlmDSz
         6H70NZRIRHClMu8Wl9ugv0mTuXRokTnExNzD59V8Rg0b7HI4vowMv6iHqr9Q3Nfg8jVi
         BL2FMgsNIrsUCuwfmFXr6/wQdTIFPk1LFYq9YvCAwbXpY206JpAq728yj9TLDnq0O/Xq
         192KKaU0AvX9VS2t/2b6RvRgh05SSmicFkpbnCm5+4qIRpYon3kN3Nhht3cGs0W+W10a
         FIeA==
X-Forwarded-Encrypted: i=1; AJvYcCXXDMnXiKXKPm7dDjvQUQV1cK+ji8FyTOaWBM+QcpZRiP2Jo3qxX5i9kmq0cEZLeI/31uhfeMHuGYdc+07Yr6kO@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfehhp+illbp2X5tpISDUweY4Y+AvP9RCjzMKAwiGMT6lTdVC0
	N8TBCCXqkrdL2J2HQdJUZaKUU383f1+bqtKSHCI5j5YFgFHMX+U3qjR/gSUYya554Pi4Wg==
X-Google-Smtp-Source: AGHT+IECB4t9+nxA9LWLIFfRwRwZsyYuUUH4xiSxgCR5XbY+fu38QoXLmO5+/gf/KeL9xbqGeB9WRgfz
X-Received: from ywbhl13.prod.google.com ([2002:a05:690c:620d:b0:6f5:278e:e957])
 (user=keyz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690c:74ca:b0:6ef:81c0:5b56
 with SMTP id 00721157ae682-6f7a8355a9amr168753257b3.14.1738576619752; Mon, 03
 Feb 2025 01:56:59 -0800 (PST)
Date: Mon,  3 Feb 2025 17:56:53 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250203095653.4085118-1-keyz@google.com>
Subject: [PATCH v5] cpuidle: psci: Add trace for PSCI domain idle
From: Keita Morisaki <keyz@google.com>
To: linux-kernel@vger.kernel.org, lpieralisi@kernel.org, sudeep.holla@arm.com, 
	rafael@kernel.org, daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, aarontian@google.com, 
	yimingtseng@google.com, Keita Morisaki <keyz@google.com>, Dhruva Gole <d-gole@ti.com>, 
	Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_015701_819643_D794ED5F 
X-CRM114-Status: GOOD (  12.11  )
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

The trace event cpu_idle provides insufficient information for debugging
PSCI requests due to lacking access to determined PSCI domain idle
states. The cpu_idle usually only shows -1, 0, or 1 regardless how many
idle states the power domain has.

Add new trace events namely psci_domain_idle_enter and
psci_domain_idle_exit to trace enter and exit events with a determined
idle state.

These new trace events will help developers debug CPUidle issues on ARM
systems using PSCI by providing more detailed information about the
requested idle states.

Signed-off-by: Keita Morisaki <keyz@google.com>
Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
---
v1->v2: Split the ftrace event into two (psci_domain_idle_(enter|exit))
        and rephrase the commit message accordingly. Rebased onto the latest.
v2->v3: Add "Reviewed-by: Steven Rostedt"
v3->v4: Add the Tested-by label
v4->v5: Add "Reviewed-by: Dhruva Gole"

Hopefully this patch gets attention from maintainers of
drivers/cpuidle/cpuidle-psci.c too.

 drivers/cpuidle/cpuidle-psci.c |  3 +++
 include/trace/events/power.h   | 37 ++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index 2562dc001fc1..dd8d776d6e39 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -25,6 +25,7 @@
 #include <linux/syscore_ops.h>

 #include <asm/cpuidle.h>
+#include <trace/events/power.h>

 #include "cpuidle-psci.h"
 #include "dt_idle_states.h"
@@ -74,7 +75,9 @@ static __cpuidle int __psci_enter_domain_idle_state(struct cpuidle_device *dev,
 	if (!state)
 		state = states[idx];

+	trace_psci_domain_idle_enter(dev->cpu, state, s2idle);
 	ret = psci_cpu_suspend_enter(state) ? -1 : idx;
+	trace_psci_domain_idle_exit(dev->cpu, state, s2idle);

 	if (s2idle)
 		dev_pm_genpd_resume(pd_dev);
diff --git a/include/trace/events/power.h b/include/trace/events/power.h
index d2349b6b531a..9253e83b9bb4 100644
--- a/include/trace/events/power.h
+++ b/include/trace/events/power.h
@@ -62,6 +62,43 @@ TRACE_EVENT(cpu_idle_miss,
 		(unsigned long)__entry->state, (__entry->below)?"below":"above")
 );

+DECLARE_EVENT_CLASS(psci_domain_idle,
+
+	TP_PROTO(unsigned int cpu_id, unsigned int state, bool s2idle),
+
+	TP_ARGS(cpu_id, state, s2idle),
+
+	TP_STRUCT__entry(
+		__field(u32,		cpu_id)
+		__field(u32,		state)
+		__field(bool,		s2idle)
+	),
+
+	TP_fast_assign(
+		__entry->cpu_id = cpu_id;
+		__entry->state = state;
+		__entry->s2idle = s2idle;
+	),
+
+	TP_printk("cpu_id=%lu state=0x%lx is_s2idle=%s",
+		  (unsigned long)__entry->cpu_id, (unsigned long)__entry->state,
+		  (__entry->s2idle)?"yes":"no")
+);
+
+DEFINE_EVENT(psci_domain_idle, psci_domain_idle_enter,
+
+	TP_PROTO(unsigned int cpu_id, unsigned int state, bool s2idle),
+
+	TP_ARGS(cpu_id, state, s2idle)
+);
+
+DEFINE_EVENT(psci_domain_idle, psci_domain_idle_exit,
+
+	TP_PROTO(unsigned int cpu_id, unsigned int state, bool s2idle),
+
+	TP_ARGS(cpu_id, state, s2idle)
+);
+
 TRACE_EVENT(powernv_throttle,

 	TP_PROTO(int chip_id, const char *reason, int pmax),

base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
--
2.48.1.362.g079036d154-goog

