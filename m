Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A4BC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+HRDuHXSniBcTl319wMebUIfOiOr/PY9mh76cg7spk=; b=cVxtq0mS2eUyiJLFvV+BqVEY/t
	NJDDjCwkIX8OtMhNsnSOYdumRM521wUJQRIBnP1XKqh3IDheNBZ74N9FsXdCeAczthZCYBInudBZi
	2JofOyVP7FcyKbY3GDMu1Na8c/Ls4lzfyAasWtXGIaZW+U3thLf1Fc6FAOWsidjeRKiomB4DwoF7C
	T1amVa11nod6W5EWBL7kTXBH74aLgyG6Wk4N9TfRCjOwNaI/gN46MedoN187IPEm9bWyKfGkZIzkf
	MtnXIsuS7SMIo8mq95/z70PoUa9V40l5c3B2WxUrGp4Pu6GlTxFRS3ArzV3ZfZom2wgq/n9Z/RGoI
	rAGV330w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoTQ-0000000Cnwi-2PbN;
	Fri, 31 Jul 2026 14:44:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoRT-0000000ClwG-2gNF;
	Fri, 31 Jul 2026 14:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=B+HRDuHXSniBcTl319wMebUIfOiOr/PY9mh76cg7spk=; b=aTmzzjZcwhZAxFD1qccH9Lo5Mq
	3PTlAUYUMpPxABPODEAsGDS5poY5eIlhHnQDRIS6cXASTz08huSQ4/ExDo/Jz0KpVlCSKHOjijdCW
	wQL4hvWTX4/i/CXNKGeT8Q3Io48ogxRyyH0wYWbhXGb+7LvnACJ9tQD1tszakxsDlm/MUaNNR/eZS
	nl0UN74v8mcmK2+H6ZJtWVoptU/whw8Y0NXKKwhSP8OAdZ44PsRfS9O65Iz2GhOgIS2n690OcY0Ll
	nWgasR5ZgaKZ11MQjiuZHcmiWgvlsqU/KcJ2TzAcJeTtKnTpvPHRy4ZEVimnQ6uNkx69chMPeu3k9
	opGCUu9w==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wpoRQ-00000007X7D-2YZk;
	Fri, 31 Jul 2026 14:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785508930;
	bh=K2BbWak3F9Q2jTvsGbkaNezEQtxpB/CTjje1XqI8cJs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XIbnfTov8CI+zFJE3Wez1sHO3FnU9QAdCZrQYxhWe871ioseaolSozp/xJT5qdu4+
	 HKDiI442lAa8OJkkzq8xG8Bl20oeQg/ml5qjUD2uX9DkEBOZVlXSUEMyPFDPsfeAVB
	 LMexNAGAFvHkKw9r5UG04hDTMH3ifv2SVc5xejvHFE8Rcu58ZYRJI3mx/dwbuYTelm
	 UesTKr64sip90qR93s75PBWki5F4SvKy3o+3mhwhIEx+/uWm1KrHGHLQpJArckU36N
	 uhnq45XuBIF7t91iogNSMB3SAbrE9/TPl4cIX2QbAdXpdyR8w7d2pki6rh4rQBAWkd
	 tXVpGO1p5IAjQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BCF5B17E0936;
	Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0FEDF48004E; Fri, 31 Jul 2026 16:42:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 31 Jul 2026 16:42:18 +0200
