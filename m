Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68AFF4BB93
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 22:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODday1WVPLIDMOZF0cQx8EO46XTC+ThUzCG+rg0DrFk=; b=SOz2YXJ+zuZ5VLWNohcsCQKvpj
	BFHxMjZZx0914xVskr+K/eLk5NoAGT+pKvy7nQ3uj9MsB0lrt5TGCzm51hMkxXy5/zXS2tO0kGmXE
	fBBdb/Hu1OjjvlrB8MZFekz4PudZtz+wc6QeHtSMSsnOWtTojhhjQHXk7f1b+zHWuluR3cdGSr8t6
	rmu0upklNvvs+98+4T86NLvjQ/k8kSAtUndPHfLKP4yHBq+du6Y/atbyfJ6X48GjLkSTpQ9b4T91K
	Xaygovn/ZoD2IP4oVFoovcacBNlgvk87jukYxSEktjt3LVsYJrKA/gtFU8W0oPhotvKGXYicO6sCF
	eNoRBuMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0WM-00000002prn-2VFS;
	Tue, 24 Feb 2026 22:04:46 +0000
Received: from mail-qk1-x762.google.com ([2607:f8b0:4864:20::762])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0WJ-00000002pqy-2glW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 22:04:44 +0000
Received: by mail-qk1-x762.google.com with SMTP id af79cd13be357-8cbae8f69cbso30423785a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 14:04:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771970682; x=1772575482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODday1WVPLIDMOZF0cQx8EO46XTC+ThUzCG+rg0DrFk=;
        b=spLjue6PCvgkBM9rwsU+ttkOTNsUy/+5JziRaYpUfFQI8xMlhHA33C2SWYxUpaSoH8
         j2Ht5pOIoobW/aYUMB4CgdMlRwUX7vRwHAPH9+N678kMOCCi3PcdPHrzs851lJsFWUbF
         zdMaS7hSZ975vriTPHnwhTvdNxG4D8MoG+btdlcDUKKvO52W5eEca2lO+CEdok5HbMge
         FpiSLl9KHiRo7xguFq+QwiDoE4WMFYJO6QPsYBymzWUVl2rqzlnpYjFI+4cycLXn9rUg
         qSUOBWBBNYIRqU2S+enuiYUbk8rPBImpIkzFBVkIBxk9byl86/lkmTjIlid0Awdo/mvq
         wP6g==
X-Forwarded-Encrypted: i=1; AJvYcCVygA+p+N/bCS8QziY9zK7yoWukOQwO3GQapgHZ4WlsTbzLADIxKXnHF3O3pa53a8hq59XduHssy4G/Lw4sLqY1@lists.infradead.org
X-Gm-Message-State: AOJu0YzDBFcKwiyzd14Q9Vc9fhxSjeb90z2rMavLaCBskuRpzwvghftE
	iz7Jv6GsWN46LQmTJ8m6moQN9tuW6dEY5iAkj4OgqOY5cWEX5mXty2tardky2h724Z95cxc6rZ0
	m6YiviWwt803VFUzYvdVe5eWkMHnpQp+iwTcx6oN8SjQwCSl3gUKlNfszknaNNEC64YWuqbo8gs
	0kwr5SDQfNXTvR4XTQiw8o7BIxrt1bBcrF0B5xXFLjMdaVwwNs2w0o7OEdFD1/pcdKb/SpsXQWJ
	SD9zVkyM2HEvPgYAIEgoCh/vI4=
X-Gm-Gg: AZuq6aICivQILDlRKpLJNRCGctqHpDAypmUnEkDw4qvWbriJoLtQHvffsKGxu2V6Ede
	kTH9mWqekfEXtbOLxSp1LjQbBX9ZUu/pc9uYGgCo7zvytXMSMiGQ8Q3oEoKWFQKxT5afaNx/i6P
	g4HzN5cmRj8zR0bIw0AHaNEO4tx7hfzhd3wcij/vlNxXX+upe3i0LApVc0Cwa1WLYZjKLqHQjmK
	0fJmIuXaS/xPGtW3gfGCdkDEy7d8Yvq2OuBzMrebzH/PuvumQU26D/wjBadHZojC2qfl0VGaZra
	jO3pGF6unz9gPSr1IraQ6Rejd1/EFTUKLmeZlNqGxjLWUz7S4nodf5IC4D2p00lhJLCyx80WOPj
	DOdaOKVDeeR9Lrh5UuM50FlvrFOjvZLIHvUv6qkJdxDEUTJ8jKx5lGiOMAwpT9PUgNCW2c2wb4d
	ZXv87Ex7FNRUFt49QXyQroR077x4pJl6fc/6iuqn46jzcbeY5mfkd4N2z5
