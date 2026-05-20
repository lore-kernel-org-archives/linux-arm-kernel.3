Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254D1CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDqvmhpgR5R/NjXlTPYGN3+LiIMi5JspVL5461hiPGM=; b=xgRdx8QoqjGXvFvaC2gQUcoqjl
	hfrtAOeTLbfcl0hW8gFs9hOsMqJ3Aa7B7kSebVg1FmUb0iRF9bs+Jh4YFVixkc1e55aVhdTS2+xAo
	vNVNIly9BBVSkHauJjXfLatq/4xATAUsqIAuq0i/spK3L5ZZEkqu0h03tvQ4Gqw4HHg6ZWBU9VOIz
	lDhRcEvZND2Hykqv2i2gIEQxpqgUYUyf+I98+irL/+G9KNmZdVS+NLNI0MudSUnwBN958t+j2zXZT
	nENdd5t56zqT7/3VkKhtvwSFvUouEU3usH3bsQItD1unqCGaCLU+7yaNYscNbwfOqybIuLr/sL8EA
	COHc10Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlos-00000005TQX-2lhf;
	Wed, 20 May 2026 18:39:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPloa-00000005SpZ-1Sxv;
	Wed, 20 May 2026 18:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779302322;
	bh=uZe9IQRi0ANcc0QeZ98Gz54zfT2EANyU1q5JBI5gvwg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bY2quIi/5Gcb3Oxmc+j6AmD4ej3uoYcgYMaTb3f3seeegCeKjdXuiwmnBHBi27ZyA
	 /S+V03VxcDdVRz+MjRmCTf+4Lqc/JpopsQq3hN0EvrvtyHouAIJ9xpw5r0JM/5qCdl
	 DxykHGgbelkX6O6G1DJdSU7VXQ9V3R/jHYRwm+JUCsAzDJN3jnpzPJdYVPZ7mfz/bY
	 UFFQeNE1svC14eoCTobP7T4Or8kCxc3Dc/x5cxYIkhNj/zIspZLyFCjAlLnzZtVDiT
	 fQS94XTSRCNfWVtxvI67ZDxIhgg8KLxNNSHsp/d9SleEVlt2LO9UDHWiSz98ktVyjd
	 bYypUeDElbyng==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5851917E1553;
	Wed, 20 May 2026 20:38:42 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 20 May 2026 21:38:26 +0300
Subject: [PATCH v6 15/22] drm/rockchip: dw_hdmi_qp: Add missing newlines in
 dev_err_probe() messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-dw-hdmi-qp-scramb-v6-15-24b74603b782@collabora.com>
References: <20260520-dw-hdmi-qp-scramb-v6-0-24b74603b782@collabora.com>
In-Reply-To: <20260520-dw-hdmi-qp-scramb-v6-0-24b74603b782@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniels@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_113844_571931_FE085AD2 
X-CRM114-Status: GOOD (  10.81  )
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
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index f35484715c2d..296f9a3ba66a 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -589,14 +589,14 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	drm_encoder_helper_add(encoder, &dw_hdmi_qp_rockchip_encoder_helper_funcs);
 	ret = drmm_encoder_init(drm, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret)
-		return dev_err_probe(hdmi->dev, ret, "Failed to init encoder");
+		return dev_err_probe(hdmi->dev, ret, "Failed to init encoder\n");
 
 	platform_set_drvdata(pdev, hdmi);
 
 	hdmi->hdmi = dw_hdmi_qp_bind(pdev, encoder, &plat_data);
 	if (IS_ERR(hdmi->hdmi))
 		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->hdmi),
-				     "Failed to bind dw-hdmi-qp");
+				     "Failed to bind dw-hdmi-qp\n");
 
 	connector = drm_bridge_connector_init(drm, encoder);
 	if (IS_ERR(connector))

-- 
2.53.0


