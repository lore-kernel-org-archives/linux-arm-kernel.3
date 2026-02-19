Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C9FC531E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 21:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQ4iRn4Yr0HtvQBIFvgGnqHMHINRSvRxdUg7UzIwt38=; b=E2jpttvGAKJNRd56EOv5WuwxKW
	i+pkpUe4E16oZpdadPtB145vkdhqRAdi4CHLrfrZdob1sdWEoXHOciM1olJO5i9u5eckF8YrDtOPK
	qkrPKd2gZnPRUUqfax3ZNgnG27VT/HRDhHVdGrcGkZZzAPoVapEZkhESDjCraE0VgxRTpbxDg09yz
	UynhnHNxSmRUXUjANJZ3uDQ7jJ2A+d/O0SIeB5fWXaqHXRnxrlMN6TG/C6LdwItDNfXpwAMzoZXaU
	+x5EMmBGzj9phU+wXtSE7/w0O4/8W6uKbdoyBTZsw9qnBDD/bZIERH1ViwmjaWAb+DfExjUmLuXKu
	fk5mJQEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtC1W-0000000C7O9-36js;
	Thu, 19 Feb 2026 21:57:26 +0000
Received: from mail-oi1-x262.google.com ([2607:f8b0:4864:20::262])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtC1O-0000000C7M7-3kDg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 21:57:21 +0000
Received: by mail-oi1-x262.google.com with SMTP id 5614622812f47-463f00cda04so787558b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 13:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771538238; x=1772143038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hQ4iRn4Yr0HtvQBIFvgGnqHMHINRSvRxdUg7UzIwt38=;
        b=ZAe7qumgb+AX3RgTd+HjkuzbbTR2ScnvzoeWKoDmtDWIt+6qFOkcjRKwa0bNeYVX3n
         dF8sgflSzTSbH9TPxX1UnMRIIXhsrcaAcsopL2OcUtNYdTbhsFDdY8QoZvNBfquR/m2Q
         IvqDGGUhExi9He5DeZBU1zUUFVU/D2DTA4wjUr4+/h5eUU5Him5+3a2R4ldGg+BXTsPq
         qU+YTpRtYgeMKrz3Sp2SZXtkJwP68iblBZDzCMjsi8x2CoRPVnMURFqnap4BnJeD5UDV
         aNTBzIq7TevIKjVA+VkT52pXfbZ4U8nenYH/vd3aiy0fywzdZyiVqjBaqDrfLL2ipgeS
         WHaw==
X-Forwarded-Encrypted: i=1; AJvYcCXTRPqgvLTG9h3PDTNYjolE9WtXOQSaK6waA2ZR7xh3u2KIJTkDuZmfLBDYyR/VQ57OW2IENUTTxhJ1c/l2DXDg@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9fwxExtYn7VNM0wAxLnwqI6RODkFyQr3nQYDOEw1JIN149VA2
	VTgpfaOn84l9D1MU3UBNqOjtJjpSschdqu3FrG/oRrzLVe2gySr0voq5xiHM7KHtKrzbaCauWpL
	+6F7yfyKz6fU+7UU1VoGHJQdFowo1/zQIoUuMYzqlPirMvTwcj+pOPb8vX3SkOi4ElnbRnaMdZy
	CGIFaO7M6a7ybp/t+ZzZPBWQdcfTsUIIqv8URMe6uIh4k/DQ+g2OYa9HSdB83Tp/d8p6pt506MW
	8RQKL8UM1unOdL3d0MprE7x8gI=
X-Gm-Gg: AZuq6aIdx1GmYc1MUPT2IxEdFcxijiMXIM3IunoyMmozNOyMpQcjZH/dCoBYBI2dP7U
	Mwe8Bam1v7HYgUcSUBqrgC4jntSYo/0LRGzQuNND6Moj0EEZMRSklsloc89LJaB4ZUp2lJXxb4h
	wSc4LVreCb7dtYc8WfE9yAEi8tY5GmBLXoz6KJFp2ldKoELZv0ppWg2VW4SzOy21LXWM+yTClgI
	JIpdzGcILf6W8ZgV/n+jDgg/0rG0u7cumWXFWapRshEn5TrvJVOVK+727s3XhKCatKd3WpmeBpd
	NnpZqRuVF4kGTaGvIk5S5YUcqI1j1adpQpVpf8T1JQoEZgwCFMvIqENyZ1K3W5Vsa/OxLiOiMfM
	hnb30dwj2OWJTa8DV7J2OLmkcXVFW25lufouVuqAuqUe350LgR9u/iUS5k27cry/tFFhdHa2JTD
	/8BnEleIlI6DXQK7o4bVPDOXaxAxO73nQpKHiV9CqYKTUyRSjN3nU2Fw==
X-Received: by 2002:a05:6808:1188:b0:450:bc64:d159 with SMTP id 5614622812f47-46410d0ca53mr3921456b6e.54.1771538237992;
        Thu, 19 Feb 2026 13:57:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-40eaf0acc91sm4584725fac.11.2026.02.19.13.57.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:57:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7b7f04a11so83033075ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 13:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771538236; x=1772143036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ4iRn4Yr0HtvQBIFvgGnqHMHINRSvRxdUg7UzIwt38=;
        b=eyuZLRsUhcXkQauPpPejKH63diKyNJK5Fs7Qb2qp+eBvrps0a7aADFLsCkeUYuxZiZ
         6rX/JwpDI287fiTPPl3wM2peqfDEaXMvmgR5L7Hk2LqO+fOxwCcOM4KGF+lqkVj9mUPl
         +Pxr8O6M1f8VOxHx2FGReR2nrUnc3fYc7FV8o=
X-Forwarded-Encrypted: i=1; AJvYcCV/D4VNxKyrSDPy2dF8HJVX5bmk5bzhentQjKXDqIuXJXhSydLkV8K8DgWKHoUd6XBt+SkZauVelxGgAhZvJZmc@lists.infradead.org
X-Received: by 2002:a17:902:dac7:b0:2a9:5b87:5bd4 with SMTP id d9443c01a7336-2ad50e58478mr62473645ad.1.1771538236591;
        Thu, 19 Feb 2026 13:57:16 -0800 (PST)
X-Received: by 2002:a17:902:dac7:b0:2a9:5b87:5bd4 with SMTP id d9443c01a7336-2ad50e58478mr62473445ad.1.1771538236118;
        Thu, 19 Feb 2026 13:57:16 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aae9d73sm156416065ad.77.2026.02.19.13.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 13:57:15 -0800 (PST)
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
Subject: [PATCH v4 2/3] hwspinlock: brcmstb hardware semaphore support
Date: Thu, 19 Feb 2026 16:57:01 -0500
Message-Id: <20260219215702.63321-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219215702.63321-1-kamal.dasu@broadcom.com>
References: <20260219215702.63321-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_135718_953235_758F9383 
X-CRM114-Status: GOOD (  23.98  )
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
index 000000000000..4488032a3f7f
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
+	{ .compatible = "brcm,brcmstb-sun-top-ctrl-semaphore", },
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


