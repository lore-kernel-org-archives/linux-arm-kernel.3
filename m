Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588D5C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4z9KPq6w3LUK2n9euwY+R1qx/yy4WhQEoq1xcNtnNk=; b=all6rFOkk09ZL9c9n0gVsxqST2
	Gl5QmF3G1ug8JPW8BM0KS1ixNRyE+UuWNyAB3ux36jHZJ6nYB3eqpHnRWYFpuHM6O8iuVjWIX/1fW
	JxsME9wUAvDFXun8tEJ7su3urKMnMPX2zab/FlTk+h+RDy3+ZneBNwhgRgAhQvCqaE5HShmFyemr6
	ezynuLInjRYL5E+aZuSScAUC0JoWDz7tCV3yNWRmt9ftXVP3kATO3g//mOngccUL98XqL19TIZl5Z
	RCMJbamvB5rTunEHZ9Fc6ghk6Y/zUUkk315cjM3IE0Ckv41OxRSZZ4AvvxrwFq3zMNwLpYZxj4moZ
	8ImSlr+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq16-0000000D2QL-1316;
	Fri, 31 Jul 2026 16:23:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppxS-0000000CzBV-3z7t;
	Fri, 31 Jul 2026 16:19:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514777;
	bh=nLsJmF2gP+Ibwk4xSRh3va9+XgtdrzUv0K++TOJHryQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ldqJm2Kckgv0TOuO4l+8QqCG3hXFQ+dFH6yul9YEWcUFPXwA2ik4FgAIjuAzLNQyF
	 sLnvVe4W3HZz4OggJxTdvALq8C//2VkQv80yIjsFZg5giMNOMccqHYY6lnxabWplYW
	 2OA3hDsyP7CwEmxyAEjD6yb599HLigde4dzHnHMWLPAO8oLalwvsxvgKvmPt5+Cgsg
	 YzyL0Wl6m0kbNNQHsG6aJi+gobQGQMg/MchorPapeXL1CTGYOJOYvdO6OqODSuAkWI
	 hdI6Y3ai48rCiINGgqEMNx0vOIZiUZvxfTzfepQ91HBd2ZIaecW2nV4TKI5WGKWdNA
	 KvTlJ/jrQ8djQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1436717E015B;
	Fri, 31 Jul 2026 18:19:37 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:38 +0300
Subject: [PATCH v10 31/69] drm/rockchip: dw_hdmi_qp: Add missing newlines
 in dev_err_probe() messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-31-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_091939_159214_49491DE3 
X-CRM114-Status: GOOD (  10.47  )
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

Add the missing trailing newlines to a couple of dev_err_probe() calls
in dw_hdmi_qp_rockchip_bind().

Fixes: b6736a4ea3fa ("drm/rockchip: dw_hdmi_qp: Improve error handling with dev_err_probe()")
Fixes: e1f7b7cbd74c ("drm/rockchip: dw_hdmi_qp: Switch to drmm_encoder_init()")
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index e9fda67b8ca9..8b48558deb3e 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -681,12 +681,12 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	drm_encoder_helper_add(encoder, &dw_hdmi_qp_rockchip_encoder_helper_funcs);
 	ret = drmm_encoder_init(drm, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret)
-		return dev_err_probe(hdmi->dev, ret, "Failed to init encoder");
+		return dev_err_probe(hdmi->dev, ret, "Failed to init encoder\n");
 
 	hdmi->hdmi = dw_hdmi_qp_bind(pdev, encoder, &plat_data);
 	if (IS_ERR(hdmi->hdmi))
 		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->hdmi),
-				     "Failed to bind dw-hdmi-qp");
+				     "Failed to bind dw-hdmi-qp\n");
 
 	connector = drm_bridge_connector_init(drm, encoder);
 	if (IS_ERR(connector))

-- 
2.55.0


