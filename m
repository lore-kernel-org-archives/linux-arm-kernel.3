Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F3AC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 06:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1d/dvcHxVamna9owaFeoSOXs3fDbPWjgtvVHJ9x58IE=; b=0utMUQUvzhW6zQTmyj1O0Ly0bg
	N/0QthwWK3WbicnkBk6GhBKkUmDtk4gk+bjthDIt+YaRaIRccoYT8k1SNtLSulMqR9wcLL6QK4AW2
	jg8SOxnwUy8+XsOzAyXw1z/+0umGfk6rMs0ZaFxgjB+wvzwNk6Ey25X+L9D9pNC+BW4cfUmTXh7iN
	YPoDzuRDZlE6alxqNoNGTvXJuMDMbN8jmUAwqOg8fxMT3vfEYl/z8BsEGx+2Q0hNamsJzptMJn5OG
	Z4pIAk/9rglPyk64z01VJNkzUYswdyLqO8l8MFc25pq/dVv9aK1YK1SiicJwK0AdVZF3DltHYdUO/
	RTK3rH3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uR7-00000004PlV-1GtP;
	Tue, 22 Sep 2026 06:57:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uR6-00000004PlK-1VYV;
	Tue, 22 Sep 2026 06:57:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DDD1543C09;
	Tue, 22 Sep 2026 06:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B991F00898;
	Tue, 22 Sep 2026 06:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060223;
	bh=1d/dvcHxVamna9owaFeoSOXs3fDbPWjgtvVHJ9x58IE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=TDo0ofYbNdfgzlG8qaMtA+hOaXzI2f+8O7RhKvtC64oAxw5fY99+Xnmpn4wuSn1k/
	 UFu1OOvp2Y+3cDkZCdyu8ToN+hSihOfZ6cIqvShfoUL3SY+CbYSlsweV1In9DuAobn
	 STQEIh6E7UqqP0lkiUPyBOVRhKndm6Dg5wROir+eZsX5I+1nyyew2NF26rf7yj3rRE
	 vIkNS3s0GDFHUxy2TYFchLghJvCIFbA6HR/9eZOTUGyPoP4f1wgH1CTIXFhybpxNEM
	 GMK6KQfYL+R/4HGOjBKfQN89DJMtXwJEDfsFr4ODWV1iocn/bH64X/PssKOFOp6jIC
	 6rraVpPj7OLzg==
Message-ID: <3925411c892a96d8e72872191a915deb@kernel.org>
Date: Tue, 22 Sep 2026 06:56:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 05/19] drm/panel: embed a drm_bridge into every
 drm_panel
In-Reply-To: <20260916-drm-bridge-every-panel-v3-5-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-5-83afb4f1a707@bootlin.com>
Cc: asahi@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, "Albert
 Esteve" <aesteve@redhat.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Anusha
 Srivatsa" <asrivats@redhat.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Fabio Estevam" <festevam@gmail.com>, "Frank
 Li" <Frank.Li@nxp.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang" <jesszhan0024@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>, "Linus
 Walleij" <linusw@kernel.org>, "Lucas Stach" <l.stach@pengutronix.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Paul
 Cercueil" <paul@crapouillou.net>, "Paul Kocialkowski" <paulk@sys-base.io>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Randy Dunlap" <rdunlap@infradead.org>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Sean
 Paul" <sean@poorly.run>, "Shuah Khan" <skhan@linuxfoundation.org>, "Simona
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

On Wed, 16 Sep 2026 15:45:29 +0200, Luca Ceresoli wrote:
> Adding a drm_panel does currently not add a panel_bridge wrapping
> it. Usually the panel_bridge creation happens later, when some other driv=
er
> (e.g. the previous bridge or the encoder) calls *_of_get_bridge() and the
> following element in the pipeline is a panel.
>=20
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

