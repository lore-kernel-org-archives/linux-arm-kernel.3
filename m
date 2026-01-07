Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5824CFD641
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtifbZ9dlYB5B7pMnTwF6U4zuHUg4AAtxUwmlBGabgM=; b=c4Hse9OAt5fAKzgCvyvc5xea8v
	qHHSGcHdtOZLnLGeupjJiIOtqjqPciNvkrDObJ29L4fmxC9o9o/jTfk7AhFpXqSu0ptc8foOq/wBk
	8i4WzaDApxVOoxKdeJatAip3Nw2qzo9sC4gJZYh1T4DEdyM6DJFJ0QIqK2gUZaCAX23024MYN9E1r
	I72Fnc9zQOfwZx2BlZx6g/30nWCyqXKB2dTh2HpOngRzRzrPKED/0D1oNBMcHP+grPxYSVR9Cz1Az
	innfb1dOOOg8OY10wtuNr117R3g+fsUJgeauWaA0Awj8pto9gUzmXgCqyDJ3jym6raGZWtHMvsU1H
	IAoJflyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUGO-0000000F42S-0PHK;
	Wed, 07 Jan 2026 14:11:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUGM-0000000F42H-37QH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:11:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A2DA60051;
	Wed,  7 Jan 2026 14:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AF1C4CEF1;
	Wed,  7 Jan 2026 14:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795109;
	bh=AtifbZ9dlYB5B7pMnTwF6U4zuHUg4AAtxUwmlBGabgM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=PoFOS6yjUEp/Ku0PSbiog971JRBJ6PZ+3kCcXxXM1T112J2ja/3UUNB4br3ITj3W/
	 w3nnqpjHkxMXf+QrPvuC7rUWRI61Rz5WxYZ1w3WwqgDNiO+cCYBiErps8kCL0gvqmq
	 w/s2tFI5q+155Wg4qsZDAVdfSSmI4I19zeD35/nje+HnET5gANiuiYuJ/KRoxGbO7F
	 pOcCMkZjhmWsl75ovylLNFpKpz9T1JwaMn4y6YscdE+AEEHZVeD7YSgmFoI+9z/6r9
	 spNLpw0XB21LPI499Uh7VVARGJbmLtONgj322D/1PbSl9bNyE4Mp34cCU6R2SQwE9Q
	 tSoamu4lgUnkg==
Message-ID: <8f4ea75e3ee9d192f0fe649338827581@kernel.org>
Date: Wed, 07 Jan 2026 14:11:47 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 11/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: don't use the bridge pointer as an error
 indicator
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-11-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-11-283d7bba061a@bootlin.com>
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

On Wed, 7 Jan 2026 14:13:02 +0100, Luca Ceresoli wrote:
> In preparation to handle refcounting of the out_bridge, we need to ensure
> the out_bridge pointer contains either a valid bridge pointer or NULL, not
> an ERR_PTR. Otherwise calls such as drm_bridge_get/put() would try to
> redeference an ERR_PTR.
>=20
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

