Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5546CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 21:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwbGC/K9B4U3uycXerXPSUMJfx+iuM+3b1WmPO2FpvA=; b=s6AIYsICnzM8lbezBYzUr57AaZ
	FD3PhsFurk9A+dWK791VMBtpuDuHzK0xNXLLlm0dyj/vElAHMxRy0dz9VNdx2vbLHONTUyLygwgBU
	oUiQm/208/8jqxKVFjH9FIXRMUJ+crEJYD84J89fNHtuupjQmdgcZ40FbR+3WUag+g3Q2ii1JXSII
	0aiVwpmnTSq7wQvhUbMKy8XClnHJYw6rGQrx9puceNZI9H49/L2CSKVoEcpEcxG3npVL5ruv/xbJp
	+EaXoIc9W9v1Pb887EaufzOs1GwHFT3eXd3lSgNM3BoL9F8XHZaEPxp1Lv5mSv3cyqjgznDsa1wWh
	EHx2R2Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4QU2-0000000BHJJ-2eIp;
	Thu, 02 Oct 2025 21:05:02 +0000
Received: from mail-qv1-xf64.google.com ([2607:f8b0:4864:20::f64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4QTz-0000000BHHR-3plv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 21:05:01 +0000
Received: by mail-qv1-xf64.google.com with SMTP id 6a1803df08f44-87499a3cd37so11971066d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 14:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759439098; x=1760043898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cwbGC/K9B4U3uycXerXPSUMJfx+iuM+3b1WmPO2FpvA=;
        b=CiEom0i8mdgE+2Lrh0TDdUPgVBAq7tUD9ZOAUkpDk2XwX9BK9y3Y8vlJkbg2dbOZHX
         kI6YwxpmuvJLr7IrLkg5ru2FLIvU1QLMLXxCtiOrjcZCmDIfkzAGUX6JKXoZATYf0FSc
         d5S55snuxESmWzoHRf35/snq3y948kVrq0FtF9V0DP6Hf1JUmrx5Pl7a2IhQa+P3YoPc
         Ra8KrWI+cL+4e0OHEBLb4fUPleVYo8FaNjkK1xB9HgKfCmhgc4P8r0KyQT8S7X+ulwJq
         +ZO5EylvQumAxJbOojfInA1Hy/KyUNaH3Yu2x4CexdOpkhM9cfudAG8+uF3vIn0swaml
         01IA==
X-Forwarded-Encrypted: i=1; AJvYcCW1b0bB/FW6pDvtV4rqTXAjYjjXmbHVMGg/GNA7DM8Q1IZ896gHoD81SnNgi6bCYGtN3ONWjQsuCbjFn+0W5ycJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzeI07ivsmHKGtSa0qdQ6fAoFTq42UVJNrfdz2AzMmVOltxXLTd
	xLHviHEnUahz50WhgyESWWUqw5ssIvEgmSCvK+bav4/OmNZYnML5ur7dLmLpXi41VRlEnTdbDkf
	uOsyIriyC3VtY5CNSZMllRjwKoQAMzh59C4DfEdW7hdqk8qneF/9xnGjxMl0j1ViThJhga7MaQU
	s0MRPaK1EeuAwvr+2Dv3h64K89Fqz+/bpEWJ69PjMkJFhj5QyvOuBNJRHS9OKWW8vzHZ/jpQShc
	7VNk7ff3yYm3JirfxCazm8on54=
X-Gm-Gg: ASbGncsK4P19fFKpSMOcS23FbcrEoFVlnjSVDZWEZtkLa3Zt1X3c8iXjj5SvzFAVK2U
	ItWtJT9cCQcIqGlWL3HMdkqySa97leSwfMX7QH2kFEV4mfSiurRTVJf0QMbyit1d0vgPSrX2VuE
	4P1mH5UHIWrE8qDHtBQB2vqLRHeaIi31gqChcKUiNfwQKycqgEK/oXIa2tGyZt/NvidaF7a7vtV
	1GBy5W6XzKO13f9o8xfqlty2IDmTPO7Z7LissRBDSAofOBPgXBVvj1CPvDULc1OPObVVhGcVsfT
	uSskwoB9oMOuK5rPNxtpS5F3k6NCGpFC9epDi4sBjnVDXv3MQMGvRS6otmCZ6iG8UMP5aHb+ZTX
	ql2jObiVVzI8KP7CMJLh9+eZ239qdIFnnGnk+CpcOiyeUc83ih4er/BbGYi4MuOM1mL4hSifOwj
	A=
X-Google-Smtp-Source: AGHT+IHnlqCC7Ok6BD3EB4+BH5wcIgIXTfP5FaBCLcnC2Ws9Z8BzFsmLsJ4cRln7PyqgAKmkBtGPLcGHJ2Rh
X-Received: by 2002:a05:6214:2029:b0:80c:2633:4825 with SMTP id 6a1803df08f44-879dc869b88mr11960816d6.34.1759439098209;
        Thu, 02 Oct 2025 14:04:58 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-878be42fecfsm2316116d6.36.2025.10.02.14.04.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Oct 2025 14:04:58 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-46e47d14dceso5776565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 14:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759439097; x=1760043897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwbGC/K9B4U3uycXerXPSUMJfx+iuM+3b1WmPO2FpvA=;
        b=I0Qb+/G8AsGJ3efcu2hrQMXWkjwwc5v3+nRzJG/KKaXoTAeyFyWKu5T2RyxhmrnpCW
         xlQv5ZE4h7NFNttZRjfhhtroiqv+4TPGaebV0r4v5zwjOkYocVv2s128FoaiRzXisoYm
         cj5ONi9SIRpQDmtPXAvgvJysOWYzOkFdBdGTA=
X-Forwarded-Encrypted: i=1; AJvYcCUNNp7akHkkr2LVCxvzs22gDaSeWmwDJFOdIP13JiAVcpkOVbk/N5QBtlcA2iTkz0ORqhuv92JdkBphIaC6njez@lists.infradead.org
X-Received: by 2002:a05:600c:8b22:b0:45b:4a98:91cf with SMTP id 5b1f17b1804b1-46e71102657mr4393325e9.15.1759439096531;
        Thu, 02 Oct 2025 14:04:56 -0700 (PDT)
X-Received: by 2002:a05:600c:8b22:b0:45b:4a98:91cf with SMTP id 5b1f17b1804b1-46e71102657mr4393165e9.15.1759439096023;
        Thu, 02 Oct 2025 14:04:56 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5c4c0321sm61711295e9.8.2025.10.02.14.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 14:04:55 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH 3/3] mmc: brcmstb: save and restore registers during PM
Date: Thu,  2 Oct 2025 17:04:26 -0400
Message-Id: <20251002210426.2490368-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002210426.2490368-1-kamal.dasu@broadcom.com>
References: <20251002210426.2490368-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_140500_086584_5827166D 
X-CRM114-Status: GOOD (  20.69  )
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

Added support to save and restore registers that are critical
during PM.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/host/sdhci-brcmstb.c | 124 +++++++++++++++++++++++++++++--
 1 file changed, 119 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
index 0905b316a24b..ffa602a99ab7 100644
--- a/drivers/mmc/host/sdhci-brcmstb.c
+++ b/drivers/mmc/host/sdhci-brcmstb.c
@@ -24,7 +24,9 @@
 #define BRCMSTB_MATCH_FLAGS_NO_64BIT		BIT(0)
 #define BRCMSTB_MATCH_FLAGS_BROKEN_TIMEOUT	BIT(1)
 #define BRCMSTB_MATCH_FLAGS_HAS_CLOCK_GATE	BIT(2)
-#define BRCMSTB_MATCH_FLAGS_USE_CARD_BUSY	BIT(4)
+#define BRCMSTB_MATCH_FLAGS_HAS_CFG_V1		BIT(3)
+#define BRCMSTB_MATCH_FLAGS_HAS_CFG_V2		BIT(4)
+#define BRCMSTB_MATCH_FLAGS_USE_CARD_BUSY	BIT(5)
 
 #define BRCMSTB_PRIV_FLAGS_HAS_CQE		BIT(0)
 #define BRCMSTB_PRIV_FLAGS_GATE_CLOCK		BIT(1)
@@ -38,19 +40,39 @@
 #define SDIO_CFG_OP_DLY_DEFAULT			0x80000003
 #define SDIO_CFG_CQ_CAPABILITY			0x4c
 #define SDIO_CFG_CQ_CAPABILITY_FMUL		GENMASK(13, 12)
+#define SDIO_CFG_SD_PIN_SEL			0x44
+#define SDIO_CFG_V1_SD_PIN_SEL			0x54
+#define SDIO_CFG_PHY_SW_MODE_0_RX_CTRL		0x7C
 #define SDIO_CFG_MAX_50MHZ_MODE			0x1ac
 #define SDIO_CFG_MAX_50MHZ_MODE_STRAP_OVERRIDE	BIT(31)
 #define SDIO_CFG_MAX_50MHZ_MODE_ENABLE		BIT(0)
 
+#define SDIO_BOOT_MAIN_CTL			0x0
+
 #define MMC_CAP_HSE_MASK	(MMC_CAP2_HSX00_1_2V | MMC_CAP2_HSX00_1_8V)
 /* Select all SD UHS type I SDR speed above 50MB/s */
 #define MMC_CAP_UHS_I_SDR_MASK	(MMC_CAP_UHS_SDR50 | MMC_CAP_UHS_SDR104)
 
+enum cfg_core_ver {
+	SDIO_CFG_CORE_V1 = 1,
+	SDIO_CFG_CORE_V2,
+};
+
+struct sdhci_brcmstb_saved_regs {
+	u32 sd_pin_sel;
+	u32 phy_sw_mode0_rxctrl;
+	u32 max_50mhz_mode;
+	u32 boot_main_ctl;
+};
+
 struct sdhci_brcmstb_priv {
 	void __iomem *cfg_regs;
+	void __iomem *boot_regs;
+	struct sdhci_brcmstb_saved_regs saved_regs;
 	unsigned int flags;
 	struct clk *base_clk;
 	u32 base_freq_hz;
+	void (*save_restore_regs)(struct mmc_host *mmc, int save);
 };
 
 struct brcmstb_match_priv {
@@ -60,6 +82,69 @@ struct brcmstb_match_priv {
 	const unsigned int flags;
 };
 
+static void sdhci_brcmstb_save_regs(struct mmc_host *mmc, enum cfg_core_ver ver)
+{
+	struct sdhci_host *host = mmc_priv(mmc);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_brcmstb_priv *priv = sdhci_pltfm_priv(pltfm_host);
+	struct sdhci_brcmstb_saved_regs *sr = &priv->saved_regs;
+	void __iomem *cr = priv->cfg_regs;
+	bool is_emmc = mmc->caps & MMC_CAP_NONREMOVABLE;
+
+	/* save  */
+	if (is_emmc && priv->boot_regs)
+		sr->boot_main_ctl = readl(priv->boot_regs + SDIO_BOOT_MAIN_CTL);
+
+	if (ver == SDIO_CFG_CORE_V1) {
+		sr->sd_pin_sel = readl(cr + SDIO_CFG_V1_SD_PIN_SEL);
+		return;
+	}
+
+	sr->sd_pin_sel = readl(cr + SDIO_CFG_SD_PIN_SEL);
+	sr->phy_sw_mode0_rxctrl = readl(cr + SDIO_CFG_PHY_SW_MODE_0_RX_CTRL);
+	sr->max_50mhz_mode = readl(cr + SDIO_CFG_MAX_50MHZ_MODE);
+}
+
+static void sdhci_brcmstb_restore_regs(struct mmc_host *mmc,
+						enum cfg_core_ver ver)
+{
+	struct sdhci_host *host = mmc_priv(mmc);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_brcmstb_priv *priv = sdhci_pltfm_priv(pltfm_host);
+	struct sdhci_brcmstb_saved_regs *sr = &priv->saved_regs;
+	void __iomem *cr = priv->cfg_regs;
+	bool is_emmc = mmc->caps & MMC_CAP_NONREMOVABLE;
+
+	/* restore */
+	if (is_emmc && priv->boot_regs)
+		writel(sr->boot_main_ctl, priv->boot_regs + SDIO_BOOT_MAIN_CTL);
+
+	if (ver == SDIO_CFG_CORE_V1) {
+		writel(sr->sd_pin_sel, cr + SDIO_CFG_SD_PIN_SEL);
+		return;
+	}
+
+	writel(sr->sd_pin_sel, cr + SDIO_CFG_SD_PIN_SEL);
+	writel(sr->phy_sw_mode0_rxctrl, cr + SDIO_CFG_PHY_SW_MODE_0_RX_CTRL);
+	writel(sr->max_50mhz_mode, cr + SDIO_CFG_MAX_50MHZ_MODE);
+}
+
+static void sdhci_brcmstb_save_restore_regs_v1(struct mmc_host *mmc, int save)
+{
+	if (save)
+		sdhci_brcmstb_save_regs(mmc, SDIO_CFG_CORE_V1);
+	else
+		sdhci_brcmstb_restore_regs(mmc, SDIO_CFG_CORE_V1);
+}
+
+static void sdhci_brcmstb_save_restore_regs_v2(struct mmc_host *mmc, int save)
+{
+	if (save)
+		sdhci_brcmstb_save_regs(mmc, SDIO_CFG_CORE_V2);
+	else
+		sdhci_brcmstb_restore_regs(mmc, SDIO_CFG_CORE_V2);
+}
+
 static inline void enable_clock_gating(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -300,24 +385,33 @@ static struct brcmstb_match_priv match_priv_7425 = {
 	.ops = &sdhci_brcmstb_ops,
 };
 
-static struct brcmstb_match_priv match_priv_7445 = {
+static struct brcmstb_match_priv match_priv_74371 = {
 	.flags = BRCMSTB_MATCH_FLAGS_BROKEN_TIMEOUT,
 	.ops = &sdhci_brcmstb_ops,
 };
 
+static struct brcmstb_match_priv match_priv_7445 = {
+	.flags = BRCMSTB_MATCH_FLAGS_BROKEN_TIMEOUT |
+			BRCMSTB_MATCH_FLAGS_HAS_CFG_V1,
+	.ops = &sdhci_brcmstb_ops,
+};
+
 static struct brcmstb_match_priv match_priv_72116 = {
-	.flags = BRCMSTB_MATCH_FLAGS_BROKEN_TIMEOUT,
+	.flags = BRCMSTB_MATCH_FLAGS_BROKEN_TIMEOUT |
+			BRCMSTB_MATCH_FLAGS_HAS_CFG_V1,
 	.ops = &sdhci_brcmstb_ops_72116,
 };
 
 static const struct brcmstb_match_priv match_priv_7216 = {
-	.flags = BRCMSTB_MATCH_FLAGS_HAS_CLOCK_GATE,
+	.flags = BRCMSTB_MATCH_FLAGS_HAS_CLOCK_GATE |
+			BRCMSTB_MATCH_FLAGS_HAS_CFG_V2,
 	.hs400es = sdhci_brcmstb_hs400es,
 	.ops = &sdhci_brcmstb_ops_7216,
 };
 
 static struct brcmstb_match_priv match_priv_74165b0 = {
-	.flags = BRCMSTB_MATCH_FLAGS_HAS_CLOCK_GATE,
+	.flags = BRCMSTB_MATCH_FLAGS_HAS_CLOCK_GATE |
+			BRCMSTB_MATCH_FLAGS_HAS_CFG_V2,
 	.hs400es = sdhci_brcmstb_hs400es,
 	.ops = &sdhci_brcmstb_ops_74165b0,
 };
@@ -325,6 +419,7 @@ static struct brcmstb_match_priv match_priv_74165b0 = {
 static const struct of_device_id __maybe_unused sdhci_brcm_of_match[] = {
 	{ .compatible = "brcm,bcm2712-sdhci", .data = &match_priv_2712 },
 	{ .compatible = "brcm,bcm7425-sdhci", .data = &match_priv_7425 },
+	{ .compatible = "brcm,bcm74371-sdhci", .data = &match_priv_74371 },
 	{ .compatible = "brcm,bcm7445-sdhci", .data = &match_priv_7445 },
 	{ .compatible = "brcm,bcm72116-sdhci", .data = &match_priv_72116 },
 	{ .compatible = "brcm,bcm7216-sdhci", .data = &match_priv_7216 },
@@ -441,6 +536,19 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
 	if (res)
 		goto err;
 
+	/* map non-standard BOOT registers if present */
+	if (host->mmc->caps & MMC_CAP_NONREMOVABLE) {
+		priv->boot_regs = devm_platform_get_and_ioremap_resource(pdev, 2, NULL);
+		if (IS_ERR(priv->boot_regs))
+			priv->boot_regs = NULL;
+	}
+
+	if (match_priv->flags & BRCMSTB_MATCH_FLAGS_HAS_CFG_V1)
+		priv->save_restore_regs = sdhci_brcmstb_save_restore_regs_v1;
+
+	if (match_priv->flags & BRCMSTB_MATCH_FLAGS_HAS_CFG_V2)
+		priv->save_restore_regs = sdhci_brcmstb_save_restore_regs_v2;
+
 	/*
 	 * Automatic clock gating does not work for SD cards that may
 	 * voltage switch so only enable it for non-removable devices.
@@ -533,6 +641,9 @@ static int sdhci_brcmstb_suspend(struct device *dev)
 	struct sdhci_brcmstb_priv *priv = sdhci_pltfm_priv(pltfm_host);
 	int ret;
 
+	if (priv->save_restore_regs)
+		priv->save_restore_regs(host->mmc, 1);
+
 	clk_disable_unprepare(priv->base_clk);
 	if (host->mmc->caps2 & MMC_CAP2_CQE) {
 		ret = cqhci_suspend(host->mmc);
@@ -564,6 +675,9 @@ static int sdhci_brcmstb_resume(struct device *dev)
 			ret = clk_set_rate(priv->base_clk, priv->base_freq_hz);
 	}
 
+	if (priv->save_restore_regs)
+		priv->save_restore_regs(host->mmc, 0);
+
 	if (host->mmc->caps2 & MMC_CAP2_CQE)
 		ret = cqhci_resume(host->mmc);
 
-- 
2.34.1


