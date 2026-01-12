Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB184CF45DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 23:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PedUtDSJ6SSfwM5GVd8QfI7HKn1ndiazW6iYI3eqewQ=; b=fGrTcF9IljLkXDRBNH+c0mbeLJ
	Cvdxe7mYMUGXpWFB0yTAAybdRGbRLjxkeUwWgZYHLv2oGnifbxp6Ve+rvCq5ST5JccuHY9RsDRZ+D
	OGKlymtvvNUp1eK2GQtur78eUYj68yWL65ffUpjfPCf9zNJD4EBpRv7f3n/S1A5HD9YUy7XaBLBN0
	m7Hls3CZU5UpTExe/9RlT+6p/PAT0TZhwPnaBMlHySS3z47xNHL4M6yo0cp5mrhIr8//EaF9QruHm
	eNsmUGjfI64kYtUw475C4bMIcHp3GSgUTJs2FMCXrXYjQwt9MV3chgjfFYsitDKOWWid3MPYjkzgp
	DxmVCYQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRDm-00000006I02-3pY6;
	Mon, 12 Jan 2026 23:21:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRDh-00000006Hto-1j9P;
	Mon, 12 Jan 2026 23:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PedUtDSJ6SSfwM5GVd8QfI7HKn1ndiazW6iYI3eqewQ=; b=W2WiJ4TYcLPfVkEEjwTuA/hI8k
	Y2qET0344k0erapfsn1xHRgYPSULSXVbe49iH31Nwc4lOeOxcrL4hwrDx+g/iWAB/IZRMCkl/cBqg
	d7a4ZPnQMxR+GZQ9gv7ZWRi6GIUbg8Qc5PY/2iFW0AfgnGa3NFi3CKt1I+twag6tf6KfukTsqmPZh
	dVgsZlXscnjHTnkHzHq0bZOqXjULuaWoLfNxiLlhD9xcBTHeTteYrYtZaFxWixFmT5SL/UoGjnct2
	2DDXcnIEFcKPbINHLgIMoyWAg2h4xCGgyoBcz0KUIUJHzsBOpEU3klN9/BZnYSgjhUC8LKbiGJJtE
	w9RwMalA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRDb-00000001oOV-24h4;
	Mon, 12 Jan 2026 23:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768260061;
	bh=t4G0P1G257iLLRzfcphPHbiOLK5Aw17+DfQw5nw6lvo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m91XudQjnCo+w1sfy6f/mVwGXrnKRNXcQfx4HxSLJfZudsagVFJyZGQ0zeFN9K4oa
	 r8quCNWF0xtNTii8dQMUePTIHhS85sJoKxnRJrmk3oe7TlOsP7mdBEHC94z6LWraik
	 aK1ukASetnsC6Y2Me6MFMXUmy3Di4ApZPkxoyu28+hS1TLAHRLDcSg6Q9WWVWS/vJn
	 YrZGbNmAS4mhIcOliV8ERnEMbxk+GBAe2CkgIVmfcCQ9QslEmz6raEqte+Wm/02Ui/
	 C8LUes+joRkFIRYS6u1MVL1a4U4FB0MVkpZLuk1FWzrhJPpZZIpfuC23wTbyfnQ+gJ
	 rB0VpDSMST2Gw==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A102B17E150E;
	Tue, 13 Jan 2026 00:21:01 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 13 Jan 2026 01:20:51 +0200
Subject: [PATCH v6 04/11] phy: rockchip: samsung-hdptx: Consistently use
 [rk_]hdptx_[tmds_] prefixes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-phy-hdptx-frl-v6-4-8d5f97419c0b@collabora.com>
References: <20260113-phy-hdptx-frl-v6-0-8d5f97419c0b@collabora.com>
In-Reply-To: <20260113-phy-hdptx-frl-v6-0-8d5f97419c0b@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_232103_942588_127CDD39 
X-CRM114-Status: GOOD (  16.52  )
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

Fix the naming inconsistencies for some of the functions and global
variables:

* Add the missing 'rk_hdptx_' prefix to ropll_tmds_cfg variable
* Replace '_ropll_tmds_' with '_tmds_ropll_' globally
* Replace 'hdtpx' with 'hdptx' globally

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 62 +++++++++++------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 3f8a7f4f5cd8..3c6eb6dbadd0 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -32,17 +32,17 @@
 #define HDPTX_O_PHY_RDY			BIT(1)
 #define HDPTX_O_SB_RDY			BIT(0)
 
