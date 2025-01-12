Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224F0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 09:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+b5mPw0njIVRk8eDzDfK3kc9XYfeGBfYoL5g0zXa9Lk=; b=HzeN+oJNAdmobqG5u9T7kDcAHJ
	fTHbi+MpgKommGhvlWNWRn4IkPON28gOH0BzEk+6tTXJKl7G1T0h5t/7TBOaO8g1V6DdkW9I/PJvH
	nXkAWmZNMZN40JmdFdUkjumlBNupo53aoBJChmGk+Vr6MdW5gxoRXSi3lS5E+uIr3vqtjE+aVtC3s
	N/2C1IhtAQhm69L/z4cML654Q+fWI+HvCpZ0gO8Qteti5mEksxOOJ7OozLXyqJsNUTiVh5e29A4hR
	ULE0IwzI0xZRHwejMrnMgP7LfiN81ivskdFoEnwOK+C1h99mL9WDu97gOcp4kmxTV1kYtLnycurc7
	hMSt/A9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWu1Z-00000002PGq-3ovJ;
	Sun, 12 Jan 2025 09:12:49 +0000
Received: from mail-m49234.qiye.163.com ([45.254.49.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWtwh-00000002OZK-12e4;
	Sun, 12 Jan 2025 09:07:48 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 870092ac;
	Sun, 12 Jan 2025 17:07:43 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rfoss@kernel.org,
	vkoul@kernel.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	l.stach@pengutronix.de,
	dmitry.baryshkov@linaro.org,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	algea.cao@rock-chips.com,
	kever.yang@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v1 3/6] phy: phy-rockchip-samsung-hdptx: Add the '_MASK' suffix to all registers
Date: Sun, 12 Jan 2025 17:07:11 +0800
Message-Id: <20250112090714.1564158-4-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250112090714.1564158-1-damon.ding@rock-chips.com>
References: <20250112090714.1564158-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ05IQlZJGEpLQk0fShhITUxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9459c4e45003a3kunm870092ac
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OCo6FAw4HDISTAMhFx0MIRc6
	Fg0aFBBVSlVKTEhNTUxJQ01PQkxPVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFNS01DNwY+
DKIM-Signature: a=rsa-sha256;
	b=d6mn6hP7Oe9CWWM5yX+x2HYkuDiZIeEvaLEici9gxfDSQrOcHz0ieZ04qRoH943B6uoORoHvmgNqweeqXpYlpQbA/eCxM5dqFmgOHKyJF71HdLw4WmKfIwSLzQaGEIGEgmSMnHoYlr/tH5vdctTOhbz3+c15kKkgdOGDxVN+WIY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=+b5mPw0njIVRk8eDzDfK3kc9XYfeGBfYoL5g0zXa9Lk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_010747_490273_C1AB9064 
X-CRM114-Status: UNSURE (   8.36  )
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


