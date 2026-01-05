Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF39C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urFj5GEfGN8FUr9AOM2C6eqiJQ8QOnGyn9HuswUxntE=; b=m6740EGg0t5h6uUOvt4cTltzHx
	4R1n4KzH/A/hFrVyc7nS+9EmVGVDFRdQ2abKYtRjXpeg5pA+TjzceVhxDFvJ05qGmYTA5/n0vazjd
	8HAga/wXeM0p+ab7q6LJ/TzLfnRzui1QSEzDmTLVupLMoF6d5QNKXtvqmSHOaQIncqZyUE9zaVro7
	vNMEzf900YdeIzg+uyMfIU+V00AYOlx1luJg+iJ9sGsJ5TZ5y9S8u+IoHhjZBnedZPGRCL7PgJFhn
	aMAAmoYFY4TrD3hGGmUA98jxjPWyjqn+VqrockT5A6blXJ8qIoAx5rwvbpQN16bZhNqt6wLCTtCdO
	rJbVZDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmmX-0000000Bd6S-3QlA;
	Mon, 05 Jan 2026 15:46:09 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmmR-0000000Bd4k-3ah7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:46:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 10F974E41F7F;
	Mon,  5 Jan 2026 15:46:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D0C1C60726;
	Mon,  5 Jan 2026 15:45:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5BF16103C8589;
	Mon,  5 Jan 2026 16:45:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767627958; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=urFj5GEfGN8FUr9AOM2C6eqiJQ8QOnGyn9HuswUxntE=;
	b=siYqSzl40Vyi3gRkzXNtwSMwEya76+IHz+53auu6Pjt5ozNbdfPZkTRqqklql44NeDop1b
	g6skmldwyiDb3s414SWmAGzorvgwWlL7tjuFf8dfYjqUbJziGpnCtn4JmMyrLAZvkY65+/
	Wad8Z/Xsgu7aVPaJ9jLbde9LuDKwZvkxi2PWu1RplG+8Pgaoc3a1Fc5YBiAhgmVD0t3DNU
	o/f3kJQQEUpi5xDULWXoaFWYJv0ohNpe+07F6lCVXE+658vVHMueSf+9yr5DZYPzejXDNd
	VJ+0XZjsUSqZ02HoL4dTROlwgBBOHtXuQx1EH4M3EWIEEA1EO2Q3FCeqzoHJaQ==
Date: Mon, 5 Jan 2026 16:45:48 +0100
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
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v2 13/20] drm/tilcdc: Remove the useless module list
 support
Message-ID: <20260105164548.0f760c66@kmaincent-XPS-13-7390>
In-Reply-To: <DF0K7JPSOKLU.3V1FT4LAZSPGB@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
	<20251211-feature_tilcdc-v2-13-f48bac3cd33e@bootlin.com>
	<DF0K7JPSOKLU.3V1FT4LAZSPGB@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_074604_050167_75707104 
X-CRM114-Status: GOOD (  18.56  )
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

On Wed, 17 Dec 2025 15:25:40 +0100
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

> On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
> > The tilcdc driver previously supported a sub-module system where
> > external display drivers (panels, encoders) could register themselves
> > through tilcdc_module_init() and be automatically initialized through
> > a module list. This infrastructure became unused after the component
> > framework support and panel driver was removed.
> >
> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com> =20
>=20
> [...]
>=20
> > @@ -562,24 +533,7 @@ static struct platform_driver tilcdc_platform_driv=
er =3D
> > { .of_match_table =3D tilcdc_of_match,
> >  	},
> >  };
> > -
> > -static int __init tilcdc_drm_init(void)
> > -{
> > -	if (drm_firmware_drivers_only())
> > -		return -ENODEV;
> > -
> > -	DBG("init");
> > -	return platform_driver_register(&tilcdc_platform_driver);
> > -}
> > -
> > -static void __exit tilcdc_drm_fini(void)
> > -{
> > -	DBG("fini");
> > -	platform_driver_unregister(&tilcdc_platform_driver);
> > -}
> > -
> > -module_init(tilcdc_drm_init);
> > -module_exit(tilcdc_drm_fini);
> > +module_platform_driver(tilcdc_platform_driver); =20
>=20
> Is this hunk related to the removal of the module list? Looks like it
> should be a separate patch.

Indeed it is not directly related, but a following cleanup. I will put it in
another patch.

>=20
> With that hunk removed (or kept if I'm wrong and it should stay):
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

