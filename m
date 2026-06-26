Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E401ACDE012
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3/Tou2Y2bkgqurZkBs8ONUNyfbAU/Y1H2i6z9bjz4A=; b=wknVG3Ipptim3fllYMSXs8JkMp
	fuvGMszO2nuGgPqsfeIyaEUhIx/g3VUcO0RSjS7O1Eder0pfbQ4/5e2REUmKcjDdZFCoNVWzFDWfm
	J9BKFGCdydJ/bgRJI7R1OxCQTH41GLcEJL+shHXVwVaKR/dCyXeNS/9V34NJdDasDV9XQ0xaBpjvP
	9q1UQj7hE2sqJA+KfVa7XsQtTcs0pUVW6UjJi7FHH58Cb+0/wsfxGZ08uM5iiRbJtS6RjcuDbrg0G
	y+X65T6lsWXSmm1l2OA0Kyi6vGOmAL4wgjEL7RcB0/ITEMkn/05hYwJj6q/g9Bv9Ryow6PerDTBQ2
	14Eil2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2k2-0000000AxnZ-1ETk;
	Fri, 26 Jun 2026 09:20:54 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2jz-0000000Axig-0sVg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:20:52 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-46db3c9a9e0so425690f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 02:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782465649; x=1783070449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3/Tou2Y2bkgqurZkBs8ONUNyfbAU/Y1H2i6z9bjz4A=;
        b=NFVrQPTToQDdKKs2mF0FdXNTFmZkHgzsmoYYJBYEjCtPiNnYHgxD7v4pgChaA0UUb8
         iaOPIyQ2AzUk+g7ooyKPcZDF6GuwRDXkUeQWRnJsMbk3GMhqibgtCvgU70EDrvgX1V9S
         ZNAHfHI0TWmL8Vb5aOkQn38E8bn23zGvWI5wZMqQP5BXXsl6QZL6Ou4K9/SD41+Ad8RQ
         SUt9nw6bm/vAEZNuFid4XJbPoZaUNTqaxYI4R7FWNidkOn22psZQfQ7dHXwrVxaEwzX8
         1vw90RORL+Wc8Jp+NToRircbdTMF5ohzMMHIMfTR2U8XjxO6xFEcyUGbFTiUZ5vFtRuG
         fSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465649; x=1783070449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d3/Tou2Y2bkgqurZkBs8ONUNyfbAU/Y1H2i6z9bjz4A=;
        b=qk0HzpRv099NwfMwkVKMKn3l3ZXpZVdN+KOBYvA7feZUTYEl0M8m5Vb6U+tKbFlfkP
         84eo1ROTAEvHlJN4fr2xmTzhEMGcYS1ZsLBghJd0DpFcr7kQchURcqMqF3Pnh0bWgLhN
         amycS9mk7MwMdliE72zqyVYuRBD/Ox5IwyX58wwX8laVFJ7E4+BdOYNvytrOkYrKPrgS
         KYTiPAcKI/LOcTlao2EOzMGa10q7zjZidObEh89hGWd1Cbil4eVZZU4hSAe1Q8t+p4ch
         3bUP9BPv8W0iB9QDEvC+QOdW56w/r/+lY5cqHHQa4HB/7tJr40rQnZUxQfCJdXDu+eNz
         dNSw==
X-Forwarded-Encrypted: i=1; AHgh+RpZ5Rfm39SvyrRXh5GFaFAS5fbVXn29fR0mj6NLsrg1p3TzXtfQkj/0WsMtgs09qGpshCkQt3VItAkbjq2zwUD+@lists.infradead.org
X-Gm-Message-State: AOJu0YyDGQSd/EMSzP/Mr7yneVRLGS3GUd9xdwZuz8oOXoKEeG155mqa
	oCco5/K+qLknk1Im9UTRjqd8eqo5uCn8L2WqxkaxB01kFLVom6yUBKkg
