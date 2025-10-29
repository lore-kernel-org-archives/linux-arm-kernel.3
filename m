Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC96FCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 19:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qs94W/XWkVsQM8QXT0wY5HKWqWEfFFstbFkTTTBpc24=; b=DOFCfi5KEsqp1BMaV2xtswM6wR
	PMGhHKAN2Cbwwm1jg0Hvy4M/i974o2iakmU6REKkJPT69Cq3uTxuLykTYku0qtTSlmuWu32kyzAfI
	X5sw+G6G0/Mbg+JJPWzLY4FVfHGNccDzJy+JxipZMtQ9NoqjT6E8CrDjpukPz/EdM6Spq4VS3vc2G
	zgeIcji9JuQIBLnKmZGSQkNGCmudHFR4TGoiZYH3gaTybjN6Jsw+tmeiK0kH1cOqsVU3RUwU5m7PG
	C0fp0K0bMWQNlQluvhMnzDuWI9TN7BImNOv39MNWo+4t2Yah2W9DVrrrxwB2oKGsGGv/ss+4n17wT
	XSILbMuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEByK-00000002cvI-0Nto;
	Wed, 29 Oct 2025 19:36:40 +0000
Received: from mail-qv1-xf61.google.com ([2607:f8b0:4864:20::f61])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBy9-00000002csu-0jp4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 19:36:30 +0000
Received: by mail-qv1-xf61.google.com with SMTP id 6a1803df08f44-87c1f607e72so3819316d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 12:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761766588; x=1762371388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qs94W/XWkVsQM8QXT0wY5HKWqWEfFFstbFkTTTBpc24=;
        b=xPIKMIFUjxifSBNeDkJDJcJePN3MyPQXSJL1Ba30Dvl8pOw5nj55PEhLbYVeBYoKoF
         sXHm8todCCu1zQwsHs4MXSLjANUqQLJC7NAXXzUKQmMSHe4n+Yi79BXTjR3pKQNnsfau
         9ic9Yg1NdVb4s4TICy38jeLOeIgIOHr87WjMR2oh3vgsz03evHs8ezRxZZBF+mSwJ4PX
         8xEGn0nBM++JK+BMl0FwU9BvdwwECp20ZlYfkj4hWudKhStbHBT9MYGpVCwqiPDz8Uub
         pd8HBS51IcLGd8PciXMHJyBD6UHryqWLMPFUaWhm9bXC+acCqvV/ihN5UB+aoQ523W7T
         O4WA==
X-Forwarded-Encrypted: i=1; AJvYcCU6Rx3oEBo6ROtJCas12LrRL+zUXXYKvULeUvlGhJyERCwNS/v0CTdwHtZCQxl7/oaOHXfUEeYHJWatbEesl2QR@lists.infradead.org
X-Gm-Message-State: AOJu0YzLf2K83wgNtcxYIm+KpFnt53YyB3tCge56XELov5HlHKKNLRtY
	or08DlL+XuQs/ic5kkVmN3qQJLZJgJn0/odew53PD+IUDHsneN3I3RKt7n+f6AeeyymAOeMkDvq
	Gbf5hb6HMHAGQQsFnR81GJl+tUStRnhMA3GQvjm8OxTPJdNAzD27zqfnoW019U632RvgLeCH/Lj
	qLJZT0D1MHJI0kXmhxpDdEOBqO6g1UmonfD1FpGkRj8lwdbMARIv8EiMG/3m2yK9rUpeniWFnGs
	2ZkCF6jW2aA5/QsxIXIw1Y+z8rlNhc=
