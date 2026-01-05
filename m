Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B68AC79FB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIBkZttH8UcrhXyn62V/vifYHtr3RdH6TLU19ogc48M=; b=VCA9Uf4R2LmZwMKzSrDxIgcol+
	2zOhhUwH1O5bTqNhGRHlEhRwzG/8n5u2ShqB0gIjjPWST946HrmwyhkvUpL6YtAL9JZtd1slx8PK0
	k0MbR/AQyZLb9n2X6CruX85hAZ1VIM50sU2YdvqwMItFVzm8T37uU6nk0z6o8GtVPhBy6k6SmKzfj
	/9kvbwz7rDZgc/3A0tcq9zBjoa6X2W7PsnOsM/BVQKWhQ3bADNvbb6ywJi9KTarqL3Am/yRpqz2qW
	jyGY148ngbIEDsRNVGKD8QevEYXsvtqnvAhYajEWhRrxyJkH69pERRijqmDnm8p2P91frsY4Dtg2l
	ZmgxrZng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoEI-0000000Bo5r-3F9O;
	Mon, 05 Jan 2026 17:18:54 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoEE-0000000Bo56-2rki
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:18:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 909B01A2667;
	Mon,  5 Jan 2026 17:18:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5787760726;
	Mon,  5 Jan 2026 17:18:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 859B4103C85AF;
	Mon,  5 Jan 2026 18:18:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767633524; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jIBkZttH8UcrhXyn62V/vifYHtr3RdH6TLU19ogc48M=;
	b=Lgt1/wWNFRp8ZDmb4YxYLjkiBRcb7CtoVKmTRMZ07W0U/br6Dh3BJWJMTCYTx3gk9yo5me
	xVBBu3t77YwByxcwFqBpDuk8U4O7hBLh/oP5g71HenWMA4xI7vHRcUm5Z9ZtzOcZVuysNt
	bRHiWBmjoR+i2zexcxaE9zdDtikD61FniAZQJYOp+9QYJkIAd0Z43TNx4bhO2i1havaIzR
	Fppa2taeXE/HzEaPkj85nvh8yN6jO297zAoQ9AVoqAQe1qUyBFvrA5fYX7/bN/TBFseok9
	7iNat9VoBDAXYM3IVTcoqyJz9uKtvjg1NeNZfFNiiqU2vUTkn2Sya1FAGxzOBg==
Date: Mon, 5 Jan 2026 18:18:38 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: "Luca Ceresoli" <luca.ceresoli@bootlin.com> (by way of Kory Maincent
 <kory.maincent@bootlin.com>), "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony Lindgren" <tony@atomide.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v2 05/20] drm/tilcdc: Convert legacy panel binding via
 DT overlay at boot time
Message-ID: <20260105181838.1f307964@kmaincent-XPS-13-7390>
In-Reply-To: <20260105172220.2d2edd28@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
	<20251211-feature_tilcdc-v2-5-f48bac3cd33e@bootlin.com>
	<DF0K5UFX46JA.OH85T6IPC5MW@bootlin.com>
	<20260105172220.2d2edd28@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_091851_044598_4678F3D8 
X-CRM114-Status: GOOD (  28.91  )
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

On Mon, 5 Jan 2026 17:22:20 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi Luca, Kory,
>=20
> On Wed, 17 Dec 2025 15:23:26 +0100
> "Luca Ceresoli" <luca.ceresoli@bootlin.com> (by way of Kory Maincent
> <kory.maincent@bootlin.com>) wrote:
>=20
> > Hi,
> >=20
> > Cc: Herv=C3=A9, can you review the DT overlay aspects? =20
>=20
> Yes sure.
>=20
> Here is my global review.
>=20
> Depending on the discussion on things I have spotted, I will go deeper in
> patch details.
>=20
> ...
>=20
> > > +
> > > +static void __init
> > > +tilcdc_panel_update_prop(struct device_node *node, char *name,
> > > +			 void *val, int length)
> > > +{
> > > +	struct property *prop;
> > > +
> > > +	prop =3D kzalloc(sizeof(*prop), GFP_KERNEL);
> > > +	if (!prop)
> > > +		return;
> > > +
> > > +	prop->name =3D kstrdup(name, GFP_KERNEL);
> > > +	prop->length =3D length;
> > > +	prop->value =3D kmemdup(val, length, GFP_KERNEL);
> > > +	of_update_property(node, prop); =20
>=20
> I would use OF changesets to perform the modification.
>=20
> OF changesets are kind of atomic. You first prepare all modifications in a
> changeset and then you apply the changeset.
> If something goes wrong, the changeset is removed.
>=20
> Also, if something goes wrong during the changeset preparation, you can a=
bort
> without any modification on the live device-tree.

Ok, I will take a look at changeset to use it to copy all the properties to=
 new
the panel-dpi node.

...

> > > +
> > > +	ret =3D of_overlay_fdt_apply(dtbo_start, dtbo_size, &ovcs_id,
> > > NULL);
> > > +	if (ret)
> > > +		goto out; =20
>=20
> As soon as the overlay is applied, the driver handling the panel-dti node
> can be probed.
>
> Modifying some properties after applying the overlay could be not seen by=
 the
> driver.

I disagree here. This driver is loaded at subsys_initcall (initcall 4) while
the panel is loaded at device_initcall (initcall 6) so the panel driver won=
't
probe in-between.

...

> > > +subsys_initcall(tilcdc_panel_legacy_init); =20
>=20
> IMHO, the call to tilcdc_panel_legacy_init() will be too late.
>=20
> subsys initcalls are called after arch initcalls.
>=20
> During arch initcalls, of_platform_populate_init() is called
> https://elixir.bootlin.com/linux/v6.19-rc3/source/drivers/of/platform.c#L=
599
>=20
> The root node is populated and handled by the platform bus.
>=20
> Later at subsys initcall, the tilcdc_panel_legacy_init() function is call=
ed.
> This function starts by applying the overlay and so a new node (panel-dpi)
> is added at the root node.
>=20
> This trigger an OF_RECONFIG_CHANGE_ADD event handled by the platform bus.
> https://elixir.bootlin.com/linux/v6.19-rc3/source/drivers/of/platform.c#L=
731
>=20
> If the "panel-dpi" compatible driver is available, its probe() is called =
but
> the panel-dpi DT node is not fully correct. Indeed, tilcdc_panel_copy_pro=
ps()
> has not be called yet.

As said before, I don't think this will happen due to the initcall differen=
ce
value.

> Also, the legacy compatible string is removed after the
> of_platform_populate_init() call. The legacy driver could have been alrea=
dy
> probed.

Same here.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

