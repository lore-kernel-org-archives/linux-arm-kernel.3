Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FAFFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 20:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDV4LUkEkUcEhST/7UTvXNteW4b3j/yhsWXpXNrZ4E8=; b=1uaAwK8sdJTRdhBhZKWzkBkH0U
	bE2lsfpYMjS6I0TEvhIyB7veXIeLjvEbF310mE3SqbhmjFz5pyd1aW6D/DcmALN9NTMO7Le+3yvNa
	SWKyKwKHY0qymLeNHsK6YEb0AsCx56mFAcWOp+hRvEH42nLqBoOUVSVcIPmNO87qgCPSc606UU7ev
	uRlVDhDEwNfmdk0vq8+p8s8RgV6x25UZc97ppXIeOfyD4tKyqeuLAbKTksMyR4fNX4nDzM2gafkTZ
	y6R20PJIYyVtvgzcADZfUFAhuzX9jcw1T4vQxA8DuKNPxm/ph3z8HssQOGbc+1RTA/dVlmzbxUv1I
	LYqQ1yCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSK5-000000005xo-3BrF;
	Mon, 27 Apr 2026 20:12:53 +0000
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSK3-000000005wo-31J2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 20:12:53 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-c7973f67f4dso3142940a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 13:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320771; x=1777925571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mDV4LUkEkUcEhST/7UTvXNteW4b3j/yhsWXpXNrZ4E8=;
        b=IqBgSE6zBPSc5JrA95nj8ZmwSA93DgGtEVDyYMZJn3+fTI9TRZuXxHnZCVIrkKwyz3
         xBsIg6yoInx6mbvWzxWWqudDktRwoN4pbdVw8NtOlsx5ClrEnKkeIuwJvKCwXPQmoe0X
         H90Indcxhl77wNrMF9sFP+Jhn4vUWyQoP8BZ4formJaecaeOb1zKyEJzgLtnfv/+5PLn
         HBXvU5+Z7yJCSGVQM5ALkIYiNnF87WyX1uVHARw0keAbfsSh/jpSp5SxfPwcCXygydhH
         xIHke2aRE+LGuRUU7f99p4E6SZh1US2c5CH7IO4eAwJEiU+Gab5XEAixJ3JUoMQ8IR+X
         iyzw==
X-Forwarded-Encrypted: i=1; AFNElJ+fEXwvjYZkqV6asQEpSM7WEtUHWGgL3TBgg8nxQulOM93LE6QGzpcwnh1yhK7L2taTx3/GEqgNqjA69k0n2HUI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+509DDoizviSNlxD9gUBacLYERF+HaTklkCIg1jwjbIBgQiyv
	dkEBFQ0r0H9nzqszNUpTTWfLqnZPkxK+KF5VPA9i/ptz0iQd3pmHDqA67PBD+JWsaZWZbrK8/GC
	PAzgt6pvjot0+HvS+Ykw532cE4iq7KRVlt5iRLiD40KpYW/aq6n9lLQSrpFdKiScIIkjduKR60R
	vqddPeNaIPgnW7fWUhRmChsZponLS7vE3CfzLSbU/woeD2PM3CqIrjj9NzkDgjZBrmPhzxNF1VZ
	vn05WNr1AoqB6eQHznC/VqbUSQ=
X-Gm-Gg: AeBDievnbSa3lg+6RmbnhlGs7QvlmLOG5xAcU5ZraGAS7Vd3qnYrrjoG5YhJmJvJQTA
	rA5IoEVe7A2H+AqX9l1zLpar4cj3RY7jMN1T9pfts1ixJ7UP5EkA3SPKOwVjJk+A51Nk2gcCyyU
	gUgWESpma0mKeO/aO75YUS2UyTfCJb8mD9lG143bZhh1inPfMc7EZdXK/Pe9OCKCtG9bkAoQ3rw
	RniE6URdxSDz3BFHalx54M5wvFgiQLkpGTALSagO5mkBgP9ZN+ktQVa3hexrFD88EkBydfl2joO
	0rKOCC5/XZUDZ4SyU17srKEILaoYZWLljMmyiB1GRbiDXEkpVROsAODbWUSubGP5VPCkDPFrx/0
	c4ZsUnolAJ9hXQiajSKM2IOhQtZgPXzpFpz3at1Q4pc+KKrTiQHgwVwhH5GLrrcKGC7QTsTipCc
	F3B0vR3/6h3KSYN8jYymK3LnwrkVqBVO+29nRejMJdqA2m/Ho3eDYajzIMLLM22g==
X-Received: by 2002:a17:903:3b88:b0:2b0:91e6:bc18 with SMTP id d9443c01a7336-2b97c0125d5mr954445ad.14.1777320770601;
        Mon, 27 Apr 2026 13:12:50 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b97ac69375sm302735ad.27.2026.04.27.13.12.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Apr 2026 13:12:50 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bda35eab74so9540635eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 13:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777320769; x=1777925569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDV4LUkEkUcEhST/7UTvXNteW4b3j/yhsWXpXNrZ4E8=;
        b=Wv0EtquN2Z3S5DUYIBbUcnGOAMkBei34ik5q/mS2h/F9xHgJ8mZv3uxl+lDe66RVh4
         wvuUCSaLQYT9yjI4LzobzBLSYBrPcjvSh/2/EzdKfTwN0lJTHl1FvhNU3QtuTFzzO5J8
         hUpZVCb2WQFHcprHS6oYIFvZ5olx8tsR+86mQ=
X-Forwarded-Encrypted: i=1; AFNElJ/zGMz4yrKKtj9K213bMp66+d/i/Nh3RJ88klVVWGNKdOw9wzdT5BO8x1vq3XoolWGtdpWao6a3wcaPlUBSOdTu@lists.infradead.org
X-Received: by 2002:a05:7300:d509:b0:2be:17b1:e49f with SMTP id 5a478bee46e88-2ed0a3e3ac0mr143855eec.4.1777320768628;
        Mon, 27 Apr 2026 13:12:48 -0700 (PDT)
X-Received: by 2002:a05:7300:d509:b0:2be:17b1:e49f with SMTP id 5a478bee46e88-2ed0a3e3ac0mr143826eec.4.1777320767938;
        Mon, 27 Apr 2026 13:12:47 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed09fb6b7fsm437136eec.10.2026.04.27.13.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 13:12:47 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org
Cc: krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org,
	baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v7 2/3] hwspinlock: brcmstb hardware semaphore support
Date: Mon, 27 Apr 2026 16:12:32 -0400
Message-Id: <20260427201233.380314-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427201233.380314-1-kamal.dasu@broadcom.com>
References: <20260427201233.380314-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_131251_781478_C08BE4A6 
X-CRM114-Status: GOOD (  23.58  )
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
 drivers/hwspinlock/Kconfig              | 10 +++
 drivers/hwspinlock/Makefile             |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c | 96 +++++++++++++++++++++++++
 3 files changed, 107 insertions(+)
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index d84e00084ee2..3a81a6785e45 100644
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
diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
index 3a740805949d..379443987b94 100644
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


