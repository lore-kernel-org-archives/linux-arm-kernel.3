Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82E1D29C2C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 13:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWb/w85gdwaqFeKpkqi3eBmzYIDL+GjmRN6SfH9uJI8=; b=RhRE241h9f97UBupUdhxfsyKbM
	9sRK8FbuvdWJifbsAXX1FYx/okEjdxaKEWDb98Pph+B5N4ZEj4DHccSjmMAb3A3vYR1c/Ny6iUHrw
	tb54aADQurVHghNLL7RZrNRMnQ1v9x76aNMjV3HGi53BYj8Jx1nGZglr0TVVeaS5mPvC4CTuG9/O0
	pzAFsbSpyCYXSwHEnNlizX1HQon/0lIXFwsxzm/nLPkpmqoD33QR64XaYWkW8uVjS0HYALccLwC6b
	+L7LaipRc9E8YTbosa/EgiEsJpMpEHhq38GF8Q7bZN4skZ5oSrmkfQA7WBHvlGDIuRexiGUDx8Q1B
	fbZ2v14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpGt-00000002A3w-29za;
	Mon, 19 Jan 2026 13:26:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpGk-000000029yC-1rAg;
	Mon, 19 Jan 2026 13:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wWb/w85gdwaqFeKpkqi3eBmzYIDL+GjmRN6SfH9uJI8=; b=aQFCX8+lE1Tww4sNNVXrdq7x/t
	2JAVdjG5nEjOccIjYqppfVg2nGxvlfv0dQv3hN8ZtkAzOeOszwlzMvImb8imXpamiDOX5TDSd5Rsg
	bdvGpmDid87rVo2TKtYfRh/9TEj+GhjcabWPbFQ5rJHlJB+A+6827H4NowudY5t5OWMVnTR/oFhB8
	K2dyJX7Du078wwmiGNvCZnbqLjPzavEWsWNTh+KMXD7Pw1MvLqPwyTK7Bv6R04WFZ0IK1PT3bkF9N
	Y0lnLVrv8s9JqOk9zVWN7nX3veEb/+XZENZNdzpPElz7muFDnBD9+gzDqN5kiHNsLGGWfMYlDd63H
	m8HleJqg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpGg-0000000CACq-3n2g;
	Mon, 19 Jan 2026 13:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768829163;
	bh=hPdWONUuBZHvs/8qLAlcTuSIfRD9EX7k/uxvPVejFN8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Hp803FHzilgQypjtQ20NWLvwmbouXX0rqGax8QY42Mi6I49cCjf8N12pAfBPDKxZ6
	 gMiOZyOb/dO9RxOEopsUB/u0qx8hd+4Yn0Z6TK4spQSYjlB7VTvC+xERVF/Bm3ECyx
	 +NLA+k5qaH9yGkbr2SGX/rXeu5He0wWmT3xq07cugFejv5AYpbByg5gMgc3qxbNKdY
	 ZI0eBIKdnzcwxUbJtFcDhkUwh9K1WoAL5oSeGWiWZaZpP/IFyTLrOMbWnknLxn/xBs
	 0gr9swNdyf9Bbp4JTiK09KHdy3jNomRmGXp5jwsvYE8mEqlimftyQnj39TG1ErNmvc
	 bkmJxVKpLKSMA==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D502617E13E4;
	Mon, 19 Jan 2026 14:26:02 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 19 Jan 2026 15:26:00 +0200
Subject: [PATCH v3 4/4] drm/rockchip: dw_hdmi_qp: Do not send HPD events
 for all connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-dw-hdmi-qp-scramb-v3-4-bd8611730fc1@collabora.com>
References: <20260119-dw-hdmi-qp-scramb-v3-0-bd8611730fc1@collabora.com>
In-Reply-To: <20260119-dw-hdmi-qp-scramb-v3-0-bd8611730fc1@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_132607_078436_00E31C71 
X-CRM114-Status: GOOD (  14.93  )
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

