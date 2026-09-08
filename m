Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A52C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 11:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvBcVAP7Xte4hXp7tFPxbcEIaY+sVDfeQbUwhJkefGo=; b=qqsFp8wcRb4RO+HOvqk1tcpPuq
	+o+31Aw/YJWKz0LhO8nTIKqiBlnK9Obrm+QOoDGjZQogM+U9/AleGk5D3vnCEKdCoyOY+zCBtll/l
	xnBrmA067gCydAoNf2kpSarEHZrXEUdnSt7grrM68yh+DkcagoIh2HJ9Gx+hUJqrp/R+XxD7nxXLD
	QmAzovRF5UBzXKj0GuUOwg17LjRvhe+G0ObaJvLyHXD7bXaxZzYx+mdR4I6LFBAlSvNCTqLkor4bI
	C8u/1sw43D+Q0YtYDsCeIewvnFDJpcf6ULALtvbYorY+DRbfbs9zN1smEyVtk4P2nJOCzp3C9i9Bu
	kkc9PgyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uH4-00000008um6-2xRy;
	Tue, 08 Sep 2026 11:46:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uH3-00000008ulf-2LVW;
	Tue, 08 Sep 2026 11:46:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B72360A99;
	Tue,  8 Sep 2026 11:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE581F00A3A;
	Tue,  8 Sep 2026 11:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788867959;
	bh=TvBcVAP7Xte4hXp7tFPxbcEIaY+sVDfeQbUwhJkefGo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=LscrDB6yAvYsoaiCWf8QXN0O6I7bifJcbOF7U4O8uKtXUCUcqEtwJTEpYGh8z096y
	 UZap/ZBSgwgccuCNPAANeC5d5s7JtHhfc2ufRCxyKjmdZ25ZHeSn4AN6NjSYCcGkch
	 OPNtcHJ2IjF7ecPLyuFZDFY65+GkhGFdDt3GpnIljs+Nus3ae5bPNNSLLydzDu2ReF
	 K+k36WA6LSvxxJ+bn91YMxCbC59qfoSIpIPaDOZ5bq04glFVLdduxU8rFvtMFjO2EC
	 8Fa/o3Gklu+85jRk5b1r64W+WeIxXolQIxLM5SWifV4HlacWHVYeuStJlRFrCInl52
	 daZWO5GF5faew==
Message-ID: <d24d2bd88c66ed1b110b1035f7d09e6e@kernel.org>
Date: Tue, 08 Sep 2026 11:45:55 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v11 53/74] drm/bridge: ite-it6263: Advertise HDMI 1.3
 capabilities
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-53-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-53-bc12954a0688@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Algea
 Cao" <algea.cao@rock-chips.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniels@collabora.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Helge Deller" <deller@gmx.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Phong LE" <ple@baylibre.com>, "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Tue, 1 Sep 2026 21:51:17 +0300, Cristian Ciocaltea wrote:
> Bridges using DRM_BRIDGE_OP_HDMI are expected to provide the supported
> HDMI version.  This is not enforced yet, but will become mandatory once
> the migration to the caps-based HDMI connector initialization API is
> complete.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

