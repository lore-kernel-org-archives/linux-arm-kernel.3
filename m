Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E3CD29C54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YR6+2Itn40lkRnr+OAS9zREnR4405rvByb0P/AItP0E=; b=GFwoG4iHyUy3EkcpvwmtkV8oSx
	Z0kgvMyY9YnKXCkTNGF9q6nxOgSrOd5XxcpqSf+UK73vpj75e2Jx2BXjOYzbpfKfsWq3KuYfnYuMO
	lUodmSISAM2C64JZmSfhXkmbw51IrSviA1K/Dd7q1eyu7fq1AlQamLFoaMCjIV6CNEqoXvQKHAvSo
	4PVqbnzuN2kcie0N/snxSRVHTUOnOg8Vy810LX52WP+UHJIOmJQuspXlGAwn9SQ88GPwrrFGBYIx0
	n6A8VklEPSBmLfbbHy4+OYi2Eh6wFcnxr0XmYxza4GTbiPiDYNW1Hd2uiPx148lnVPcL00OzZQYWS
	jmfIdDpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtWV-00000002fyQ-3IgK;
	Mon, 19 Jan 2026 17:58:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtWO-00000002fvB-24JK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:58:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 06CE21A2998;
	Mon, 19 Jan 2026 17:58:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC08160731;
	Mon, 19 Jan 2026 17:58:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D05710B682D3;
	Mon, 19 Jan 2026 18:58:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768845511; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YR6+2Itn40lkRnr+OAS9zREnR4405rvByb0P/AItP0E=;
	b=ViZZYN+8ZA6EeG7KsC3ELuWixrmDwmHDTXz3U+7SrA4LgjdSwWjXCPqNp8XIowdvv677da
	5Jp7DO+6d+qjAAJhuoeAWI2KZcoOwfKv/Y8v0GBENrBvc/VwUAgPp9+Ji+1G2u3tXANlqR
	s0/8m4tHi49V9k/wLLPeluE1LdlNGllup5ozlTR4jiQUMyiCemL/PBcTg/LSgpNBeUeKn1
	F38GQo9ntcGj3KoGFl8a42yZiwjavj0bZdGv4cHQpS0XmeH6Mmq+2YSnQNWjJYyRyxVkKT
	qPkX1FWjDoDEQmh4uRlXSHBYL0MF3DEVVEFsQQO4q9e2t3Sn0eaHYjvdKdiaOQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 18:58:22 +0100
Message-Id: <DFSREDMLBHB0.30X5TCHNLAZ9B@bootlin.com>
Subject: Re: [PATCH v4 25/25] rm/tilcdc: Add support for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
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
X-Mailer: aerc 0.20.1
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
 <20260116-feature_tilcdc-v4-25-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-25-2c1c22143087@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_095837_455831_B15D1664 
X-CRM114-Status: GOOD (  18.74  )
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

On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> Convert the driver to use the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag when
> attaching bridges. This modernizes the driver by delegating connector
> creation to the bridge subsystem through drm_bridge_connector_init()
> instead of manually searching for connectors created by the bridge.
>
> The custom tilcdc_encoder_find_connector() function is removed and
> replaced with the standard drm_bridge_connector infrastructure, which
> simplifies the code and aligns with current DRM bridge best practices.
>
> This change is safe as there are now no in-tree devicetrees that
> connect tilcdc to bridges which do not support the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
>
> Changes in v4:
> - Select missing DRM_BRIDGE_CONNECTOR and DRM_DISPLAY_HELPER config
>   dependency in Kconfig
> ---
>  drivers/gpu/drm/tilcdc/Kconfig          |  2 ++
>  drivers/gpu/drm/tilcdc/tilcdc_encoder.c | 37 ++++++++++++++-------------=
------
>  2 files changed, 18 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/tilcdc/Kconfig b/drivers/gpu/drm/tilcdc/Kcon=
fig
> index a36e809f984cd..80f53bdd0ace0 100644
> --- a/drivers/gpu/drm/tilcdc/Kconfig
> +++ b/drivers/gpu/drm/tilcdc/Kconfig
> @@ -6,9 +6,11 @@ config DRM_TILCDC
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER
>  	select DRM_BRIDGE
> +	select DRM_BRIDGE_CONNECTOR
>  	select DRM_PANEL_BRIDGE
>  	select VIDEOMODE_HELPERS
>  	select BACKLIGHT_CLASS_DEVICE
> +	select DRM_DISPLAY_HELPER

It looks more logical to put DRM_DISPLAY_HELPER just before
DRM_BRIDGE_CONNECTOR.

Other than that this patch is de facto the same as v2 which I had already
reviewed, so:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