X-Received: by 2002:a05:620a:172b:b0:8c9:f4ed:c33e with SMTP id af79cd13be357-8cbb20838b3mr200862285a.18.1771970682244;
        Tue, 24 Feb 2026 14:04:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-8cb8d0c11casm151504985a.4.2026.02.24.14.04.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Feb 2026 14:04:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bda35eab74so208365eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 14:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771970681; x=1772575481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODday1WVPLIDMOZF0cQx8EO46XTC+ThUzCG+rg0DrFk=;
        b=cSNzxtK95UkBpUOh8BVT1jiRHCVyiFoU/koXCgKBXxCtBzqPg9QOX2XGY4TwHPjf8k
         e9Jr1BMqvshZWt6YuQtSoZvNm//ZG3mSkHRUzQvQBkcDK7ZSZMLoYUmQlKoBRa/f1so1
         aj6lKKTQTG2N1gBg0Sru6VBtTcESOJLgYcatk=
X-Forwarded-Encrypted: i=1; AJvYcCVfsUCrUedn0SA/qI6NbGcEY7aZ9GXDwmlhEnWnT+7YLokRrWn5RRb/TELP9TG2IKYUF/y0wZbloMDK4ZlgOzzp@lists.infradead.org
X-Received: by 2002:a05:7301:7015:b0:2ba:7b2a:6a5f with SMTP id 5a478bee46e88-2bdbc347a89mr507203eec.8.1771970680918;
        Tue, 24 Feb 2026 14:04:40 -0800 (PST)
X-Received: by 2002:a05:7301:7015:b0:2ba:7b2a:6a5f with SMTP id 5a478bee46e88-2bdbc347a89mr507193eec.8.1771970680284;
        Tue, 24 Feb 2026 14:04:40 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdb055507bsm2374822eec.0.2026.02.24.14.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 14:04:39 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v6 2/3] hwspinlock: brcmstb hardware semaphore support
Date: Tue, 24 Feb 2026 17:04:06 -0500
Message-Id: <20260224220407.2351692-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
References: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_140443_691936_A90A7C3C 
X-CRM114-Status: GOOD (  23.81  )
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

Broadcom settop SoCs have common 16 hardware semaphore registers that
can be used as part of the kernel hardware spinlock framework. The
hardware semaphores are part of the 'sundry' ip block that also has
controls like pin/mux controls, SoC identification, drive strength,
reset controls, and other misc bits.

Adding support for brcmstb_hwspinlock that only maps sundry block
registers SUN_TOP_CTRL_SEMAPHORE_[0:15] to implement the hardware
spinlock operations. Change allows other Broadcom settop drivers to
call hwspin_trylock() and hwspin_unlock() interfaces to make use of
hwspinlock framework. Other driver dt nodes just need to provide a
reference to the &hwspinlock and lock id to make use of a particular
hardware lock.
e.g. hwlocks = <&hwspinlock0 0>;

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/hwspinlock/Kconfig              | 11 ++-
 drivers/hwspinlock/Makefile             |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c | 96 +++++++++++++++++++++++++
 3 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index 3874d15b0e9b..9b7f7bcce14b 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -8,6 +8,16 @@ menuconfig HWSPINLOCK
 
 if HWSPINLOCK
 
+config HWSPINLOCK_BRCMSTB
+	tristate "Broadcom Settop Hardware Semaphore functionality"
+	depends on ARCH_BRCMSTB || COMPILE_TEST
+	help
+	  Broadcom settop hwspinlock driver.
+	  Say y here to support the Broadcom Hardware Semaphore functionality, which
+	  provides a synchronisation mechanism on the SoC.
+
+	  If unsure, say N.
+
 config HWSPINLOCK_OMAP
 	tristate "OMAP Hardware Spinlock device"
 	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX || SOC_AM33XX || SOC_AM43XX || ARCH_K3 || COMPILE_TEST
