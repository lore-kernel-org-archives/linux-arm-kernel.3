Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CBFD65530
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGGu/6JNVBgNvuM6ZsKdOI4ON53xGWkWHM73FXbvNis=; b=m2n9TylyZ1LNaDHBzMlZBQnad8
	3Cg7DjxjKXw+3epjnccrArMEdA22SLQFNsTRhzaAPsn4RpjGGXpEEUnXMP9mYe/9tlVY0DtsLWCiC
	8v/WIS0iNAGLkYlC/+cjl+Aiz7qo5Q79nar13S6yNcur4J3Gcgr0TcE70iwE7BmRNV6mZjcj1u835
	m+o92nS3JL8caxqXKJYK/FTyO1BZ3m3b5o5IPKzYrBMzoThYQHNVSkfcwEXsFhWbXc8f72XgXsAf3
	u+xGejBU1BBS5zsChJyVyilg8bN/Q/Tnza2KWZNoN/ZzPfF6UEX+kXzAaTKYt6rKXJyyKdncjWT5D
	tZxFFsAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVobx-00000006aq1-13g4;
	Wed, 17 Dec 2025 10:18:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVobv-00000006aoF-328Y;
	Wed, 17 Dec 2025 10:18:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2954760557;
	Wed, 17 Dec 2025 10:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52486C4CEF5;
	Wed, 17 Dec 2025 10:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966702;
	bh=gGGu/6JNVBgNvuM6ZsKdOI4ON53xGWkWHM73FXbvNis=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=o9TOZ5xbmIgqxSOK8HVTeLQOxHTGpU67pqx7lt/Gy9iAK1IOrXCBrOKaYEXM9Fw5Q
	 NKRDYHrBWhLUhZOyNFDQuXbWwI2vArQELO850hGsATfwRpbngWW+8heC3qvmO+LLpp
	 Ix0HZprfSAhrDLQTsG2u6mxCrkAPxADMVKtZSw4TiBPNf3R1GBbgH+Mb4rVsuVvQOA
	 8DV+e6ydAj+0yqMkx8/kdd1kijBRC7KtfmJEBd7cUwlxjLrsRAEyo+bF19y4eV3+I1
	 6fnobX50SZqrHlKYt7dWV2uYZ9vZMEI3DnZgzzN+mEL8EKDcI1b7E+D6XlptFXJlDz
	 b7Y3QhgdQ+o9w==
Message-ID: <7e16dd4d1eb87f96ab70ded4f16a04ef@kernel.org>
Date: Wed, 17 Dec 2025 10:18:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 12/22] drm/meson: encoder_hdmi: get/put the next
 bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:45 +0100, Luca Ceresoli wrote:
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

