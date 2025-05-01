Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B4DC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 02:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h3HdnQQ7Lh7tqptK4W9tkQbnlg3dmorsc2Pl8mD4q/M=; b=eRpGmTkvCmEk7vsWllH2QFDhqI
	LLfJpe5AIMBDWfL0b77vDKoJW99c6y0BsnE3dFHbNot/j+Y5Uqq2yvDx7CGmgx2zp0d4Xhy4CRNcs
	AVZzhF6j3SszrMBYa4SaUDDRFilS5FHITZxNBomhK4on6pq9FilbRTezOxLAyGdiAi0PZpBXjJtJl
	UEbWYG5l/BBhhvdTHPdzP8oyEdgMl32TjtgWdnCYLq5g1RzUBW53mMdP4mUu5z9i3/xH3CVyH1F57
	maiYNR+n+OyV0y1iLlikAHy2bpambhtwFEYnoDzFhyhih79pi2ZTUa8KQTtppME3/aLJTE+QvrMOl
	YMhG3Rhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAJDV-0000000EPtC-3G34;
	Thu, 01 May 2025 02:00:01 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAJBW-0000000EPgz-3Wvw;
	Thu, 01 May 2025 01:58:03 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so404121a12.3;
        Wed, 30 Apr 2025 18:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746064678; x=1746669478; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h3HdnQQ7Lh7tqptK4W9tkQbnlg3dmorsc2Pl8mD4q/M=;
        b=M1x/K2UqzxT1URexqhl5hFbRdfRFn/8RfqaAIYGDjQTZL6RFBUyFp/Aaw/oFCSm735
         hQMytlS+44Skg8dmmcy2DInucmNe50Zkz9Sw3sBOnSmm4hG92A73IkIlY4BMR3Qh7bE0
         TZQo5taAs7I63kvX7rF4nzXpyyQltZcu2PNPSd12Ut9CbXSLHcogE8/Yq43l5drbF0xr
         Le3ucCbWscj2F7i97/m+K16u98EkqVWvNRYUgLg8kNa+YwW841iGComD0vVf63QRHW3e
         bhHA2QLV+vCJ9eQ4ErT/8qK2wW2BdBU4nb9EzxS+PusvDZCegQUB3ubdBKOVQI8dqtLH
         wojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746064678; x=1746669478;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3HdnQQ7Lh7tqptK4W9tkQbnlg3dmorsc2Pl8mD4q/M=;
        b=XgMXzhzTDIY297F9aYJm52p+UPZS5vAuzt26wD4Rr4vJvlxFG0c9cwpndMyJzdq5YN
         6V4miixOdbtGLAm6bkdX8WC8StTC/MyMvmFu6RyenDK4ac8Jfip27WFB7cHEIyWCtJVV
         sQ9Z/O94ktC3Ud3l1vJRmpSwoJB2i54Q3px+DPWcIhYnILWEeyZDB4egkxlwripWiekV
         +3E5+bpA7tztvrvthFK+RKbPWxxkufBD2esIY5Ta5FhhbibKS4aTYxtx9CU8HUxLYHBm
         p9pvVvmxLdi0YVluB13Ms6l+iIDUYorsdsHmv4DF8C73NcECPHwT1eDOy9gv4iKzblV+
         jDcw==
X-Forwarded-Encrypted: i=1; AJvYcCUlnjhgUSp2xwz0+2hoctMTN2P+x4GuEPVr43DTsXPUrBD2XEgGI6Wk9IZ6pm4BDL0MOzfvmyihSapEBW/c9w4=@lists.infradead.org, AJvYcCWihd7GZ9/v8wm0QCIN0Z73uDWTvuakgNugeqy4A+mFL7W7OPEKSZtQ7xMhe89bdVpS4zgtkkOBhhG+MLK938hj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/AhvLGQuZJSFOthlYby9lYqeWHQkYTZwZi/RA1xEo2YpcXRjR
	NSqiVg4L44DqTCIeX2omfD1sbWBYlOGD/H6XXC5huY8a1OZ4Tckd
