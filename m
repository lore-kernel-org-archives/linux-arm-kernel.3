Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7CBD609D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 18:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rV1fjGxz59GFvzUULQooHruBRdYG3t1TVlD4LjvuTEk=; b=FKvCXSSJiTQhy/gpfQoKFalyx/
	1bIZU3O8rKpoyPvtRuoXhzihobrd0TKzUeNsW566A9TaD5E9SMjZ/lLc91nZScJUha54wv3W4Y4HZ
	R5Vp7/4eqztwKqSISj9IrOqKdXwQGbmWdHZ9ol96wX2IVTk+kX4ilDFsljX3iucZCuXPoUG1a31ad
	yLarFTh4YhMGm8vdOmQaqgHiKGh5kaoaF1WWqkcTNNrM1UlLTbUSd9NnTAUWWhYjYA0xCsfvu34j2
	PrpFad79Tz4pOoY+/XWsGNxTFuFjdUaaugR/IVs9MfaCO2UgR13jXUiYGO3VPhSCxhj/ctoxTPRXt
	ld98XLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZMd-00000005fsx-1vMO;
	Tue, 16 Dec 2025 18:01:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZMR-00000005fi3-3vLt;
	Tue, 16 Dec 2025 18:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=rV1fjGxz59GFvzUULQooHruBRdYG3t1TVlD4LjvuTEk=; b=nyaoU6lTq0NVOd5OrrJO17JC92
	TIiRWZLnrGxk5Mp7FjtxGd39PqFA/q3z9RHmNyJLMMNMHf3wloWo+jZwiVB435S6wMTcmOtcLwPzA
	suyJIWO0xwvhxCLQiYOE+BJ/olFUJFRpZY55G/x6x/jG8cICmanEmGkAOSMhTXr1Mfd9TiWjxqy1L
	VqyC15ZM19KE/jRVNWWAQOUAgT9rgwAS1MmYo68lWVsTMWsLPLYkhNNJQGRSzU8y1sOs7x4jU/o1l
	OfhAJhy92rg3Iqqy9bJ8yB0PxFXF3UKyPFZ+tyMKaAwbziRMRAApagZz9ZJsQjNtl0+g7oLh4sAl1
	b15iejkg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZMN-00000003cXO-1MtR;
	Tue, 16 Dec 2025 18:01:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7E0D74E41C36;
	Tue, 16 Dec 2025 18:01:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42AD86071C;
	Tue, 16 Dec 2025 18:01:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EF25119A980E;
	Tue, 16 Dec 2025 19:01:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rV1fjGxz59GFvzUULQooHruBRdYG3t1TVlD4LjvuTEk=;
	b=zc8GPsNZdo6fKnJmjXGh1kNhxRSx4Z9fSvDhy+xCe3z3BXENrcn4y7td35arslthDWCXzY
	LgUURCo19Vb5J6lm6/FmixeL049Xcq19LBDq7eZPcEMQLhfT+fpHAnufcaTi7qdhm6d++0
	Q7krYwH7UFrbW5eEYD2KD1Lg2dmpdk+B0jQWAA0rhP8p+cZuOJIZ1IBEu7/BaNjAYXtvs3
	SGkFaF4SGuoNS1EYB027PBS/Gb6JdCXqglf2DGqZOIi2F9X3jJQQtO4KzrDihitiW23N+I
	dgS6dmi5eoGzJOIXJQYu4EeFMmVz6yEbqbztBXKHe+tFdTpEKMNx/AmTdbfhrg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:55 +0100
Subject: [PATCH v3 22/22] drm/bridge: imx8qxp-pixel-link: get/put the next
 bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-22-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_180119_449311_A30D8513 
X-CRM114-Status: GOOD (  12.39  )
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

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
refcounted and use bridge->next_bridge to put the reference on
deallocation.

This needs to be handled in various steps:

 * the bridge returned of_drm_get_bridge() is stored in the local temporary
   variable next_bridge whose scope is the for loop, so a cleanup action is
   enough
 * the value of next_bridge is copied into selected_bridge, potentially
   more than once, so a cleanup action at function scope plus a
   drm_bridge_put() in case of reassignment are enough
 * on successful return selected_bridge is stored in bridge->next_bridge,
   which ensures it is put when the bridge is deallocated

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 91e4f4d55469..b3050310a7f0 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -23,7 +23,6 @@
 
 struct imx8qxp_pixel_link {
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct device *dev;
 	struct imx_sc_ipc *ipc_handle;
 	u8 stream_id;
@@ -140,7 +139,7 @@ static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge *bridge,
 	}
 
 	return drm_bridge_attach(encoder,
-				 pl->next_bridge, bridge,
+				 pl->bridge.next_bridge, bridge,
 				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 }
 
@@ -260,7 +259,7 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 {
 	struct device_node *np = pl->dev->of_node;
 	struct device_node *port;
-	struct drm_bridge *selected_bridge = NULL;
+	struct drm_bridge *selected_bridge __free(drm_bridge_put) = NULL;
 	u32 port_id;
 	bool found_port = false;
 	int reg;
@@ -297,7 +296,8 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 			continue;
 		}
 
-		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
+		struct drm_bridge *next_bridge __free(drm_bridge_put) =
+			of_drm_find_and_get_bridge(remote);
 		if (!next_bridge)
 			return -EPROBE_DEFER;
 
@@ -305,12 +305,14 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 		 * Select the next bridge with companion PXL2DPI if
 		 * present, otherwise default to the first bridge
 		 */
-		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
-			selected_bridge = next_bridge;
+		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi")) {
+			drm_bridge_put(selected_bridge);
+			selected_bridge = drm_bridge_get(next_bridge);
+		}
 	}
 
 	pl->mst_addr = port_id - 1;
-	pl->next_bridge = selected_bridge;
+	pl->bridge.next_bridge = drm_bridge_get(selected_bridge);
 
 	return 0;
 }

-- 
2.52.0