Subject: [PATCH v8 13/21] drm/rockchip: dw_dp: Implement out-of-band HPD
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-synopsys-dw-dp-improvements-v8-13-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6400;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=K2BbWak3F9Q2jTvsGbkaNezEQtxpB/CTjje1XqI8cJs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpstEDljVLC02Lqn2tjeIrZLlrea05+8fIh6
 1zOAqXphftG5YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqbLRAAAoJENju1/PI
 O/qamFsQAJeteMyuKwBjytLtNtYJsgKiMPyHh2dC+gvDgkWkh3hSmzmnYRSnN0wt8I6wGjAnUxz
 fQDU30n5XOdHrkOuwoAfXEbyXhuJBNVMYlWhYg/shcWvUltlZQ3p+zgs6mqy64BIRh089DZA+AK
 Wb7JSJc2d1LUvP2BUM5naGp7LqiIiNvb8hyW/uoEsVl101kGh2u2+GDdSQyTMq473oixbcIvML5
 tOrAZNkGnCNj2uw8YT5kayqmIzq4/pPoIXWSH3TzLP4QBh//LhNYf7xNXtzoe0dLZxDjQOLFaaG
 fEaUt8bpR0jVcf70HWpz+bEFixMWbwGGTrkVLZtYiJb9bMLs2JF1X7kTqTxvr01xsy1V+DOQYbO
 trWSGu1g2zXj7vKhCGqR5dDN/fTLQ1+CnhkfMZzMg3LM9fvNfzL/8AG0NI6512ztmNt7xV9J3Fa
 i7ZdoNeenjZ6NT8n2EZSOq3E5rhWX383axejUIAssTeBaglKXuwKgn0XgM8eAlQC0J7qOLjfhEG
 m6nunzmflC/bmNYWyW+zTcrsNzECOgeb/Ij7ZTOSIHTcSbhm8oGuOF9T+If2sNovQLiDFnhZ/K+
 ojmVCNo2oMM610GN0rieinTLg2UAYSUlDG8065L511KKDKbYhKKNDNnACPbL0tx8Tvc9j8pygAQ
 amRtfAqhz0afwtHBH/cg3Ug==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_154228_860504_25F73FB3 
X-CRM114-Status: GOOD (  23.17  )
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

Implement out-of-band hotplug handling, which will be used to receive
external hotplug information from the USB-C state machine. This is
currently handled by the USBDP PHY, which brings quite some trouble
as the register being accessed requires the power-domain from the DP
controller. Thus this patch prevents massive SError problems once
runtime PM is enabled. Apart from that it avoids custom TypeC HPD
info parsing in the USBDP PHY driver.

In contrast to the USBDP PHY this does not just enable the hotplug
signal when a DP AltMode capable adapter is plugged in, but instead
properly detects if a cable is plugged in for things like USB-C to
HDMI adapters.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 118 ++++++++++++++++++++++++++++--
 1 file changed, 113 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 005938dc66c9..d516b3910b51 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -7,9 +7,12 @@
  */
 
 #include <linux/component.h>
+#include <linux/hw_bitfield.h>
 #include <linux/media-bus-format.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/videodev2.h>
 
 #include <drm/bridge/dw_dp.h>
@@ -23,12 +26,48 @@
 
 #include "rockchip_drm_drv.h"
 
+#define ROCKCHIP_MAX_CTRLS 2
+
+#define ROCKCHIP_VO_GRF_DP_SINK_HPD_SEL BIT(10)
+#define ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG BIT(11)
+
+struct rockchip_dw_dp_plat_data {
+	u8 num_ctrls;
+	u32 ctrl_ids[ROCKCHIP_MAX_CTRLS];
+	u32 max_link_rate;
+	u8 pixel_mode;
+	u32 hpd_reg[ROCKCHIP_MAX_CTRLS];
+};
+
 struct rockchip_dw_dp {
 	struct dw_dp *base;
 	struct device *dev;
+	const struct rockchip_dw_dp_plat_data *pdata;
+	struct regmap *vo_grf;
 	struct rockchip_encoder *encoder;
+	int id;
 };
 
+static void dw_dp_rockchip_hpd_sw_sel(void *data, bool force_hpd_from_sw)
+{
+	struct rockchip_dw_dp *dp = data;
+	u32 hpd_reg = dp->pdata->hpd_reg[dp->id];
+
+	regmap_write(dp->vo_grf, hpd_reg,
+		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_SEL, force_hpd_from_sw));
+}
+
+static void dw_dp_rockchip_hpd_sw_cfg(void *data, bool hpd)
+{
+	struct rockchip_dw_dp *dp = data;
+	u32 hpd_reg = dp->pdata->hpd_reg[dp->id];
+
+	dev_dbg(dp->dev, "Force HPD connected=%s\n", str_yes_no(hpd));
+
+	regmap_write(dp->vo_grf, hpd_reg,
+		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG, hpd));
+}
+
 static int dw_dp_encoder_atomic_check(struct drm_encoder *encoder,
 				      struct drm_crtc_state *crtc_state,
 				      struct drm_connector_state *conn_state)
@@ -71,6 +110,35 @@ static const struct drm_encoder_helper_funcs dw_dp_encoder_helper_funcs = {
 	.atomic_check		= dw_dp_encoder_atomic_check,
 };
 
