Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB30C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 11:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uK63oZ4i0F32jSJA2To/0D+4/gNLK+p7bUQFW8Uf4/I=; b=q3K5xUXoNs9EIn4WAQtkMXczXk
	wa8MUyFhLcdygZjqtzf+LUWqVphnFq+PJVT/G1x+jTRCkgVfUGKbvsdBJTQJ9fJAor/ZA7qTX54eP
	TxvEG8yRAObXuOs71gGjL6KlArdc6cOB0mr0jLHBt8CLOJ6DbOLRRDMFtD74nkApHNT3a4GupqdNk
	KU3SAozMGhd8+M+7Kj+FTPUHil0jimIQfVayvI0kBRgufFqEUCprMgsaSIRzjoDJ+rgJERpHb+5Jf
	O/EOe+86q/2j0z1ooEzRsVN3ezgI41UB6j+teMYjWH8yKhhBfS40qepZF/z2ffzB1ZLJm4EO+Mey7
	GbgF8lYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfd8K-00000002yxb-1Z5h;
	Wed, 05 Feb 2025 10:59:52 +0000
Received: from mail-m19731110.qiye.163.com ([220.197.31.110])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfd1h-00000002xGt-3O06;
	Wed, 05 Feb 2025 10:53:03 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id a3bebbbe;
	Wed, 5 Feb 2025 18:52:57 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	heiko@sntech.de
Cc: dmitry.baryshkov@linaro.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 3/4] phy: phy-rockchip-samsung-hdptx: Add the '_MASK' suffix to all registers
Date: Wed,  5 Feb 2025 18:51:56 +0800
Message-Id: <20250205105157.580060-4-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205105157.580060-1-damon.ding@rock-chips.com>
References: <20250205105157.580060-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRlPSFZISE9OTE8ZT0kfQxhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94d5bddcd303a3kunma3bebbbe
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NSo6Tww5GjIUPApDA00pGDg2
	Pg4wClZVSlVKTEhDTE5JTExDT09DVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFNSkNMNwY+
DKIM-Signature: a=rsa-sha256;
	b=YFHAj99l/XRrrk/fFHkPAqifCWw5mHhR1wC3obDAwyMTFI/ub5GmnWxC9z5nCEI0SqozZd1USekdlLpBELZ6mICs9z2ifxnpKQVGE1y/KDrS7oZNTmD1EMmZVPeSSBRYos3GZ87dWNHY3jgT0FWJpHhpRANVxOBCdlCGrDJXkVA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=uK63oZ4i0F32jSJA2To/0D+4/gNLK+p7bUQFW8Uf4/I=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_025302_017680_C93D8418 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

Adding the '_MASK' suffix to all registers in order to ensures consistency
in the naming convention for register macros throughout the file.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---

Changes in v4:
- Split the older patch related to the renaming of registers into three
  different commits
---
 .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 88 +++++++++----------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 423c61b7469f..5aec854c74b5 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -50,60 +50,60 @@
 #define LCPLL_PI_EN_MASK		BIT(5)
 #define LCPLL_100M_CLK_EN_MASK		BIT(0)
 /* CMN_REG(0025) */
-#define LCPLL_PMS_IQDIV_RSTN		BIT(4)
+#define LCPLL_PMS_IQDIV_RSTN_MASK	BIT(4)
 /* CMN_REG(0028) */
-#define LCPLL_SDC_FRAC_EN		BIT(2)
-#define LCPLL_SDC_FRAC_RSTN		BIT(0)
+#define LCPLL_SDC_FRAC_EN_MASK		BIT(2)
+#define LCPLL_SDC_FRAC_RSTN_MASK	BIT(0)
 /* CMN_REG(002d) */
 #define LCPLL_SDC_N_MASK		GENMASK(3, 1)
 /* CMN_REG(002e) */
 #define LCPLL_SDC_NUMBERATOR_MASK	GENMASK(5, 0)
 /* CMN_REG(002f) */
 #define LCPLL_SDC_DENOMINATOR_MASK	GENMASK(7, 2)
-#define LCPLL_SDC_NDIV_RSTN		BIT(0)
+#define LCPLL_SDC_NDIV_RSTN_MASK	BIT(0)
 /* CMN_REG(003d) */
-#define ROPLL_LCVCO_EN			BIT(4)
+#define ROPLL_LCVCO_EN_MASK		BIT(4)
 /* CMN_REG(004e) */
-#define ROPLL_PI_EN			BIT(5)
+#define ROPLL_PI_EN_MASK		BIT(5)
 /* CMN_REG(005c) */
-#define ROPLL_PMS_IQDIV_RSTN		BIT(5)
+#define ROPLL_PMS_IQDIV_RSTN_MASK	BIT(5)
 /* CMN_REG(005e) */
 #define ROPLL_SDM_EN_MASK		BIT(6)
-#define ROPLL_SDM_FRAC_EN_RBR		BIT(3)
-#define ROPLL_SDM_FRAC_EN_HBR		BIT(2)
-#define ROPLL_SDM_FRAC_EN_HBR2		BIT(1)
-#define ROPLL_SDM_FRAC_EN_HBR3		BIT(0)
+#define ROPLL_SDC_FRAC_EN_RBR_MASK	BIT(3)
+#define ROPLL_SDC_FRAC_EN_HBR_MASK	BIT(2)
+#define ROPLL_SDC_FRAC_EN_HBR2_MASK	BIT(1)
+#define ROPLL_SDM_FRAC_EN_HBR3_MASK	BIT(0)
 /* CMN_REG(0064) */
 #define ROPLL_SDM_NUM_SIGN_RBR_MASK	BIT(3)
 /* CMN_REG(0069) */
 #define ROPLL_SDC_N_RBR_MASK		GENMASK(2, 0)
 /* CMN_REG(0074) */
