Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C272CC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 23:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulmUmxoKn2frrsYltohW0CKthat5ISQxrYAQM4kkNLU=; b=pcxwaxgirfe3YUDiijpxZU383W
	gK0tneOj1wo0wQUnW2NfwYkGHYFKrnw51UtQ9FInPlKftg5Cs5WamyTSj7AoxImitYHWEdr5tV7JY
	7YWZfD6+su11Xhb4xsJcRXGevPpwFooF0FHLPRegsMpqVfr5737V7tPbZnzf22TCbW44m2/0XtEf+
	UBafPIDTC0LV6her9j4Xb+ZzEIF/bIGYE0Dd/yIt7kBkjadA2iWVHtqdAzDKR8xEaqojKnSbw9x/0
	fmciiKyAwK+rBtoOrM0qnwcrrDOdhQ/gQKWSb2E7yTbi+nKLy9W01hpjourdV3xWufKC45ogHBEFG
	nwzVQJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzOI4-00000001Zgr-1mz1;
	Mon, 31 Mar 2025 23:11:36 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzO7i-00000001YYz-1E0j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 23:00:55 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff64898e2aso9527085a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 16:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743462053; x=1744066853; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ulmUmxoKn2frrsYltohW0CKthat5ISQxrYAQM4kkNLU=;
        b=nRYJUpvt3hxbxPXbQJwZBMtcxVk3OnZvEN9LNTl+7Fnv8BvSgxYsCEOwNwR/bLmlyX
         f8IrtgY5AEmwpKzb426unzH1oNWrZXWh+POQmvvbwq+MDZfaR11308GX98VmeC1rJa9C
         k3c+GKym3hXbLlLHGCxpvFjCaQ/DuW92WZjY4DAHnVfBhWZSS7/pPT3x2If8cHYimW3e
         WHs/nJmE5Erb4OJfsVzDzdsipijZgUDAxl606USRdycjALUYBdV8t57GjXaqj5384Do/
         8+ib/6f6SrNe11tdcGMzu8Yt3szD6A6yLhaMmnFMhflTzWuyPqQ+Vrz2UXgneAWFddRw
         HncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743462053; x=1744066853;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulmUmxoKn2frrsYltohW0CKthat5ISQxrYAQM4kkNLU=;
        b=aPI2pgFkgp2h1VPU5gH6gBqYNmSgGqOX5PcTcionG8lLF+iHxLNg3G9/KYD7GiqauF
         WactuCQTf3Hk37WoWTH5KNvWpTR44K+hZCnYjnYr4GtLAnxisxqJg6WH7zE0Fbx3K1e3
         pZzU1D3SabZdo0BLHCAwsDFdCnnj9xHyehlLUFrjBHlrXAiFmTTB+fN9hz0mrqAEbdBl
         W6e1ccMoUaRiRor1EDiOss+3wD5RTdbJuqfX5RCBk44IQfrePOaQAv6pPTHdn53ZYSJq
         yeMBZVVr9hsrHxeTMA2LBzLYx9tpaLTPF/vpbwAyNZSeMnqvPhrJfhI+jGaMkoRIJkvk
         igQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtmIAxq0bCpjyboXvtIzQM4I28YkPl7OBHaP0XeZ80hBY1VCESiWVGCepZLhPxPt1tQELWPbre7Gs81d/Apnll@lists.infradead.org
X-Gm-Message-State: AOJu0YzeI06Zj/QmUvTM99TkfZe0w9gvfHWxqH3p7cQ2vZL6HYpRzE2J
	dlN4AdykXOidO7FH1l92YSLGPDRJs0p6QBr7H0SEKC7FZ885l8H8SpBYGeuS7DJKT2cSlnkIEqV
	VRv+c8kMSmDnf6X/vvD+zNOoCBw==
X-Google-Smtp-Source: AGHT+IE5NyFQYus/tf1QYYAFIfVAMg9yb/cSsm8CoRrwBXhSWC0iBExikv4kLw7OwXIeyQY2hQdq59zsfug5q/X9xxE=
X-Received: from pjbsb5.prod.google.com ([2002:a17:90b:50c5:b0:2ff:4ba2:f3a5])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1cc7:b0:2fa:1d9f:c80 with SMTP id 98e67ed59e1d1-3051c9752admr21092256a91.17.1743462053067;
 Mon, 31 Mar 2025 16:00:53 -0700 (PDT)
