Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A73EA4FC7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 01:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODday1WVPLIDMOZF0cQx8EO46XTC+ThUzCG+rg0DrFk=; b=xE+fd4i9xPYbMQXRF+eZYoAmvg
	sxUNSS1qnnF8BoiIHb3iqexjMvd3nGQ7gqrXp9PZYDk06xAG6p9BxKUx07LuP5YrhAxkSUgSok8m2
	/0s/+zTI2aOXDYIe1RfsIh7Gxz8kYahmzwPOoFmGPX9TFhO0XDnpMJMLy7mdxxW/5xnD1/HaKolZ+
	hNKmD3oaJQNP9gIvKw71GK7uOtuEVW87y2oJY8sR1mkwLCL4AlMke5k8U0nM+okqjhctazbfnOCEH
	myG2eTnbIwI/su2M54x0zRPI/c0hQoS+i9XnSRlSPwiRmCbGksZ5Wv1K/LLaWHkm8u5CeK8pwvat1
	8muOPyzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhXE-00000001J0u-1q85;
	Tue, 24 Feb 2026 01:48:24 +0000
Received: from mail-yw1-x1162.google.com ([2607:f8b0:4864:20::1162])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhXB-00000001IzW-03pd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 01:48:22 +0000
Received: by mail-yw1-x1162.google.com with SMTP id 00721157ae682-798527f822cso11360027b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 17:48:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771897700; x=1772502500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODday1WVPLIDMOZF0cQx8EO46XTC+ThUzCG+rg0DrFk=;
        b=bm51dyeAPI66d1U4piiYGYpatpaGocMRMkPGJSM93QWfk6N6zkZHwRU7LDG/Ob1Kdd
         GCxpot4GCxlBVeq8DUlSA7xHCz7qJlPjp7Qv/9pgvmSaCxXLCCvmfWMArbd7CDVigoFS
         WT7MqVc4mueH2FBGyZovi5vFolVsSbKQAvOVajTa6svF2GMhytNN1OtZ4AR3TxXByH8L
         LTykMemLVFXmbYWZZiB1VV17Zqfd0WItwOKdVBE1YUGt0ZWJU2lSHFMNhHhgYZk0Ik4x
         7j9BtXR3G+Rx48oAC3bqYK7Qq54bvir+BMqql+stRlbam2vZdtGTiYGroZxbeVTdPtL1
         FSyg==
X-Forwarded-Encrypted: i=1; AJvYcCV11YZJAVKiRobqRpN67nKU48x4ykfpXJiNSUmKEYf+u3xB5RFOhqb1rDcgO3Yo1qplbONq6tcfwaOPWbibPDMe@lists.infradead.org
X-Gm-Message-State: AOJu0YwiKcJoptm4/j6PdUnmLBN5VvRO0DdN700VIjWPZDRcLwqnXfMr
	JBSQeLYHNiwvbNe7GnLIIptyP2jj1CnySu2w1bNh7CfejJYJaWeoEug2314vXRQvD20XQsuJ47d
	JYsKNo2FHB8FJSRChnTS7q4FzKa1UuIkr9vQROISrYO4zyZ37v4pbp80QAjFE6RNY5hXwv0c4qW
	un/BXuyev+eQDZhtl+Cmm9ZPv8bYhaw6u6FXb1He8L+jTTVghknHF1r579wX0bnYy5wB+3ge5mC
	YJLAqDA6KfuAPqZ6Y/EBEpv82k=
X-Gm-Gg: ATEYQzzvNWVN8rukKUCCYwQrcE5XZ2wYFTFCKQHsu04qfJu0LjNXa/zmEOa/MKhGaZz
	0pEwor1OCw6IMedNvtNbH51hllzPkk6qv1m0alQZ8/tKMy1j0ztSd8miXjfopNwZySCjCGOvOOF
	M96Nj+GZx5TRXDjdf9EQ8F6aDNUKRLOR1MuDPFHOC9guiqUi84aY9keLc/kB8ksQqjM5ZSSW2MS
	aaQ3vcEVbQXw4w0Sni4QtZqP3kr+FD6m0hrEBzZVoyf/zFaeIaLI6ybJtqUYH0/p5r45NKWEm+K
	vWUP4yw3T0S3Z/aqblZho8MrqMnD7nvNMfU8Wz7aZ6B9cfojX/rrZkdpKMxHrar1MlqmlLeo2NV
	lwyeFugM/pMP0IkvxUL6bZauuEKy/QcpWVXoWFvhj2OH7t1ecdkjYd2HojA2GSOAgTfJhoDiSQQ
	9Pz/EgUFBpRLKwj4JwTt7Z1yUv8LL/Sh5ibQS8aQRiFpxtUVqfUT0EWIVA
X-Received: by 2002:a05:690c:19:b0:794:afa7:5c52 with SMTP id 00721157ae682-79829037826mr101758247b3.46.1771897699719;
        Mon, 23 Feb 2026 17:48:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7982de13cdasm11191717b3.26.2026.02.23.17.48.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Feb 2026 17:48:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bd2a2028c5so7418746eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 17:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771897698; x=1772502498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODday1WVPLIDMOZF0cQx8EO46XTC+ThUzCG+rg0DrFk=;
        b=QrsW99/WbGYxzdvbNusmqIYA9ilkWKj+54a0o7NTWsdlJSIEuxIhZKbbiK+edz74ty
         UUy2bMkyLxjGBClAsnkAFNitJ7MV241X/WSjHFPucxkKsTwVwo6dS7cXmUx80TIVzaqo
         naenYIsfsaxi5dqV1uN1OGW9aF6e5Snroyv3E=
X-Forwarded-Encrypted: i=1; AJvYcCXBNTUJ0lDWW3xtLIcPrS14tdWP9YH1547EAkxS4n+nVfl4LSK3m1dP5vvwigQlEz4wNDgLZly8+2OGGtJNhq+S@lists.infradead.org
X-Received: by 2002:a05:7300:2152:b0:2b7:1d38:3596 with SMTP id 5a478bee46e88-2bd7b9d5477mr3656029eec.4.1771897698422;
        Mon, 23 Feb 2026 17:48:18 -0800 (PST)
X-Received: by 2002:a05:7300:2152:b0:2b7:1d38:3596 with SMTP id 5a478bee46e88-2bd7b9d5477mr3656015eec.4.1771897697765;
        Mon, 23 Feb 2026 17:48:17 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af102d9sm8470964c88.1.2026.02.23.17.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 17:48:17 -0800 (PST)
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
Subject: [PATCH v5 2/3] hwspinlock: brcmstb hardware semaphore support
Date: Mon, 23 Feb 2026 20:47:57 -0500
Message-Id: <20260224014758.2660318-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224014758.2660318-1-kamal.dasu@broadcom.com>
References: <20260224014758.2660318-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_174821_073865_3C7E4C6E 
X-CRM114-Status: GOOD (  23.30  )
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