In order to optimize the HPD event handling and run the detect cycle on
the affected connector only, make use of
drm_connector_helper_hpd_irq_event() instead of
drm_helper_hpd_irq_event().

Additionally, move devm_request_threaded_irq() after bridge connector
initialization.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 44 ++++++++++++--------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index e91caae7e353..4091966a2075 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -92,6 +92,7 @@ struct rockchip_hdmi_qp {
 	struct regmap *regmap;
 	struct regmap *vo_regmap;
 	struct rockchip_encoder encoder;
+	struct drm_connector *connector;
 	struct dw_hdmi_qp *hdmi;
 	struct phy *phy;
 	struct gpio_desc *frl_enable_gpio;
@@ -251,14 +252,10 @@ static void dw_hdmi_qp_rk3588_hpd_work(struct work_struct *work)
 	struct rockchip_hdmi_qp *hdmi = container_of(work,
 						     struct rockchip_hdmi_qp,
 						     hpd_work.work);
-	struct drm_device *drm = hdmi->encoder.encoder.dev;
-	bool changed;
+	bool changed = drm_connector_helper_hpd_irq_event(hdmi->connector);
 
-	if (drm) {
-		changed = drm_helper_hpd_irq_event(drm);
-		if (changed)
-			dev_dbg(hdmi->dev, "connector status changed\n");
-	}
+	if (changed)
+		dev_dbg(hdmi->dev, "connector status changed\n");
 }
 
 static irqreturn_t dw_hdmi_qp_rk3576_hardirq(int irq, void *dev_id)
@@ -475,13 +472,12 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	struct dw_hdmi_qp_plat_data plat_data = {};
 	const struct rockchip_hdmi_qp_cfg *cfg;
 	struct drm_device *drm = data;
-	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct rockchip_hdmi_qp *hdmi;
 	struct resource *res;
 	struct clk_bulk_data *clks;
 	struct clk *ref_clk;
-	int ret, irq, i;
+	int ret, hpd_irq, i;
 
 	if (!pdev->dev.of_node)
 		return -ENODEV;
@@ -582,17 +578,9 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (plat_data.cec_irq < 0)
 		return plat_data.cec_irq;
 
-	irq = platform_get_irq_byname(pdev, "hpd");
-	if (irq < 0)
-		return irq;
-
-	ret = devm_request_threaded_irq(hdmi->dev, irq,
-					cfg->ctrl_ops->hardirq_callback,
-					cfg->ctrl_ops->irq_callback,
-					IRQF_SHARED, "dw-hdmi-qp-hpd",
-					hdmi);
-	if (ret)
-		return ret;
+	hpd_irq = platform_get_irq_byname(pdev, "hpd");
+	if (hpd_irq < 0)
+		return hpd_irq;
 
 	drm_encoder_helper_add(encoder, &dw_hdmi_qp_rockchip_encoder_helper_funcs);
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
@@ -606,12 +594,20 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 				     "Failed to bind dw-hdmi-qp");
 	}
 
-	connector = drm_bridge_connector_init(drm, encoder);
-	if (IS_ERR(connector))
-		return dev_err_probe(hdmi->dev, PTR_ERR(connector),
+	hdmi->connector = drm_bridge_connector_init(drm, encoder);
+	if (IS_ERR(hdmi->connector))
+		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->connector),
 				     "Failed to init bridge connector\n");
 
-	return drm_connector_attach_encoder(connector, encoder);
+	ret = drm_connector_attach_encoder(hdmi->connector, encoder);
+	if (ret)
+		return ret;
+
+	return devm_request_threaded_irq(hdmi->dev, hpd_irq,
+					 cfg->ctrl_ops->hardirq_callback,
+					 cfg->ctrl_ops->irq_callback,
+					 IRQF_SHARED, "dw-hdmi-qp-hpd",
+					 hdmi);
 }
 
 static void dw_hdmi_qp_rockchip_unbind(struct device *dev,

-- 
2.52.0