+static struct regmap *dw_dp_rockchip_get_vo_grf(struct rockchip_dw_dp *dp)
+{
+	struct device_node *np = dev_of_node(dp->dev);
+	struct of_phandle_args args;
+	struct regmap *regmap;
+	int ret;
+
+	ret = of_parse_phandle_with_args(np, "phys", "#phy-cells", 0, &args);
+	if (ret)
+		return ERR_PTR(-ENODEV);
+
+	/*
+	 * Limit this workaround to RK3576 and RK3588, potential future platforms
+	 * reusing the driver should just add a VO GRF phandle in the DisplayPort
+	 * controller DT node.
+	 */
+	if (!of_device_is_compatible(args.np, "rockchip,rk3576-usbdp-phy") &&
+	    !of_device_is_compatible(args.np, "rockchip,rk3588-usbdp-phy")) {
+		regmap = ERR_PTR(-ENODEV);
+		goto out_put_node;
+	}
+
+	regmap = syscon_regmap_lookup_by_phandle(args.np, "rockchip,vo-grf");
+
+out_put_node:
+	of_node_put(args.np);
+	return regmap;
+}
+
 static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *data)
 {
 	struct rockchip_dw_dp *dp = dev_get_drvdata(dev);
@@ -121,19 +189,53 @@ static const struct component_ops dw_dp_rockchip_component_ops = {
 
 static int dw_dp_rockchip_probe(struct platform_device *pdev)
 {
-	const struct dw_dp_plat_data *plat_data;
+	const struct rockchip_dw_dp_plat_data *plat_data_const;
+	struct dw_dp_plat_data *plat_data;
 	struct device *dev = &pdev->dev;
 	struct rockchip_dw_dp *dp;
+	struct resource *res;
+	int id;
 
-	plat_data = of_device_get_match_data(dev);
-	if (!plat_data)
+	plat_data_const = device_get_match_data(dev);
+	if (!plat_data_const)
 		return -ENODEV;
 
+	plat_data = devm_kzalloc(dev, sizeof(*plat_data), GFP_KERNEL);
+	if (!plat_data)
+		return -ENOMEM;
+
 	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
 	if (!dp)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, dp);
 	dp->dev = dev;
+	dp->pdata = plat_data_const;
+
+	res = platform_get_mem_or_io(pdev, 0);
+	if (!res)
+		return -ENODEV;
+
+	/* find the DisplayPort ID from the io address */
+	dp->id = -ENODEV;
+	for (id = 0; id < plat_data_const->num_ctrls; id++) {
+		if (res->start == plat_data_const->ctrl_ids[id]) {
+			dp->id = id;
+			break;
+		}
+	}
+
+	if (dp->id < 0)
+		return dp->id;
+
+	dp->vo_grf = dw_dp_rockchip_get_vo_grf(dp);
+	if (IS_ERR(dp->vo_grf))
+		return PTR_ERR(dp->vo_grf);
+
+	plat_data->max_link_rate = plat_data_const->max_link_rate;
+	plat_data->pixel_mode = plat_data_const->pixel_mode;
+	plat_data->hpd_sw_sel = dw_dp_rockchip_hpd_sw_sel;
+	plat_data->hpd_sw_cfg = dw_dp_rockchip_hpd_sw_cfg;
+	plat_data->data = dp;
 
 	dp->base = dw_dp_probe(pdev, plat_data);
 	if (IS_ERR(dp->base))
@@ -147,14 +249,20 @@ static void dw_dp_rockchip_remove(struct platform_device *pdev)
 	component_del(&pdev->dev, &dw_dp_rockchip_component_ops);
 }
 
-static const struct dw_dp_plat_data rk3588_dp_plat_data = {
+static const struct rockchip_dw_dp_plat_data rk3588_dp_plat_data = {
+	.num_ctrls = 2,
+	.ctrl_ids = {0xfde50000, 0xfde60000},
 	.max_link_rate = 810000,
 	.pixel_mode = DW_DP_MP_QUAD_PIXEL,
+	.hpd_reg = {0x0000, 0x0008},
 };
 
-static const struct dw_dp_plat_data rk3576_dp_plat_data = {
+static const struct rockchip_dw_dp_plat_data rk3576_dp_plat_data = {
+	.num_ctrls = 1,
+	.ctrl_ids = {0x27e40000},
 	.max_link_rate = 810000,
 	.pixel_mode = DW_DP_MP_DUAL_PIXEL,
+	.hpd_reg = {0x0000},
 };
 
 static const struct of_device_id dw_dp_of_match[] = {

-- 
2.53.0


