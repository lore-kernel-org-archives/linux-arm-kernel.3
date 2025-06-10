Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB850C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 17:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JkfG8YXz0QvamudIhCtDRX+9K9gQecYFXtrNBuUy3iE=; b=axhtCfhxGHtE291T8ziV7GEBgQ
	cXDCuOyBAn2kIwhgi+BfkOYgwegIqc17eeIXp67OPihrld8fxYonQvypXiIzBhAR2EGOcFjc53ZWg
	ximz225VEktXDc6yrpNXp2W2I9P+HaLJD57xhMTgYOo0QfGIYwGUUW0uIyGG8RMi80EfhThtH2UJe
	akd/QTDh/aQGpbp4LsVSpEH3guvCz9wpp/tQ+ynOMTV+rdK+U+fEISRlLQwiNfN9zJfEjGXb12w5C
	clMEjySJ/8N1BLmjv1xQiFDpSm1TLazMUM3HLCbQgGcqjQpttKqxdjBFSoyc2bBHPXYpSwEO2fyg9
	fGWQ06xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2qk-00000007e0L-2RzV;
	Tue, 10 Jun 2025 17:33:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP027-000000078Sn-0Ed7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 14:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JkfG8YXz0QvamudIhCtDRX+9K9gQecYFXtrNBuUy3iE=; b=ASp8fP1bDkF32Hd1VBsJuVtnXY
	9cnn/Mt5YPHJwHEYN1ZIMHMPJHBWTKzCEkwHpXBQB8v+oonxpXRu7d9eBuYdsUXi27omCHjw9v/YS
	ylryQcG9rbrB6bWcJ34/bDhH5P0V19aLRxX6Fl+/xg242aRtrOl+Tr6skAKjhJxrE5WMixmXsD04c
	kc/notolCN4BZ9qOhfAZ5xATDtGU/oEx86kHSpAdG42YM1qZLn2VXFWeXFf68KG0PN/VrigqV7VVJ
	lNH9hUj+7Ha4u5WHmCIg7p+AzX7//hSDzKe3DtAafyzRmDxitpN/gBWM6KA/FvxUq37oQ2N6RtLxi
	tfduxVQA==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP024-00000001sVj-49Um
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 14:32:58 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLDfV012929;
	Tue, 10 Jun 2025 16:32:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	JkfG8YXz0QvamudIhCtDRX+9K9gQecYFXtrNBuUy3iE=; b=hftHrf/mn+BLdir3
	rR60G4wkeaI4uYHS2fdRciYhBawaBorbRsChkNY86w4UCXuxgCIfeXSO3aGLfdRK
	hX9WF72u0J4rz9nYP0BPtJDbequG0V4AJZftM5aw0d1YZQOhHxN9ibvRGIPRa20h
	ToBlDYYZBfw26vena3kO+Bs4kRSItvba07CuwUKo89O23Iw+JyTAx16tjkQ9Omfh
	epVSBcOn95T4lxI04veNc7eRnGA5GAlyOENF/uGHsCZ0hSksFMkSwdJaIHwlGDHl
	Z5ZnVMtEsBmgxYXf7DALd1wXn8N464Ge0Jkdg19iZkIfdqGaXCCR/kW+dBLz6220
	86Xhag==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aumdsb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 16:32:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6496040066;
	Tue, 10 Jun 2025 16:31:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7C206B3C2F1;
	Tue, 10 Jun 2025 16:30:48 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 16:30:48 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Stephane Danieau
	<stephane.danieau@foss.st.com>
Subject: [PATCH v2 4/5] pinctrl: stm32: Allow compile as module for stm32mp257
Date: Tue, 10 Jun 2025 16:30:41 +0200
Message-ID: <20250610143042.295376-5-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610143042.295376-1-antonio.borneo@foss.st.com>
References: <20250610143042.295376-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_153257_179189_C251C62B 
X-CRM114-Status: GOOD (  17.08  )
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

From: Stephane Danieau <stephane.danieau@foss.st.com>

Add ability to build pinctrl for stm32mp257 as a kernel module.
Add kernel-doc to the exported symbols.

Signed-off-by: Stephane Danieau <stephane.danieau@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm64/Kconfig.platforms               |  1 -
 drivers/pinctrl/stm32/Kconfig              |  6 +++---
 drivers/pinctrl/stm32/pinctrl-stm32.c      |  8 ++++++++
 drivers/pinctrl/stm32/pinctrl-stm32.h      | 14 ++++++++++++++
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c | 11 ++++++-----
 5 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4e..d6cfcfad26e47 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -311,7 +311,6 @@ config ARCH_STM32
 	bool "STMicroelectronics STM32 SoC Family"
 	select GPIOLIB
 	select PINCTRL