X-Gm-Gg: ASbGncua5P1n4iuIZG+a8qfEW0HdvJQ7gIdk4tvS1nZRDYZqOuoBClvO3T1pvmZh2gL
	HwoA7S9uf+EMr28N98U9RMpFNTEnwbLl2zlu7xSHP+K0eUUsrx0chaXNESd+uE/bfaauke5Hb6x
	11kH+lhTVuKkmIFvBaYq0BIKcz457q3ZB9JHz6x5GAAq4tLZE1V+bfHIS0o1IuskdO6GYckQQhD
	DMUL1sWwF1/qJp/oiwhb6QsEHx6+0Bw1n46wKkxK1dDlRtrsFW4pQo/z8pkdL+0noTe0CyElB8t
	5/YTA9zH4OhV3oZ9axLWgO/1HuUMWY02i0YT6RtwfhlMTBbWotQG+aU=
X-Google-Smtp-Source: AGHT+IF2WAQ6u6BUakZzN4fH3Qie907SR8WIaTRHAciW0cHWcMbgl7LsGYCK5MbNO946abRXqL8u9A==
X-Received: by 2002:a17:90b:578b:b0:2fc:ec7c:d371 with SMTP id 98e67ed59e1d1-30a41cfc306mr1391942a91.3.1746064677565;
        Wed, 30 Apr 2025 18:57:57 -0700 (PDT)
Received: from [192.168.0.69] ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3480ea0dsm2405977a91.37.2025.04.30.18.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 18:57:56 -0700 (PDT)
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
Date: Thu, 01 May 2025 11:57:39 +1000
Subject: [PATCH v2] PCI: dwc: Add support for slot reset on link down event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-b4-pci_dwc_reset_support-v2-1-d6912ab174c4@wdc.com>
X-B4-Tracking: v=1; b=H4sIABPVEmgC/4XPTW7DIBAF4KtYsy4VBmOwV71HFVn8DA1SE1wgT
 qPIdw8hm+66fGh4880dMqaAGebuDgm3kEM818DeOrBHff5CElzNwCgTdOCUmIGsNizuapeEGcu
 SL+saUyFOMuqM9kaihvp9TejDb6v+PLxywp9L3VBej2B0RmLj6RTK3FElOadKGTGORiimuKe+Z
 7WOe+HMqCc9OeQU/soqtLloQyFpIpK/YyGSU+O17HWdmDcOT8Ix5BLTrR279c3w/11bT3riRzH
 oZ9/ExMfV2ffKhsO+7w9/6N5AQQEAAA==
X-Change-ID: 20250430-b4-pci_dwc_reset_support-d720dbafb7ea
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, 
 Alistair Francis <alistair@alistair23.me>, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746064672; l=7785;
 i=wilfred.mallawa@wdc.com; s=20250430; h=from:subject:message-id;
 bh=fQbwUUTN1gpul4279z5HHNPBrxwyTc+m4i94uBkh6VE=;
 b=7NSdJlp2U95ab1vI4/p/BCj6VkXTEmSaUc41LRhFtY64AYcBWmncQYGWuEogibsCLEgxrjoN5
 9wV/Fc4Sa0RDLtSAo+g5gDBtuxIOeI0fQPAWLSBcOTHYi8tQfdAdPKT
X-Developer-Key: i=wilfred.mallawa@wdc.com; a=ed25519;
 pk=DpjNSsEpzUYRunwCxBmAJ/fv9YKUmAPOIoBDL0qeAQU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_185758_908992_6E0333D3 
X-CRM114-Status: GOOD (  25.60  )
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

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

The PCIe link may go down in cases like firmware crashes or unstable
connections. When this occurs, the PCIe slot must be reset to restore
functionality. However, the current driver lacks link down handling,
forcing users to reboot the system to recover.

