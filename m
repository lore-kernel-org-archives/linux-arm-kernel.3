Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87210CC6B1E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 22:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFVoXd/p5JKlzMS7PMvwSwlg+fVGcbnlutInuO9Y3+8=; b=nCk3JGwjJCRPNSjZ8KQ1KH4/vn
	cssQZk9oA6RcWXXjq7gEUqSaafH6pjl++ehIedXk55xFc/Zavhz31FVoyn5ccYKe/txDOcCNp8r/0
	UHx5QnQsKKALJz9CXP0NqOmEVW3KEnz9kmmaJ4i3MZYgdDQXEHgmmwrWqGZUbgwXivlZsTl7dI99R
	rXRglbHRWKjwFFzJEII6iSjlhFILVPpPoHPqUNuBWPfOOabjBZZnAxDOAAS+80fwJEiJ32dD+RM5O
	XgeetE0a/Ko1IZNzL33FzW98L3wVHsetwx240foLMnak7kGL0w8wI4FmzsPfQ0ywyh9r4RdRZ38sy
	ehQSCuiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlMh-0000000EBeL-0JUa;
	Tue, 13 Oct 2026 22:52:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlLs-0000000EB5I-21RL;
	Tue, 13 Oct 2026 22:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cFVoXd/p5JKlzMS7PMvwSwlg+fVGcbnlutInuO9Y3+8=; b=DR891FMQ/o3E9t05GXAR+GgNJW
	DgtPC+36a688G64dGaAMbVpr4uLIV5pnlvYAdbK2afEC32SUCd1oGoSRGtyqUxd99doaFTOgwYsRb
	bLtw35Vcfewh36vxIHJuXKuDTECJ7wZ23HB5mUZKoBIFexNV3zWYyMf7ysuhe7ww/4uUitdjZDIzy
	its2lebesp+Siuy7KjXvryOrqsWm70Zm8EObLC3UI84N659nG9AO1R/QPI+TxpXPOLXekfLCpNgE9
	o1L3DEJSQ9838gv4lspCKcFzy0vmPotPzTHP1XQvOcOEVHfoCSrP1qGI4eVhnKbG1jLEm2t05VSe3
	dJq7A6uA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGlLo-0000000GAnY-3sDb;
	Tue, 13 Oct 2026 22:52:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791931915;
	bh=oh03Y7NCIkpLfkDY9780Qo+quIBDKM75hnX8uyXXrl8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aPs/LzkLpJ6m+2b96DYGcmcHzzrLEHGOEVofC/k4ojACGuZL6TxdVOhxZwIaBr7jN
	 BjhscD0kbV7GA7Xu/Wlu3VAYfVG/StfFSSKVKLmtRS7QZdCig3JDW4unGjET4ON8vb
	 Ung3OVnHKF0yz5vyvkA0lHMlwOmIuF6wiEc2K/5ErNNaIg3FMQnMqG3nFcje8PtpME
	 RcqwlWBo/XwWl+sAPAEzJ6Gl7pc5IhdhppCuOCfFVhWV1ztV6RQradn0R10CakuCYs
	 Qqfuq9z3nXmoOEiseQpcbjfXfK4sSTi7bcZEsRlQYdIaTMZfIwxBWaqDYeLdKP862l
	 by/JTtkLoYH0g==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 96CE217E0FAB;
	Wed, 14 Oct 2026 00:51:55 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 14 Oct 2026 01:51:24 +0300
Subject: [PATCH v5 07/15] drm/rockchip: vop2: Reset AXI and DCLK to improve
 robustness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dw-hdmi-qp-yuv-v5-7-6fab0fe43a9b@collabora.com>
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Daniel Stone <daniels@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniel@fooishbar.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_235205_369648_BBCB782B 
X-CRM114-Status: GOOD (  17.58  )
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

Assert the AXI reset in the bind and CRTC disable paths, and the VP DCLK
reset in the enable path.

These resets are intended to leave the hardware in a clean state for the
next use, helping recover from exceptions such as IOMMU page faults, as
well as to prevent random display output glitches, such as a blank
image, observed when switching modes that also change the color format,
e.g. from RGB to YUV420 and vice versa.  Moreover, this is also expected
to fix the DSI panel support on RK3588 EVB1.

