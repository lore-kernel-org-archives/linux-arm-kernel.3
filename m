Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A3AC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 06:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUhdkfTfZYkwV1OMbcAcC6Pw5pH0JpuT7NkR4uZdKPc=; b=BrL7OzWVI5oyFabBJOnwUAlVvl
	uWP1Jg0L+L7Le9ks/tN7vAgLERZFjlzgluyJCMaWyotz5s8JSiikUfI8l8Zmd2fb5EaYpp4Db/P2+
	wEPjrBOzF4tXQXVSw7ldiLbeCaaMyzeZ9kveuG5qy2V1+GATN5wVRoX3CoHIQpCAk/C8x7ZRW1Mxl
	sH1OOf7hRLM0837GeSNFkxpOC+6HAIg5C0o+cdnh0IHf2w/Q15kbktQ0qRIjC3Hv9NP/bJEmZp7Gv
	xuGrYda7yqRdHOi8gSBxp0eL/wg2BF37kCaXlhFvWhdWsmrjOBsJVeJOg9FUxfI/gCFPa/3IxhXVG
	gHRe/X4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uS1-00000004Q9F-0PBH;
	Tue, 22 Sep 2026 06:58:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uRz-00000004Q8O-3i5x;
	Tue, 22 Sep 2026 06:57:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AC7660234;
	Tue, 22 Sep 2026 06:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363FB1F000FF;
	Tue, 22 Sep 2026 06:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060278;
	bh=EUhdkfTfZYkwV1OMbcAcC6Pw5pH0JpuT7NkR4uZdKPc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=JftsdkfDUeoe7XikNfywfFBvp2aJTpTnEv9wPYh1I/6gXECPMaLgqWgeQfdQHlYUU
	 i/TbsEzzct7jm56kCKmJ0tWA1ypE958tuvSp91KHOI0+1afhdOMNOjLozs78MvopHo
	 SVnzPLIPxc8dQCVXJPprD7nvslYc8xU5fRwA6RrbTivk5IfZsZpVK+0VVyk8vXNUG+
	 3AVspVri2r9QHBRskn29ScBE2kcH7Kt+knwYB5tjlXfiWQQQRQoN8Qt1WClc+CSwlB
	 MQLhOFKJM13m8XT5XyF1/VT4M01hyF0TRa0GoF6KpQLQ1PKyCvjI67eRmBva08atlk
	 AfMHWYL56HNFw==
Message-ID: <fcdb76ee38c6ab63727d8f526a2f9208@kernel.org>
Date: Tue, 22 Sep 2026 06:57:55 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 07/19] drm/panel: deprecate panel-bridge APIs
In-Reply-To: <20260916-drm-bridge-every-panel-v3-7-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-7-83afb4f1a707@bootlin.com>
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

On Wed, 16 Sep 2026 15:45:31 +0200, Luca Ceresoli wrote:
> Now that a drm_bridge is embedded into every drm_panel, the panel_bridge =
is
> not needed anymore. Its APIs are just accessing the embedded drm_bridge
> transparently.
>=20
> Deprecate them all, encouraging to use the drm_bridge API.
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

