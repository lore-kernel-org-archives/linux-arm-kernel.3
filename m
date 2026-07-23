Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0FFC531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 09:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PrK33UFnL51Yikk7HZvEthg4vpaBxc9dwwZV4cmtgs=; b=vH4eTns0D3tXQYLEYXHRwSzMCh
	iXKPmKBNCgaXkfq9mIo3w+hr5VuUbFypW8lmxIRZ0706ZcMzXYPsvG/7sdpaB1Xyx8EqNreV5Wc8H
	AcKsrMba3ySzK3SMGV3DLqXIG5JRijTx0wHQJh7e6L3okmYFMYLx0F/epgbKChXo68tUoCYPPHoqf
	CYOllLOrhliebeqh0KFvZ47k3F6is+ilnkm8MnDvVLglSRkzOmiYoLg+XfYbDb9A3h9HgMOEgCYrj
	0xnNOAMgro+XSMx8Hd1dD/s/xxJRXifcoJDFZcW8BIVAbtmCDUfc0F3p3kwUAPNllsWZEKMX0IuOO
	j0ynh1wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpJs-0000000DnP8-3CRI;
	Thu, 23 Jul 2026 09:02:20 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpJp-0000000DnOe-0v02
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:02:19 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1784797330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1PrK33UFnL51Yikk7HZvEthg4vpaBxc9dwwZV4cmtgs=;
	b=oYmHFakPdPtNeOnn7Mn+PFTTcil1Fls8CvNpv3K5nlbPtwcTVmeVzAV7Bvl7lyhnhvH5dE
	kZ0zBp6xdH+C3LLTbSKZswNmCpAZiMOzTrLcqxIK2LLUAopEfy/wwBLsZi6scpkCB9WB9u
	zCbdL7bYPNpz+2+GcEBVOMg/BxF9ZTiY8fikx9ajMOSqQvLj9LsslXTUQdUOMPyUhKRJ0Q
	MFTHVoDBv21bTzN/5Hs7+4VjKJJlswmVclcljHUNFHV0cdl/J28Q13U6RTFPZVWQ34nUR9
	UahL+2Vao1t+OQftY+ywsrz/V8nGFAKqGxeHQ8cC1rRq1/q4v7tmeoLpfYwLpw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 11:02:03 +0200
Message-Id: <DK5TUJBKSK19.ZXEOSCVMTN6T@cknow-tech.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Chen-Yu Tsai"
 <wens@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Dave Stevenson"
 <dave.stevenson@raspberrypi.com>, =?utf-8?q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, "Raspberry Pi Kernel Maintenance"
 <kernel-list@raspberrypi.com>, "Sandy Huang" <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Algea Cao" <algea.cao@rock-chips.com>, "Daniel
 Stone" <daniels@collabora.com>, "Liu Ying" <victor.liu@nxp.com>, "Phong LE"
 <ple@baylibre.com>
Cc: <kernel@collabora.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v9 46/61] drm/rockchip: rk3066_hdmi: Advertise HDMI 1.4
 capabilities
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
 <20260723-dw-hdmi-qp-scramb-v9-46-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-46-4fb12ea22ac9@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_020217_799313_7294E418 
X-CRM114-Status: GOOD (  16.65  )
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

Hi Cristian,

On Thu Jul 23, 2026 at 3:35 AM CEST, Cristian Ciocaltea wrote:
> Bridges using DRM_BRIDGE_OP_HDMI are now expected to also provide a
> supported HDMI version.  This is not yet enforced, but will become
> mandatory once the migration to the new caps-based HDMI connector
> initialization API is completed.
>
> The RK3066 HDMI TX supports HDMI 1.4a, as described in commit
> f84d3d37b7fb ("drm: rockchip: introduce rk3066 hdmi").  However, the
> driver does not currently enforce a maximum TMDS character rate, it only
> filters non-CEA modes and excludes VIC 1 (640x480) via the .mode_valid
> callback.
>
> Advertise HDMI 1.4 support for now so that modes exceeding the 340 MHz
> TMDS limit are rejected by the core.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/roc=
kchip/rk3066_hdmi.c
> index f28d6a883e09..c080abe676c4 100644
> --- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> @@ -14,6 +14,7 @@
>  #include <drm/drm_probe_helper.h>
> =20
>  #include <linux/clk.h>
> +#include <linux/hdmi.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> @@ -712,6 +713,7 @@ rk3066_hdmi_register(struct drm_device *drm, struct r=
k3066_hdmi *hdmi)
>  	hdmi->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
>  	hdmi->bridge.vendor =3D "Rockchip";
>  	hdmi->bridge.product =3D "RK3066 HDMI";
> +	hdmi->bridge.supported_hdmi_ver =3D HDMI_VERSION_1_3;

Is this correct or should this be HDMI_VERSION_1_4 ?
In the other 'Advertise HDMI N.M capabilities' patches, there is a (direct)
match between the version mention in the commit summary and the
supported_hdmi_ver property, but not here.

Cheers,
  Diederik
> =20
>  	hdmi->bridge.ddc =3D rk3066_hdmi_i2c_adapter(hdmi);
>  	if (IS_ERR(hdmi->bridge.ddc))


