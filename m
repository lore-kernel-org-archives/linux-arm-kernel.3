Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92822C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 18:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KucomvysAjkq7Mc20S0WzT2rldg2A7wys58v4bjZBcg=; b=hnT8CiifUkIQ9/ElQTYINDUDFr
	bckjCzl1aI2geth754hMr6UyGnf6PSBksdNeccJA6KLSL2T9/iqb8xJ9a89M0/gq/EI0o/OHGFxlK
	I4AbiLXMsfASIDFxZWA0EOuAw8RiserhMisq7bsFAv5XnJsaHEDdcHSCN51Zb+X1N8Tosd8Tomfq9
	CD+hD8vxqqVm2jDpujNfUCCvTs+ZHKA+TyMrn32IJklBel5ttc9iSyeI3i8O32d/0QW5pJaqCXMjE
	ghj9QyghlEypnaOCAlRVjO+8hi1nnvRfZjm01uaCDZmwCY3LDIITPijrHNBbos/OImbK7/bBXgb7g
	7Nc3lgvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSgU6-0000000GMcA-0X7U;
	Fri, 20 Jun 2025 18:29:06 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSgJC-0000000GLMb-0tRu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 18:17:51 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b2c00e965d0so1456258a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 11:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750443469; x=1751048269; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KucomvysAjkq7Mc20S0WzT2rldg2A7wys58v4bjZBcg=;
        b=AHpYm1x3avegxbDXW2/tegGSfdybd58jGLUSSn15BJZb9ZZQ/wv/Rj+Kr6lt+KidrW
         5yPgaiiuOmBlfW4VK3j/xb1MgTiZGfW9r3UImmtnMQ4sl0rjzK84cw94RP7Sxw0n5Zzu
         lN517TfG1jFVNDo4YaawcmbSHHVueuFLebYNZfi2wOOh/TWFh5TkTOxdgDI0SHiF96MA
         hO0XjWXaTTyRcaCzp2Cb9wJ287FmZETMwpBHK7WCKkkExY3S7nRmtSGdUNzUS1Qn1Ksy
         EIKTuidFEnYjAkiIZx9fmlu4KQRkwvJ7y3kYE2SCGQ5fUdtCzyAZxW3RClx8C0xbSpG2
         KPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443469; x=1751048269;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KucomvysAjkq7Mc20S0WzT2rldg2A7wys58v4bjZBcg=;
        b=fj1kevF6v6Gn2ogtejbzFjauHQ9LN9ixyB/ko4QxvHohsWbnBUc9OI7B0BYVG13SuE
         S8SNlG4oWSZuxCg4SmBmqtNVfsa66+znwpbR5HdF8qnu/hGd85/IDCOEyzsfeNGJ+fib
         ViL9EoPECHz/krSpE3CDCS0n6e403cZuU3NIOx2DD2/f0wS15tcsq3vMbgdLvEXT6Yr+
         B2Z9otrbpMvt7hHQtciGLIE9IFvrGaj6ufCI73XpJ91P7MXKbGPe1cBzy6WvmE1CFHed
         DEZz2jt3jedSq462Kpp+38EbTMLx4U+EdtwsdJXWQCaq79hxR+dIkf/yEalLbtHszS90
         Fg9g==
X-Forwarded-Encrypted: i=1; AJvYcCUacMqd/xLezEDh81hxmyf/6XIjfO063QRIZDR88BJVYGdGLs/r1QZ8jVKHz70JWsvZ/GgehBi/HhnuYP6hX2iq@lists.infradead.org
X-Gm-Message-State: AOJu0YzCm0xmmUuTuGyb1Rs4PW8yWxcn9puzK2xifdDTx4FEwMvKnTzV
	PxBklwyVgMxfxDF3Qe7cMOaCeCgLMEEZWxgc4QJRK8dB74zAURSKukGY3WhAjNna1DFgKHc8wez
	ul8Y9mgjpfW1fGVzSJWhL5t+FH6Ureg==
