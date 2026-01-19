Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048ECD2ECE6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 21:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dccIYLuOl9zFcSjOIfL/wJ5qKBUv5KOPn4Dk/51P1ro=; b=1soCmp7Ocovy0NFOms59yFFI7L
	gtHOOJVMLmgkBwIyBjwK4DQMvxh008acplpjas2wa5H88C1Dx//1CwpH48HD66PU2iC6Inh95IlqW
	tPzt5wFIQT7LRElKom5hnexj/V9Q0HkLRp7CGbu0eZbi+RglTfcIZuFTXsqtG7sy6Jcaf9XS7vQb8
	jvpJknEHmRjuqNU/TOwNHY/Vh8abwaiLVkMp9ixanTFmxPRL40q6MqrNzZ4ZwBonspHA/TdjEfBky
	jykI7MnlSeDow6hJOu2CZCLcbe0HM2OSKqWASxkka/9d7xLWq2kkmhy5wtBNPL+6uK0f/ev+lz50t
	w5YH2ktQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwds-00000002sWL-1mii;
	Mon, 19 Jan 2026 21:18:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwdo-00000002sVk-3APe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 21:18:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2EF564E42188;
	Mon, 19 Jan 2026 21:18:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA16460731;
	Mon, 19 Jan 2026 21:18:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 965DE10B68B2D;
	Mon, 19 Jan 2026 22:18:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768857502; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dccIYLuOl9zFcSjOIfL/wJ5qKBUv5KOPn4Dk/51P1ro=;
	b=p/IKxkR85xBhtvnXMQJ+Z0lHSsJWSaFvuppJJ4ZXkuadRGQIpoG7bnPV0UcyCtmbOdTWgQ
	0rn135SAWYO3qRVYhojkKTXg4SgVukMsCF8fAnnYneY75QRWh33r6hYsTy1ipD8hz8+nSA
	ZVQqTI5bKwqe1m+dcloKK2QMWzcF+RQu9PLeDgTq/oxMrpjLo+sDKd+NhHj6tR9ryA4+EV
	u77RNcwnEkPc0EzXmFMRuXXu+I8911O4ebAx7XT/9gagAC1hJDDVfI3CO9WS6qTn9A7Zs9
	jCCeC/x+rj727+a1JkODsgA2nO0mzW4GuhY7YK926s+DDvrWm4YSHuBAke+MMg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 22:18:12 +0100
Message-Id: <DFSVNE16870S.ABQUMH9BWMDY@bootlin.com>
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 20/25] drm/tilcdc: Use devm_drm_of_get_bridge()
 helper
X-Mailer: aerc 0.20.1
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
 <20260116-feature_tilcdc-v4-20-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-20-2c1c22143087@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_131829_278083_361604ED 
X-CRM114-Status: GOOD (  20.02  )
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

Hi K=C3=B6ry, Maxime,

Maxime, I'd appreciate your opinion about the topic below.

On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> Replace drm_of_find_panel_or_bridge() with the newer
> devm_drm_of_get_bridge() helper which simplifies the code by:
> - Automatically handling both panel and bridge cases internally
> - Managing the panel-to-bridge conversion when needed
> - Using devres for resource management, eliminating manual cleanup
>
> This removes the need for explicit panel-to-bridge conversion via
> devm_drm_panel_bridge_add_typed() and the associated error handling path.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
>
> Change in v4:
> - New patch
> ---
>  drivers/gpu/drm/tilcdc/tilcdc_encoder.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c b/drivers/gpu/drm/ti=
lcdc/tilcdc_encoder.c
> index a34a10337f6a8..546fe7e6ee815 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
> @@ -55,15 +55,12 @@ int tilcdc_encoder_create(struct drm_device *ddev)
>  	struct tilcdc_drm_private *priv =3D ddev_to_tilcdc_priv(ddev);
>  	struct tilcdc_encoder *encoder;
>  	struct drm_bridge *bridge;
> -	struct drm_panel *panel;
> -	int ret;
>
> -	ret =3D drm_of_find_panel_or_bridge(ddev->dev->of_node, 0, 0,
> -					  &panel, &bridge);
> -	if (ret =3D=3D -ENODEV)
> +	bridge =3D devm_drm_of_get_bridge(ddev->dev, ddev->dev->of_node, 0, 0);
> +	if (PTR_ERR(bridge) =3D=3D -ENODEV)

This patch is technically OK in the sense that the code before and after
would be equivalent. However if it were me I would not do this change. The
reason is that both drm_of_find_panel_or_bridge() and *_of_get_bridge() are
problematic when introducing drm_bridge hotplug, which is the long-term
goal I am working for, but *_of_get_bridge() is more problematic than
drm_of_find_panel_or_bridge().

These functions are still there and not deprecated because there is
currently no better replacement (and drm_bridge hotplug is not yet
supported because of this and other things still to be done). To have a
replacement, the panel_bridge lifetime needs to be reworked first and
that's not going to happen overnight. So, all in all, if this patch is not
crucial to your series I'd consider dropping it. But if it is important I'm
fine with applying it, it won't make a huge difference.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

