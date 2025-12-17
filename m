Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2EBD65549
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HS77sf4V8YC7YSp8UgyycGNSNR1n+CSMJ+7dfOmB8yM=; b=wWCwCMnXVr3ztGg086e6ldCSoV
	2PEQoyunJdH5OiAJ5PCTiZnaNwdmjh0wLygW7tDZBiV9N0R2GxeY8zHCyvLBPhCCVGdJ9EpuMasue
	pswAg4sUqQsJp9eobo0vb+lYo5HeqT3boqEs2Afe/D/PG+dAFCbEw5Ucer+J8mBOdFbd8ZqY6sE/i
	FuGWWwus3HpVim8YX3ujDZTEaVQMpapTmTeRIn+COoGOyqxGYlJ0r3URv7w4KI1oo4mGO5IznXc86
	/EXdJS4lgz0uh1UqdnZ8Q4JeZ4qdP6Q1CmuKdrQUTbvdIM/0O7kC01dwhuyZb6Gpp+Q0uoTbU7GPC
	ZhxIgMVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoxw-00000006fQW-1Q3g;
	Wed, 17 Dec 2025 10:41:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoxu-00000006fQ7-4B9O;
	Wed, 17 Dec 2025 10:41:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D86CD60122;
	Wed, 17 Dec 2025 10:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128FEC4CEF5;
	Wed, 17 Dec 2025 10:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765968065;
	bh=HS77sf4V8YC7YSp8UgyycGNSNR1n+CSMJ+7dfOmB8yM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=DQxUNVuVjHEimXd0sj6alZGotMu3GsO6SG4ExH0jB7DUFOOA7XPV0xy08fhrpjVu9
	 VciicFfPEd4ej90eC7nUpJeuwltg87Ozm+dawEbMOaPnfcLSvhLGWcEqLFme4UKIoT
	 uQfCTacFDVT3B2NMKlgrXN+ukZw/VFiX5AGD2gNBmbNwKf1FwNvLdGDMKZRZ/OJXRY
	 xfrw+/Si1SMoxQYcBhLu5J9cLyUzdfcS2pdEWlIGWPqYDU05zKrWEiw2XIrqRKKaZP
	 lsDuU6s4dd4tmJ/7s3sM0bSpZLLjx0yZPC+qJ3SelOpQbb+q/NXmymoUEDaS5XHrNh
	 E0ghXx1NPKEMA==
Message-ID: <654c1bbfcade818bfea35b52bc5e80ae@kernel.org>
Date: Wed, 17 Dec 2025 10:41:03 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 09/22] drm/bridge: simple-bridge: get/put the next
 bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-9-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-9-b5165fab8058@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Alexey
 Brodkin" <abrodkin@synopsys.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Kevin
 Hilman" <khilman@baylibre.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Robert Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Tue, 16 Dec 2025 18:58:42 +0100, Luca Ceresoli wrote:
> This driver obtains a bridge pointer from of_drm_find_bridge() in the pro=
be
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use bridge->next_bridge to put the reference on
> deallocation.
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