-	select PINCTRL_STM32MP257
 	select ARM_SMC_MBOX
 	select ARM_SCMI_PROTOCOL
 	select REGULATOR
diff --git a/drivers/pinctrl/stm32/Kconfig b/drivers/pinctrl/stm32/Kconfig
index 2656d3d3ae402..297a2f088bc1f 100644
--- a/drivers/pinctrl/stm32/Kconfig
+++ b/drivers/pinctrl/stm32/Kconfig
@@ -2,7 +2,7 @@
 if ARCH_STM32 || COMPILE_TEST
 
 config PINCTRL_STM32
-	bool
+	tristate
 	depends on OF
 	select PINMUX
 	select GENERIC_PINCONF
@@ -53,8 +53,8 @@ config PINCTRL_STM32MP157
 	select PINCTRL_STM32
 
 config PINCTRL_STM32MP257
-	bool "STMicroelectronics STM32MP257 pin control" if COMPILE_TEST && !MACH_STM32MP25
+	tristate "STMicroelectronics STM32MP257 pin control"
 	depends on OF && HAS_IOMEM
-	default MACH_STM32MP25
+	default MACH_STM32MP25 || (ARCH_STM32 && ARM64)
 	select PINCTRL_STM32
 endif
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index e7621f9b00056..ce2a5fee42303 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -8,6 +8,7 @@
  */
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/export.h>
 #include <linux/gpio/driver.h>
 #include <linux/hwspinlock.h>
 #include <linux/io.h>
@@ -1785,6 +1786,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	clk_bulk_disable_unprepare(banks, pctl->clks);
 	return ret;
 }
+EXPORT_SYMBOL(stm32_pctl_probe);
 
 static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 					struct stm32_pinctrl *pctl, u32 pin)
@@ -1857,6 +1859,7 @@ int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL(stm32_pinctrl_suspend);
 
 int __maybe_unused stm32_pinctrl_resume(struct device *dev)
 {
@@ -1873,3 +1876,8 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL(stm32_pinctrl_resume);
+
+MODULE_AUTHOR("Alexandre Torgue <alexandre.torgue@foss.st.com>");
+MODULE_DESCRIPTION("STM32 core pinctrl driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index ed525f5bdd7cd..9e44ad8c35b35 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -66,8 +66,22 @@ struct stm32_pinctrl_match_data {
 	bool rif_control;
 };
 
+/**
+ * stm32_pctl_probe() - Common probe for stm32 pinctrl drivers.
+ * @pdev: Pinctrl platform device.
+ */
 int stm32_pctl_probe(struct platform_device *pdev);
+
+/**
+ * stm32_pinctrl_suspend() - Common suspend for stm32 pinctrl drivers.
+ * @dev: Pinctrl device.
+ */
 int stm32_pinctrl_suspend(struct device *dev);
+
+/**
+ * stm32_pinctrl_resume() - Common resume for stm32 pinctrl drivers.
+ * @dev: Pinctrl device.
+ */
 int stm32_pinctrl_resume(struct device *dev);
 
 #endif /* __PINCTRL_STM32_H */
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
index 984587207956a..d226de524bfc1 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
@@ -4,6 +4,7 @@
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
 #include <linux/init.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
@@ -2564,6 +2565,7 @@ static const struct of_device_id stm32mp257_pctrl_match[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(of, stm32mp257_pctrl_match);
 
 static const struct dev_pm_ops stm32_pinctrl_dev_pm_ops = {
 	 SET_LATE_SYSTEM_SLEEP_PM_OPS(stm32_pinctrl_suspend, stm32_pinctrl_resume)
@@ -2577,9 +2579,8 @@ static struct platform_driver stm32mp257_pinctrl_driver = {
 		.pm = &stm32_pinctrl_dev_pm_ops,
 	},
 };
+module_platform_driver(stm32mp257_pinctrl_driver);
 
-static int __init stm32mp257_pinctrl_init(void)
-{
-	return platform_driver_register(&stm32mp257_pinctrl_driver);
-}
-arch_initcall(stm32mp257_pinctrl_init);
+MODULE_AUTHOR("Alexandre Torgue <alexandre.torgue@foss.st.com>");
+MODULE_DESCRIPTION("STM32MP257 pinctrl driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