X-Gm-Gg: ASbGnctm/V3QshCw03dP3dvOmiG9FS7i/4x3JnAzpLrvwmennN6VzCK6RHlYOSsyZKx
	kRyGMZjn/0vvjy7tKdXLMDRyXm43dwZ8BhT1lUsFNMlolVcp99+AqGeZCSuXJWI9FL1AwuVTlJc
	vHkBi0CPKCG7Lwp/Baajf6L6zMaW7BFz9gRVLHuHNOMWOhOj9gFU1A2ytudDo0+toH9yyXG03yk
	N+Wk0aPGXdOFWWMaT6I5LVdtGbsyQd88vlNYZtc0OsdLttFu2DA5kU3D5ahx4YstkZpwXfUIjGk
	DE3fn+sMtqe0nHT+Fd9QicWUpZPROi+k7YLuhp2Ptg0HIc9CKMA8gepMFAqEcVP+6U6WPB7hLi6
	p7BG9qaSCVKJCGeT84Oh+1oDA9PoPvNoxznlVOer6U0k1NywL4/rruWBILKjIEuF3c+E159l7Qd
	4mtjU3v1oqWllmgiLBcLiVOb+p0doVLsqTtCMeWA==
X-Google-Smtp-Source: AGHT+IGJe3cDhDOjLY8bRXHLtLxk9TE0iilAUVPtsAkA/ZEM6pdvWUOPQY0fvBuvkQEM50XjVGtbSUn/F/h0
X-Received: by 2002:a05:6214:4608:b0:87f:fffb:b7af with SMTP id 6a1803df08f44-8801ac16b19mr12350346d6.1.1761766587944;
        Wed, 29 Oct 2025 12:36:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-87fc497578csm14388656d6.21.2025.10.29.12.36.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Oct 2025 12:36:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78108268ea3so1147438b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 12:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1761766587; x=1762371387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qs94W/XWkVsQM8QXT0wY5HKWqWEfFFstbFkTTTBpc24=;
        b=EQEZGDQvWgFRpUwbXlykNMo/N/n38ttInbFVLzu/DkY7vBzmz61morh5px2PjYgCe4
         9aGhe/ebuI1VqO17Ge8fo0/dy5p2BQ0fqTDmeBqqKqFh314YpZnkViF6Igl6XhDRq42X
         g7+kce19JpWfhhmUOdJfcSG5JVKpXSOlfJhrg=
X-Forwarded-Encrypted: i=1; AJvYcCVRcTABhCz3DuwLJGPUVJoSkdkolhTFzjZ6tD9EjXPtfnrQPFnpGkJE0atkWipBDobb0V3RuhqC1pTJNRg+C4u/@lists.infradead.org
X-Received: by 2002:a05:6a00:12d0:b0:77d:98ee:e1c5 with SMTP id d2e1a72fcca58-7a615f6d321mr755385b3a.15.1761766586602;
        Wed, 29 Oct 2025 12:36:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:12d0:b0:77d:98ee:e1c5 with SMTP id d2e1a72fcca58-7a615f6d321mr755353b3a.15.1761766586139;
        Wed, 29 Oct 2025 12:36:26 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140a0d47sm15895260b3a.73.2025.10.29.12.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 12:36:25 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/2] PCI: brcmstb: Add panic/die handler to driver
Date: Wed, 29 Oct 2025 15:36:15 -0400
Message-Id: <20251029193616.3670003-3-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251029193616.3670003-1-james.quinlan@broadcom.com>
References: <20251029193616.3670003-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_123629_241813_1470D803 
X-CRM114-Status: GOOD (  23.96  )
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

Whereas most PCIe HW returns 0xffffffff on illegal accesses and the like,
by default Broadcom's STB PCIe controller effects an abort.  Some SoCs --
7216 and its descendants -- have new HW that identifies error details.

This simple handler determines if the PCIe controller was the cause of the
abort and if so, prints out diagnostic info.  Unfortunately, an abort still
occurs.

Care is taken to read the error registers only when the PCIe bridge is
active and the PCIe registers are acceptable.  Otherwise, a "die" event
caused by something other than the PCIe could cause an abort if the PCIe
"die" handler tried to access registers when the bridge is off.

Example error output:
  brcm-pcie 8b20000.pcie: Error: Mem Acc: 32bit, read, @0x38000000
  brcm-pcie 8b20000.pcie:  Type: TO=0 Abt=0 UnspReq=1 AccDsble=0 BadAddr=0

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 160 +++++++++++++++++++++++++-
 1 file changed, 158 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 9f1f746091be..67e73607f0ed 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -14,15 +14,18 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqchip/irq-msi-lib.h>
 #include <linux/irqdomain.h>
