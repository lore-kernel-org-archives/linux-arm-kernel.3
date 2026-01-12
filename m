Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6178ACF45D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 23:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFTXynklPXsseYm2PaltcAsjvGz58jQ3hRY9IqWMKLU=; b=aFr4GgAqjWSQ9FXXzOXsM/8rfx
	QhBpTzLUlOWSh+lv5lE2qmUdexrtqMTiTygs46uywxJxNnJHYXAoR0T0GQvJtbw5pousdU/ps8vqH
	DKfnLMhlW1Rdi+sFsAfMnJPjFzrP/zVRtEcXQfsku87//JHNjmQCIG0K848lczu3ylvq+M9HknpEh
	7GYcKUmsASfUsw+NffkdAEIcqlnV1p0A9oiMGGZFo2+KCFMIG59KTKYNtus15oDb9k9r6rJcEt4iW
	c1xoPIw88gljcsqZi8QtbwXE1TMyB88U2LuDdfq0EMBY93miennq9YDe08Q7H+spYVaS4lGfj2XDi
	1sxuafdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRE4-00000006IL1-26eI;
	Mon, 12 Jan 2026 23:21:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRDs-00000006I6R-3iUm;
	Mon, 12 Jan 2026 23:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AFTXynklPXsseYm2PaltcAsjvGz58jQ3hRY9IqWMKLU=; b=ZBd19j3eZFgOPsaBMiJY0iRgnq
	seNedLSJ/KVOywAEIGw9KyJTFIoegpHzv/GZlWqujwZGjuleDGHn1CGZC5IITlZhCLay09NiaO2KH
	XMvBJdotnTzzWm9Nq5EEfpuE//EE+01ahBbVgxyDBdKXdeIEXtDirV++yZVf9Je+z0r1W/VcOGRCM
	ZeS31N3jsASU8ixHkOEA7T5UPYXIkgR38LkPI3glLGBhd7YX3pd6bo4ZuVet4P/XWKYuhd5gaaJPb
	PrUvMujgFuDcP/l5Y8gOELJiS9WTsSlayPkowlrN3Qz9+WcsXHTdTymrAzJeua+9rlOgQZ4OV5pri
	2voV2jwA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRDg-00000001oPS-3hcN;
	Mon, 12 Jan 2026 23:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768260065;
	bh=ylqlh2mqfKMI4xnkMy0+CDeTdpdAkE0bPpilDLTbH4Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QgNAdtcyKuBWxvh6BhmCw8zYW91l3MkS/JcWoO5+52+nVcuLfKDD5UdgDXlqYgAbY
	 MrGnFZORmGx4rAFoRmCQRDLbouOL9du0V7qMNHDdRjTfRhvshWBGqmTCz7Jbbuit0P
	 tq6L7WwCib46DudjLqNcQADmjZlp0CS8gVdRZEz0xJx48Rh2u/352Ur/bDs4RyZ5AY
	 FMgZjd5xkkVanOelvSmLH7Yi4ivsrcMgzFsQEwYCpQG8pAGepwanX2bry72QbTR16k
	 ard1u/87PgtkREK9pDZD55qx24FHUvcLlAamOCk86O4SCeBfwIn4cl/ARvHTagc1oW
	 5BXkv7kcED+4A==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B733717E1525;
	Tue, 13 Jan 2026 00:21:05 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 13 Jan 2026 01:20:56 +0200
Subject: [PATCH v6 09/11] phy: rockchip: samsung-hdptx: Switch to driver
 specific HDMI config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-phy-hdptx-frl-v6-9-8d5f97419c0b@collabora.com>
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
X-CRM114-CacheID: sfid-20260112_232109_549472_0B43DFCD 
X-CRM114-Status: GOOD (  19.25  )
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

In preparation to support the FRL operation mode which gets configured
via the lanes and rate per lane tuple, switch to a driver specific
struct for configuring the link rate and bpc.

This simplifies and optimizes the implementation by allowing implicit
switches between TMDS and FRL rates, without requiring additional checks
of the active PHY mode followed by recalculations of the link rate when
operating in FRL mode.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 47 +++++++++++++----------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 6297a5171e78..f1cad0264952 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -373,6 +373,11 @@ struct rk_hdptx_phy_cfg {
 	unsigned int phy_ids[MAX_HDPTX_PHY_NUM];
 };
 
