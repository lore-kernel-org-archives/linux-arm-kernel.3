Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C155C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cE2GIGpzCoTJfok5ialF83+vS2toupukOH7Ha7eEy2A=; b=23YPztUbG1Ty4+csawN+ZjvQTD
	J39EyY28DER7IF8nD8rVLBpqWQu4R9IlMkP0p6RubU2wDst5mf82Kzf44EgtQFiO2RojA2MvtoHlC
	lB/XhEuK1NdvwigQ4HBOxdGmOqhTM5FuDxQj+ywSwNIE7bJPfa+D9jFayBhwx5p8F76IHf7EdYAky
	k0zELZ8NHiqCF8rxDc/cE47D4mD7V9L5+WcuV03PBqwmJ/vjJcHoT5VlGKsJod0+zN5qaPefe4sbC
	MYrcbvAyZoRQKonDFZ6sysb0k8ZPg4sfAlRt4PFfOBqFRWq9VwQa+RrPyT6/vRcCXIbd/HFNGSYQ9
	QrRYDs+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sbM-00000008hOI-1i5P;
	Tue, 08 Sep 2026 09:58:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sbK-00000008hNt-3VFi;
	Tue, 08 Sep 2026 09:58:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EBDF435F9;
	Tue,  8 Sep 2026 09:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A8F1F00A3F;
	Tue,  8 Sep 2026 09:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788861530;
	bh=cE2GIGpzCoTJfok5ialF83+vS2toupukOH7Ha7eEy2A=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=URYU6/qiDVZf8Bnwa3wJeFRuNJbuks2TgRJWOal//UegZQVZZMGJnvJ4ixFtBRVON
	 nkt9ubX3XDXScngwGHC9n7WJbZdAtFApQF5wKSAcAicX6j8ag4qkUyPDCWduJxFvNO
	 i9c5ik2MQso1iHtJXP3j4JKoyXmEf2f0DK27PAozWDIkrsp1rau7+i2UHOjACydIki
	 YbIibC+9eXiSHVBCEcB9FVbm4GSjnGg6qqFdYJnvaAMGosJkIuMEDG9kNnT/w+G6/m
	 LoxEc/UkkscsQjMDfpX/2JEbGaAIotd9v+xK924GpPZ2GEDxoHSr0RR/h8M9QBOAoG
	 sboGsRJqI2FAg==
Message-ID: <dbd7ce5178e8e3049486aa89798abcce@kernel.org>
Date: Tue, 08 Sep 2026 09:58:47 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v11 50/74] drm/bridge: adv7511: Advertise HDMI 1.2
 capabilities
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-50-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-50-bc12954a0688@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Algea
 Cao" <algea.cao@rock-chips.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniels@collabora.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Helge Deller" <deller@gmx.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Phong LE" <ple@baylibre.com>, "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Tue, 1 Sep 2026 21:51:14 +0300, Cristian Ciocaltea wrote:
> Bridges using DRM_BRIDGE_OP_HDMI are now expected to also provide a
> supported HDMI version.  This is not yet enforced, but will become
> mandatory once the migration to the new caps-based HDMI connector
> initialization API is completed.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

