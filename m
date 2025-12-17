Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306E4D65C4F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 14:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHGq9IXZnBW7eRUrSpb4u2mpy3tMbvnCqqPzrqz3jkY=; b=x9x4bLDA1u5m2zWFk3BSXTpDqF
	D2ueebyU1JcvTYUb83V0BTEIPQC78Y/G4sGjidh0fCc027rrDGGGnX6NjJ8IyfGvcUFAA98REEk9C
	zzGEueab2CcnOnL6V3dzUu8Tzf5D4qknnCIOyrXTBrPwxJatB1jtEK94TfuhmDHYobZ2VTSnsIZ72
	Jb2TzFsm5g2lAPNm3wTMxu2rG8QwtVPtB+UBDjW2CD5Udgt87gFsnvyqHGCYpNwZ3KHlhFWDsZQFZ
	Ns2C4gLBWa3Hz9HzQXZLG7NIYcARL5GRgb32KCqfvU8taivgOpPq6QdK3BlhAakjB4UpnPm+ee4M9
	wlLXSo/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsTV-00000006vjm-1Zly;
	Wed, 17 Dec 2025 14:25:57 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsTP-00000006vh7-1zR1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 14:25:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2E5871A2281;
	Wed, 17 Dec 2025 14:25:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 030396072F;
	Wed, 17 Dec 2025 14:25:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92D3D102F0AD6;
	Wed, 17 Dec 2025 15:25:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981543; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zHGq9IXZnBW7eRUrSpb4u2mpy3tMbvnCqqPzrqz3jkY=;
	b=YLwG9uu4miJcCiS4PauUoFGBmSt4Mu4Of8VQF1/watYpRV/stxgihcWzmBzdtEOqrKg9Ly
	8/oPQA2xCa+x6ofTLP1MFsLEq3Jmq7BU1EQZk/cxjnvqqEYw/JbAN2KBL8cb0USXNPnYCY
	PdFUm+IY3U+L5PZpe2g7/lv4rwmcCF8rWEgIbDglIdKzooK5tEC1D6FSwxw7ybGKQRRB8d
	SE6cn645lDh2cDY7Q0mGW18ZQfeqQkEckS5q30CEGHA996HMzSN1copF7e1hBLEPYStFCY
	1S+mdIgzNdfjxEdTd8RzpiwkgH/uoNYmdLVcz96dyNvfZDEvQB4EkzwI2nhQQQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:25:40 +0100
Message-Id: <DF0K7JPSOKLU.3V1FT4LAZSPGB@bootlin.com>
Subject: Re: [PATCH v2 13/20] drm/tilcdc: Remove the useless module list
 support
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
 <20251211-feature_tilcdc-v2-13-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-13-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_062551_644628_EB639B5B 
X-CRM114-Status: GOOD (  12.89  )
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

On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
> The tilcdc driver previously supported a sub-module system where
> external display drivers (panels, encoders) could register themselves
> through tilcdc_module_init() and be automatically initialized through
> a module list. This infrastructure became unused after the component
> framework support and panel driver was removed.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

[...]

> @@ -562,24 +533,7 @@ static struct platform_driver tilcdc_platform_driver=
 =3D {
>  		.of_match_table =3D tilcdc_of_match,
>  	},
>  };
> -
> -static int __init tilcdc_drm_init(void)
> -{
> -	if (drm_firmware_drivers_only())
> -		return -ENODEV;
> -
> -	DBG("init");
> -	return platform_driver_register(&tilcdc_platform_driver);
> -}
> -
> -static void __exit tilcdc_drm_fini(void)
> -{
> -	DBG("fini");
> -	platform_driver_unregister(&tilcdc_platform_driver);
> -}
> -
> -module_init(tilcdc_drm_init);
> -module_exit(tilcdc_drm_fini);
> +module_platform_driver(tilcdc_platform_driver);

Is this hunk related to the removal of the module list? Looks like it
should be a separate patch.

With that hunk removed (or kept if I'm wrong and it should stay):
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

