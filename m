Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF340C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 17:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/btPUl6pjzYs9vKDzKPJBqLPa3JcDc59VuLKN5W68tM=; b=mqETl9df1RK03cxhPTyG3H/zJd
	TasOSaRAdqmi4nxTI9ZxoRdVmnqGD7SXttM6+tuZlKnVgKg1+CtPI9ZDUkAhln3j/MDODY63LUnwW
	oCIDij3WIUO8Na/CAkQ2bqBFRS3B3Q1xuBCOjH+Hz8STsXk2kg0/d8Rrl/FPn8u/qOEt23IkmhV7l
	Yc070DpW1r9uBFoBa9EwHb/MdQHEginAFJfFD6H9rtob8IeHVuKsa6LE4xLasHYJbUoi1nrov9mpa
	bCstR8fZqXf/fd1YbhXVfMF49osX33sZZqu5mnbe5XQXNaIILjHsZFKvRmgW/WS3gRAPPA+dEmWwS
	TcMbozcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2oe-00000007ddV-3Png;
	Tue, 10 Jun 2025 17:31:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP027-000000078Sm-07FK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 14:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/btPUl6pjzYs9vKDzKPJBqLPa3JcDc59VuLKN5W68tM=; b=AZBSSuYMZJFXjcH0sGPgklqvZv
	8RWoYbUy7UUC7dUSvo6jv/Fc/Up1KipxUnJj3doamF8jTS2h5RNyUcb4Pa5KOBQfsr1XIKIRI5q80
	F5CoOysEjSwb6TAIgXfqEu1H71R0+05zXQvyAveYVxiPPOVy3rc4y92YOlDJ4AUX2o3Llc0wgxc8w
	zf9mJB1jOH6Ao7NrOq5k5oEEzeBFQGi4jCfVM3vuQpK67D2ex6SjvMEJIAjfasDRomfJ82Kk+vYon
	NcaDlkSh6grLg/BEPZAQECQQJm/DdNE0fMor65npMfYWOZ3ftSuKeguemnhYRp4XpPLFyMPSs9HeK
	/49YryZw==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP023-00000001sUn-0G1O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 14:32:58 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLKZJ000488;
	Tue, 10 Jun 2025 16:32:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	/btPUl6pjzYs9vKDzKPJBqLPa3JcDc59VuLKN5W68tM=; b=AaUfUI5X6cuLxvYn
	nYhanMe9zFs9dOfO44R1kWLOgV5eG4pV/xzRxV+ER0QWHDtoFv8Mkrek+bdPINjD
	VOwb93YZGCITjdvBL2xk9tPNPYoFM4YWDrzsEPg03sqdqag7WQC2fwR2A7tzUnEH
	c9CMgfYrIS5DeamvmQ1945QOMKzwQpYkp/GPvrNwCJXi7VwY0PSlqKR2tgOE0L8n
	tzgW//xDSyjQ5Y2pd5Hb5lXxRA6Fwar5WjCY5+ASihymScuI+y0VWN5fc08ZL702
	4skEt+eRI9//ZvsoRK/y7Q8P66Q+HkyiiKZkYPxHtL8vdcv8rcJCj/W565QOpSYa
	cIEslA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4750cntb30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 16:32:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0DE8740060;
	Tue, 10 Jun 2025 16:31:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD303B39A07;
	Tue, 10 Jun 2025 16:30:47 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 16:30:47 +0200
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
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>
Subject: [PATCH v2 3/5] pinctrl: stm32: Add RIF support for stm32mp257
Date: Tue, 10 Jun 2025 16:30:40 +0200
Message-ID: <20250610143042.295376-4-antonio.borneo@foss.st.com>
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
X-CRM114-CacheID: sfid-20250610_153255_477669_89E56173 
X-CRM114-Status: GOOD (  21.61  )
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

On SoC stm32mp257, GPIO supports security and isolation compliant
with the Resource Isolation Framework (RIF). Each GPIO line can be
assigned to different security and compartment domains.

Add the generic code to handle the RIF configuration set by the
secure world and initialize the GPIO valid mask accordingly.

Enable the RIF support for stm32mp257.

Co-developed-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c      | 121 ++++++++++++++++++++-
 drivers/pinctrl/stm32/pinctrl-stm32.h      |   1 +
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c |   4 +
 3 files changed, 125 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index e0e3e649976b8..e7621f9b00056 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -6,6 +6,7 @@
  *
  * Heavily based on Mediatek's pinctrl driver
  */
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/hwspinlock.h>
@@ -36,6 +37,8 @@
 #include "../pinctrl-utils.h"
 #include "pinctrl-stm32.h"
 
