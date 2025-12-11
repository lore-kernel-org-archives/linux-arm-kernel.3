Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99263D41C12
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 09:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zGzU3kbLemiWMqEmTPLKGTorh/h4e+IJdkwMTpq4JE8=; b=bayOg/Don43ngzu6UKVKgPY1FD
	oAwjyL0lQfYffq62IPTzbMcofRN5QqXwwodyttsM0Qdxy+Rs0IHRzSGfDSw/EzoCn0BpYvTC+eKnf
	fFZG+PjNO6tMYb8ssnUOPhipsYnU33vf4WsaYSZPk5bsuzMvTMgrrQ358FNJtALokYQewdATp9voM
	5F5CC5uXJEbSHIHRh0sASN2xza2afn3cI/WIYFI6Y0rcv8UEQyPb5kZ8woce/rIvMuUY9s0XbvVj/
	GoDtHOuhOp8hm20zH0GDO+Keq1AgQAkJNa9xLwgHCgxzBXmGosifNYxPkwODv2XX3RH7YcOB4YSDc
	8WRUkYzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTdDg-0000000GSBA-3G0w;
	Thu, 11 Dec 2025 09:44:20 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTdDf-0000000GSAP-0EZn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 09:44:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 83D251A20E3;
	Thu, 11 Dec 2025 09:44:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 514976068C;
	Thu, 11 Dec 2025 09:44:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E507103C8D53;
	Thu, 11 Dec 2025 10:44:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765446256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zGzU3kbLemiWMqEmTPLKGTorh/h4e+IJdkwMTpq4JE8=;
	b=gxsvFGtPTLnD0JyjG6m9prqnZ61BlB5362xEqI6cR9nBOHH9hRpNRZvTanPUldgR0OZ0e7
	Numb+R1znKwhLHoHECxBAR1AcJekgNSbI7h9NQlhPEKNZLAxLpepfGoGBXTtq0U4K+MuBt
	9K8F4Uk/DaR2NJxFFUCuUqVPZVNLBhYPORXe2yJjHkZmd7OxLUmPlD+2+C2QOPeq1Xf8hn
	KDc6vbeEFtc2G+8B9F6IEziZ9e25xgLfschQPsRSPsswbqMwKxXEieHhVxuzUweTD9DT6S
	CpT+7uK0xSKn0yj1TUzfbNGxqRYZNXv7ufdYLb5Bdy1JMxUsytowlD6hlfZq6g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 10:44:10 +0100
Message-Id: <DEVAGR1ZP5RJ.3GQ5EPCVDUXWJ@bootlin.com>
Subject: Re: [PATCH 09/21] drm/tilcdc: Remove tilcdc_panel_info structure
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
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
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
 <20251126-feature_tilcdc-v1-9-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-9-49b9ef2e3aa0@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_014419_223536_A8D88268 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

On Wed Nov 26, 2025 at 6:35 PM CET, Kory Maincent (TI.com) wrote:
> Remove the tilcdc_panel_info structure and its associated helper
> function as the structure contains only redundant or unused parameters.
>
> Most panel configuration parameters in tilcdc_panel_info are either:
> - Already represented by existing DRM mode flags (invert_pxl_clk,
>   sync_edge via DRM_BUS_FLAG_*), or
> - Set to identical values across all instances (panel_info_default),
>   making them effectively constants
>
> The removed fifo_th field is already handled by priv->fifo_th when set.
> Other removed fields (tft_alt_mode, raster_order) were always set to 0
> in the only instance (panel_info_default) and thus had no effect.
>
> This simplifies the code by eliminating unnecessary abstraction while
> preserving all functional behavior.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