+struct rk_hdptx_hdmi_cfg {
+	unsigned long long rate;
+	unsigned int bpc;
+};
+
 struct rk_hdptx_phy {
 	struct device *dev;
 	struct regmap *regmap;
@@ -380,7 +385,7 @@ struct rk_hdptx_phy {
 
 	int phy_id;
 	struct phy *phy;
-	struct phy_configure_opts_hdmi hdmi_cfg;
+	struct rk_hdptx_hdmi_cfg hdmi_cfg;
 	struct clk_bulk_data *clks;
 	int nr_clks;
 	struct reset_control_bulk_data rsts[RST_MAX];
@@ -932,19 +937,19 @@ static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 	struct ropll_config rc = {0};
 	int i;
 
-	if (!hdptx->hdmi_cfg.tmds_char_rate)
+	if (!hdptx->hdmi_cfg.rate)
 		return 0;
 
 	for (i = 0; i < ARRAY_SIZE(rk_hdptx_tmds_ropll_cfg); i++)
-		if (hdptx->hdmi_cfg.tmds_char_rate == rk_hdptx_tmds_ropll_cfg[i].rate) {
+		if (hdptx->hdmi_cfg.rate == rk_hdptx_tmds_ropll_cfg[i].rate) {
 			cfg = &rk_hdptx_tmds_ropll_cfg[i];
 			break;
 		}
 
 	if (!cfg) {
-		if (!rk_hdptx_phy_clk_pll_calc(hdptx->hdmi_cfg.tmds_char_rate, &rc)) {
+		if (!rk_hdptx_phy_clk_pll_calc(hdptx->hdmi_cfg.rate, &rc)) {
 			dev_err(hdptx->dev, "%s cannot find pll cfg for rate=%llu\n",
-				__func__, hdptx->hdmi_cfg.tmds_char_rate);
+				__func__, hdptx->hdmi_cfg.rate);
 			return -EINVAL;
 		}
 
@@ -952,7 +957,7 @@ static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 	}
 
 	dev_dbg(hdptx->dev, "%s rate=%llu mdiv=%u sdiv=%u sdm_en=%u k_sign=%u k=%u lc=%u\n",
-		__func__, hdptx->hdmi_cfg.tmds_char_rate, cfg->pms_mdiv, cfg->pms_sdiv + 1,
+		__func__, hdptx->hdmi_cfg.rate, cfg->pms_mdiv, cfg->pms_sdiv + 1,
 		cfg->sdm_en, cfg->sdm_num_sign, cfg->sdm_num, cfg->sdm_deno);
 
 	rk_hdptx_pre_power_up(hdptx);
@@ -1001,7 +1006,7 @@ static int rk_hdptx_tmds_ropll_mode_config(struct rk_hdptx_phy *hdptx)
 
 	regmap_write(hdptx->regmap, LNTOP_REG(0200), 0x06);
 
-	if (hdptx->hdmi_cfg.tmds_char_rate > HDMI14_MAX_RATE) {
+	if (hdptx->hdmi_cfg.rate > HDMI14_MAX_RATE) {
 		/* For 1/40 bitrate clk */
 		rk_hdptx_multi_reg_write(hdptx, rk_hdptx_tmds_lntop_highbr_seq);
 	} else {
@@ -1372,19 +1377,19 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 	int ret, lane;
 
 	if (mode != PHY_MODE_DP) {
-		if (!hdptx->hdmi_cfg.tmds_char_rate) {
+		if (!hdptx->hdmi_cfg.rate) {
 			/*
 			 * FIXME: Temporary workaround to setup TMDS char rate
 			 * from the RK DW HDMI QP bridge driver.
 			 * Will be removed as soon the switch to the HDMI PHY
 			 * configuration API has been completed on both ends.
 			 */
-			hdptx->hdmi_cfg.tmds_char_rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
-			hdptx->hdmi_cfg.tmds_char_rate *= 100;
+			hdptx->hdmi_cfg.rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
+			hdptx->hdmi_cfg.rate *= 100;
 		}
 
 		dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
-			hdptx->hdmi_cfg.tmds_char_rate, hdptx->hdmi_cfg.bpc);
+			hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
 	}
 
 	ret = rk_hdptx_phy_consumer_get(hdptx);
@@ -1731,12 +1736,13 @@ static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opt
 		if (ret) {
 			dev_err(hdptx->dev, "invalid hdmi params for phy configure\n");
 		} else {
-			hdptx->hdmi_cfg = opts->hdmi;
+			hdptx->hdmi_cfg.rate = opts->hdmi.tmds_char_rate;
+			hdptx->hdmi_cfg.bpc = opts->hdmi.bpc;
 			hdptx->restrict_rate_change = true;
 		}
 
 		dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
-			hdptx->hdmi_cfg.tmds_char_rate, hdptx->hdmi_cfg.bpc);
+			hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
 		return ret;
 	}
 
@@ -1916,7 +1922,7 @@ static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
 	 * To be dropped as soon as the RK DW HDMI QP bridge driver
 	 * switches to make use of phy_configure().
 	 */
-	if (!hdptx->restrict_rate_change && req->rate != hdptx->hdmi_cfg.tmds_char_rate) {
+	if (!hdptx->restrict_rate_change && req->rate != hdptx->hdmi_cfg.rate) {
 		struct phy_configure_opts_hdmi hdmi = {
 			.tmds_char_rate = req->rate,
 		};
@@ -1925,7 +1931,7 @@ static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
 		if (ret)
 			return ret;
 
-		hdptx->hdmi_cfg = hdmi;
+		hdptx->hdmi_cfg.rate = req->rate;
 	}
 
 	/*
@@ -1933,8 +1939,7 @@ static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
 	 * hence ensure rk_hdptx_phy_clk_set_rate() won't be invoked with
 	 * a different rate argument.
 	 */
-	req->rate = DIV_ROUND_CLOSEST_ULL(hdptx->hdmi_cfg.tmds_char_rate * 8,
-					  hdptx->hdmi_cfg.bpc);
+	req->rate = DIV_ROUND_CLOSEST_ULL(hdptx->hdmi_cfg.rate * 8, hdptx->hdmi_cfg.bpc);
 
 	return 0;
 }
@@ -1945,11 +1950,11 @@ static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 	unsigned long long tmds_rate = DIV_ROUND_CLOSEST_ULL(rate * hdptx->hdmi_cfg.bpc, 8);
 
-	/* Revert any unlikely TMDS char rate change since round_rate() */
-	if (hdptx->hdmi_cfg.tmds_char_rate != tmds_rate) {
+	/* Revert any unlikely TMDS char rate change since determine_rate() */
+	if (hdptx->hdmi_cfg.rate != tmds_rate) {
 		dev_warn(hdptx->dev, "Reverting unexpected rate change from %llu to %llu\n",
-			 tmds_rate, hdptx->hdmi_cfg.tmds_char_rate);
-		hdptx->hdmi_cfg.tmds_char_rate = tmds_rate;
+			 tmds_rate, hdptx->hdmi_cfg.rate);
+		hdptx->hdmi_cfg.rate = tmds_rate;
 	}
 
 	/*

-- 
2.52.0


