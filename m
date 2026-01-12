Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D965CF45D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 23:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esATcOkCbjA9eI6BTSPcL6i1wZQ6NjofOkzIEkkkXz4=; b=oxFxLxrROQ8bRjCBAxHMNPTdZh
	gIWCxa+xU92wiBvzOK0twEUcUG15589bK80OMxlO7rzFN2tQ3pdXLLTvY1gKFtT4P0biAkrhEgE/Q
	Oy5DYFIGR9aKbZrXaBT0SWhp966LhN6W/ERs95EwNIwJD90NVIOKSkl89/f1eVik6L0niNiXtG70f
	KNhtqzbahvQjo9SBxdb/Y57vCLk1V8m5p0YSUrgh7DPZffYLN8QyrWv4Spkvnu8U9/vRsh7XV1xv2
	8TEWjn5Wama+lqZaq4bKc6aTO2bYmPkxcnsywc1MEdsfObfC5b+VXd2zirRld6VDrXiuWRKbKTd+J
	Py0wtn3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRE3-00000006IIr-1fHi;
	Mon, 12 Jan 2026 23:21:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRDs-00000006I6N-3Wqm;
	Mon, 12 Jan 2026 23:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=esATcOkCbjA9eI6BTSPcL6i1wZQ6NjofOkzIEkkkXz4=; b=nOrN5Ly9lAyVyDn95419xScfx5
	GsUKpeGUTmwkV2oR+Cddjc74XGlTfYMjengSPVfNQiYfEU6t6F7RtXr/9Vf5vOlshOkm9LI59zbWt
	f9fjtBq2Gz/843ezZpB5xphghkjspx51aUYuJuFbJnCcJw4fxvxVbUukusja3Fq2VAwjEhUZpGMQm
	jLAr6wWx8Ayrv1qgC7u2O00E10F3+qDB/oDUiCidjMQLWCwxLVvEVnHxK39cciK+EciHgBFYvvStr
	kThF9bC+xYDnbmofXOmx8w1+uPZtL+yytigbNdLu/M3e1Nb0Dt7LLa2jV4EGonYSQ5nJ/EHqBj5+C
	3jAmSvMw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfRDg-00000001oPR-3XhR;
	Mon, 12 Jan 2026 23:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768260065;
	bh=yhHswPhK8Uv+ThYv0TpEvbUInvVl/XTpXkzaWxs8TNI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S7w0Kfx0vPtbQYVk3/CXXqN48x7Kzr7LV8rmBl+4oS/MIWJg1L31NSqYchdQGLvDt
	 ncj7gJJiKQo56HSZGt7qjDNkrqQu5L6E+95ALwatvMjYFTAnncznjBxeu8W4b+xpYb
	 2O2mboQ7uQytXqI/vXZXyGHTbG6dnH/9WGo+QB7RTnp9yx3prlKFKQ3/qJn8lXOH01
	 YNBPqrEKGdLHW87FncJuUwTCFxm0mK/cVbWSyZ3EuxbYDsWb0WBd2Vy41qK7wDvLQB
	 v3/cPXlnoOz2HoLsYQSm6sjLwyvWlX7GerH9ErSJhuLy9Tdl93D5WENisJjrFdwZs2
	 +938MaULX1ewA==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E69A117E0E30;
	Tue, 13 Jan 2026 00:21:04 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 13 Jan 2026 01:20:55 +0200
Subject: [PATCH v6 08/11] phy: rockchip: samsung-hdptx: Drop hw_rate driver
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-phy-hdptx-frl-v6-8-8d5f97419c0b@collabora.com>
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
X-CRM114-CacheID: sfid-20260112_232109_435627_13B037C8 
X-CRM114-Status: GOOD (  13.75  )
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

The ->hw_rate member of struct rk_hdptx_phy was mainly used to keep
track of the clock rate programmed in hardware and support implementing
the ->recalc_rate() callback in hdptx_phy_clk_ops.

Computing the clock rate from the actual PHY PLL configuration seems to
work reliably, hence remove the now redundant struct member.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 3cc8976e10e6..6297a5171e78 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -387,7 +387,6 @@ struct rk_hdptx_phy {
 
 	/* clk provider */
 	struct clk_hw hw;
-	unsigned long hw_rate;
 	bool restrict_rate_change;
 
 	atomic_t usage_count;
@@ -931,7 +930,7 @@ static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 {
 	const struct ropll_config *cfg = NULL;
 	struct ropll_config rc = {0};
-	int ret, i;
+	int i;
 
 	if (!hdptx->hdmi_cfg.tmds_char_rate)
 		return 0;
@@ -993,12 +992,7 @@ static int rk_hdptx_tmds_ropll_cmn_config(struct rk_hdptx_phy *hdptx)
 	regmap_update_bits(hdptx->regmap, CMN_REG(0086), PLL_PCG_CLK_EN_MASK,
 			   FIELD_PREP(PLL_PCG_CLK_EN_MASK, 0x1));
 
-	ret = rk_hdptx_post_enable_pll(hdptx);
-	if (!ret)
-		hdptx->hw_rate = DIV_ROUND_CLOSEST_ULL(hdptx->hdmi_cfg.tmds_char_rate * 8,
-						       hdptx->hdmi_cfg.bpc);
-
-	return ret;
+	return rk_hdptx_post_enable_pll(hdptx);
 }
 
 static int rk_hdptx_tmds_ropll_mode_config(struct rk_hdptx_phy *hdptx)
@@ -1903,9 +1897,6 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 	u64 rate;
 	int ret;
 
-	if (hdptx->hw_rate)
-		return hdptx->hw_rate;
-
 	ret = regmap_read(hdptx->grf, GRF_HDPTX_CON0, &status);
 	if (ret || !(status & HDPTX_I_PLL_EN))
 		return 0;

-- 
2.52.0


