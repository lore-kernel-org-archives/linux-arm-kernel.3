Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C597C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Lw89QRJYUOqvxTzd8ZewXC/b7dBIb5O6ww8mYUMBfU=; b=Lp1p6C7b0Ov5GuEA8/9qGz00sn
	8CgiYHHbJ4BQ/70Z/uRHoKs3MYcpGtpqW813/yC8fa1tEzTToNrec5rTIj7XWXZQDmzyMtPG5612i
	7xbfn4LGy20h7fn05keaeZNDM9F9yFCuSeH2lRIJzsnzQMs2M4JbDqwOie/OmzrPcv+a4OqROCgxS
	6jvk/ZDbei31ZNLlZR/zhdxdvVEF2lgeFo62ANNc4VLBNep+GOrSR/GD6AgOgykNdZ2xuYtGnOis8
	DChSCEiqMmXWWdLKNNrJzyYSADh4mXWe8nykp1pPGMa440R3c+eyHPjmCTZkWvaNKKdHxGn7+ToyZ
	oUVGL6tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZ9K-0000000CEVv-1tx3;
	Wed, 22 Jul 2026 15:46:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZ9J-0000000CEV2-3hWq;
	Wed, 22 Jul 2026 15:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9Lw89QRJYUOqvxTzd8ZewXC/b7dBIb5O6ww8mYUMBfU=; b=k5WUj2ycORug0O4tqpvSw+UsOP
	jdkO4tuJcUa1zglDgRFEuXkhib24Mrz29n5LhtUaVB9WQBQtSHpydog2Wq9I0TDm0gCwO4RhXqFUX
	s41lPC+klQqVQvfqrdebJTbXtQZ74GKvS0UYFMKyX0qpEzReTJF2Is25fbyD6Q4R2sfX4KDugAnju
	PVrJKywIwkv+Bo1fT75EQM++wKOy1WGlQoSoUz2+13svw66sVSkdB5P6S3bwNPOkk9ajDxOKxhAtJ
	eaSdI1xqR7Vz1dt8ib2W1Uo9Bb9RQnhGt7Y93fj4XjIo6fTFAVBo19sepqJWXZViwr5hjjAy+kvz7
	4EZJi89A==;
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmZ9H-00000000y8s-0Yju;
	Wed, 22 Jul 2026 15:46:20 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wmZ9B-000000006dY-2SFN;
	Wed, 22 Jul 2026 15:46:13 +0000
Date: Wed, 22 Jul 2026 16:46:10 +0100
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
Subject: [PATCH v5 04/11] drm/bridge: it6505: complete poweroff even if
 disabling regulators fails
Message-ID: <51bec6ff870eb67415408268a798a934dcad6a6c.1784717129.git.daniel@makrotopia.org>
References: <cover.1784717129.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784717129.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_164619_277714_2BF09B5A 
X-CRM114-Status: GOOD (  11.03  )
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

it6505_poweroff() returns early when regulator_disable() fails,
leaving it6505->powered set with the IRQ already disabled. The next
it6505_poweron() then takes its early return and never re-enables the
IRQ, leaving the bridge deaf to hotplug and link training interrupts.
Log the error and complete the power-off state transition instead.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v5: new patch

 drivers/gpu/drm/bridge/ite-it6505.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index ff6471d3ef7a..0f79ddfd1501 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2810,13 +2810,15 @@ static int it6505_poweroff(struct it6505 *it6505)
 	if (pdata->pwr18) {
 		err = regulator_disable(pdata->pwr18);
 		if (err)
-			return err;
+			dev_err(dev, "cannot disable pwr18 regulator: %d",
+				err);
 	}
 
 	if (pdata->ovdd) {
 		err = regulator_disable(pdata->ovdd);
 		if (err)
-			return err;
+			dev_err(dev, "cannot disable ovdd regulator: %d",
+				err);
 	}
 
 	it6505->powered = false;
-- 
2.55.0

