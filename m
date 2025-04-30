Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE159C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 08:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zrESOHG0sLCCbiiaT25hID1gO0oTlv+4VenA0x68Mew=; b=pckXA/RAY+95hhznEM02v/g58k
	utDydzhZ7cIbwThqp8QgRefdir1ul3nOEwvO7rkv84R2gE54tNYy2LrjI8222AzaynXGVq0qB0RLu
	b1axRn55kTpDPnoSZ939ljFyzUn2TrSpMwsd1DrKHrUJ1cP5dyrjlKE5CWkmOLeoLS38FxMLdHteD
	ElXd3yA/nuYSSddHum2t6tmuPjjThAzoHVk/b1ZV3sZDSw7bdSaKS+m+cc1Q81xaRbSXIdGtAidMK
	BWL/hJBIdF3+rGHHBAgN/esomyOdPy5cs39AY7rwF8JLi2N4VCLcV6qnqX65NINxhQ1zwbd7REEqQ
	mEZgbOuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2TQ-0000000C6BX-1Zy0;
	Wed, 30 Apr 2025 08:07:20 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA278-0000000C1wl-3D58;
	Wed, 30 Apr 2025 07:44:20 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-739525d4e12so5769380b3a.3;
        Wed, 30 Apr 2025 00:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745999057; x=1746603857; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zrESOHG0sLCCbiiaT25hID1gO0oTlv+4VenA0x68Mew=;
        b=UXiJTzV8j4TUi/74bog1IcD0VBxavudg2MkwEQvq5T9WT71wYR0qJQZ0AwWm3l3Jml
         rp/6QjdHGdLRzDky1iyvEv/JTL2I1Ry1YcRvluCZLzqzPP4YoHRfyi/bRJRYdYzz+gCc
         2L5Kz7PHkxCvp5e0dN/wtrxmkSkCXiZG4TRrXLShCFb4JMdweSKIdBBx2T8zpkcEjJFG
         mYkuhuRbVyqhJo+DBlaFMDvCIiSZ72v3mc8ajVEGBlO8+KWgW4707vkt662GE02eaW6e
         Js6kC6If+a4pqQJyltKNsOc/mciwIg13DyHPWSyeX4A/S3GlJjVHfCzI3Dn6Qp7jqdhY
         Q7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745999057; x=1746603857;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrESOHG0sLCCbiiaT25hID1gO0oTlv+4VenA0x68Mew=;
        b=J2GnY4CphqMFmNTj59VrKoGg5jyornMdu/ul5m8F/2o36SIFc4OfMK3YABMaQSZUka
         2E4ThJWwyeYjN6tWAgl79Vew0Fo1VztIHM+ykdW3+2ZNMwHBT513rEHuF2LQ17FSrd2S
         kOf/70B9c39HzUOSDeMWsowYFftnLWtCpcUY9kcUQ9FhXkqJHCbpezJ6+55O1bFu+f15
         o6Ge4QRPMI+xWv4HWcXWNBgcgxFxIHTegsL77ftYXAR3Fn+sv8RM2TntvjJzdx/hnDlw
         vClFH4fJdTN8vCpuB/ypd+lUpTO4cQwZO0lEEDKYf7vRpgYrE09AR8QDq5ifjgsVl2AD
         R0IA==
X-Forwarded-Encrypted: i=1; AJvYcCUzhukWDqHVT5wrnTVQIK2se7olmw5C3ax1b8QnnG2gwsqvdC1Id7abCHqPUFwT9gT2MOs3NSXBVG/qu8JNNHnZ@lists.infradead.org, AJvYcCV13ucL6rMTXtLhYCX1y13Hk8ObzuIOQLdbK1QTPngm0t4gC07ij4wlGFsuI92mdI8OdqIzNgRyXkALYYDKlTo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGnJAl/xX0q3BoAUEuebcE6/w4uV2oUqVyCdG8INh+vgamR4Ae
	Uw9VHU7/JQJBOcPNhXU+wKMO3mc1X5M2/r8Cb6JhaK6aO2CxYmFr