X-Google-Smtp-Source: AGHT+IHpdvlqIvd5OPMBnBWNmW/55tcTKxbpdQaDGPMx3/p+0hFPHDCPkEbjUA750R9QqBN1jh56itwHNkqhRDPQ52g=
X-Received: from pge20.prod.google.com ([2002:a05:6a02:2d14:b0:b2f:637a:a7d0])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:9f8b:b0:1f5:7ea8:a791 with SMTP id adf61e73a8af0-22026c30688mr5635494637.10.1750443468893;
 Fri, 20 Jun 2025 11:17:48 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:17:07 -0700
In-Reply-To: <20250620181719.1399856-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250620181719.1399856-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250620181719.1399856-5-willmcvicker@google.com>
Subject: [PATCH v4 4/6] clocksource/drivers/exynos_mct: Fix uninitialized irq
 name warning
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_111750_251738_A2A3E634 
X-CRM114-Status: GOOD (  16.97  )
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

The Exynos MCT driver doesn't set the clocksource name until the CPU
hotplug state is setup which happens after the IRQs are requested. This
results in an empty IRQ name which leads to the below warning at
proc_create() time. When this happens, the userdata partition fails to
mount and the device gets stuck in an endless loop printing the error:

  root '/dev/disk/by-partlabel/userdata' doesn't exist or does not contain a /dev.

To fix this, we just need to initialize the name before requesting the
IRQs.

Warning from Pixel 6 kernel log:

[  T430] name len 0
[  T430] WARNING: CPU: 6 PID: 430 at fs/proc/generic.c:407 __proc_create+0x258/0x2b4
[  T430] Modules linked in: dwc3_exynos(E+)
[  T430]  ufs_exynos(E+) phy_exynos_ufs(E)
[  T430]  phy_exynos5_usbdrd(E) exynos_usi(E+) exynos_mct(E+) s3c2410_wdt(E)
[  T430]  arm_dsu_pmu(E) simplefb(E)
[  T430] CPU: 6 UID: 0 PID: 430 Comm: (udev-worker) Tainted:
         ... 6.14.0-next-20250331-4k-00008-g59adf909e40e #1 ...
[  T430] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
[  T430] Hardware name: Raven (DT)
[...]
[  T430] Call trace:
[  T430]  __proc_create+0x258/0x2b4 (P)
[  T430]  proc_mkdir+0x40/0xa0
[  T430]  register_handler_proc+0x118/0x140
[  T430]  __setup_irq+0x460/0x6d0
[  T430]  request_threaded_irq+0xcc/0x1b0
[  T430]  mct_init_dt+0x244/0x604 [exynos_mct ...]
[  T430]  mct_init_spi+0x18/0x34 [exynos_mct ...]
[  T430]  exynos4_mct_probe+0x30/0x4c [exynos_mct ...]
[  T430]  platform_probe+0x6c/0xe4
[  T430]  really_probe+0xf4/0x38c
[...]
[  T430]  driver_register+0x6c/0x140
[  T430]  __platform_driver_register+0x28/0x38
[  T430]  exynos4_mct_driver_init+0x24/0xfe8 [exynos_mct ...]
[  T430]  do_one_initcall+0x84/0x3c0
[  T430]  do_init_module+0x58/0x208
[  T430]  load_module+0x1de0/0x2500
[  T430]  init_module_from_file+0x8c/0xdc

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index a5ef7d64b1c2..62febeb4e1de 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -465,8 +465,6 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
 		per_cpu_ptr(&percpu_mct_tick, cpu);
 	struct clock_event_device *evt = &mevt->evt;
 
-	snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d", cpu);
-
 	evt->name = mevt->name;
 	evt->cpumask = cpumask_of(cpu);
 	evt->set_next_event = exynos4_tick_set_next_event;
@@ -567,6 +565,14 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 	for (i = MCT_L0_IRQ; i < nr_irqs; i++)
 		mct_irqs[i] = irq_of_parse_and_map(np, i);
 
+	for_each_possible_cpu(cpu) {
+		struct mct_clock_event_device *mevt =
+		    per_cpu_ptr(&percpu_mct_tick, cpu);
+
+		snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d",
+			 cpu);
+	}
+
 	if (mct_int_type == MCT_INT_PPI) {
 
 		err = request_percpu_irq(mct_irqs[MCT_L0_IRQ],
-- 
2.50.0.rc2.761.g2dc52ea45b-goog


