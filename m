Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC42FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kX3akctXS5o2mju3h0uKTaPUyivHAkjE2bG1GzpTBXQ=; b=OBReQq+7Z7wpTbJlC39Z5wU8Kx
	OC8ayGZIugxDIYJum/DHj+DNisfDBJmlPTFrn53ImbBVkJvzGB1XUlbMQIOhovWm6TU3BzRIwcEZc
	GoR1mwjLpWL1WmfS8MZ5wOMNP+eQFXrqMKyLHbFIUIywawdJTSDXKUju1TqsZNjiyyuvK+UxMOrPL
	7mfs49IsEFf298dv17ytfTFec3iS7FwRcj/j/6t9I87CnxabIEKAQefqTmAZLGXEfJfUwmjJTvg6u
	GUTOl+SZCaX1obXpBPf7HEImuAi3cVvVHqK4tkwgmd4srKWuQK3e9hfrtJevypa1Vi/GqxKRMubYz
	4vWkPnxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI3T-0000000GYH4-2Tap;
	Mon, 27 Apr 2026 09:15:03 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI3R-0000000GYFE-3PFc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 09:15:02 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wHI31-000151-3b; Mon, 27 Apr 2026 11:14:35 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wHI2y-007Sug-0S;
	Mon, 27 Apr 2026 11:14:32 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wHI2y-000000004DH-0Dxa;
	Mon, 27 Apr 2026 11:14:32 +0200
Message-ID: <871996c5a57223294c584c0ff344efd30b3b982b.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] thermal: mediatek: lvts: Add MT8189 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: mtk36707 <kuanfu.lu@mediatek.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>,  Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,  Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Balsam CHIHI <bchihi@baylibre.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, jarried.lin@mediatek.com, 
	vince-wl.liu@mediatek.com, justin.yeh@mediatek.com
Date: Mon, 27 Apr 2026 11:14:31 +0200
In-Reply-To: <20260427065236.1685057-2-kuanfu.lu@mediatek.com>
References: <20260427065236.1685057-1-kuanfu.lu@mediatek.com>
	 <20260427065236.1685057-2-kuanfu.lu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_021501_853778_D5B61FAA 
X-CRM114-Status: GOOD (  21.12  )
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

On Mo, 2026-04-27 at 14:48 +0800, mtk36707 wrote:
> From: Kuanfu Lu <kuanfu.lu@mediatek.com>
>=20
> Add LVTS thermal support for MediaTek MT8189 by adding MT8189-specific
> controller/sensor topology and platform data for the MCU and AP domains.
>=20
> MT8189 differs from previous SoCs in a few aspects, so extend the driver
> to handle these variations:
> - Program the hardware thermal shutdown threshold (tshut) using raw units=
.
> - Add per-SoC feature flags to skip clock gating and reset control when
>   they are not required, and to enable Stage-3 monitor interrupt setup.
> - Pass SoC data into lvts_irq_init() and lvts_ctrl_configure() so the
>   initialization can be configured per platform.
>=20
> This enables monitoring of MT8189 CPU clusters and AP domain sensors
> (SOC/APU/GPU) with the existing LVTS driver.
>=20
> Signed-off-by: Kuanfu Lu <kuanfu.lu@mediatek.com>
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 142 +++++++++++++++++++++---
>  1 file changed, 129 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
> index a9617d5e0077..9dbd9191e3ba 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
[...]
> @@ -1470,10 +1482,12 @@ static int lvts_probe(struct platform_device *pde=
v)
>  	if (IS_ERR(lvts_td->base))
>  		return dev_err_probe(dev, PTR_ERR(lvts_td->base), "Failed to map io re=
source\n");
> =20
> -	lvts_td->reset =3D devm_reset_control_get_by_index(dev, 0);

First of all, this should have been:

	lvts_td->reset =3D devm_reset_control_get_exclusive(dev, NULL);

since there is only a single reset control defined in the binding.

> -	if (IS_ERR(lvts_td->reset))
> -		return dev_err_probe(dev, PTR_ERR(lvts_td->reset), "Failed to get rese=
t control\n");
> -
> +	if (!lvts_data->reset_no_need) {
> +		lvts_td->reset =3D devm_reset_control_get_by_index(dev, 0);

So this can be changed to

	lvts_td->reset =3D devm_reset_control_get_optional_exclusive(dev, NULL);

instead. There is no need for the reset_no_need parameter at all.
Whether the reset control is required or not is already specified in
the device tree bindings.

> +		if (IS_ERR(lvts_td->reset))
> +			return dev_err_probe(dev, PTR_ERR(lvts_td->reset),
> +					     "Failed to get reset control\n");
> +	}
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;

regards
Philipp