Date: Mon, 31 Mar 2025 16:00:27 -0700
In-Reply-To: <20250331230034.806124-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250331230034.806124-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331230034.806124-6-willmcvicker@google.com>
Subject: [PATCH v1 5/6] clocksource/drivers/exynos_mct: Add module support
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Donghoon Yu <hoony.yu@samsung.com>, Youngmin Nam <youngmin.nam@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_160054_332121_05AA5083 
X-CRM114-Status: GOOD (  20.97  )
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

From: Donghoon Yu <hoony.yu@samsung.com>

On Arm64 platforms the Exynos MCT driver can be built as a module. On
boot (and even after boot) the arch_timer is used as the clocksource and
tick timer. Once the MCT driver is loaded, it can be used as the wakeup
source for the arch_timer.

Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/Kconfig      |  3 +-
 drivers/clocksource/exynos_mct.c | 47 +++++++++++++++++++++++++++-----
 2 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 487c85259967..e5d9d8383607 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -443,7 +443,8 @@ config ATMEL_TCB_CLKSRC
 	  Support for Timer Counter Blocks on Atmel SoCs.
 
 config CLKSRC_EXYNOS_MCT
-	bool "Exynos multi core timer driver" if COMPILE_TEST
+	tristate "Exynos multi core timer driver"
+	default y if ARCH_EXYNOS
 	depends on ARM || ARM64
 	depends on ARCH_ARTPEC || ARCH_EXYNOS || COMPILE_TEST
 	help
diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 21ded37137d7..da4460d8a0ba 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -15,9 +15,11 @@
 #include <linux/cpu.h>
 #include <linux/delay.h>
 #include <linux/percpu.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <linux/clocksource.h>
 #include <linux/sched_clock.h>
 
@@ -235,7 +237,7 @@ static cycles_t exynos4_read_current_timer(void)
 }
 #endif
 
-static int __init exynos4_clocksource_init(bool frc_shared)
+static int exynos4_clocksource_init(bool frc_shared)
 {
 	/*
 	 * When the frc is shared, the main processor should have already
@@ -507,7 +509,7 @@ static int exynos4_mct_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
-static int __init exynos4_timer_resources(struct device_node *np)
+static int exynos4_timer_resources(struct device_node *np)
 {
 	struct clk *mct_clk, *tick_clk;
 
@@ -535,7 +537,7 @@ static int __init exynos4_timer_resources(struct device_node *np)
  * @local_idx: array mapping CPU numbers to local timer indices
  * @nr_local: size of @local_idx array
  */
-static int __init exynos4_timer_interrupts(struct device_node *np,
+static int exynos4_timer_interrupts(struct device_node *np,
 					   unsigned int int_type,
 					   const u32 *local_idx,
 					   size_t nr_local)
@@ -640,7 +642,7 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 	return err;
 }
 
-static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
+static int mct_init_dt(struct device_node *np, unsigned int int_type)
 {
 	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
 	u32 local_idx[MCT_NR_LOCAL] = {0};
@@ -688,15 +690,46 @@ static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
 	return exynos4_clockevent_init();
 }
 
-
-static int __init mct_init_spi(struct device_node *np)
+static int mct_init_spi(struct device_node *np)
 {
 	return mct_init_dt(np, MCT_INT_SPI);
 }
 
-static int __init mct_init_ppi(struct device_node *np)
+static int mct_init_ppi(struct device_node *np)
 {
 	return mct_init_dt(np, MCT_INT_PPI);
 }
+
+#ifdef MODULE
+static int exynos4_mct_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+
+	if (of_machine_is_compatible("samsung,exynos4412-mct"))
+		return mct_init_ppi(np);
+
+	return mct_init_spi(np);
+}
+
+static const struct of_device_id exynos4_mct_match_table[] = {
+	{ .compatible = "samsung,exynos4210-mct" },
+	{ .compatible = "samsung,exynos4412-mct" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
+
+static struct platform_driver exynos4_mct_driver = {
+	.probe		= exynos4_mct_probe,
+	.driver		= {
+		.name	= "exynos-mct",
+		.of_match_table = exynos4_mct_match_table,
+	},
+};
+module_platform_driver(exynos4_mct_driver);
+#else
 TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
 TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
+#endif
+
+MODULE_DESCRIPTION("Exynos Multi Core Timer Driver");
+MODULE_LICENSE("GPL");
-- 
2.49.0.472.ge94155a9ec-goog


