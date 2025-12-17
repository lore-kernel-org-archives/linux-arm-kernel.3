Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABE5D6552F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fiVn2ZgRAMxuWDCmDkwSx5n9MWlyH2AXOpyMgeTHX8=; b=yBCV4hB/fjWgxOalmV4asR8Fok
	76VTajkBKC4AFYf5AJ1FPh+zApDLx+0Xgew+vrLMuzpzo8IFhlRIE7TsJgDucJvlCghxLaukwijVL
	jAncuiIHbJh/H6MLgXgD0Qh/M5l4lcndZr2wTIDJtl1mnPiLDWwklQUqLM0R5j28XG9sW3Yq7mNut
	2kdcdLqVVaqeLtQstXBClfoUdh6gWYPIvgj1wCcq3hCSSG+sXwkPz79mljMvL7pYjBoO8VbxtnqVx
	TVum2rEk8/m5J75RgAovC99EtyofDvfME2IBEo+nuS2SWlm/CHaETsnGYgbxjMRHUaxgecRULOGmW
	YUSr/M0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVobI-00000006aUG-2wE2;
	Wed, 17 Dec 2025 10:17:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVobH-00000006aTT-03gM;
	Wed, 17 Dec 2025 10:17:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7114A601A7;
	Wed, 17 Dec 2025 10:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3F0C4CEF5;
	Wed, 17 Dec 2025 10:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966662;
	bh=8fiVn2ZgRAMxuWDCmDkwSx5n9MWlyH2AXOpyMgeTHX8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=O8QQZoCT+lo88BxSzfhcgkUq6VKTur72pRBybceuQse7jqMKd6FlDzGYkUt7i1AeZ
	 7LcOhYiaUxuWdL4eSBq9rk/9Y+kqfExxZ9L3YVx9hxYE3S1MFB2LyZ0JaPAntmfxiM
	 Ce/XNRdPiukqzVKcznZESth9KZuoinj5JdAmcjDWb3pgeU4a147CDYNyJ0YXsFXJLJ
	 8c0ujjOLNMSfMWpGkWW1BIUXIq01OSt/7OD/TYx2gcuaGFk/u7QMt/ravwFpV16pqD
	 a2g21PzDbi/Os82PBlGocEX5OMiKj/PA0UPZUyhaFZSWwBtFnAyiOeO9RSt1yC6Nkn
	 g2oL1QZWYwKTw==
Message-ID: <c88ececc4692f3b9d8d5284bb398470a@kernel.org>
Date: Wed, 17 Dec 2025 10:17:39 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 08/22] drm/bridge: imx8qxp-pixel-combiner: get/put
 the next bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-8-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-8-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:41 +0100, Luca Ceresoli wrote:
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

