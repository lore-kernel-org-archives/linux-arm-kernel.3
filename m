Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8572CFD62A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 13:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AuEIKQRaUTKYvyexM1F0XSO1bD3dwL6lWSlAHqpMDQ=; b=Q9fEreH4SlTrNs5vxm5RMETy0Z
	/iRqbJQCuLBE6sg7FHNx37PKBVVGP86dveJ5ssRt+ZwIWj7ZoEWHam5/J88Tk1KkBn+1X+OR9DkKa
	DQtydn2qeemPhhntMuFkTjiBeiay65UIVLfswShZguwK2g99eENaqn2qQGqXS3i34kNija8A3iMkm
	meZkDOS+ryv/6C9EauO+m4mdNFQX0GY1Cltb0oU5rsj+K3nbHBqZGBtrp7F2NSFwG7PzDcAcCd84K
	2XC3SPy6CdeN47MYQRfYKBiF1NTLLB8wkFR7V9NUOigBzmqG/fr7nne7NSXSsLqp/zGxLX4ZUmLts
	yCmylM5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTkB-0000000F1NJ-2bGC;
	Wed, 07 Jan 2026 13:38:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTk9-0000000F1Mo-2n4L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 13:38:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 50D6640BEF;
	Wed,  7 Jan 2026 13:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74BDC19421;
	Wed,  7 Jan 2026 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767793113;
	bh=5AuEIKQRaUTKYvyexM1F0XSO1bD3dwL6lWSlAHqpMDQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=VUYmwsZrYLDh9idprF4/FuorE9A4MAV3dv0EdWpPLiQBbcJ2KUGtgQ3VsXuteOMe6
	 r519kSjJ5M89E+PKZed+vv8jsvVjOebiaqlcn2zFFAGzKICXSd3mxEeAeMaI1pqs/g
	 IB1wtq60n3ybwQLnMYmvNFvsZG/NwGuasbA6X6Brfs17XQIARu1wZUKu1Bmz77RiUF
	 SqmtmE8PLD8E6Wqye/0MlVmZnhLRq2mGt05szhbua63fghwRg+6xoFzx82YpLnCh5B
	 XpsBtK+QIzQpAHwUcWDzaldTQY9+9Q8p5dxMbLZFefH5kf7453hPsz/W70Av4EzJGQ
	 XUTIemUBN6g7g==
Message-ID: <2f14571f948b24e7c453895bbc1b33d1@kernel.org>
Date: Wed, 07 Jan 2026 13:38:30 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 04/12] drm/bridge: thc63lvd1024: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-4-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-4-283d7bba061a@bootlin.com>
Cc: benjamin.gaignard@linaro.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philippe Cornu" <philippe.cornu@st.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_053833_725306_93948410 
X-CRM114-Status: UNSURE (   6.59  )
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

On Wed, 7 Jan 2026 14:12:55 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done by using the drm_bridge::next_bridge pointer.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