For now this seems to affect only the RK3588, hence the resets are
optional and will be provided in the device tree for this SoC only.

Co-developed-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Co-developed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 38 ++++++++++++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 +++
 2 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 14c073f61c64..afa4bc6cbcc4 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/swab.h>
 
 #include <drm/drm.h>
@@ -867,6 +868,26 @@ static void vop2_core_clks_disable_unprepare(struct vop2 *vop2)
 	clk_disable_unprepare(vop2->hclk);
 }
 
+static void vop2_reset_assert_deassert(struct vop2 *vop2, struct reset_control *rstc)
+{
+	int ret;
+
+	if (!rstc)
+		return;
+
+	ret = reset_control_assert(rstc);
+	if (ret < 0) {
+		drm_warn(vop2->drm, "failed to assert reset: %d\n", ret);
+		return;
+	}
+
+	udelay(10);
+
+	ret = reset_control_deassert(rstc);
+	if (ret < 0)
+		drm_err(vop2->drm, "failed to deassert reset: %d\n", ret);
+}
+
 static void rk3588_vop2_power_domain_enable_all(struct vop2 *vop2)
 {
 	u32 pd;
@@ -953,6 +974,8 @@ static int vop2_enable(struct vop2 *vop2)
 
 static void vop2_disable(struct vop2 *vop2)
 {
+	vop2_reset_assert_deassert(vop2, vop2->axi_rst);
+
 	rockchip_drm_dma_detach_device(vop2->drm, vop2->dev);
 
 	pm_runtime_put_sync(vop2->dev);
@@ -1981,6 +2004,8 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	vop2_crtc_atomic_try_set_gamma(vop2, vp, crtc, crtc_state);
 
+	vop2_reset_assert_deassert(vop2, vp->dclk_rst);
+
 	drm_crtc_vblank_on(crtc);
 
 	vp->enabled = true;
@@ -2596,6 +2621,12 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 			return dev_err_probe(drm->dev, PTR_ERR(vp->dclk),
 					     "failed to get %s\n", dclk_name);
 
+		vp->dclk_rst = devm_reset_control_get_optional_exclusive(vop2->dev,
+									 dclk_name);
+		if (IS_ERR(vp->dclk_rst))
+			return dev_err_probe(drm->dev, PTR_ERR(vp->dclk_rst),
+					     "failed to get %s reset\n", dclk_name);
+
 		np = of_graph_get_remote_node(dev->of_node, i, -1);
 		if (!np) {
 			drm_dbg(vop2->drm, "%s: No remote for vp%d\n", __func__, i);
@@ -2955,6 +2986,13 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 		return dev_err_probe(drm->dev, PTR_ERR(vop2->pll_hdmiphy1),
 				     "failed to get pll_hdmiphy1\n");
 
+	vop2->axi_rst = devm_reset_control_get_optional_exclusive(vop2->dev, "axi");
+	if (IS_ERR(vop2->axi_rst))
+		return dev_err_probe(drm->dev, PTR_ERR(vop2->axi_rst),
+				     "failed to get axi reset\n");
+
+	vop2_reset_assert_deassert(vop2, vop2->axi_rst);
+
 	vop2->irq = platform_get_irq(pdev, 0);
 	if (vop2->irq < 0)
 		return dev_err_probe(drm->dev, vop2->irq, "cannot find irq for vop2\n");
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index b209b2d5b96d..1c2d7d97a6c2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -165,6 +165,8 @@ enum vop2_win_regs {
 	VOP2_WIN_MAX_REG,
 };
 
+struct reset_control;
+
 struct vop2_regs_dump {
 	const char *name;
 	u32 base;
@@ -238,6 +240,7 @@ struct vop2_video_port {
 	struct vop2 *vop2;
 	struct clk *dclk;
 	struct clk *dclk_src;
+	struct reset_control *dclk_rst;
 	unsigned int id;
 	const struct vop2_video_port_data *data;
 
@@ -335,6 +338,7 @@ struct vop2 {
 	struct clk *pclk;
 	struct clk *pll_hdmiphy0;
 	struct clk *pll_hdmiphy1;
+	struct reset_control *axi_rst;
 
 	/* optional internal rgb encoder */
 	struct rockchip_rgb *rgb;

-- 
2.55.0