@@ -62,5 +72,4 @@ config HSEM_U8500
 	  SoC.
 
 	  If unsure, say N.
-
 endif # HWSPINLOCK
diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
index a0f16c9aaa82..35f2d94d8ba2 100644
--- a/drivers/hwspinlock/Makefile
+++ b/drivers/hwspinlock/Makefile
@@ -4,6 +4,7 @@
 #
 
 obj-$(CONFIG_HWSPINLOCK)		+= hwspinlock_core.o
+obj-$(CONFIG_HWSPINLOCK_BRCMSTB)	+= brcmstb_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_OMAP)		+= omap_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_QCOM)		+= qcom_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_SPRD)		+= sprd_hwspinlock.o
diff --git a/drivers/hwspinlock/brcmstb_hwspinlock.c b/drivers/hwspinlock/brcmstb_hwspinlock.c
new file mode 100644
index 000000000000..7a5a35e741f3
--- /dev/null
+++ b/drivers/hwspinlock/brcmstb_hwspinlock.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * brcmstb HWSEM driver
+ *
+ * Copyright (C) 2025 Broadcom
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/hwspinlock.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include "hwspinlock_internal.h"
+
+#define BRCMSTB_NUM_SEMAPHORES		16
+#define RESET_SEMAPHORE			0
+
+#define HWSPINLOCK_VAL			'L'
+
+static int brcmstb_hwspinlock_trylock(struct hwspinlock *lock)
+{
+	void __iomem *lock_addr = (void __iomem *)lock->priv;
+
+	writel(HWSPINLOCK_VAL, lock_addr);
+
+	return (readl(lock_addr) == HWSPINLOCK_VAL);
+}
+
+static void brcmstb_hwspinlock_unlock(struct hwspinlock *lock)
+{
+	void __iomem *lock_addr = (void __iomem *)lock->priv;
+
+	/* release the lock by writing 0 to it */
+	writel(RESET_SEMAPHORE, lock_addr);
+}
+
+static void brcmstb_hwspinlock_relax(struct hwspinlock *lock)
+{
+	ndelay(50);
+}
+
+static const struct hwspinlock_ops brcmstb_hwspinlock_ops = {
+	.trylock	= brcmstb_hwspinlock_trylock,
+	.unlock		= brcmstb_hwspinlock_unlock,
+	.relax		= brcmstb_hwspinlock_relax,
+};
+
+static int brcmstb_hwspinlock_probe(struct platform_device *pdev)
+{
+	struct hwspinlock_device *bank;
+	struct hwspinlock *hwlock;
+	void __iomem *io_base;
+	int i, num_locks = BRCMSTB_NUM_SEMAPHORES;
+
+	io_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(io_base)) {
+		dev_err(&pdev->dev, "semaphore iobase mapping error\n");
+		return PTR_ERR(io_base);
+	}
+
+	bank = devm_kzalloc(&pdev->dev, struct_size(bank, lock, num_locks),
+			    GFP_KERNEL);
+	if (!bank)
+		return -ENOMEM;
+
+	for (i = 0, hwlock = &bank->lock[0]; i < num_locks; i++, hwlock++)
+		hwlock->priv = (void __iomem *)(io_base + sizeof(u32) * i);
+
+	return devm_hwspin_lock_register(&pdev->dev, bank,
+					 &brcmstb_hwspinlock_ops,
+					 0, num_locks);
+}
+
+static const struct of_device_id brcmstb_hwspinlock_ids[] = {
+	{ .compatible = "brcm,bcm7038-sun-top-ctrl-semaphore", },
+	{ /* end */ },
+};
+MODULE_DEVICE_TABLE(of, brcmstb_hwspinlock_ids);
+
+static struct platform_driver brcmstb_hwspinlock_driver = {
+	.probe		= brcmstb_hwspinlock_probe,
+	.driver		= {
+		.name	= "brcmstb_hwspinlock",
+		.of_match_table = brcmstb_hwspinlock_ids,
+	},
+};
+
+module_platform_driver(brcmstb_hwspinlock_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Hardware Spinlock driver for brcmstb");
+MODULE_AUTHOR("Kamal Dasu <kamal.dasu@broadcom.com>");
-- 
2.34.1