+#include <linux/kdebug.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/msi.h>
+#include <linux/notifier.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_pci.h>
 #include <linux/of_platform.h>
+#include <linux/panic_notifier.h>
 #include <linux/pci.h>
 #include <linux/pci-ecam.h>
 #include <linux/printk.h>
@@ -32,6 +35,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 
 #include "../pci.h"
@@ -156,8 +160,40 @@
 #define  MSI_INT_MASK_SET		0x10
 #define  MSI_INT_MASK_CLR		0x14
 
+/* Error report registers */
+#define PCIE_OUTB_ERR_TREAT				0x6000
+#define  PCIE_OUTB_ERR_TREAT_CONFIG		0x1
+#define  PCIE_OUTB_ERR_TREAT_MEM			0x2
+#define PCIE_OUTB_ERR_VALID				0x6004
+#define PCIE_OUTB_ERR_CLEAR				0x6008
+#define PCIE_OUTB_ERR_ACC_INFO				0x600c
+#define  PCIE_OUTB_ERR_ACC_INFO_CFG_ERR			BIT(0)
+#define  PCIE_OUTB_ERR_ACC_INFO_MEM_ERR			BIT(1)
+#define  PCIE_OUTB_ERR_ACC_INFO_TYPE_64			BIT(2)
+#define  PCIE_OUTB_ERR_ACC_INFO_DIR_WRITE		BIT(4)
+#define  PCIE_OUTB_ERR_ACC_INFO_BYTE_LANES		0xff00
+#define PCIE_OUTB_ERR_ACC_ADDR				0x6010
+#define PCIE_OUTB_ERR_ACC_ADDR_BUS			0xff00000
+#define PCIE_OUTB_ERR_ACC_ADDR_DEV			0xf8000
+#define PCIE_OUTB_ERR_ACC_ADDR_FUNC			0x7000
+#define PCIE_OUTB_ERR_ACC_ADDR_REG			0xfff
+#define PCIE_OUTB_ERR_CFG_CAUSE				0x6014
+#define  PCIE_OUTB_ERR_CFG_CAUSE_TIMEOUT		BIT(6)
+#define  PCIE_OUTB_ERR_CFG_CAUSE_ABORT			BIT(5)
+#define  PCIE_OUTB_ERR_CFG_CAUSE_UNSUPP_REQ		BIT(4)
+#define  PCIE_OUTB_ERR_CFG_CAUSE_ACC_TIMEOUT		BIT(2)
+#define  PCIE_OUTB_ERR_CFG_CAUSE_ACC_DISABLED		BIT(1)
+#define  PCIE_OUTB_ERR_CFG_CAUSE_ACC_64BIT		BIT(0)
+#define PCIE_OUTB_ERR_MEM_ADDR_LO			0x6018
+#define PCIE_OUTB_ERR_MEM_ADDR_HI			0x601c
+#define PCIE_OUTB_ERR_MEM_CAUSE				0x6020
+#define  PCIE_OUTB_ERR_MEM_CAUSE_TIMEOUT		BIT(6)
+#define  PCIE_OUTB_ERR_MEM_CAUSE_ABORT			BIT(5)
+#define  PCIE_OUTB_ERR_MEM_CAUSE_UNSUPP_REQ		BIT(4)
+#define  PCIE_OUTB_ERR_MEM_CAUSE_ACC_DISABLED		BIT(1)
+#define  PCIE_OUTB_ERR_MEM_CAUSE_BAD_ADDR		BIT(0)
+
 #define  PCIE_RGR1_SW_INIT_1_PERST_MASK			0x1
-#define  PCIE_RGR1_SW_INIT_1_PERST_SHIFT		0x0
 
 #define RGR1_SW_INIT_1_INIT_GENERIC_MASK		0x2
 #define RGR1_SW_INIT_1_INIT_GENERIC_SHIFT		0x1
