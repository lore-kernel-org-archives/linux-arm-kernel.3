Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5B5D29C3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVFcKhkUdETrp1c8XKKoPxdTEHK11EffXAPvYnESbUI=; b=nub4KSYJaEAi3Q+CAURopVuEFG
	94Xw99D49mRRAL/7ATg3Ft7YLr9HiCqDGv5pT2d+d29E+4f/s3688IMJjCH/eLBiydS4h9/VBlL+k
	XmXzHC51fuQhgTc84YfQ6FQ6RKSLu1DNZVWPhS5rkBAoagnP+DWEhO4WrpLrWknyOi1no8u4EnCzz
	lZu+EJJjiHTFLUqLJfRocj6h7rpD+4vUxDY2mmpUiUOrsFlPkPQjCQauPPCqNGXvJwhiWJKNYUHPl
	rb9ecw/8F2zA5WeTUkLy0sJrId+QGfIgYNim6O34YBUpyOOQ9YrRzUBhdps4tZ4BD7z2SqioTct95
	jkPC8W+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrxf-00000002Rep-2xdM;
	Mon, 19 Jan 2026 16:18:39 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrxP-00000002RcV-1WmP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:18:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 946044E42173;
	Mon, 19 Jan 2026 16:18:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4CDF360731;
	Mon, 19 Jan 2026 16:18:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9152A10B6B095;
	Mon, 19 Jan 2026 17:18:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768839496; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zVFcKhkUdETrp1c8XKKoPxdTEHK11EffXAPvYnESbUI=;
	b=X6HM1B73FohTlPdstllNH10OpGsFr4saiixWKoNahZO8w64STBnifa9Ng9OnTkcBi5eZop
	HfLzfXdiWoHWVV2DppgIeSJGCvNpQUWuzg7+IuAy/DEPt9ZMzwCcRSud/hHn8lkPBnqF8N
	PG8mAVbOXwlg9+uJKIUKRXnUzqo2MU5sqXYMSLEJf+FHDpwqmx9v5Az/+Tf+Yr+tD7VkRL
	ryjXtPBrbzEZsav5a2wbqV4DmltTUCoq3lkJVTy/W/wwFtLZL8CR0h6KKdLjZulp4R/hbW
	1g8gkeYaYkRWcnRbTpBZgu4GtUIA90FrqeCQsckTZjQIAdSdSljEA96tMgSsBg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 17:18:06 +0100
Message-Id: <DFSP9M51XD3I.6IAGC6OYHBEW@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 04/25] drm/tilcdc: Add support for DRM bus flags and
 simplify panel config
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
X-Mailer: aerc 0.20.1
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
 <20260116-feature_tilcdc-v4-4-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-4-2c1c22143087@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_081827_716830_DEC2AE5C 
X-CRM114-Status: GOOD (  10.12  )
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
> Migrate CRTC mode configuration to use standard DRM bus flags in
> preparation for removing the tilcdc_panel driver and its custom
> tilcdc_panel_info structure.
>
> Add support for DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE and
> DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE flags to control pixel clock and sync
> signal edge polarity, while maintaining backward compatibility with the
> existing tilcdc panel info structure.
>
> Simplify several hardware parameters by setting them to fixed defaults
> based on common usage across existing device trees:
> - DMA burst size: 16 (previously configurable via switch statement)
> - AC bias frequency: 255 (previously panel-specific)
> - FIFO DMA request delay: 128 (previously panel-specific)
>
> These parameters show no variation in real-world usage, so hardcoding
> them simplifies the driver without losing functionality.
>
> Preserve FIFO threshold configurability by detecting the SoC type, as
> this parameter varies between AM33xx (8) and DA850 (16) platforms.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

