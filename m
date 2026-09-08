Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479D9C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 11:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFqlxS0VAJUS1eYBmNpsy+dfqGlk6k7GW17X4HTW28c=; b=ktLd8xQM+ZCj/OmHj6dt1yLxNx
	0/ZggQaECBaUqk6QPlLvIIQhV/UudmaNyQRBgpUhpY9nilUgX8t+33zmktAg11g/6EY+szVm0My1/
	qbe4ucRL58kTQExg04RUtOZ6dGfuvaNKqWR9rlWvI0+v/ccnqI7H1nIStE3pLXr2t6D7X+Ym0TBHo
	JwCZIsrC5dw/BeoDvxB+9ZrTZunLqKtj9THan1FbqRblIlvtJLxa9b0Shutwu2r8Nsvo0kVOXWus9
	o+lzds/15fTl4Gq9P6NQqPw6fHzc8gJtU+54dF8RSfr/z7wN5sYx5rW1evTYPwb/w0bBdh+YZJdua
	YxT18NnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uIq-00000008vS7-0O1f;
	Tue, 08 Sep 2026 11:47:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uIn-00000008vR3-4758;
	Tue, 08 Sep 2026 11:47:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B89F60A99;
	Tue,  8 Sep 2026 11:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6594A1F00A3D;
	Tue,  8 Sep 2026 11:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788868069;
	bh=tFqlxS0VAJUS1eYBmNpsy+dfqGlk6k7GW17X4HTW28c=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=Zrwask4N3j51yTltiB/mAq4qaOdIeMraUZsUz5Ls8bSfm7rcPvdE1RKC4nsb2ec3r
	 SHKYRO7l2cVsLvKvwr7aAv6tqdshJRerMmC+kdkjk1yet+kY5czRmLjXIeHQK70y4p
	 JkRs3Vsy0kK1W1xcDm0uOq0Rh2t51tEVYzZ220IlX2o6xjmgDL5RJQWaAuRq5wucv8
	 rzzImm1aqyGT37N4xIGW3yBv0/gaNUmU51JqCVG5+VBUZFUE+QtVz/EsoM8fGqRS+/
	 MYjYz1E/Yjr2yEevd/KD/VMzK3s2nXeEntc5tdJhy87XkeYLIFj9T8WNUoRIQWSzVC
	 sLgUXq0Xtxfbw==
Message-ID: <3f8b2fbfcaf3185caf8a833375b335a5@kernel.org>
Date: Tue, 08 Sep 2026 11:47:45 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v11 61/74] drm/tests: bridge: Set supported HDMI version
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-61-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-61-bc12954a0688@collabora.com>
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
Content-Transfer-Encoding: quoted-printable
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

On Tue, 1 Sep 2026 21:51:25 +0300, Cristian Ciocaltea wrote:
> Bridges using DRM_BRIDGE_OP_HDMI are now expected to also provide a
> supported HDMI version.  This is not yet enforced, but will become
> mandatory once the migration to the new HDMI connector initialization API
> is completed.
>=20
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