X-Gm-Gg: AfdE7cmRzaIuRpVAMQJoTXc3qAWk7IlA5ZkvVesy8sLOlJamD45iMf9+5tD3LIxqZeT
	bLfyDdPfjdjutx+d1PtqFaz+1CzmTYHhB4ULHg97X8aRCGgBXI8cxDXGeUcSeZ4hyJ27oJzlm5z
	xFvLC+oINx1OWqaBNbCSHgeSzL1p6DP/rpifu+r4b2jcVRmhR/uI9KXnPIeqth3XxhBB+619ySl
	aYDqFzl64qPj0jgDoPShuXC/OPTCu896BUWD6dSHSDYY6r875l/+cUyrjpggJbsNQBUozXKTioR
	kYgxbFkQyVxd+dgic9MVWl2us6wvoO4wjgFkcY6rx8hsYJUBcjrvmVfy4cvWwgNTMipqqfW5yd9
	gsLQx15Ql4rfzg3kPZDFlbI3twWYENaqDBOqb5YcKR/+kR99Qey153PEASXNlABJtJpU1v6k7zo
	BxvbEpj429wLz4DO3xvN1cyOoY/zc3a4ABd+meIVS7ukhNJHiMFiQTIFGd2gjaPnEeXgxd+obl1
	agprUEV15I4
X-Received: by 2002:a05:6000:454a:b0:46d:d5f9:d170 with SMTP id ffacd0b85a97d-46dd5f9d3a6mr6557284f8f.46.1782465649353;
        Fri, 26 Jun 2026 02:20:49 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-46e6167c05fsm9094388f8f.25.2026.06.26.02.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:20:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581
Date: Fri, 26 Jun 2026 11:20:28 +0200
Message-ID: <20260626092029.3525264-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260626092029.3525264-1-ansuelsmth@gmail.com>
References: <20260626092029.3525264-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_022051_301168_BE5684E0 
X-CRM114-Status: GOOD (  25.23  )
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

The Airoha AN7581 SoC supports configuring the first PCIe0 line to 2-lanes
mode by bonding it with the second PCIe line. This is done by configuring
the PCIe MUX in the SCU register.

To correctly configure the line for 2-lanes mode, it's required to define
in DT an additional reg, 'sec-pcie-mac' for the secondary PCIe.
It's also needed to define the additional reset and the PERSTOUT reset.
Also 'airoha,scu' property is mandatory to correctly configure the SCU
register for the PCIe MUX.

Finally to toggle 2-lanes mode, it's needed to define in DT 'num-lanes' as
2.

In such configuration the EQ preset are configured to the same values.

To permit correct configuration of the PCIe line, additional logic is added
to assert and deassert the PERSTOUT resets.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 101 ++++++++++++++++----
 1 file changed, 82 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b0accd828589..14893cff135a 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -32,6 +32,11 @@
 
 #include "../pci.h"
 
+/* AN7581 SCU register */
+#define SCU_PCIC			0x88
+#define SCU_PCIC_PCIE_CTRL		GENMASK(7, 0)
+
+/* PCIe register */
 #define PCIE_BASE_CFG_REG		0x14
 #define PCIE_BASE_CFG_SPEED		GENMASK(15, 8)
 
@@ -131,6 +136,7 @@
 #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
 
 #define MAX_NUM_PHY_RESETS		3
+#define MAX_NUM_PERSTOUT_RESETS		2
 
 #define PCIE_MTK_RESET_TIME_US		10
 
