Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C10CF9C7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 18:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZhynQ1C+Qi97UwkIs4tb4ijOuArkDPdVuCjShevDQ4=; b=h8B5tyyAigIfQA4W2jf1ktxllq
	kkS5mB+bz8gYGklLLD0doobMGFVzSgdQvNwDP5H0BKZ8TNA0ypBAI/o5OJ5/QSuZbCT22TMJj0ip8
	vCP+GLkl6hhgszpQdzKy4Ath49IZdpGrTqdeIDfK687IqzXnGQGue4VdmfMowpsE/qNCVnT8LfTCK
	pIjeq8kWggFlLv+sUGtmeZ6lNluE8s8RScq52R0UeW6oIizGVDTItg/tQKc4uJZNULZqrswKIjAUR
	PnOiyOomlcRCbqBPj+8lcypREYMNv4u8oqgiukDsxj7Iik3WId/gqKIblhuhRBEJ+ihSdpWgdWgjx
	h4Oa1Jcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9cY-00000007Eky-3P9o;
	Thu, 20 Nov 2025 18:43:06 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9cS-00000007Ehm-3wVg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 18:43:02 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2980ef53fc5so43537495ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 10:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763664180; x=1764268980; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZhynQ1C+Qi97UwkIs4tb4ijOuArkDPdVuCjShevDQ4=;
        b=PSuK7eIc4pIwGbFw6zyAM8bUM/9ZF2y2+Zne9C5tS9LkmvpAr6MX8CAAL+YsrsuE3h
         9YGTKUzhqCVyyuwYIGaMDSl42E8gitvmAAOZ2KVRAfY3BQN+NMUZhQr2dSZX4uNglT9Z
         kNxB9I6qvcBAP8N9WxXVACzK4yg+8MifhPuEck30RPDIsV+D10IYamXnf6sxLLEOK2YA
         GiZYXzR/AEC7DAXwalnpa16avZ9ryws+y/CM86V5U+ZCK64oSYHsrhnFP9yjvQIRNMHT
         RR+qx9gXdlMK3JVbSK1ndWY4VYnQ0ltAX30cj05vxQbwDIxGAv9wxO2L+LW1p8g7bjRG
         BhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763664180; x=1764268980;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZhynQ1C+Qi97UwkIs4tb4ijOuArkDPdVuCjShevDQ4=;
        b=gqBfRdFRSZhrTx4PWjdNaAEbrZ5q5Pvad04zlvw1fl1qlJ45nLr3ZMz7gQq7p7SjuK
         Q4eXMIO3d1Yeq7KiQ7Hla+36XiMndaR40xo3dLA1rII4xy3KfVqAd7itCSko4KN50ToY
         efjNvm9t7ePj8J+501XLj87csaN2kU3k52ZGmczctDEpFG93TXnrWvF3PPUD357bhJUr
         Ivyxt4iwa3HCB41pnWaROPmo55rcUMlAcp42d7FZnLHMBxuu4SnKmyGJ1LuUCuApRarQ
         RSqPMpAboC1GKa+tQBft6CKhda/ssPcdnr42yYtyJQdC8v3SkPu6hkyNF/nmptqFSmcx
         en1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYQKqg2nTCEhHeIsxUx6hjGbK2wGhz7WwjtyUK2c/nmot2UTO5RsNUNzDhY71i1PV8Rza73A/NrLIaWwInK4Yv@lists.infradead.org
X-Gm-Message-State: AOJu0YytRRJt/ZGiNhZBMBvbe5qYoiJOuyE2asrXJt4aLYGOw0dYEZYC
	gxPD9Lpn+Br6sjwf4Sx8UJavrkENI29DPtTz+HgxukdD0crNBs7K2XWUupC8Q+Mu9swXiVAcPuV
	2jEUr0SJv5x1KDWRnCj7yqg73o31JIA==
X-Google-Smtp-Source: AGHT+IEt/Rnu04z2aH9Z9OLNbqRP/pUTKYo+u1/ArFiPePsuZbsDWIhlzIUZmUyy2hjC5k2QI/TnRwU+QRzQbAqqPns=
X-Received: from plgu3.prod.google.com ([2002:a17:902:e803:b0:290:d4a1:13cb])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1a44:b0:258:f033:3ff9 with SMTP id d9443c01a7336-29b5b0fe951mr55111265ad.48.1763664180062;
 Thu, 20 Nov 2025 10:43:00 -0800 (PST)
