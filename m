Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A181CCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 21:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNu9C7+Hl8/zwgHRFvABJRp0xk1fvGWapoEQB/t9/po=; b=sSfoN5sC2YppCPLWf5Z4MfzgVj
	5j97bSLLIPU70RQjmQxYzdvx8Ptj3mtxgdvTnTXCEQTRFiSc22CErlT7LmjzHfU3gNdM1GW112hW6
	Wskt27BTTuYgIkjbXh2gnPr3ImfazBId3dF4wb5pUIPNYV6A7c94Tn/LLIEVO4x8CC6qN5ZOgoy55
	wi+P6r/10ciFEF92E6P8Q7cXNTmWgtdFevXFY629NW7D8UNO8KDqHf1bbniSQh6Ldaglbs3iVtDnl
	kGduRQo4oRv9QdZLX1tVUi4Z7GgIti6C54eE4vbjbrrzB9k9YDNAsEFYHUPFWom1ufmZ+MPNzp0Lt
	eM/+M19A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6y44-000000078qb-270u;
	Thu, 09 Oct 2025 21:20:44 +0000
Received: from mail-pl1-x662.google.com ([2607:f8b0:4864:20::662])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6y41-000000078oD-2sIy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 21:20:43 +0000
Received: by mail-pl1-x662.google.com with SMTP id d9443c01a7336-269639879c3so13606305ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 14:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760044841; x=1760649641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UNu9C7+Hl8/zwgHRFvABJRp0xk1fvGWapoEQB/t9/po=;
        b=n0WnZ6m24zFTirwjvgR3NZfiK/UZjhHSNu6CwpvMyqcl+hj9Y+70YayPOM7yOGc6KJ
         jX637bXkFQVVSIxTar+PmaGf083vs4PtnrkB7Fe6zXV2i4qHG4s1CM4eYMRyTGYPSZ1y
         8CjPzeiXt1lOTu466kgNEnEvgpYmrn7K7zoUSCooxyniY91zeNq6/UvBux643400sUhN
         5lR3u9t0qOsDu7GVI1+MoavEDpmjH6PXMtR8mEsS6kxQYjOIzMIdVHGjMbIEmB2olY+I
         sTWTzuNuhlQEnNdnxNuMPhl9FLmXL9mNfsx4QyCoSGxV+Bmp8QS5/iHAVJcwp/Rkm3W2
         olag==
X-Forwarded-Encrypted: i=1; AJvYcCX7yP0Cqb+BNw0ShQBAFXbeHNEkTkZ0wWV9/n5USxtvjtboVtZBHCzsP3I2XQbMxF6D4Avcy1ZFh5vwqpORJT2o@lists.infradead.org
X-Gm-Message-State: AOJu0YzTOEjuVWa3uMq3sDhGVX5NncFt4tZSyQoLXI/fXLzooDVs+Zkl
	mDDaVaEMqjGzgxx50sJuhXJsNRyhjyHUkshMC5KybhttwxEVkdKQxpL/TwgMGDqmIK0cA513CXg
	mLbh4S2RjYTb+M+PdRhh7s8rkd6JeK0mvWwCUzU5L4nOV2czGrrB5ClpozFEa/9MZDkxs9dxEtf
	NERaVZqI8ZsS/7WI5O0mAeL8r+ab9qvuaUx6ibspWtbnJdeF9LZFSEWmcEzZRtM/O1hmnqiJK0h
	+pgcjOlIVPOtL5phA/bYesntyY=
X-Gm-Gg: ASbGnctbrLEiT2S9rHxYVwoJCaPyD2k5XVhkOOtr+jo+dW1AetWDC1i/3TwF+1k3DBk
	pAKJfaH8qPOjtuYwCjE3EikFn2uGsCBThn08AQCA0zZ7N8RurbNkMH+cO/9pTN09+gFauBAAued
	f+2dlv0c1vlsAaQM4t8jl2DFRV8al/UhkSOGkeCEyHTa7BKyL8yftQW70K11zF7lkLNLRMj6ZO/
	zDRrjkJHeFt/tdqQiebiLbZvDAw43d3i6yfVTGfZXXDE4QrsK1Hz2PMiL+oFA0jNjcHIxTJPNlu
	sdg7SB8izps7dbaNnh/GiIiBibGvRwZilnVOe1R065iNxh69kDup/RLctWkBDJA7D78CXCuAyRy
	8T6qe3sbgh9tG3mhCsGJHxddjy2ErrHNyFqgrIlNIyQTcZ47q5JdLsjaRuHH3d72ceGTZPpRnar
	KqwQ==
X-Google-Smtp-Source: AGHT+IGPjNMbq1vxd85e8Z5BI0YctVNY4ZVbWZaNXmJnpMvJUFny0JOqPxSiV1HybxbbjfdcWFtQREx3c9KO
X-Received: by 2002:a17:902:e806:b0:28d:18d3:46ca with SMTP id d9443c01a7336-29027402f00mr128574365ad.49.1760044840808;
        Thu, 09 Oct 2025 14:20:40 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-72.dlp.protect.broadcom.com. [144.49.247.72])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-29034eed5a1sm3061515ad.47.2025.10.09.14.20.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Oct 2025 14:20:40 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-854bec86266so703396185a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 14:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1760044839; x=1760649639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNu9C7+Hl8/zwgHRFvABJRp0xk1fvGWapoEQB/t9/po=;
        b=SKVw0xWQEVAzTCsu9pWvgbFkDa6pKEjZdHYPI7zcoYwe0ScT3olJ9cBmI+I+UYU1DQ
         25oA4FmjfuNrWB3Vc+xS/jN7t6nz3u1GZQaRgZyONfIp31ts54wYpqHCluq/ZuCf+5dk
         8wdbK/sYOfOpjEufXDTL/Sw2oEN908S6BodY0=
X-Forwarded-Encrypted: i=1; AJvYcCWRJa6/aRAlNuEzywbdSRpgbALr4r/fSM3qaMb0Oybeq68OHfrGnGQJIba7VhL5d7E0BD/JVDRieWi/JAx3Ow/p@lists.infradead.org
X-Received: by 2002:a05:620a:d89:b0:86a:3188:bb49 with SMTP id af79cd13be357-883525c06f8mr1579829085a.54.1760044839306;
        Thu, 09 Oct 2025 14:20:39 -0700 (PDT)
X-Received: by 2002:a05:620a:d89:b0:86a:3188:bb49 with SMTP id af79cd13be357-883525c06f8mr1579823385a.54.1760044838777;
        Thu, 09 Oct 2025 14:20:38 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f9ae428sm274832685a.16.2025.10.09.14.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 14:20:38 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: peng.fan@oss.nxp.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v3 2/3] hwspinlock: brcmstb hardware semaphore support
Date: Thu,  9 Oct 2025 17:20:02 -0400
Message-Id: <20251009212003.2714447-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009212003.2714447-1-kamal.dasu@broadcom.com>
References: <20251009212003.2714447-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_142041_739891_346470D8 
X-CRM114-Status: GOOD (  23.77  )
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

Adding support for brmstb_hwspinlock that only maps sundry block
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
index 3874d15b0e9b..39797cadfd0b 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -8,6 +8,16 @@ menuconfig HWSPINLOCK
 
 if HWSPINLOCK
 
+config HWSPINLOCK_BRCMSTB
+	tristate "Broadcom Setttop Hardware Semaphore functionality"
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
index 000000000000..0b164c57192e
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
+	{ .compatible = "brcm,brcmstb-hwspinlock", },
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
+MODULE_AUTHOR("Kamal Dasu <kdasu.dasu@broadcom.com>");
-- 
2.34.1