@@ -203,9 +209,11 @@ struct mtk_msi_set {
 struct mtk_gen3_pcie {
 	struct device *dev;
 	void __iomem *base;
+	void __iomem *sec_base;
 	phys_addr_t reg_base;
 	struct reset_control *mac_reset;
 	struct reset_control_bulk_data phy_resets[MAX_NUM_PHY_RESETS];
+	struct reset_control_bulk_data perstout_resets[MAX_NUM_PERSTOUT_RESETS];
 	struct phy *phy;
 	struct clk_bulk_data *clks;
 	int num_clks;
@@ -928,6 +936,14 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get PHY bulk reset\n");
 
+	pcie->perstout_resets[0].id = "perstout";
+	pcie->perstout_resets[1].id = "sec-perstout";
+
+	ret = devm_reset_control_bulk_get_optional_exclusive(dev, MAX_NUM_PERSTOUT_RESETS,
+							     pcie->perstout_resets);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get PERSTOUT bulk reset\n");
+
 	pcie->mac_reset = devm_reset_control_get_optional_exclusive(dev, "mac");
 	if (IS_ERR(pcie->mac_reset))
 		return dev_err_probe(dev, PTR_ERR(pcie->mac_reset), "failed to get MAC reset\n");
@@ -949,18 +965,38 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 			pcie->num_lanes = num_lanes;
 	}
 
+	/* Map secondary PCIe for 2-lanes mode for EN7581 */
+	if (num_lanes == 2 && device_is_compatible(dev, "airoha,en7581-pcie")) {
+		regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sec-pcie-mac");
+		if (!regs)
+			return -EINVAL;
+		pcie->sec_base = devm_ioremap_resource(dev, regs);
+		if (IS_ERR(pcie->sec_base))
+			return dev_err_probe(dev, PTR_ERR(pcie->sec_base), "failed to map secondary register base\n");
+	}
+
 	return 0;
 }
 
 static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 {
 	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
+	unsigned int num_lanes = max(1, pcie->num_lanes);
+	struct regmap *pbus_regmap, *scu;
 	struct device *dev = pcie->dev;
 	struct resource_entry *entry;
-	struct regmap *pbus_regmap;
 	u32 val, args[2], size;
 	resource_size_t addr;
-	int err;
+	int i, err;
+
+	if (num_lanes > 2)
+		return dev_err_probe(dev, -EINVAL, "unsupported num-lanes, maximum 2 lanes supported\n");
+
+	if (num_lanes == 2) {
+		scu = syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,scu");
+		if (IS_ERR(scu))
+			return dev_err_probe(dev, PTR_ERR(scu), "failed to map SCU regmap\n");
+	}
 
 	/*
 	 * The controller may have been left out of reset by the bootloader
@@ -992,6 +1028,19 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	size = lower_32_bits(resource_size(entry->res));
 	regmap_write(pbus_regmap, args[1], GENMASK(31, __fls(size)));
 
+	/* Assert PERSTOUT for all relevant lines */
+	err = reset_control_bulk_assert(MAX_NUM_PERSTOUT_RESETS,
+					pcie->perstout_resets);
+	if (err) {
+		dev_err(dev, "failed to assert PERSTOUTs\n");
+		return err;
+	}
+
+	/* Configure SCU MUX to disable PCIE1 for 2 lines mode */
+	if (num_lanes == 2)
+		regmap_update_bits(scu, SCU_PCIC, SCU_PCIC_PCIE_CTRL,
+				   FIELD_PREP(SCU_PCIC_PCIE_CTRL, BIT(1)));
+
 	/*
 	 * Unlike the other MediaTek Gen3 controllers, the Airoha EN7581
 	 * requires PHY initialization and power-on before PHY reset deassert.
@@ -1024,33 +1073,47 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-	val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
-	      FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
-	      FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
-	      FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
-	writel_relaxed(val, pcie->base + PCIE_EQ_PRESET_01_REG);
-
-	val = PCIE_K_PHYPARAM_QUERY | PCIE_K_QUERY_TIMEOUT |
-	      FIELD_PREP(PCIE_K_PRESET_TO_USE_16G, 0x80) |
-	      FIELD_PREP(PCIE_K_PRESET_TO_USE, 0x2) |
-	      FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
-	writel_relaxed(val, pcie->base + PCIE_PIPE4_PIE8_REG);
-
 	err = clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
 	if (err) {
 		dev_err(dev, "failed to prepare clock\n");
 		goto err_clk_prepare_enable;
 	}
 
-	/*
-	 * Airoha EN7581 performs PCIe reset via clk callbacks since it has a
-	 * hw issue with PCIE_PE_RSTB signal. Add wait for the time needed to
-	 * complete the PCIe reset.
-	 */
+	/* Wait for refclk to stabilize */
 	msleep(PCIE_T_PVPERL_MS);
 
+	/* Configure all the lines to the same EQ config */
+	for (i = 0; i < num_lanes; i++) {
+		void __iomem *base = pcie->base;
+
+		if (i == 1)
+			base = pcie->sec_base;
+
+		val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
+			FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
+			FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
+			FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
+		writel_relaxed(val, base + PCIE_EQ_PRESET_01_REG);
+
+		val = PCIE_K_PHYPARAM_QUERY | PCIE_K_QUERY_TIMEOUT |
+			FIELD_PREP(PCIE_K_PRESET_TO_USE_16G, 0x80) |
+			FIELD_PREP(PCIE_K_PRESET_TO_USE, 0x2) |
+			FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
+		writel_relaxed(val, base + PCIE_PIPE4_PIE8_REG);
+	}
+
+	/* Deassert PERSTOUT for all relevant lines */
+	err = reset_control_bulk_deassert(MAX_NUM_PERSTOUT_RESETS,
+					  pcie->perstout_resets);
+	if (err) {
+		dev_err(dev, "failed to deassert PERSTOUTs\n");
+		goto err_perstout_deassert;
+	}
+
 	return 0;
 
+err_perstout_deassert:
+	clk_bulk_disable_unprepare(pcie->num_clks, pcie->clks);
 err_clk_prepare_enable:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
-- 
2.53.0


