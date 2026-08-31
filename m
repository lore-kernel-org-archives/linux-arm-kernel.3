Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696D0C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2dfCgcT9WYoJq3MbnykfoZuENOChAECsgIei3J8DQo=; b=2HWe+YgDrLIxJZHymSqUD0SBZI
	LxVZdf0q/NL1joYltRlZ9/aLoWwsEVgNsUTtK+nsEL7jbkkUGIIz7l7ybT3Ac+G62g6jbbVxo4kzh
	A1TgY15v1mvzFBIVGQRtpInXqol49TQMQWmWB3q0HEKZqDf0f+WurFYb10OaHBS4041xVOomwzYHJ
	mbBHFKvkuQPbn1XoMTJctk6nQMNbBNNCV6uY0TWjnyMP2yEPxzlsmBZ5CQim6qmh4QxXXyfwNUwU5
	ncu/QgXN5L0/VoXKYQi6KLShmw4MAjIpfNtkgkjKYvcG0ayJZQV/yuSM7PWL5RLA4ZExpuOdzNB5y
	kg3Xg9mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14xg-0000000A3SA-2d3l;
	Mon, 31 Aug 2026 16:34:20 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14xe-0000000A3RT-0TEl;
	Mon, 31 Aug 2026 16:34:19 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1x14xL-000000007ih-0eiy;
	Mon, 31 Aug 2026 16:33:59 +0000
Date: Mon, 31 Aug 2026 17:33:55 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
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
	Allen Chen <allen.chen@ite.com.tw>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v6 00/13] drm/bridge: it6505: DP audio support +
 shared-DAI hw_params fix
Message-ID: <apWs89912pK8qK37@makrotopia.org>
References: <cover.1784947240.git.daniel@makrotopia.org>
 <7eebbd9b-3a5e-4d95-bbbb-8ba3a7238383@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7eebbd9b-3a5e-4d95-bbbb-8ba3a7238383@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_093418_158110_3031BFEB 
X-CRM114-Status: GOOD (  16.99  )
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

On Mon, Jul 27, 2026 at 01:34:12PM +0200, AngeloGioacchino Del Regno wrote:
> On 7/25/26 04:57, Daniel Golle wrote:
> > Revive HDMI/DP audio support for the it6505, originally posted by
> > Jiaxin Yu [1], rebased onto current -next with the review feedback
> > addressed: &client->dev is gone (the driver gained it6505->dev) and
> > "#sound-dai-cells" has since been added by commit 325af1bef5b9
> > ("dt-bindings: display: bridge: it6505: Add #sound-dai-cells").
> > 
> > Patches 1-11 fix pre-existing bugs found during review of earlier
> > versions of this series; they carry Fixes: tags and are ordered first
> > so stable trees can pick them.
> > 
> > Patch 12 wires up the it6505 audio helpers via hdmi_codec_ops,
> > unblocking the mt8186-mt6366 sound card which references it6505 as
> > the I2S3 codec. Patch 13 makes hw_params succeed with no display
> > attached, needed when the I2S bus is shared with another codec as on
> > MT8186 "steelix" Chromebooks, where the speaker path must keep
> > working regardless of the it6505 link state.
> > 
> > Tested on a MT8186 (google,steelix) Chromebook: the sound card comes
> > up, speakers, microphone and headset jack work. HDMI/DP audio output
> > itself could not be tested for lack of a suitable adapter cable.
> > 
> 
> Whole series is
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioachcino Del Regno
> <angelogioacchino.delregno@collabora.com> # Steelix Chromebook

Any chance to get this merged in the new cycle now?

