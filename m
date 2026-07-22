Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A54EC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3kJI25oA+cp5YVXJRoeWprSuLu5yW0g3ExXC1p8Ri4=; b=tg5zizSCp1OaDg+qEDHGxh0k0w
	QdvwaYyp2bWScT9PD02ezyvv5QC6Bt3sN3NkYBCBcxASqfDIKzgkKs3eY79q4TzXJZLkrUdZ4/8Jj
	eypyML9buWIEum+JXh2l0t3Wa6smHZIk31vxI5daAQ+hTopHXdElCi4RJP9GGVoLfuzPyNlo97Q5Q
	9+b86rOi4COHTbntQ+zZvWoQdRKWgn/IepFClAQhsmT6/yqK4P7IirIDfZD1iLbsbVSJDLp6Sgmut
	a16/fmQbrPKDdeMsZgJtuHZDrqm+sPzXNLsStJ9PXQFy8z0Pa18I8UO+tRZpC7MFhnvUui3fMbqgc
	HPWJDlVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZAt-0000000CFSv-31Wx;
	Wed, 22 Jul 2026 15:47:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZAs-0000000CFSL-1OIG;
	Wed, 22 Jul 2026 15:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=A3kJI25oA+cp5YVXJRoeWprSuLu5yW0g3ExXC1p8Ri4=; b=nTjNREVoraYTdoGn5DJt/9/iDO
	6vEPzUt9ZAA4qOMY4VdF4SCjKIZcwIPRmwVApYbRNLcdhEDpuzqpX+L8P2vsJrowgCzfkAXNkpn+6
	OKhk99NAEGPIdGUmTkHhFwHMCoZiq1J8NgVxLxB2ZxmMpCWvpPAOvTsXTIwqN/BsgWeMS2pHnw4X/
	pgp7StnZ9UuD0dZ2fwmcWNSWmCBdsygGXXCA/zoHDuIWF4erc09BR87w4hDMf1VY+fOKk+uk4TNYu
	kCk+tHRw2F8Xk8a8g61J7kgoT+lpxF6vfOkFCJlrWGDaCcPrcu1QgRySKQSepofzRa+m25zdSsiVk
	7hEcnOAg==;
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmZAp-00000000yOx-29Ds;
	Wed, 22 Jul 2026 15:47:57 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wmZAj-000000006jd-0Q9G;
	Wed, 22 Jul 2026 15:47:49 +0000
Date: Wed, 22 Jul 2026 16:47:45 +0100
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
Subject: [PATCH v5 11/11] drm/bridge: it6505: Don't reject audio hw_params
 without an encoder
Message-ID: <b7e959e44dfb517297f3449bac8fed53671c505e.1784717129.git.daniel@makrotopia.org>
References: <cover.1784717129.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1784717129.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_164755_714356_065E460A 
X-CRM114-Status: GOOD (  10.21  )
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

it6505_audio_setup_hw_params() returns -ENODEV when no encoder is
attached. With it6505 registering an hdmi-audio-codec this runs for
every stream on the I2S DAI, and on mt8186-corsola, where the rt1019
speaker amplifier shares I2S3, the error tears down the whole DPCM
backend and breaks speaker playback whenever no display is attached.

The function only caches stream parameters, which needs no encoder.
Drop the check, and apply the audio defaults once at probe instead of
in it6505_variable_config(), which would clobber the cached
parameters again on every hotplug. Actual audio output remains gated
by it6505->powered.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v5: no changes

v4: apply audio defaults at probe time instead of in
    it6505_variable_config()

v3: no changes

v2: drop the encoder check entirely instead of returning 0 early

 drivers/gpu/drm/bridge/ite-it6505.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 75b287cda801..ba8db1e36ff6 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1370,16 +1370,6 @@ static void it6505_variable_config(struct it6505 *it6505)
 	it6505->link_state = LINK_IDLE;
 	it6505->hdcp_desired = HDCP_DESIRED;
 	it6505->auto_train_retry = AUTO_TRAIN_RETRY;
-	it6505->audio.select = AUDIO_SELECT;
-	it6505->audio.sample_rate = AUDIO_SAMPLE_RATE;
-	it6505->audio.channel_count = AUDIO_CHANNEL_COUNT;
-	it6505->audio.type = AUDIO_TYPE;
-	it6505->audio.i2s_input_format = I2S_INPUT_FORMAT;
-	it6505->audio.i2s_justified = I2S_JUSTIFIED;
-	it6505->audio.i2s_data_delay = I2S_DATA_DELAY;
-	it6505->audio.i2s_ws_channel = I2S_WS_CHANNEL;
-	it6505->audio.i2s_data_sequence = I2S_DATA_SEQUENCE;
-	it6505->audio.word_length = AUDIO_WORD_LENGTH;
 	memset(it6505->sha1_input, 0, sizeof(it6505->sha1_input));
 	memset(it6505->bksvs, 0, sizeof(it6505->bksvs));
 }
@@ -3020,9 +3010,6 @@ static int it6505_audio_setup_hw_params(struct it6505 *it6505,
 			     params->sample_rate, params->sample_width,
 			     params->cea.channels);
 
-	if (!it6505->bridge.encoder)
-		return -ENODEV;
-
 	if (params->cea.channels <= 1 || params->cea.channels > 8) {
 		DRM_DEV_DEBUG_DRIVER(dev, "channel number: %d not support",
 				     params->cea.channels);
@@ -3154,6 +3141,16 @@ static int it6505_register_audio_driver(struct device *dev)
 	};
 	struct platform_device *pdev;
 
+	it6505->audio.select = AUDIO_SELECT;
+	it6505->audio.sample_rate = AUDIO_SAMPLE_RATE;
+	it6505->audio.channel_count = AUDIO_CHANNEL_COUNT;
+	it6505->audio.type = AUDIO_TYPE;
+	it6505->audio.i2s_input_format = I2S_INPUT_FORMAT;
+	it6505->audio.i2s_justified = I2S_JUSTIFIED;
+	it6505->audio.i2s_data_delay = I2S_DATA_DELAY;
+	it6505->audio.i2s_ws_channel = I2S_WS_CHANNEL;
+	it6505->audio.i2s_data_sequence = I2S_DATA_SEQUENCE;
+	it6505->audio.word_length = AUDIO_WORD_LENGTH;
 	it6505->audio.mute = true;
 	INIT_DELAYED_WORK(&it6505->delayed_audio, it6505_delayed_audio);
 
-- 
2.55.0

