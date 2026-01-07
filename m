Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BFACF6C1F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jw9fYqtCDXfPtT+8UOX2Xqrz6As8LIZX/uUf/suEIp4=; b=ho7lT4L1lxRXLhAWtWYHprES83
	3wr8xAPJRLs/BMCdiISLkRHJfkQ+L+2eGOt/MSqVAUTDy4ZPjDMD70o6jVIMy3264vZrBTiO5s5h0
	Z1DCpgVuD6mWcv92UMEmgD5U6wJMHAfxWtop5DMYM1xfgKNYqjPyFFZlJuRc7cykhDmbhb6QwhXas
	/fKOwipn9b+XJ/35M7kSazuqrsErgUBbaNwpCCc3p/k0FpEn9sHusyndtS5D8yR+42ShwWEl33wfJ
	F38epy6Z9uQQBdhpFoPR9MgohSrlQs9yiYy3VUHyzz5JwDTY3zHRN55MGUJ5EU4xUbkF01H5ZRqhS
	2/vLIcmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPye-0000000EY7D-1ddR;
	Wed, 07 Jan 2026 09:37:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPyb-0000000EY6M-2pGs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:37:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 726B41A26D9;
	Wed,  7 Jan 2026 09:37:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A77F606F8;
	Wed,  7 Jan 2026 09:37:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 438FD103C86E9;
	Wed,  7 Jan 2026 10:36:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767778628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Jw9fYqtCDXfPtT+8UOX2Xqrz6As8LIZX/uUf/suEIp4=;
	b=eJVtBzDDN9p/slaW/fBHnk6sVTQesibf2sguJrNYrWaLClMnA9NKlPA4Ehezr7dp/2Wuke
	TtkA9rGEI3kgx5Up+CjRj68avMbdok0rWTvevos1bkIUmBtsEc3fEQAZZNRjssRPAloNrC
	VfxUf5Z15TAE+A3Jw8pC2+6bVzQsAaV+4oOVdZHc8zL4SSQ9M3QGpLQjsSiKDMF3meKpSN
	YPF2lEeX7O9RW27hBkGMeIALtYqJ6aPxfiYjy+nR4V04yL93puBZHruosW7nlE02Kh9nWH
	Bq1tRPOh8ZxhL8aaB7bxftYzP2XBxLgSOURHpSrQZbKVffuOe3IhbgOhgwE4BA==
Date: Wed, 7 Jan 2026 10:36:55 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Andrew Davis <afd@ti.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell
 King <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, Tony
 Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, Markus
 Schneider-Pargmann <msp@baylibre.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Miguel Gazquez
 <miguel.gazquez@bootlin.com>, Herve Codina <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v3 04/22] drm/tilcdc: Add support for DRM bus flags and
 simplify panel config
Message-ID: <20260107103655.2d25bcc3@kmaincent-XPS-13-7390>
In-Reply-To: <f9fb8050-89f9-4449-bc2c-ff284873be79@ti.com>
References: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
	<20260106-feature_tilcdc-v3-4-9bad0f742164@bootlin.com>
	<f9fb8050-89f9-4449-bc2c-ff284873be79@ti.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_013713_848485_274C37A0 
X-CRM114-Status: GOOD (  13.49  )
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

On Tue, 6 Jan 2026 13:30:40 -0600
Andrew Davis <afd@ti.com> wrote:
> >   static int tilcdc_init(const struct drm_driver *ddrv, struct device *=
dev)
> >   {
> >   	struct drm_device *ddev;
> >   	struct platform_device *pdev =3D to_platform_device(dev);
> >   	struct device_node *node =3D dev->of_node;
> > +	const struct of_device_id *of_id;
> >   	struct tilcdc_drm_private *priv;
> >   	u32 bpp =3D 0;
> >   	int ret;
> > @@ -209,6 +222,10 @@ static int tilcdc_init(const struct drm_driver *dd=
rv,
> > struct device *dev) if (IS_ERR(ddev))
> >   		return PTR_ERR(ddev);
> >  =20
> > +	of_id =3D of_match_node(tilcdc_of_match, node); =20
>=20
> You should be able to use `device_get_match_data()` here, then you would
> also be able to keep the tilcdc_of_match table down were it was before.

Indeed. Didn't know this helper.
Thanks you!

--
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

