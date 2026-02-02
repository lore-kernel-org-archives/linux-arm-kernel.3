Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182DEE73151
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 09:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+RzlUEH251YiNbOWqwHIrsXi4zbpi7hYqWeCjzmkvA=; b=XcD0Z+RwRjNlLCPVTTbm3ppBzz
	6AxoA4JlIMtKkvycHC83xpcZmVLRRmfa5JAVIWsc9bPoXR1DusWkJWL4cqsqjBrMquhA36cRQeMQM
	C8g07YnuJRE1elz3XWI5xR8FsmxOtQCpudmxVdFW4O/4JtVCKdiycgQNr6xkSbW7kSwxB8s4by8J1
	zTubczXPPoLk5G1PJmTFGjitSc1jq5+y43X2anJKlYHLvN7npCyoFZnIRCtQfDimh5BaMV4g6zvo+
	ih2SN9kHIlRdB234RKma+sozHSdK0rszqiAsJju4MwG/hcsqf3cKWeBHTKgYaNs7r8uAZQiXqQ8pD
	ZmdefUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqgZ-00000004kg6-0wEW;
	Mon, 02 Feb 2026 09:57:35 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqgW-00000004kej-1BkL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 09:57:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AC150C237F2;
	Mon,  2 Feb 2026 09:57:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E12BB60767;
	Mon,  2 Feb 2026 09:57:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24B11119A88F3;
	Mon,  2 Feb 2026 10:57:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770026246; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=S+RzlUEH251YiNbOWqwHIrsXi4zbpi7hYqWeCjzmkvA=;
	b=FXCVqwM72h5FfBEEXwcOFOqTDjIdbJaKQXVYgrJ8vEuINUCHICIlFugMQeTGBCNR3O6Mow
	O8vavTSKTulfNlq/92gz9cn/ivnkcP8CHDf943HUZpYM8vdjSJHF+t1oUXcloP8KCHQ5O9
	L4KfNkJ4Tgs759FtCusyfBX27o+U0DsBRF5F6byiew2+Hqv5mBJkIE5sUaijyqm0KTruKn
	6x7MEh/prgS0XlRexT4gxyKUL/Kr0jKr4oJJ9OxNWE2snMNmeVBKpyITDLkt0I/SsUvjZ0
	kVNpU1wBPIAlEfJCKS5V4JpovaWRxhAPIVTJDU7ySTHTAq8JOCC2197uz7BWHQ==
Date: Mon, 2 Feb 2026 10:57:17 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
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
 <miguel.gazquez@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v5 20/25] drm/tilcdc: Use devm_drm_of_get_bridge()
 helper
Message-ID: <20260202105717.53067aae@kmaincent-XPS-13-7390>
In-Reply-To: <DG269FV5MZ8I.2VFNJXA0N2Y26@bootlin.com>
References: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
	<20260123-feature_tilcdc-v5-20-5a44d2aa3f6f@bootlin.com>
	<DG269FV5MZ8I.2VFNJXA0N2Y26@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_015732_465968_5442810E 
X-CRM114-Status: GOOD (  17.60  )
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

On Fri, 30 Jan 2026 20:31:11 +0100
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

> Hi Kory,
>=20
> On Fri Jan 23, 2026 at 5:12 PM CET, Kory Maincent (TI.com) wrote:
> > Replace drm_of_find_panel_or_bridge() with the newer
> > devm_drm_of_get_bridge() helper which simplifies the code by:
> > - Automatically handling both panel and bridge cases internally
> > - Managing the panel-to-bridge conversion when needed
> > - Using devres for resource management, eliminating manual cleanup
> >
> > This removes the need for explicit panel-to-bridge conversion via
> > devm_drm_panel_bridge_add_typed() and the associated error handling pat=
h.

...

> >  	encoder =3D drmm_simple_encoder_alloc(ddev, struct tilcdc_encoder,
> >  					    base, DRM_MODE_ENCODER_NONE);
> > @@ -73,12 +70,5 @@ int tilcdc_encoder_create(struct drm_device *ddev)
> >  	}
> >  	priv->encoder =3D encoder;
> >
> > -	if (panel) {
> > -		bridge =3D devm_drm_panel_bridge_add_typed(ddev->dev, panel,
> > -
> > DRM_MODE_CONNECTOR_DPI); =20
>=20
> You are introducing a subtle difference here: while you pass the connector
> type to devm_drm_panel_bridge_add_typed(), devm_drm_of_get_bridge() does
> not take it and expects it to ahve been set previously and errors out if =
it
> hasn't.
>=20
> Can you ensure the connector type is alway set before this
> devm_drm_of_get_bridge() call?

The connector type should be set by the bridge or the panel driver.

https://elixir.bootlin.com/linux/v6.18.6/source/drivers/gpu/drm/bridge/pane=
l.c#L397
 * This function is deprecated and should not be used in new drivers. Use
 * devm_drm_panel_bridge_add() instead, and fix panel drivers as necessary =
if
 * they don't report a connector type.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