-#define HDTPX_REG(_n, _min, _max)				\
+#define HDPTX_REG(_n, _min, _max)				\
 	(							\
 		BUILD_BUG_ON_ZERO((0x##_n) < (0x##_min)) +	\
 		BUILD_BUG_ON_ZERO((0x##_n) > (0x##_max)) +	\
 		((0x##_n) * 4)					\
 	)
 
-#define CMN_REG(n)			HDTPX_REG(n, 0000, 00a7)
-#define SB_REG(n)			HDTPX_REG(n, 0100, 0129)
-#define LNTOP_REG(n)			HDTPX_REG(n, 0200, 0229)
-#define LANE_REG(n)			HDTPX_REG(n, 0300, 062d)
+#define CMN_REG(n)			HDPTX_REG(n, 0000, 00a7)
+#define SB_REG(n)			HDPTX_REG(n, 0100, 0129)
+#define LNTOP_REG(n)			HDPTX_REG(n, 0200, 0229)
+#define LANE_REG(n)			HDPTX_REG(n, 0300, 062d)
 
 /* CMN_REG(0008) */
 #define OVRD_LCPLL_EN_MASK		BIT(7)
@@ -397,7 +397,7 @@ struct rk_hdptx_phy {
 	unsigned int lanes;
 };
 
-static const struct ropll_config ropll_tmds_cfg[] = {
+static const struct ropll_config rk_hdptx_tmds_ropll_cfg[] = {
 	/*             |              pms             |        sdm         |     sdc     | */
 	/*        rate, mdiv, mdafc, pdiv, rdiv, sdiv, en, deno, nsig, num,  n, num, deno, */
 	{ 594000000ULL,  124,   124,    1,    1,    0,  1,   62,    1,  16,  5,   0,    1, },
@@ -424,7 +424,7 @@ static const struct ropll_config ropll_tmds_cfg[] = {
 	{  25175000ULL,   84,    84,    1,    1,   15,  1,  168,    1,  16,  4,   1,    1, },
 };
 
-static const struct reg_sequence rk_hdtpx_common_cmn_init_seq[] = {
+static const struct reg_sequence rk_hdptx_common_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(0009), 0x0c),
 	REG_SEQ0(CMN_REG(000a), 0x83),
 	REG_SEQ0(CMN_REG(000b), 0x06),
@@ -514,7 +514,7 @@ static const struct reg_sequence rk_hdtpx_common_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(009b), 0x10),
 };
 
-static const struct reg_sequence rk_hdtpx_tmds_cmn_init_seq[] = {
+static const struct reg_sequence rk_hdptx_tmds_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(0008), 0x00),
 	REG_SEQ0(CMN_REG(0011), 0x01),
 	REG_SEQ0(CMN_REG(0017), 0x20),
@@ -556,14 +556,14 @@ static const struct reg_sequence rk_hdtpx_tmds_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(009b), 0x00),
 };
 
-static const struct reg_sequence rk_hdtpx_common_sb_init_seq[] = {
+static const struct reg_sequence rk_hdptx_common_sb_init_seq[] = {
 	REG_SEQ0(SB_REG(0114), 0x00),
 	REG_SEQ0(SB_REG(0115), 0x00),
 	REG_SEQ0(SB_REG(0116), 0x00),
 	REG_SEQ0(SB_REG(0117), 0x00),
 };
 
-static const struct reg_sequence rk_hdtpx_tmds_lntop_highbr_seq[] = {
+static const struct reg_sequence rk_hdptx_tmds_lntop_highbr_seq[] = {
 	REG_SEQ0(LNTOP_REG(0201), 0x00),
 	REG_SEQ0(LNTOP_REG(0202), 0x00),
 	REG_SEQ0(LNTOP_REG(0203), 0x0f),
@@ -571,7 +571,7 @@ static const struct reg_sequence rk_hdtpx_tmds_lntop_highbr_seq[] = {
 	REG_SEQ0(LNTOP_REG(0205), 0xff),
 };
 
-static const struct reg_sequence rk_hdtpx_tmds_lntop_lowbr_seq[] = {
+static const struct reg_sequence rk_hdptx_tmds_lntop_lowbr_seq[] = {
 	REG_SEQ0(LNTOP_REG(0201), 0x07),
 	REG_SEQ0(LNTOP_REG(0202), 0xc1),
 	REG_SEQ0(LNTOP_REG(0203), 0xf0),
@@ -579,7 +579,7 @@ static const struct reg_sequence rk_hdtpx_tmds_lntop_lowbr_seq[] = {
 	REG_SEQ0(LNTOP_REG(0205), 0x1f),
 };
 
-static const struct reg_sequence rk_hdtpx_common_lane_init_seq[] = {
+static const struct reg_sequence rk_hdptx_common_lane_init_seq[] = {
 	REG_SEQ0(LANE_REG(0303), 0x0c),
 	REG_SEQ0(LANE_REG(0307), 0x20),
 	REG_SEQ0(LANE_REG(030a), 0x17),
@@ -634,7 +634,7 @@ static const struct reg_sequence rk_hdtpx_common_lane_init_seq[] = {
 	REG_SEQ0(LANE_REG(0620), 0xa0),
 };
 
-static const struct reg_sequence rk_hdtpx_tmds_lane_init_seq[] = {
+static const struct reg_sequence rk_hdptx_tmds_lane_init_seq[] = {
 	REG_SEQ0(LANE_REG(0312), 0x00),
 	REG_SEQ0(LANE_REG(0412), 0x00),
 	REG_SEQ0(LANE_REG(0512), 0x00),
@@ -938,7 +938,7 @@ static bool rk_hdptx_phy_clk_pll_calc(unsigned long long rate,
 	return true;
 }
 
-static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx)
+static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 {
 	const struct ropll_config *cfg = NULL;
 	struct ropll_config rc = {0};
@@ -947,9 +947,9 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx)
 	if (!hdptx->hdmi_cfg.tmds_char_rate)
 		return 0;
 
-	for (i = 0; i < ARRAY_SIZE(ropll_tmds_cfg); i++)
-		if (hdptx->hdmi_cfg.tmds_char_rate == ropll_tmds_cfg[i].rate) {
-			cfg = &ropll_tmds_cfg[i];
+	for (i = 0; i < ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg); i++)
+		if (hdptx->hdmi_cfg.tmds_char_rate == rk_hdptx_tmds_ropll_cfg[i].rate) {
+			cfg = &rk_hdptx_tmds_ropll_cfg[i];
 			break;
 		}
 
@@ -969,8 +969,8 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx)
 
 	rk_hdptx_pre_power_up(hdptx);
 
-	rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_common_cmn_init_seq);
-	rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_cmn_init_seq);
+	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_cmn_init_seq);
+	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_tmds_cmn_init_seq);
 
 	regmap_write(hdptx->regmap, CMN_REG(0051), cfg->pms_mdiv);
 	regmap_write(hdptx->regmap, CMN_REG(0055), cfg->pms_mdiv_afc);
@@ -1012,25 +1012,25 @@ static int rk_hdptx_ropll_tmds_cmn_config(struct rk_hdptx_phy *hdptx)
 	return ret;
 }
 
-static int rk_hdptx_ropll_tmds_mode_config(struct rk_hdptx_phy *hdptx)
+static int rk_hdptx_tmds_ropll_mode_config(struct rk_hdptx_phy *hdptx)
 {
-	rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_common_sb_init_seq);
+	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_sb_init_seq);
 
 	regmap_write(hdptx->regmap, LNTOP_REG(0200), 0x06);
 
 	if (hdptx->hdmi_cfg.tmds_char_rate > HDMI14_MAX_RATE) {
 		/* For 1/40 bitrate clk */
-		rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_lntop_highbr_seq);
+		rk_hdptx_multi_reg_write(hdptx, rk_hdptx_tmds_lntop_highbr_seq);
 	} else {
 		/* For 1/10 bitrate clk */
-		rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_lntop_lowbr_seq);
+		rk_hdptx_multi_reg_write(hdptx, rk_hdptx_tmds_lntop_lowbr_seq);
 	}
 
 	regmap_write(hdptx->regmap, LNTOP_REG(0206), 0x07);
 	regmap_write(hdptx->regmap, LNTOP_REG(0207), 0x0f);
 
-	rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_common_lane_init_seq);
-	rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_lane_init_seq);
+	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_common_lane_init_seq);
+	rk_hdptx_multi_reg_write(hdptx, rk_hdptx_tmds_lane_init_seq);
 
 	return rk_hdptx_post_enable_lane(hdptx);
 }