Date: Thu, 20 Nov 2025 18:42:33 +0000
In-Reply-To: <20251120184242.1625820-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251120184242.1625820-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <20251120184242.1625820-6-willmcvicker@google.com>
Subject: [PATCH v6 5/6] clocksource/drivers/exynos_mct: Add module support for ARM64
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, Rob Herring <robh@kernel.org>, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_104301_007425_80EE4A27 
X-CRM114-Status: GOOD (  25.99  )
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
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
[original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
Tested-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/Kconfig      |  3 +-
 drivers/clocksource/exynos_mct.c | 62 ++++++++++++++++++++++++++++----
 2 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index ffcd23668763..9450cfaf982f 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -451,7 +451,8 @@ config ATMEL_TCB_CLKSRC
 	  Support for Timer Counter Blocks on Atmel SoCs.
 
 config CLKSRC_EXYNOS_MCT
-	bool "Exynos multi core timer driver" if COMPILE_TEST
+	tristate "Exynos multi core timer driver" if ARM64
+	default y if ARCH_EXYNOS || COMPILE_TEST
 	depends on ARM || ARM64
 	depends on ARCH_ARTPEC || ARCH_EXYNOS || COMPILE_TEST
 	help
diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index fece6bbc190e..55ce1d0b648e 100644
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
 
@@ -217,6 +219,7 @@ static struct clocksource mct_frc = {
 	.mask		= CLOCKSOURCE_MASK(32),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	.resume		= exynos4_frc_resume,
+	.owner		= THIS_MODULE,
 };
 
 /*
@@ -241,7 +244,7 @@ static cycles_t exynos4_read_current_timer(void)
 }
 #endif
 
-static int __init exynos4_clocksource_init(bool frc_shared)
+static int exynos4_clocksource_init(bool frc_shared)
 {
 	/*
 	 * When the frc is shared, the main processor should have already
@@ -336,6 +339,7 @@ static struct clock_event_device mct_comp_device = {
 	.set_state_oneshot	= mct_set_state_shutdown,
 	.set_state_oneshot_stopped = mct_set_state_shutdown,
 	.tick_resume		= mct_set_state_shutdown,
+	.owner			= THIS_MODULE,
 };
 
 static irqreturn_t exynos4_mct_comp_isr(int irq, void *dev_id)
@@ -476,6 +480,7 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
 	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT |
 			CLOCK_EVT_FEAT_PERCPU;
 	evt->rating = MCT_CLKEVENTS_RATING;
+	evt->owner = THIS_MODULE;
 
 	exynos4_mct_write(TICK_BASE_CNT, mevt->base + MCT_L_TCNTB_OFFSET);
 
@@ -511,7 +516,7 @@ static int exynos4_mct_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
-static int __init exynos4_timer_resources(struct device_node *np)
+static int exynos4_timer_resources(struct device_node *np)
 {
 	struct clk *mct_clk, *tick_clk;
 
@@ -539,7 +544,7 @@ static int __init exynos4_timer_resources(struct device_node *np)
  * @local_idx: array mapping CPU numbers to local timer indices
  * @nr_local: size of @local_idx array
  */
-static int __init exynos4_timer_interrupts(struct device_node *np,
+static int exynos4_timer_interrupts(struct device_node *np,
 					   unsigned int int_type,
 					   const u32 *local_idx,
 					   size_t nr_local)
@@ -653,7 +658,7 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 	return err;
 }
 
-static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
+static int mct_init_dt(struct device_node *np, unsigned int int_type)
 {
 	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
 	u32 local_idx[MCT_NR_LOCAL] = {0};
@@ -701,15 +706,58 @@ static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
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
+#ifdef CONFIG_ARM
+/* Note, legacy ARM 32-bit systems depend on the MCT as the only clocksource
+ * which requires this driver to be initialized very early. We need to keep this
+ * special condition until we can transparently support modular and early init
+ * timers.
+ */
 TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
 TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
+#else
+static int exynos4_mct_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int (*mct_init)(struct device_node *np);
+
+	mct_init = of_device_get_match_data(dev);
+	if (!mct_init)
+		return -EINVAL;
+
+	return mct_init(dev->of_node);
+}
+
+static const struct of_device_id exynos4_mct_match_table[] = {
+	{ .compatible = "samsung,exynos4210-mct", .data = &mct_init_spi, },
+	{ .compatible = "samsung,exynos4412-mct", .data = &mct_init_ppi, },
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
+
+static __init int exynos_mct_init(void)
+{
+  return platform_driver_register(&exynos4_mct_driver);
+}
+module_init(exynos_mct_init);
+
+MODULE_DESCRIPTION("Exynos Multi Core Timer Driver");
+MODULE_LICENSE("GPL");
+#endif /* CONFIG_ARM */
-- 
2.52.0.rc2.455.g230fcf2819-goog


