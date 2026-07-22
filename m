Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E6BC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1MTp1OHyeKgb/4aSg1q0dkJ2JKtIDN2dcWAgJbEx6EM=; b=HuWCTgpJWtgca7guLIiCLJiG7F
	zNOFTf0grxeGiMwd2hyv+uiJDrk5TFv4xxNXYkb688IWBZQzssiqkp3B5Okncz10IZG2j2oqLqt5X
	u8CYwLVFUMbmOmsBq8kJJE62K8rn+hp3m06FXuKtIOxaCMFTsKWHjmP0qK2qzuJSzJZVmilbmEJYh
	uVRuU4SUoWo/LuXzs+qIeyGgdNfsFsPOwaYtzlVvooVPfosP0YtFsUad/28YDXJBMHgoAYwXT5fP2
	I4sjrsUUJMdrem5aG8ogaDonNvyahOiqvdVGCo0Hbwoe4SA9UopFuqw/O+0B3OAD6tsQHfyk1o7F8
	0gFXD8Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZAG-0000000CF6C-1Nx2;
	Wed, 22 Jul 2026 15:47:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZAF-0000000CF5K-1SwP;
	Wed, 22 Jul 2026 15:47:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1MTp1OHyeKgb/4aSg1q0dkJ2JKtIDN2dcWAgJbEx6EM=; b=ko5sihR8RYL1kzEd2TFXRJBlx4
	k93TFI8m0Z6C4hUB07sVeeRfPwvmN9RyTTq9fgorIjfpEwkPze5AsSOiwRaYili6ijoeQF5lKlLY6
	oVvq2BB0q9jZpQ5T/RyY0V0EOM8+cCVa7/BtCqSt5T8BtxGdRbxDW/BQAWCQtdwqcrCFEFIUUJtSI
	BT58oJMBYTts6FwVpAkAwt4c09yuYxBG27XMuHDl02m0kIFhX/SCIdGFp50TYNCVcEyNLemPgH8HF
	S+q+Ym0cbvnjyVT7vczYkwhL5qnbtbapaCKnAZU6ETY1iZvGrnA6mByt3cADxeLxCkdnyDdXU9OWP
	Ie83aAxw==;
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmZAC-00000000yGJ-1wGz;
	Wed, 22 Jul 2026 15:47:18 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wmZA6-000000006gv-0kKd;
	Wed, 22 Jul 2026 15:47:10 +0000
Date: Wed, 22 Jul 2026 16:47:06 +0100
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
Subject: [PATCH v5 08/11] drm/bridge: it6505: guard against zero channel
 count in audio infoframe
Message-ID: <7f2bb1e136950b855b92a58d2faa9a5810382d17.1784717129.git.daniel@makrotopia.org>
References: <cover.1784717129.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784717129.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_164716_697944_AE1E62D9 
X-CRM114-Status: GOOD (  12.64  )
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

it6505->audio.channel_count stays 0 until link training or a valid
hw_params call has run, but it6505_enable_audio() can be reached
before that from the audio-FIFO-error IRQ, making
it6505_enable_audio_infoframe() index the 8-entry audio_info_ca[]
table with -1. Bail out while the channel count is not yet known.

Also fix the debug print on the invalid-channel-count path, which
logged the previously cached count instead of the rejected one.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
v5: no changes

v4: no changes, collected Chen-Yu Tsai's Reviewed-by

v3: new patch

 drivers/gpu/drm/bridge/ite-it6505.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 81d2c9644531..e9208d827ce3 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1576,6 +1576,9 @@ static void it6505_enable_audio_infoframe(struct it6505 *it6505)
 	struct device *dev = it6505->dev;
 	u8 audio_info_ca[] = { 0x00, 0x00, 0x01, 0x03, 0x07, 0x0B, 0x0F, 0x1F };
 
+	if (!it6505->audio.channel_count)
+		return;
+
 	DRM_DEV_DEBUG_DRIVER(dev, "infoframe channel_allocation:0x%02x",
 			     audio_info_ca[it6505->audio.channel_count - 1]);
 
@@ -3007,7 +3010,7 @@ static int __maybe_unused it6505_audio_setup_hw_params(struct it6505 *it6505,
 
 	if (params->cea.channels <= 1 || params->cea.channels > 8) {
 		DRM_DEV_DEBUG_DRIVER(dev, "channel number: %d not support",
-				     it6505->audio.channel_count);
+				     params->cea.channels);
 		return -EINVAL;
 	}
 
-- 
2.55.0

