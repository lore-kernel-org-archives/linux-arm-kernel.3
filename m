Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFCBD3EE74
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 15:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNoOeyLdRbrJPSI/I28lkpAsBvsGiM1vvz72sBr9geA=; b=qOPcxUPsnTrKT3e9OKCTW+moMJ
	iyUj9Ry2vy2+veFFSwu31pzlc/+eLsE7+WGUane9I9etSb+sakqIozp54u99pwA3W+1kvpjg9XB8W
	SRJVzd7m2RvZ/e/Fe+FJ7rb249PrBFqN0Z6GKIBznb3mRUAJLkfyfgdKMWF6VLPW4/wTFjAXQOo3a
	0wvttADwiLEbN4BtiGeKJ6ikZ6F1SnHEtuWVnIABr5KKOKmri1ERBbBNhlteEgHU7WO8A2hzAhnAz
	KvphtfCzP7VPvHO5YyJZXT4b85lKaq19QiSqf1YfqfoVSb5i+C2UetocXq+sIseiQD5FxtpvcgOCB
	25uDNxaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwDV-00000007I2y-019h;
	Thu, 22 Jan 2026 15:03:25 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwDR-00000007I2M-0CX5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 15:03:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1853AC21AA6;
	Thu, 22 Jan 2026 15:03:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 37575606B6;
	Thu, 22 Jan 2026 15:03:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47242119B82C7;
	Thu, 22 Jan 2026 16:03:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769094197; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cNoOeyLdRbrJPSI/I28lkpAsBvsGiM1vvz72sBr9geA=;
	b=bT6zFJXHZg4b/0Yur0HKyDxB7YVrRbw3CMxP+5Ir+R40QcBKAyqf+FJzlDonCEznoyVNhA
	CCIHPkx+8/4GfsBmOyxq6hpQXyXd70tOyjrkZ1mWoKbBcueernf7T74/w7ABXAppVSQiJW
	gDaaxcO7w2GjB17wCIKYfJ9NoXRjJZZRzjuDGxH5yMy0DAUsRJc3+mgmkPcPsf2LgQ9S45
	H0XQkUyNrcZeWp/BK1JoD1rGYKDTSlEW4BU1MHdTqjT6VF1rtFC/yC6cD8knyTdXTEnCjH
	i3JPQ0RGKBnqI0NzKNB/ifdENXRodl2vEY9kS+4LCNKTKV66j0jey1UVBH9f2Q==
Date: Thu, 22 Jan 2026 16:03:11 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren
 <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Markus
 Schneider-Pargmann <msp@baylibre.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Miguel Gazquez
 <miguel.gazquez@bootlin.com>, Herve Codina <herve.codina@bootlin.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 20/25] drm/tilcdc: Use devm_drm_of_get_bridge()
 helper
Message-ID: <20260122160311.658cc219@kmaincent-XPS-13-7390>
In-Reply-To: <20260122-camouflaged-cat-of-sorcery-7af8cf@houat>
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
	<20260116-feature_tilcdc-v4-20-2c1c22143087@bootlin.com>
	<DFSVNE16870S.ABQUMH9BWMDY@bootlin.com>
	<20260122-camouflaged-cat-of-sorcery-7af8cf@houat>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_070321_223935_27E97E9D 
X-CRM114-Status: GOOD (  27.33  )
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

On Thu, 22 Jan 2026 15:03:21 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> Hi,
>=20
> On Mon, Jan 19, 2026 at 10:18:12PM +0100, Luca Ceresoli wrote:
> > Maxime, I'd appreciate your opinion about the topic below.
> >=20
> > > -	int ret;
> > >
> > > -	ret =3D drm_of_find_panel_or_bridge(ddev->dev->of_node, 0, 0,
> > > -					  &panel, &bridge);
> > > -	if (ret =3D=3D -ENODEV)
> > > +	bridge =3D devm_drm_of_get_bridge(ddev->dev, ddev->dev->of_node,
> > > 0, 0);
> > > +	if (PTR_ERR(bridge) =3D=3D -ENODEV) =20
> >=20
> > This patch is technically OK in the sense that the code before and after
> > would be equivalent. However if it were me I would not do this change. =
The
> > reason is that both drm_of_find_panel_or_bridge() and *_of_get_bridge()=
 are
> > problematic when introducing drm_bridge hotplug, which is the long-term
> > goal I am working for, but *_of_get_bridge() is more problematic than
> > drm_of_find_panel_or_bridge().
> >=20
> > These functions are still there and not deprecated because there is
> > currently no better replacement (and drm_bridge hotplug is not yet
> > supported because of this and other things still to be done). To have a
> > replacement, the panel_bridge lifetime needs to be reworked first and
> > that's not going to happen overnight. So, all in all, if this patch is =
not
> > crucial to your series I'd consider dropping it. But if it is important=
 I'm
> > fine with applying it, it won't make a huge difference. =20
>=20
> Eh. I'm fine either way. I understand what you're saying, but this patch
> doesn't introduce any *new* problem while it cleans up the driver, so I
> guess we could merge it still. And further clean it up with what you
> were suggesting later on.

As you want. I will then keep the patch. If anyone has reasons why these
patch should not be merged, speak now or forever hold your peace! ^^

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

