Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA84C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 17:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2QzGKfGTaWvpcDS0Hc6F1KvTxapAgozq510GHUp/RNU=; b=KqnNkw293rTLniGVesQSs077xA
	SRbOOBTDnl6I0x/mRAIEe3QpJp59Oe8Mwf5ZtmMuiN+zOqWiVejf7bJ1Cj2QXzlyVR0QLq+YR38DL
	/0OaZOta5HH3uDYNU/WAEXkKi0AYM3faalcyc7lkEi0Rz3LzdGIGRuRlEZNkRc0sgJh9N95MOlHAP
	2KowSeClGlDtgaWsVxrnB+xD4lofsNwy2DRgoT520W1HHgtJ8rjiY+nYBcVNhw8+39fHsR5gjj4p2
	k1HjjFiw8Cn8gEvvri8lzWw5vLFtDiULFP7GliI8FNTnuzqx9os+H7d0GMGXynyl9kpah/EZNvx/y
	FLbvTQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl8RZ-00000004MFg-01PO;
	Sat, 18 Jul 2026 17:03:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl8RT-00000004MCM-3nNM;
	Sat, 18 Jul 2026 17:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=2QzGKfGTaWvpcDS0Hc6F1KvTxapAgozq510GHUp/RNU=; b=rQBHukYcBSvq7AFVbcgBPz1Mr4
	Q+SKIIh0C7/5/UNQQekDPcCxMMN2ox6NxcqsdYnCFWyp9wLTNQHHMtUr+sRFsYsXtVRBOYH7k5wwC
	AgTGPImcPMTUOTDoTtpXL8KRKYqiKStoM92PlmSuM6fBzdTGWhLDea2KtuVocOk3IL81sotJZcr0C
	UtMn47kaNBKAi5GQ/buGxy/f3+FeGHNrHZOuyrYTxyzr6yEPfwIHLn6CtZQ3LrixZhkSodO39en3Z
	P0HDVU9qHP+odaSr+uT6dO8leRRvlDd0leZt8ofQFnyAI5zmOg5fcSKcjOp9t8dWHW8mDDWJDx8rD
	sWkafe8w==;
Received: from [2a07:2ec0:3002::65] (helo=pidgin.makrotopia.org)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wl8RQ-0000000FbEJ-1jmh;
	Sat, 18 Jul 2026 17:03:10 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wl8R1-000000007ra-1sOB;
	Sat, 18 Jul 2026 17:02:43 +0000
Date: Sat, 18 Jul 2026 18:02:40 +0100
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
	Allen Chen <allen.chen@ite.com.tw>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] drm/bridge: it6505: DP audio support + shared-DAI
 hw_params fix
Message-ID: <cover.1784393979.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_180308_573180_E7436DDE 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
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

This revives Jiaxin Yu's stalled "drm/bridge: it6505: Add audio support"
v3 [1], rebased onto current mainline, plus the fix needed to make it work
on boards where the it6505 DP output shares an I2S DAI with another codec.

Patch 1 wires up the previously-unused it6505 audio helpers via
hdmi_codec_ops, which unblocks the mt8186-mt6366 sound card that
references it6505 as the I2S3 codec.

Patch 2 stops it6505_audio_setup_hw_params() from returning -ENODEV when
no DP display is attached, which would otherwise tear down the shared
backend and break playback on the co-located codec (the speaker).

Tested on a MediaTek MT8186 (google,steelix) Chromebook: speaker and
built-in mic work. Actual HDMI/DP audio output could not be tested as the
sample exposes no usable DP-audio port.

[1] https://lore.kernel.org/all/20230730180803.22570-4-jiaxin.yu@mediatek.com/
Daniel Golle (1):
  drm/bridge: it6505: Don't reject audio hw_params without an encoder

Jiaxin Yu (1):
  drm/bridge: it6505: Add audio support

 drivers/gpu/drm/bridge/ite-it6505.c | 94 +++++++++++++++++++++++------
 1 file changed, 77 insertions(+), 17 deletions(-)


base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.55.0

