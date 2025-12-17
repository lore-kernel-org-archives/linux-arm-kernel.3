Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119FCD65C49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 14:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdI+WLhwoG2148T22JxuSuz6UiWPQZG056K2Vo9svR0=; b=UMQM+XIzAC3xNYg+9/qjT5wqxw
	pKnEki7KcskDCcTW0kTyH1prIqUGVWT/xfjNcJQbDJqWeIWOEcbjuSDXs09Zyt/pBaWJLr7MQVkQd
	IXQBZtuWAf4W/vP6oEeePNcrSE/zLjL218hZNlvu3dw+NGTkTJtdqLKBYN72D8ob5haybz6x370bx
	jJVK0+TyRd4WlCdGkKiEq1oF8jUg0sRcnZZRFDkr0g0cPLD2lN8qLQM2AEvxDLj4ySvCMUk9SzRth
	f+rG8ZDI2s0fHzyBkxyIkh19sqrk6fepXy2tC6wVhwkn6pyRu8zpuJ7fr6x4AVUiXj4nNS9LnFobt
	YKg7uAOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsUA-00000006w0k-0hWm;
	Wed, 17 Dec 2025 14:26:38 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsU5-00000006vxM-24bk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 14:26:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 328D8C1A59F;
	Wed, 17 Dec 2025 14:26:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7D8A6072F;
	Wed, 17 Dec 2025 14:26:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B086102F0AD6;
	Wed, 17 Dec 2025 15:26:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981586; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LdI+WLhwoG2148T22JxuSuz6UiWPQZG056K2Vo9svR0=;
	b=ZenrByKB4riY+GKo1T8xP6/Mo8UDElSx1ICK6SOLZN83miOdDSFHFaydE0zYZ5UXZAPV25
	0546wAgP6BSD5ACbA9F26FI0aUxz5E7idXNqna2S+pOZrWuR8Xw9cQ5uF8J3i7W2izuwCF
	P7A1BViQr626iP1CwpG7zObQkDpJ5fkfTGpdUubKzxnaZXJhh6Mc+IStE1IcMUlGcMyybS
	MmrQ9HdN7ixAwdVcmebqpdqC9xW5jvF/mDiiV4GRb7mZon6O+IohZPiI5MlPrCdk3UlIG3
	Ttv/E3925xpvvK0hoNXB3OYw1dK5qMgnOFRlcBdtDZqq0LxsuEs+/F4X4l8qVQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:26:22 +0100
Message-Id: <DF0K83B46R5Y.387A8AWR3CDP5@bootlin.com>
Subject: Re: [PATCH v2 17/20] drm/bridge: tda998x: Move
 tda998x_create/destroy into probe and remove
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
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
X-Mailer: aerc 0.20.1
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-17-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-17-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_062633_703347_73E8B79A 
X-CRM114-Status: GOOD (  16.70  )
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

On Thu Dec 11, 2025 at 5:39 PM CET, Kory Maincent (TI.com) wrote:

Small nit:

> Now that tda998x_create and tda998x_destroy are called only in the probe
> function, there is no need for separate functions.
 ^ add "and remove" here

> Move the code into the tda998x_probe and tda998x_remove functions.
> Rewrite the cleanup path using goto calls in probe and reorder it in the
> remove function.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/tda998x_drv.c | 99 +++++++++++++++++++-----------=
------
>  1 file changed, 51 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tda998x_drv.c b/drivers/gpu/drm/bridg=
e/tda998x_drv.c
> index 865285ba2bd8c..4be49dd5bfc01 100644
> --- a/drivers/gpu/drm/bridge/tda998x_drv.c
> +++ b/drivers/gpu/drm/bridge/tda998x_drv.c
> @@ -1748,38 +1748,20 @@ static int tda998x_get_audio_ports(struct tda998x=
_priv *priv,
>  	return 0;
>  }
>
> -static void tda998x_destroy(struct device *dev)
> -{
> -	struct tda998x_priv *priv =3D dev_get_drvdata(dev);
> -
> -	drm_bridge_remove(&priv->bridge);
> -
> -	/* disable all IRQs and free the IRQ handler */
> -	cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
> -	reg_clear(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
> -
> -	if (priv->audio_pdev)
> -		platform_device_unregister(priv->audio_pdev);
> -
> -	if (priv->hdmi->irq)
> -		free_irq(priv->hdmi->irq, priv);

Compared to the original code being removed...

> @@ -1956,26 +1941,44 @@ static int tda998x_create(struct device *dev)
>
>  	return 0;
>
> -fail:
> -	tda998x_destroy(dev);
> -err_irq:
> +unregister_dev:
> +	i2c_unregister_device(priv->cec);
> +notifier_conn_unregister:
> +	cec_notifier_conn_unregister(priv->cec_notify);
> +free_irq:
> +	if (client->irq) {
> +		free_irq(client->irq, priv);
> +		cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
> +		reg_clear(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
> +	}

...here you moved free_irq() before writing registers. It should stay last,
as per free_irq() documentation.

[...]

> -static void tda998x_remove(struct i2c_client *client)
> -{
> -	tda998x_destroy(&client->dev);
> +	if (priv->audio_pdev)
> +		platform_device_unregister(priv->audio_pdev);
> +
> +	i2c_unregister_device(priv->cec);
> +
> +	cec_notifier_conn_unregister(priv->cec_notify);
> +
> +	/* disable all IRQs and free the IRQ handler */
> +	if (client->irq) {
> +		cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
> +		reg_clear(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
> +		free_irq(priv->hdmi->irq, priv);
> +	}

Here the order is correct.

Otherwise looks good! With the above fixed and no other changes you can
add my Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