@@ -1089,7 +1089,7 @@ static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx)
 	if (mode == PHY_MODE_DP) {
 		rk_hdptx_dp_reset(hdptx);
 	} else {
-		ret = rk_hdptx_ropll_tmds_cmn_config(hdptx);
+		ret = rk_hdptx_tmds_ropll_cmn_config(hdptx);
 		if (ret)
 			goto dec_usage;
 	}
@@ -1436,7 +1436,7 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 		regmap_write(hdptx->grf, GRF_HDPTX_CON0,
 			     HDPTX_MODE_SEL << 16 | FIELD_PREP(HDPTX_MODE_SEL, 0x0));
 
-		ret = rk_hdptx_ropll_tmds_mode_config(hdptx);
+		ret = rk_hdptx_tmds_ropll_mode_config(hdptx);
 		if (ret)
 			rk_hdptx_phy_consumer_put(hdptx, true);
 	}
@@ -1459,11 +1459,11 @@ static int rk_hdptx_phy_verify_hdmi_config(struct rk_hdptx_phy *hdptx,
 	if (!hdmi->tmds_char_rate || hdmi->tmds_char_rate > HDMI20_MAX_RATE)
 		return -EINVAL;
 
-	for (i = 0; i < ARRAY_SIZE(ropll_tmds_cfg); i++)
-		if (hdmi->tmds_char_rate == ropll_tmds_cfg[i].rate)
+	for (i = 0; i < ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg); i++)
+		if (hdmi->tmds_char_rate == rk_hdptx_tmds_ropll_cfg[i].rate)
 			break;
 
-	if (i == ARRAY_SIZE(ropll_tmds_cfg) &&
+	if (i == ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg) &&
 	    !rk_hdptx_phy_clk_pll_calc(hdmi->tmds_char_rate, NULL))
 		return -EINVAL;
 
@@ -1891,7 +1891,7 @@ static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	 * while the latter being executed only once, i.e. when clock remains
 	 * in the prepared state during rate changes.
 	 */
-	return rk_hdptx_ropll_tmds_cmn_config(hdptx);
+	return rk_hdptx_tmds_ropll_cmn_config(hdptx);
 }
 
 static const struct clk_ops hdptx_phy_clk_ops = {

-- 
2.52.0


