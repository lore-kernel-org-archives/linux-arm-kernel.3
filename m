Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248B0C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmuyKnTUy1dgog2LJcxYzZS62WpnL3R/ZnnBOFb8XTA=; b=Tp+5FyN6HHIqVCV/9vVMKic9oj
	Z7yZ/Ika2kJ7G47WJsUQEChs/If9oO2Gmryihh71ndgVsGB2UViwHVl14/VS/+CfD+/NNM+TnFele
	ISVDHcCgtPPZuPXO/T09+7MCPkbBrervQuPbZpeTaynbbO7LLvelmmCBLyc/1jbEPtkT4Vm8rDPai
	/8Vwfig8pdDdC4PQD/Q+TDY3MQzkGsOUTqw0nD9NaAItNeiHv0/xfx97uDNe3XOauLFu1Omn7Z+i7
	4Gxdlp6f8FINyQVVcMKxzK7fQ1yqk1uM4X8NP+DQmeHMaa/KC3oUk+o1y73gXG9p6+KCItSZzp3qS
	K7NfYjMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZ9n-0000000CEoG-20xp;
	Wed, 22 Jul 2026 15:46:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZ9b-0000000CEj9-3pBZ;
	Wed, 22 Jul 2026 15:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xmuyKnTUy1dgog2LJcxYzZS62WpnL3R/ZnnBOFb8XTA=; b=IME6/VGx8SxzVvpOsJFxZBAi9A
	gmzHD1/EDcKZ8Ne3pJZgpas7lT5xAbMyFUGNoQ1S3UHCRXsTEUXdpwfnago7R6TG+mUpQvYfLhkYe
	DXx291BK8N8SSq60TDhbKPol+rW2AmdxZLduKH9RFqiye9a+UCosw2uhCTSTblBHuTI6J5YramfpM
	grQLKYNVDUuqESEDCvi9UuLYHhKLv+ezLZ9slKsEiBInmjceg39rlWZf57NlVjU499qT+H1Tn7R+z
	tQAY8ZL9zZjOWY1Np2vCDYvYEZqptJpYu/l9W43ycsxEGwdiqTmyRQVXoTpvWIP6RE8lDv3Y9YgJ4
	ulxXAo+g==;
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmZ9Z-00000000yAw-0VOX;
	Wed, 22 Jul 2026 15:46:38 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wmZ9S-000000006er-2bjZ;
	Wed, 22 Jul 2026 15:46:30 +0000
Date: Wed, 22 Jul 2026 16:46:27 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Allen Chen <allen.chen@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v5 06/11] drm/bridge: it6505: avoid division by zero in pixel
 clock calculation
Message-ID: <66fbe7f9cb0efe2fb4b66dc4a4a632d46398eca8.1784717129.git.daniel@makrotopia.org>
References: <cover.1784717129.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784717129.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_164637_276765_AF9440D6 
X-CRM114-Status: GOOD (  10.76  )
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

it6505_calc_video_info() checks the sum of the three pixel clock
counter samples for zero before dividing it by 3, so sums of 1 or 2
truncate to 0 and the following pixel clock calculation divides by
zero. Divide first and check the result.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v5: new patch

 drivers/gpu/drm/bridge/ite-it6505.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 0e141310ed3c..fc95f8d4f412 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -750,12 +750,13 @@ static void it6505_calc_video_info(struct it6505 *it6505)
 		sum += rddata;
 	}
 
+	sum /= 3;
+
 	if (sum == 0) {
 		DRM_DEV_DEBUG_DRIVER(dev, "calc video timing error");
 		return;
 	}
 
-	sum /= 3;
 	pclk = 13500 * 2048 / sum;
 	it6505->video_info.clock = pclk;
 	it6505->video_info.hdisplay = hdew;
-- 
2.55.0

