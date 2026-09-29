Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E5ACA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAMMelAZHfbe1qeiK8FghiyzqtsFG4ElypA+ShW5Sj8=; b=pZGCfwJEyeRdAEi6FgsdsN3tmx
	kxx7Tn2paHQbLOFOB5yUype0lju99+Mw/TZkkDMZVm5oju2cwjlih0l8Ef4OsrXcKIVahJ3Sj2LgE
	ubod1te2kkSQYyou4r6W+0kj2Ye0Z1aYSlHDZVRO2MOzyqBD+0d9N3uqSuf4ISJyEK7olUFZ1S23p
	+CA+pnn9XXof2Z4qNzS7pk6yuz0vzI2usYT+HKhAhrhj5/OlkkiP67WypiCQkXIVhT3spPtgZVgkp
	TLnKDrnS+61Qc98O7WBp44Lr8yejh6jcZlCAPgNmbup3gI2y3KosLxpKJT9WWDYkfoGVU8XJN/Z5l
	q4Iw8UkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBX23-00000003Xpx-11zS;
	Tue, 29 Sep 2026 12:34:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBX22-00000003XpY-1sYw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 12:34:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3409B419A4;
	Tue, 29 Sep 2026 12:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B731F000FF;
	Tue, 29 Sep 2026 12:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790685242;
	bh=YAMMelAZHfbe1qeiK8FghiyzqtsFG4ElypA+ShW5Sj8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=Z/VyHBIRhz7Mv7hefrMMY4o+uIBMEbRLquJgLc+kfIUwiLtTkD6GutbszRe2gGYEx
	 VuFfSoEYDwVtyQ8CDx3Qule+Wh9HJNvAgG3QUUTfOOQB1gHVWVjPu5+ddsen45CoyN
	 Zm/LaTUv5e5nvpU6Xvc7P191wgnSfz2zSJmPN/2E1raV/xii8U8uKmJ+Fuhm6QvzJU
	 tacwlNnRIDuqy9WZ5+YGPTEBM0MRuQPoIcbrbKkgn625EK655xQhdI4CHZzdK5JZli
	 QcMSv2r6Y7IOpDhmBhupWQT/TKm6QuxhHlKxA8YMrB6Z5GMGdsyOw9FwplWhPXt8R2
	 HpGG/3HVdA4Rg==
Message-ID: <33164c650a0cbf3d9d97c42c399b07f0@kernel.org>
Date: Tue, 29 Sep 2026 12:33:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 3/7] drm/bridge: dw-mipi-dsi: stop using deprecated
 devm_drm_of_get_bridge()
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-3-ccb7e602daad@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-3-ccb7e602daad@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Arnd Bergmann" <arnd@kernel.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Doug
 Anderson" <dianders@chromium.org>, "Fabio Estevam" <festevam@gmail.com>, "Frank
 Li" <Frank.Li@nxp.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Icenowy
 Zheng" <zhengxingda@iscas.ac.cn>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
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

On Tue, 29 Sep 2026 12:36:35 +0200, Luca Ceresoli wrote:
> devm_drm_of_get_bridge() is deprecated, switch to
> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() retur=
ns
> a refcounted bridge, ensure it is put by using bridge.next_bridge.
>=20
> Fixes build failure when CONFIG_OF is disabled.
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