This patch implements the `reset_slot` callback for link down handling
for DWC PCIe host controller. In which, the RC is reset, reconfigured
and link training initiated to recover from the link down event.

This patch by extension fixes issues with sysfs initiated bus resets.
In that, currently, when a sysfs initiated bus reset is issued, the
endpoint device is non-functional after (may link up with downgraded link
status). With this patch adding support for link down recovery, a sysfs
initiated bus reset works as intended. Testing conducted on a ROCK5B board
with an M.2 NVMe drive.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
Hey all,

This patch builds ontop of [1] to extend the reset slot support for the
DWC PCIe host controller. Which implements link down recovery support
for the DesignWare PCIe host controller by adding a `reset_slot` callback.
This allows the system to recover from PCIe link failures without requiring a reboot.

This patch by extension improves the behavior of sysfs-initiated bus resets.
Previously, a `reset` issued via sysfs could leave the endpoint in a
non-functional state or with downgraded link parameters. With the added
link down recovery logic, sysfs resets now result in a properly reinitialized
and fully functional endpoint device. This issue was discovered on a
Rock5B board, and thus testing was also conducted on the same platform
with a known good M.2 NVMe drive.

Thanks!

[1] https://lore.kernel.org/all/20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org/
---
Changes in v2:
- In the reset_slot callback, use clk_bulk_disable_unprepare() to
  disable clks.
- If dw_pcie_start_link() fails, goto deinit procedure
- Skip error checking for dw_pcie_wait_for_link(), as the link may come
  up later.
- Fixup alignment.
- Link to v1: https://lore.kernel.org/r/20250430-b4-pci_dwc_reset_support-v1-1-f654abfa7925@wdc.com
---
 drivers/pci/controller/dwc/Kconfig            |  1 +
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 88 ++++++++++++++++++++++++++-
 2 files changed, 87 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index d9f0386396edf66ad0e514a0f545ed24d89fcb6c..878c52de0842e32ca50dfcc4b66231a73ef436c4 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -347,6 +347,7 @@ config PCIE_ROCKCHIP_DW_HOST
 	depends on OF
 	select PCIE_DW_HOST
 	select PCIE_ROCKCHIP_DW
+	select PCI_HOST_COMMON
 	help
 	  Enables support for the DesignWare PCIe controller in the
 	  Rockchip SoC (except RK3399) to work in host mode.
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 3c6ab71c996ec1246954f52a9454c8ae67956a54..9e68761fd6d106a6e2bf14635b6d19d53cb019b9 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -23,6 +23,8 @@
 #include <linux/reset.h>
 
 #include "pcie-designware.h"
+#include "../../pci.h"
+#include "../pci-host-common.h"
 
 /*
  * The upper 16 bits of PCIE_CLIENT_CONFIG are a write
@@ -83,6 +85,9 @@ struct rockchip_pcie_of_data {
 	const struct pci_epc_features *epc_features;
 };
 
+static int rockchip_pcie_rc_reset_slot(struct pci_host_bridge *bridge,
+				       struct pci_dev *pdev);
+
 static int rockchip_pcie_readl_apb(struct rockchip_pcie *rockchip, u32 reg)
 {
 	return readl_relaxed(rockchip->apb_base + reg);
@@ -256,6 +261,7 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
 					 rockchip);
 
 	rockchip_pcie_enable_l0s(pci);
+	pp->bridge->reset_slot = rockchip_pcie_rc_reset_slot;
 
 	return 0;
 }
@@ -455,6 +461,11 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
 	dev_dbg(dev, "PCIE_CLIENT_INTR_STATUS_MISC: %#x\n", reg);
 	dev_dbg(dev, "LTSSM_STATUS: %#x\n", rockchip_pcie_get_ltssm(rockchip));
 
+	if (reg & PCIE_LINK_REQ_RST_NOT_INT) {
+		dev_dbg(dev, "hot reset or link-down reset\n");
+		pci_host_handle_link_down(pp->bridge);
+	}
+
 	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
 		if (rockchip_pcie_link_up(pci)) {
 			dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
@@ -536,8 +547,8 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 		return ret;
 	}
 
-	/* unmask DLL up/down indicator */
-	val = HIWORD_UPDATE(PCIE_RDLH_LINK_UP_CHGED, 0);
+	/* unmask DLL up/down indicator and hot reset/link-down reset irq */
+	val = HIWORD_UPDATE(PCIE_RDLH_LINK_UP_CHGED | PCIE_LINK_REQ_RST_NOT_INT, 0);
 	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
 
 	return ret;
