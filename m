Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B67CFD641
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Al+KCPafudLV42iK9rQx6eYRBeVnrBFIjRqTYhrzW5E=; b=gnCEUVeROQ5G9P7D5HeCkCqIZS
	w9MBVzSvEa6u517CpVKXDi+1gmEElspprkKFR6Hawq4uqeVf4yYGirKE+AopJ7fdqVT9M4QtkSGbl
	PoiZII6MqMPgZkhqnS1v44xeinEwXs3bTXGb0K1wj8Cn/v5yXTXjE56G2q1D/pFxOfFF6m5h6GQJ4
	y68lB77Xpve2R1UOFTQARGJAV2tK3aPFkeW/FT0CW0CZHf+jAuoGqAfn0/5c/+QmgxprJjwxGpU1l
	J+PbU/mEX4cKW6i5fRTLLd26rWJBVNL5j3tjaCk89GMo6LmCj+pbHdKZlfPoEgMPpqOL5k7V80yfF
	jRadjzAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUUT-0000000F5j3-17tE;
	Wed, 07 Jan 2026 14:26:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUUR-0000000F5iv-3wpt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:26:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 58FB96001A;
	Wed,  7 Jan 2026 14:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836B2C4CEF1;
	Wed,  7 Jan 2026 14:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795983;
	bh=Al+KCPafudLV42iK9rQx6eYRBeVnrBFIjRqTYhrzW5E=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=gXRIFei4N1O+jFAwEkSiyAtxCcngHhyObTnyc8gHFHfx6vBqEBcR1hgXV/QcmP3/D
	 pNKkrZ8tdoOChfeZRB/KnP9432SMlvMPXcETt8hA6zJDFhRUGUw/d5vUUorQqsjYz6
	 VNogqeoqgbnX23oG5hxdQCO1RiTak043P+bc9DnDI1riIB97djG4rUIAimzRynCHqH
	 GY17F9CADQkXYDvC8oHrycvtpDal/AAfpG+Zuw0KN4v0Nweo83mvhUj5OGVeUsv3S+
	 EGy+VUpVAGuDY7JUf6kIDVXZn/joSz/iK6/kp/bCNtqHApFvrv1DB+3ozCmxa7TiVq
	 C6WHyFhKDWztQ==
Message-ID: <61e5d3c5e5f7fc2b9a2ee8d707d3b664@kernel.org>
Date: Wed, 07 Jan 2026 14:26:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 12/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: convert to of_drm_find_and_get_bridge()
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-12-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-12-283d7bba061a@bootlin.com>
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

On Wed, 7 Jan 2026 14:13:03 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done. Also switch to the drm_bridge::next_bridge pointer.
>=20
> This needs to handle both cases: when of_drm_find_panel() succeeds and wh=
en
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