-#define ROPLL_SDC_NDIV_RSTN		BIT(2)
-#define ROPLL_SSC_EN			BIT(0)
+#define ROPLL_SDC_NDIV_RSTN_MASK	BIT(2)
+#define ROPLL_SSC_EN_MASK		BIT(0)
 /* CMN_REG(0081) */
-#define OVRD_PLL_CD_CLK_EN		BIT(8)
-#define ANA_PLL_CD_HSCLK_EAST_EN	BIT(0)
+#define OVRD_PLL_CD_CLK_EN_MASK		BIT(8)
+#define ANA_PLL_CD_HSCLK_EAST_EN_MASK	BIT(0)
 /* CMN_REG(0086) */
 #define PLL_PCG_POSTDIV_SEL_MASK	GENMASK(7, 4)
 #define PLL_PCG_CLK_SEL_MASK		GENMASK(3, 1)
-#define PLL_PCG_CLK_EN			BIT(0)
+#define PLL_PCG_CLK_EN_MASK		BIT(0)
 /* CMN_REG(0087) */
-#define ANA_PLL_FRL_MODE_EN		BIT(3)
-#define ANA_PLL_TX_HS_CLK_EN		BIT(2)
+#define ANA_PLL_FRL_MODE_EN_MASK	BIT(3)
+#define ANA_PLL_TX_HS_CLK_EN_MASK	BIT(2)
 /* CMN_REG(0089) */
-#define LCPLL_ALONE_MODE		BIT(1)
+#define LCPLL_ALONE_MODE_MASK		BIT(1)
 /* CMN_REG(0097) */
-#define DIG_CLK_SEL			BIT(1)
+#define DIG_CLK_SEL_MASK		BIT(1)
 #define LCPLL_REF			BIT(1)
 #define ROPLL_REF			0
 /* CMN_REG(0099) */
-#define CMN_ROPLL_ALONE_MODE		BIT(2)
+#define CMN_ROPLL_ALONE_MODE_MASK	BIT(2)
 #define ROPLL_ALONE_MODE		BIT(2)
 /* CMN_REG(009a) */
-#define HS_SPEED_SEL			BIT(0)
+#define HS_SPEED_SEL_MASK		BIT(0)
 #define DIV_10_CLOCK			BIT(0)
 /* CMN_REG(009b) */
-#define IS_SPEED_SEL			BIT(4)
+#define LS_SPEED_SEL_MASK		BIT(4)
 #define LINK_SYMBOL_CLOCK		BIT(4)
 #define LINK_SYMBOL_CLOCK1_2		0
 
@@ -161,36 +161,36 @@
 #define SB_READY_MASK			BIT(4)
 
 /* LNTOP_REG(0200) */
-#define PROTOCOL_SEL			BIT(2)
+#define PROTOCOL_SEL_MASK		BIT(2)
 #define HDMI_MODE			BIT(2)
 #define HDMI_TMDS_FRL_SEL		BIT(1)
 /* LNTOP_REG(0206) */
-#define DATA_BUS_SEL			BIT(0)
+#define DATA_BUS_WIDTH_SEL_MASK		BIT(0)
 #define DATA_BUS_36_40			BIT(0)
 /* LNTOP_REG(0207) */
-#define LANE_EN				0xf
+#define LANE_EN_MASK			0xf
 #define ALL_LANE_EN			0xf
 
 /* LANE_REG(0312) */
-#define LN0_TX_SER_RATE_SEL_RBR		BIT(5)
-#define LN0_TX_SER_RATE_SEL_HBR		BIT(4)
-#define LN0_TX_SER_RATE_SEL_HBR2	BIT(3)
-#define LN0_TX_SER_RATE_SEL_HBR3	BIT(2)
+#define LN0_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
+#define LN0_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
+#define LN0_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
+#define LN0_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
 /* LANE_REG(0412) */
-#define LN1_TX_SER_RATE_SEL_RBR		BIT(5)
-#define LN1_TX_SER_RATE_SEL_HBR		BIT(4)
-#define LN1_TX_SER_RATE_SEL_HBR2	BIT(3)
-#define LN1_TX_SER_RATE_SEL_HBR3	BIT(2)
+#define LN1_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
+#define LN1_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
+#define LN1_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
+#define LN1_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
 /* LANE_REG(0512) */
-#define LN2_TX_SER_RATE_SEL_RBR		BIT(5)
-#define LN2_TX_SER_RATE_SEL_HBR		BIT(4)
-#define LN2_TX_SER_RATE_SEL_HBR2	BIT(3)
-#define LN2_TX_SER_RATE_SEL_HBR3	BIT(2)
+#define LN2_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
+#define LN2_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
+#define LN2_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
+#define LN2_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
 /* LANE_REG(0612) */
-#define LN3_TX_SER_RATE_SEL_RBR		BIT(5)
-#define LN3_TX_SER_RATE_SEL_HBR		BIT(4)
-#define LN3_TX_SER_RATE_SEL_HBR2	BIT(3)
-#define LN3_TX_SER_RATE_SEL_HBR3	BIT(2)
+#define LN3_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
+#define LN3_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
+#define LN3_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
+#define LN3_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
 
 #define HDMI20_MAX_RATE			600000000
 
@@ -813,8 +813,8 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx,
 	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_POSTDIV_SEL_MASK,
 			   FIELD_PREP(PLL_PCG_POSTDIV_SEL_MASK, cfg->pms_sdiv));
 
-	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_EN,
-			   PLL_PCG_CLK_EN);
+	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_EN_MASK,
+			   FIELD_PREP(PLL_PCG_CLK_EN_MASK, 0x1));
 
 	return rk_hdptx_post_enable_pll(hdptx);
 }
-- 
2.34.1