@@ -688,6 +699,79 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static int rockchip_pcie_rc_reset_slot(struct pci_host_bridge *bridge,
+				       struct pci_dev *pdev)
+{
+	struct pci_bus *bus = bridge->bus;
+	struct dw_pcie_rp *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
+	struct device *dev = rockchip->pci.dev;
+	u32 val;
+	int ret;
+
+	dw_pcie_stop_link(pci);
+	rockchip_pcie_phy_deinit(rockchip);
+	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
+
+	ret = reset_control_assert(rockchip->rst);
+	if (ret)
+		return ret;
+
+	ret = rockchip_pcie_phy_init(rockchip);
+	if (ret)
+		goto disable_regulator;
+
+	ret = reset_control_deassert(rockchip->rst);
+	if (ret)
+		goto deinit_phy;
+
+	ret = rockchip_pcie_clk_init(rockchip);
+	if (ret)
+		goto deinit_phy;
+
+	ret = pp->ops->init(pp);
+	if (ret) {
+		dev_err(dev, "Host init failed: %d\n", ret);
+		goto deinit_clk;
+	}
+
+	/* LTSSM enable control mode */
+	val = HIWORD_UPDATE_BIT(PCIE_LTSSM_ENABLE_ENHANCE);
+	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
+
+	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_RC_MODE, PCIE_CLIENT_GENERAL_CON);
+
+	ret = dw_pcie_setup_rc(pp);
+	if (ret) {
+		dev_err(dev, "Failed to setup RC: %d\n", ret);
+		goto deinit_clk;
+	}
+
+	/* unmask DLL up/down indicator and hot reset/link-down reset irq */
+	val = HIWORD_UPDATE(PCIE_RDLH_LINK_UP_CHGED | PCIE_LINK_REQ_RST_NOT_INT, 0);
+	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
+
+	ret = dw_pcie_start_link(pci);
+	if (ret)
+		goto deinit_clk;
+
+	/* Ignore errors, the link may come up later */
+	dw_pcie_wait_for_link(pci);
+	dev_dbg(dev, "Slot reset completed\n");
+	return ret;
+
+deinit_clk:
+	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
+deinit_phy:
+	rockchip_pcie_phy_deinit(rockchip);
+disable_regulator:
+	if (rockchip->vpcie3v3)
+		regulator_disable(rockchip->vpcie3v3);
+
+	return ret;
+}
+
 static const struct rockchip_pcie_of_data rockchip_pcie_rc_of_data_rk3568 = {
 	.mode = DW_PCIE_RC_TYPE,
 };

---
base-commit: 08733088b566b58283f0f12fb73f5db6a9a9de30
change-id: 20250430-b4-pci_dwc_reset_support-d720dbafb7ea
prerequisite-change-id: 20250404-pcie-reset-slot-730bfa71a202:v3
prerequisite-patch-id: 2dad85eb26838d89569b12c19d70f392fa592667
prerequisite-patch-id: 6238a682bd8e9476e5911b7a59263c3fc618d63e
prerequisite-patch-id: a01300083e94a67ea7c8bfcde320081d90b384d4
prerequisite-patch-id: ff711f65cf9926374646b76cd38bdd823d576764
prerequisite-patch-id: a5ee9d4b728b80d32844c5108a5b453eaa4f653f

Best regards,
-- 
Wilfred Mallawa <wilfred.mallawa@wdc.com>


