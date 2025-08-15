Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8926BCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 17:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVlZFD+RMAkp2R6SE31Yfc1DyLlxMDTLdf2KncYFxXg=; b=sRnAVyH4RZ9sPCMEjVrryweI3e
	4hUj+n8akEFUj2s96DZsVtWhuIzS1JlVhC9wm5sF1xGuVFM19RqG86jh+RftFEwwrk4PG13el+gs2
	dHqi+wUoA+r5JXsyhk+ZbaDTl6UaRnVhSpjBJQQCSw9sJuicajIgg0O1PUlZZ4t669Vb2AFusjhpI
	m4Ab/ef4g0dsK0bAkP4pc9gb7x03UOi0GzPBvcN3aa0iXb4U+K8AEhAk/8JlZZlaNfEqD37/WUPWZ
	J+tAiNXwXJG0W/ytHV1b+I+iX6AFNd/aXhL//DNh7diHkkX7mNqhQf+YO6YE0VqthOUxPDcXvLaJZ
	qxUT9Apw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxo7-0000000346u-0RwY;
	Fri, 15 Aug 2025 17:01:35 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umw1g-00000002o3g-25cj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 15:07:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umw10-0004t6-6g; Fri, 15 Aug 2025 17:06:46 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umw0x-000R8g-1i;
	Fri, 15 Aug 2025 17:06:43 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umw0x-000PY3-1L;
	Fri, 15 Aug 2025 17:06:43 +0200
Message-ID: <93025d4cb696f06228e1c84a7c22dbcede6e77a3.camel@pengutronix.de>
Subject: Re: [PATCH 04/21] drm: remove unneeded 'fast_io' parameter in
 regmap_config
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Liu Ying <victor.liu@nxp.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko =?ISO-8859-1?Q?St=FCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Date: Fri, 15 Aug 2025 17:06:43 +0200
In-Reply-To: <20250813161517.4746-5-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
	 <20250813161517.4746-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_080728_535339_8A1E1550 
X-CRM114-Status: GOOD (  14.81  )
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

On Mi, 2025-08-13 at 18:14 +0200, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> No dependencies, can be applied directly to the subsystem tree. Buildbot =
is
> happy, too.
>=20
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c   | 1 -
>  drivers/gpu/drm/imx/dc/dc-cf.c                   | 1 -
>  drivers/gpu/drm/imx/dc/dc-de.c                   | 1 -
>  drivers/gpu/drm/imx/dc/dc-ed.c                   | 2 --
>  drivers/gpu/drm/imx/dc/dc-fg.c                   | 1 -
>  drivers/gpu/drm/imx/dc/dc-fl.c                   | 1 -
>  drivers/gpu/drm/imx/dc/dc-fw.c                   | 2 --
>  drivers/gpu/drm/imx/dc/dc-ic.c                   | 1 -
>  drivers/gpu/drm/imx/dc/dc-lb.c                   | 2 --
>  drivers/gpu/drm/imx/dc/dc-tc.c                   | 1 -
>  drivers/gpu/drm/imx/ipuv3/imx-tve.c              | 2 --
>  drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c | 1 -
>  12 files changed, 16 deletions(-)
>=20
[...]
> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ip=
uv3/imx-tve.c
> index c5629e155d25..b34037d0d7a8 100644
> --- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> +++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> @@ -457,8 +457,6 @@ static struct regmap_config tve_regmap_config =3D {
> =20
>  	.readable_reg =3D imx_tve_readable_reg,
> =20
> -	.fast_io =3D true,
> -
>  	.max_register =3D 0xdc,
>  };
> =20

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

