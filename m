Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C17CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 16:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhyzvGyqYDneoI5awV/Ymu2qlDNiVSqqxznbewTum+s=; b=rBaFZ0Z/GYAZ8Xn2MKMGbUZCU8
	UwRRLn0W7QerriumqytKf2adOU4q5oJbsy3QMn1dmHxra0C/YvLmK9J3NvfthituxuSx7u0p8ucpZ
	+notO0v18aPzSVREyYj3Yw1Kea735lskUeuKgvg6I+5bvnmwrwaqUf8tYiu6MRiLbD8I46JlKb7Sa
	Wmz10RgjzmKGp3nm+wL1Nb717phnIJXvBP+ho6WIT9rSp9coJd+DrmnTvwt7l768B9BeQip4SAZGi
	WVSNwXsIDwfHezZ3zwhAlMmGhAP4xbVplse56Kfe3jN3Co+nOTWgrCsCpQ5elnqWUDJhjX4ktjlxR
	UHgA6pvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5HR-0000000BS9p-2Sjf;
	Mon, 01 Jun 2026 16:14:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5HO-0000000BS1b-3DZI;
	Mon, 01 Jun 2026 16:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780330444;
	bh=VlC/qSkXRHe1XHonNDu7WZ4SGBpZ/1wCRHaV181IEg0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MN34eHFVkCDT20BHVot1vjZ8uiNSZRY6VBXX5g6qZZ4+I3yyoNWUbCPhhGq33vBW+
	 ccG6TU8SI3vn5XyZDP/o9ZI0YOsyMY4rVoy9r4I6TeoCiEy0ZEm8jn1k9rpN5F1SES
	 y5unEMQ08MWEQxIDg6CRllM+1BJGpTito1EHsqACHx7O0kxHXp9xoU7t00AmAtiyR0
	 HVqre3RqAUk7SURh/k/GYvWOU1cnLJmh8EerjOYYFxxkp9+zT9ltghyOnaBUG5WP3C
	 UKV1iKgIPePC24cMSG3itCGCI5BOiMbl8tIdO5IH7bwy6QteQvq+yznZThx2DLAu1r
	 0I82/K+FoWq3g==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 69AAC17E093F;
	Mon,  1 Jun 2026 18:14:04 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 01 Jun 2026 19:13:45 +0300
Subject: [PATCH v4 2/3] drm/rockchip: dw_dp: Add missing newline in
 dev_err_probe() message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-drm-rk-fixes-v4-2-c3f3f123e1da@collabora.com>
References: <20260601-drm-rk-fixes-v4-0-c3f3f123e1da@collabora.com>
In-Reply-To: <20260601-drm-rk-fixes-v4-0-c3f3f123e1da@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_091419_300404_AAD1CC68 
X-CRM114-Status: GOOD (  10.13  )
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

Add the missing trailing newline to dev_err_probe() call in
dw_dp_rockchip_bind().

Fixes: d68ba7bac955 ("drm/rockchip: Add RK3588 DPTX output support")
Fixes: 26cb3e26efa7 ("drm/rockchip: dw_dp: Simplify error handling")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 32bc73a1d5e4..f137f699737c 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -109,7 +109,7 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 	connector = drm_bridge_connector_init(drm_dev, encoder);
 	if (IS_ERR(connector))
 		return dev_err_probe(dev, PTR_ERR(connector),
-				     "Failed to init bridge connector");
+				     "Failed to init bridge connector\n");
 
 	return 0;
 }

-- 
2.54.0