+#define STM32_GPIO_CID1		1
+
 #define STM32_GPIO_MODER	0x00
 #define STM32_GPIO_TYPER	0x04
 #define STM32_GPIO_SPEEDR	0x08
@@ -47,6 +50,8 @@
 #define STM32_GPIO_AFRL		0x20
 #define STM32_GPIO_AFRH		0x24
 #define STM32_GPIO_SECCFGR	0x30
+#define STM32_GPIO_CIDCFGR(x)	(0x50 + (0x8 * (x)))
+#define STM32_GPIO_SEMCR(x)	(0x54 + (0x8 * (x)))
 
 /* custom bitfield to backup pin status */
 #define STM32_GPIO_BKP_MODE_SHIFT	0
@@ -60,6 +65,14 @@
 #define STM32_GPIO_BKP_TYPE		10
 #define STM32_GPIO_BKP_VAL		11
 
+#define STM32_GPIO_CIDCFGR_CFEN		BIT(0)
+#define STM32_GPIO_CIDCFGR_SEMEN	BIT(1)
+#define STM32_GPIO_CIDCFGR_SCID_MASK	GENMASK(5, 4)
+#define STM32_GPIO_CIDCFGR_SEMWL_CID1	BIT(16 + STM32_GPIO_CID1)
+
+#define STM32_GPIO_SEMCR_SEM_MUTEX	BIT(0)
+#define STM32_GPIO_SEMCR_SEMCID_MASK	GENMASK(5, 4)
+
 #define STM32_GPIO_PINS_PER_BANK 16
 #define STM32_GPIO_IRQ_LINE	 16
 
@@ -98,6 +111,7 @@ struct stm32_gpio_bank {
 	u32 pin_backup[STM32_GPIO_PINS_PER_BANK];
 	u8 irq_type[STM32_GPIO_PINS_PER_BANK];
 	bool secure_control;
+	bool rif_control;
 };
 
 struct stm32_pinctrl {
@@ -194,6 +208,80 @@ static void stm32_gpio_backup_bias(struct stm32_gpio_bank *bank, u32 offset,
 	bank->pin_backup[offset] |= bias << STM32_GPIO_BKP_PUPD_SHIFT;
 }
 
+/* RIF functions */
+
+static bool stm32_gpio_rif_valid(struct stm32_gpio_bank *bank, unsigned int gpio_nr)
+{
+	u32 cid;
+
+	cid = readl_relaxed(bank->base + STM32_GPIO_CIDCFGR(gpio_nr));
+
+	if (!(cid & STM32_GPIO_CIDCFGR_CFEN))
+		return true;
+
+	if (!(cid & STM32_GPIO_CIDCFGR_SEMEN)) {
+		if (FIELD_GET(STM32_GPIO_CIDCFGR_SCID_MASK, cid) == STM32_GPIO_CID1)
+			return true;
+
+		return false;
+	}
+
+	if (cid & STM32_GPIO_CIDCFGR_SEMWL_CID1)
+		return true;
+
+	return false;
+}
+
+static bool stm32_gpio_rif_acquire_semaphore(struct stm32_gpio_bank *bank, unsigned int gpio_nr)
+{
+	u32 cid, sem;
+
+	cid = readl_relaxed(bank->base + STM32_GPIO_CIDCFGR(gpio_nr));
+
+	if (!(cid & STM32_GPIO_CIDCFGR_CFEN))
+		return true;
+
+	if (!(cid & STM32_GPIO_CIDCFGR_SEMEN)) {
+		if (FIELD_GET(STM32_GPIO_CIDCFGR_SCID_MASK, cid) == STM32_GPIO_CID1)
+			return true;
+
+		return false;
+	}
+
+	if (!(cid & STM32_GPIO_CIDCFGR_SEMWL_CID1))
+		return false;
+
+	sem = readl_relaxed(bank->base + STM32_GPIO_SEMCR(gpio_nr));
+	if (sem & STM32_GPIO_SEMCR_SEM_MUTEX) {
+		if (FIELD_GET(STM32_GPIO_SEMCR_SEMCID_MASK, sem) == STM32_GPIO_CID1)
+			return true;
+
+		return false;
+	}
+
+	writel_relaxed(STM32_GPIO_SEMCR_SEM_MUTEX, bank->base + STM32_GPIO_SEMCR(gpio_nr));
+
+	sem = readl_relaxed(bank->base + STM32_GPIO_SEMCR(gpio_nr));
+	if (sem & STM32_GPIO_SEMCR_SEM_MUTEX &&
+	    FIELD_GET(STM32_GPIO_SEMCR_SEMCID_MASK, sem) == STM32_GPIO_CID1)
+		return true;
+
+	return false;
+}
+
+static void stm32_gpio_rif_release_semaphore(struct stm32_gpio_bank *bank, unsigned int gpio_nr)
+{
+	u32 cid;
+
+	cid = readl_relaxed(bank->base + STM32_GPIO_CIDCFGR(gpio_nr));
+
+	if (!(cid & STM32_GPIO_CIDCFGR_CFEN))
+		return;
+
+	if (cid & STM32_GPIO_CIDCFGR_SEMEN)
+		writel_relaxed(0, bank->base + STM32_GPIO_SEMCR(gpio_nr));
+}
+
 /* GPIO functions */
 
 static inline void __stm32_gpio_set(struct stm32_gpio_bank *bank,
@@ -220,9 +308,26 @@ static int stm32_gpio_request(struct gpio_chip *chip, unsigned offset)
 		return -EINVAL;
 	}
 
+	if (bank->rif_control) {
+		if (!stm32_gpio_rif_acquire_semaphore(bank, offset)) {
+			dev_err(pctl->dev, "pin %d not available.\n", pin);
+			return -EINVAL;
+		}
+	}
+
 	return pinctrl_gpio_request(chip, offset);
 }
 
