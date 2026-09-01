Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC35C624D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0Ii2FNlV0pZiidhdvwyoAt0t79HDJ6o/7lDJ4FLcUA=; b=4wviWZwGco1cgMC0UT74BSvrjL
	7WfqZ3IdbnFvBasWCKFgMwE8DYTA0GOr0Z/lRnS1WgncMqNSil6q+397ThwLSB+ypBNYzUUjKJWyi
	xQfX6bghJeZWM1pgKalTUn849vE/pRpYPuhPsHJdhLWGS2Ab3mmWxbQvvUELwGPNstkjb33TgLycF
	RqmCYuXdr+YmSj7PcHTVluubwzXsz6d8MmR3qrmD3Hy1z56MH9dKj6EBQaxS56kNq9VcMea0owPOG
	DILJDwlI6P5L5ItSCJ7qQ+zX4IzvR6eHNoVlzaUMU5DUKyuIizbk6bDqlUB7QJnKKdfF9n833nPjz
	LsWWBAeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Tbc-0000000D4lR-1dQM;
	Tue, 01 Sep 2026 18:53:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZr-0000000D1M4-31b7;
	Tue, 01 Sep 2026 18:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=r0Ii2FNlV0pZiidhdvwyoAt0t79HDJ6o/7lDJ4FLcUA=; b=o37VYzsuorO+G7mOuRTV40ZpSC
	Bz5CdP58ZUPf/ls1asPkj6mLXF0uIqGYKPNsvD4OoY2A2VEq5nngZcMn0cEa1xXI1c4H1XMEIrdfz
	DTambUWA2XhYRNWs7zxmJBngJCRW3PE2zULOptMbjU0cQuURiYt9v4fdhqe0hdo5vw7N2P7GF12ff
	Ddg9Bk3dgHMHgMdrMrmns0nQzqjMr6DcRVKc9uWCpBjM14GRSL6kWObc0UFL74KdkSF61ReBD4FLi
	B1bDe3nDEqDpV9oyLIvbw3NK2OyYgrUFygHPar7yyj20hn1zQbkYMyuNUz5Yb1+d+a+ModGFlldqZ
	qo+V4BPg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1TZo-0000000BHXt-2epx;
	Tue, 01 Sep 2026 18:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288679;
	bh=FjNG/FbAfUxNWdfXcasZdzMERNWbRLC78jj086GTy6I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HlwRPzYap1glbrJnfLcC2NFINYYovF4JW9xAFw8W9qLlGl6EWvWK2n8rAGAdp5KTj
	 1u9SAoOL7rxv98kkUC7LlkTDd8EckVpWMweCGAf7hqHXPCN0W5Fa8lU6r9fJVEUpqu
	 HcfrsNPLGkvpAClhVhVkifq7lbTgSLHNxY0GXk5tae8jpQwZz/dY2ijuOAweS9n9OL
	 fYB/xbkSULb1AzZa/aEmlhkI7Sq7GTTNRAtOyObl3H0yD9CQTK6831bqRwjN32eWQf
	 C8dnwTz6j2J6nvtsvhiqFUTD7lmXbPOQpk9fmU7aWaz3xVTwyQA+Ra7lzDnOJH6NQC
	 Ca/Zx61fzEfTg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A3B817E3C76;
	Tue, 01 Sep 2026 20:51:19 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:51:16 +0300
Subject: [PATCH v11 52/74] drm/bridge: ite-it6263: Drop redundant
 .mode_valid hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-52-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-fbdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_195120_896575_AFB52F76 
X-CRM114-Status: GOOD (  11.33  )
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

Bridges using DRM_BRIDGE_OP_HDMI expect connectors to be created through
drm_bridge_connector_init(), thereby relying on the bridge connector's
.mode_valid hook to invoke drm_hdmi_connector_mode_valid().

The generic helper computes the mode's TMDS character rate and forwards
it to the bridge's .hdmi_tmds_char_rate_valid callback through the
connector HDMI funcs.  This covers exactly what
it6263_bridge_mode_valid() does for 8 bpc RGB444, but due to being
output-format aware, it also handles the validation more thoroughly.

Both the connector and bridge .mode_valid hooks are invoked during
mode validation through drm_mode_validate_pipeline(), so the custom
bridge hook is redundant.  Drop it.

While at it, remove the now-unused drm_hdmi_helper.h include.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 21ac8e58b9d2..550999491086 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -15,7 +15,6 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
-#include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -669,20 +668,6 @@ static void it6263_bridge_atomic_enable(struct drm_bridge *bridge,
 	regmap_write(regmap, HDMI_REG_PKT_GENERAL_CTRL, ENABLE_PKT | REPEAT_PKT);
 }
 
-static enum drm_mode_status
-it6263_bridge_mode_valid(struct drm_bridge *bridge,
-			 const struct drm_display_info *info,
-			 const struct drm_display_mode *mode)
-{
-	unsigned long long rate;
-
-	rate = drm_hdmi_compute_mode_clock(mode, 8, DRM_OUTPUT_COLOR_FORMAT_RGB444);
-	if (rate == 0)
-		return MODE_NOCLOCK;
-
-	return bridge->funcs->hdmi_tmds_char_rate_valid(bridge, mode, rate);
-}
-
 static int it6263_bridge_attach(struct drm_bridge *bridge,
 				struct drm_encoder *encoder,
 				enum drm_bridge_attach_flags flags)
@@ -831,7 +816,6 @@ static const struct drm_bridge_funcs it6263_bridge_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.attach = it6263_bridge_attach,
-	.mode_valid = it6263_bridge_mode_valid,
 	.atomic_disable = it6263_bridge_atomic_disable,
 	.atomic_enable = it6263_bridge_atomic_enable,
 	.detect = it6263_bridge_detect,

-- 
2.55.0