@@ -306,6 +342,8 @@ struct brcm_pcie {
 	bool			ep_wakeup_capable;
 	const struct pcie_cfg_data	*cfg;
 	bool			bridge_in_reset;
+	struct notifier_block	die_notifier;
+	struct notifier_block	panic_notifier;
 	spinlock_t		bridge_lock;
 };
 
@@ -1731,6 +1769,118 @@ static int brcm_pcie_resume_noirq(struct device *dev)
 	return ret;
 }
 
+/* Dump out PCIe errors on die or panic */
+static int brcm_pcie_dump_err(struct brcm_pcie *pcie,
+			       const char *type)
+{
+	void __iomem *base = pcie->base;
+	int i, is_cfg_err, is_mem_err, lanes;
+	const char *width_str, *direction_str;
+	u32 info, cfg_addr, cfg_cause, mem_cause, lo, hi;
+	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(pcie);
+	unsigned long flags;
+	char lanes_str[9];
+
+	spin_lock_irqsave(&pcie->bridge_lock, flags);
+	/* Don't access registers when the bridge is off */
+	if (pcie->bridge_in_reset || readl(base + PCIE_OUTB_ERR_VALID) == 0) {
+		spin_unlock_irqrestore(&pcie->bridge_lock, flags);
+		return NOTIFY_DONE;
+	}
+
+	/* Read all necessary registers so we can release the spinlock ASAP */
+	info = readl(base + PCIE_OUTB_ERR_ACC_INFO);
+	is_cfg_err = !!(info & PCIE_OUTB_ERR_ACC_INFO_CFG_ERR);
+	is_mem_err = !!(info & PCIE_OUTB_ERR_ACC_INFO_MEM_ERR);
+	if (is_cfg_err) {
+		cfg_addr = readl(base + PCIE_OUTB_ERR_ACC_ADDR);
+		cfg_cause = readl(base + PCIE_OUTB_ERR_CFG_CAUSE);
+	}
+	if (is_mem_err) {
+		mem_cause = readl(base + PCIE_OUTB_ERR_MEM_CAUSE);
+		lo = readl(base + PCIE_OUTB_ERR_MEM_ADDR_LO);
+		hi = readl(base + PCIE_OUTB_ERR_MEM_ADDR_HI);
+	}
+	/* We've got all of the info, clear the error */
+	writel(1, base + PCIE_OUTB_ERR_CLEAR);
+	spin_unlock_irqrestore(&pcie->bridge_lock, flags);
+
+	dev_err(pcie->dev, "reporting PCIe info which may be related to %s error\n", type);
+	width_str = (info & PCIE_OUTB_ERR_ACC_INFO_TYPE_64) ? "64bit" : "32bit";
+	direction_str = str_read_write(!(info & PCIE_OUTB_ERR_ACC_INFO_DIR_WRITE));
+	lanes = FIELD_GET(PCIE_OUTB_ERR_ACC_INFO_BYTE_LANES, info);
+	for (i = 0, lanes_str[8] = 0; i < 8; i++)
+		lanes_str[i] = (lanes & (1 << i)) ? '1' : '0';
+
+	if (is_cfg_err) {
+		int bus = FIELD_GET(PCIE_OUTB_ERR_ACC_ADDR_BUS, cfg_addr);
+		int dev = FIELD_GET(PCIE_OUTB_ERR_ACC_ADDR_DEV, cfg_addr);
+		int func = FIELD_GET(PCIE_OUTB_ERR_ACC_ADDR_FUNC, cfg_addr);
+		int reg = FIELD_GET(PCIE_OUTB_ERR_ACC_ADDR_REG, cfg_addr);
+
+		dev_err(pcie->dev, "Error: CFG Acc, %s, %s (%04x:%02x:%02x.%d) reg=0x%x, lanes=%s\n",
+			width_str, direction_str, bridge->domain_nr, bus, dev, func,
+			reg, lanes_str);
+		dev_err(pcie->dev, " Type: TO=%d Abt=%d UnsupReq=%d AccTO=%d AccDsbld=%d Acc64bit=%d\n",
+			!!(cfg_cause & PCIE_OUTB_ERR_CFG_CAUSE_TIMEOUT),
+			!!(cfg_cause & PCIE_OUTB_ERR_CFG_CAUSE_ABORT),
+			!!(cfg_cause & PCIE_OUTB_ERR_CFG_CAUSE_UNSUPP_REQ),
+			!!(cfg_cause & PCIE_OUTB_ERR_CFG_CAUSE_ACC_TIMEOUT),
+			!!(cfg_cause & PCIE_OUTB_ERR_CFG_CAUSE_ACC_DISABLED),
+			!!(cfg_cause & PCIE_OUTB_ERR_CFG_CAUSE_ACC_64BIT));
+	}
+
+	if (is_mem_err) {
+		u64 addr = ((u64)hi << 32) | (u64)lo;
+
+		dev_err(pcie->dev, "Error: Mem Acc, %s, %s, @0x%llx, lanes=%s\n",
+			width_str, direction_str, addr, lanes_str);
+		dev_err(pcie->dev, " Type: TO=%d Abt=%d UnsupReq=%d AccDsble=%d BadAddr=%d\n",
+			!!(mem_cause & PCIE_OUTB_ERR_MEM_CAUSE_TIMEOUT),
+			!!(mem_cause & PCIE_OUTB_ERR_MEM_CAUSE_ABORT),
+			!!(mem_cause & PCIE_OUTB_ERR_MEM_CAUSE_UNSUPP_REQ),
+			!!(mem_cause & PCIE_OUTB_ERR_MEM_CAUSE_ACC_DISABLED),
+			!!(mem_cause & PCIE_OUTB_ERR_MEM_CAUSE_BAD_ADDR));
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int brcm_pcie_die_notify_cb(struct notifier_block *self,
+				   unsigned long v, void *p)
+{
+	struct brcm_pcie *pcie =
+		container_of(self, struct brcm_pcie, die_notifier);
+
+	return brcm_pcie_dump_err(pcie, "Die");
+}
+
+static int brcm_pcie_panic_notify_cb(struct notifier_block *self,
+				     unsigned long v, void *p)
+{
+	struct brcm_pcie *pcie =
+		container_of(self, struct brcm_pcie, panic_notifier);
+
+	return brcm_pcie_dump_err(pcie, "Panic");
+}
+
+static void brcm_register_die_notifiers(struct brcm_pcie *pcie)
+{
+	pcie->panic_notifier.notifier_call = brcm_pcie_panic_notify_cb;
+	atomic_notifier_chain_register(&panic_notifier_list,
+				       &pcie->panic_notifier);
+
+	pcie->die_notifier.notifier_call = brcm_pcie_die_notify_cb;
+	register_die_notifier(&pcie->die_notifier);
+}
+
+static void brcm_unregister_die_notifiers(struct brcm_pcie *pcie)
+{
+	unregister_die_notifier(&pcie->die_notifier);
+	atomic_notifier_chain_unregister(&panic_notifier_list,
+					 &pcie->panic_notifier);
+}
+
 static void __brcm_pcie_remove(struct brcm_pcie *pcie)
 {
 	brcm_msi_remove(pcie);
@@ -1749,6 +1899,9 @@ static void brcm_pcie_remove(struct platform_device *pdev)
 
 	pci_stop_root_bus(bridge->bus);
 	pci_remove_root_bus(bridge->bus);
+	if (pcie->cfg->has_err_report)
+		brcm_unregister_die_notifiers(pcie);
+
 	__brcm_pcie_remove(pcie);
 }
 
@@ -1849,6 +2002,7 @@ static const struct pcie_cfg_data bcm7216_cfg = {
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_7278,
 	.has_phy	= true,
 	.num_inbound_wins = 3,
+	.has_err_report = true,
 };
 
 static const struct pcie_cfg_data bcm7712_cfg = {
@@ -2023,8 +2177,10 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (pcie->cfg->has_err_report)
+	if (pcie->cfg->has_err_report) {
 		spin_lock_init(&pcie->bridge_lock);
+		brcm_register_die_notifiers(pcie);
+	}
 
 	return 0;
 
-- 
2.34.1