+static void stm32_gpio_free(struct gpio_chip *chip, unsigned int offset)
+{
+	struct stm32_gpio_bank *bank = gpiochip_get_data(chip);
+
+	pinctrl_gpio_free(chip, offset);
+
+	if (bank->rif_control)
+		stm32_gpio_rif_release_semaphore(bank, offset);
+}
+
 static int stm32_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct stm32_gpio_bank *bank = gpiochip_get_data(chip);
@@ -306,12 +411,25 @@ static int stm32_gpio_init_valid_mask(struct gpio_chip *chip,
 		}
 	}
 
+	if (bank->rif_control) {
+		for (i = 0; i < ngpios; i++) {
+			if (!test_bit(i, valid_mask))
+				continue;
+
+			if (stm32_gpio_rif_valid(bank, i))
+				continue;
+
+			dev_dbg(pctl->dev, "RIF semaphore ownership conflict, GPIO %u", i);
+			clear_bit(i, valid_mask);
+		}
+	}
+
 	return 0;
 }
 
 static const struct gpio_chip stm32_gpio_template = {
 	.request		= stm32_gpio_request,
-	.free			= pinctrl_gpio_free,
+	.free			= stm32_gpio_free,
 	.get			= stm32_gpio_get,
 	.set_rv			= stm32_gpio_set,
 	.direction_input	= pinctrl_gpio_direction_input,
@@ -1350,6 +1468,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	bank->bank_nr = bank_nr;
 	bank->bank_ioport_nr = bank_ioport_nr;
 	bank->secure_control = pctl->match_data->secure_control;
+	bank->rif_control = pctl->match_data->rif_control;
 	spin_lock_init(&bank->lock);
 
 	if (pctl->domain) {
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index 8790fef2d58a2..ed525f5bdd7cd 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -63,6 +63,7 @@ struct stm32_pinctrl_match_data {
 	const struct stm32_desc_pin *pins;
 	const unsigned int npins;
 	bool secure_control;
+	bool rif_control;
 };
 
 int stm32_pctl_probe(struct platform_device *pdev);
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
index 23aebd4695e99..984587207956a 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32mp257.c
@@ -2542,11 +2542,15 @@ static const struct stm32_desc_pin stm32mp257_z_pins[] = {
 static struct stm32_pinctrl_match_data stm32mp257_match_data = {
 	.pins = stm32mp257_pins,
 	.npins = ARRAY_SIZE(stm32mp257_pins),
+	.secure_control = true,
+	.rif_control = true,
 };
 
 static struct stm32_pinctrl_match_data stm32mp257_z_match_data = {
 	.pins = stm32mp257_z_pins,
 	.npins = ARRAY_SIZE(stm32mp257_z_pins),
+	.secure_control = true,
+	.rif_control = true,
 };
 
 static const struct of_device_id stm32mp257_pctrl_match[] = {
-- 
2.34.1