X-Gm-Gg: ASbGncstPMjt33Uxn56o4CDeeV2iBeNB9dVH7pX16JAj4vbLyyoRKHqUweZ9RjxgXDZ
	8GfOFuWxcWzzF696B4f7hBPBzbCFiILD03AGFCDrm1uvrAMnsGPvSo8aZ1cQf09l8TlNYxoCTKs
	1pSdJdVBYJaladbLZ826IQ20eYE42gTh3bDLXfiPljWQHWnOfOXUHUlXccYqwjPqmHp+kMLUs8y
	y6nvSuDnwZQgL1v81c7ih0sl8DDZFFoBGvfgii32XzpxVbg1MYPEuE6rp+JckNK8IfGT5wBqLYY
	aD9kN+jnl/GhVyXpouHclrPNLtb+Ym0f8kNZgaFVQZ3ezDLFq3V6JempFHj39eUsRQ==
X-Google-Smtp-Source: AGHT+IF06NW1ClQUAO/SIEO6133O5k9N280oeUAGSpUbGow1VaGJ774XRxZ1c6pEdx19wXl+cXkOKw==
X-Received: by 2002:a05:6a21:139b:b0:1f5:82ae:69d1 with SMTP id adf61e73a8af0-20a8832fa04mr2672867637.20.1745999057268;
        Wed, 30 Apr 2025 00:44:17 -0700 (PDT)
Received: from [192.168.0.69] ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a94780sm976673b3a.168.2025.04.30.00.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:44:16 -0700 (PDT)
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
Date: Wed, 30 Apr 2025 17:43:51 +1000
Subject: [PATCH] PCI: dwc: Add support for slot reset on link down event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-pci_dwc_reset_support-v1-1-f654abfa7925@wdc.com>
X-B4-Tracking: v=1; b=H4sIALbUEWgC/02OQQ6DIBBFr2JmXZIRVNCrNMaADC1JWy2gbWK8e
 4luunyTP/+/DSIFTxG6YoNAq49+emUoLwWMd/26EfM2M3DkNVYCmanYPPrBfsYhUKQ0xGWep5C
 YlRyt0c5I0pDf50DOf4/qa39yoPeSF9J5BKMjsXF6Pn3qClRSCFTK1E1jasWVcOhKnuuEq61pd
 KtbSwLh36wrTi88pIgdRiw+psSkQOO0LHVOdKuAft9/ChD0vO0AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745999051; l=7327;
 i=wilfred.mallawa@wdc.com; s=20250430; h=from:subject:message-id;
 bh=NUb75iKsIETzPGTbAEgEuTM/+CXDTu6qPlclj4TgXHQ=;
 b=lNZp+VJHmjh4wYkVkCS7+XbaMTYDvOO1JXAzciWZJrGbWA2jT1JmIEe2qeFc5hOAqdkdfc+MR
 jdUAhikEGktDHEnC2cs0nkW4VAttUzdLO6eSHTNLHSss8fAQzrrvwqC
X-Developer-Key: i=wilfred.mallawa@wdc.com; a=ed25519;
 pk=DpjNSsEpzUYRunwCxBmAJ/fv9YKUmAPOIoBDL0qeAQU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_004418_812877_814FFAFE 
X-CRM114-Status: GOOD (  24.52  )
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
 drivers/pci/controller/dwc/Kconfig            |  1 +
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 89 ++++++++++++++++++++++++++-
 2 files changed, 88 insertions(+), 2 deletions(-)

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
index 3c6ab71c996ec1246954f52a9454c8ae67956a54..4c2c683d170f19266e1dfe0efde76d6feb23bf7a 100644
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
@@ -688,6 +699,80 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static int rockchip_pcie_rc_reset_slot(struct pci_host_bridge *bridge,
+				  struct pci_dev *pdev)
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
+		return ret;
+
+	ret = dw_pcie_wait_for_link(pci);
+	if (ret)
+		return ret;
+
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


