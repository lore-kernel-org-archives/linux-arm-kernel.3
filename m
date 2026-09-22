Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60A8C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLBBmo4Xwhls1j1goGCjnxPnfdCheNpokxKYbGGW2ss=; b=ql3p0/IfqnzV+upivGu+rnfaFj
	wRWqkmFz9gh/icmMvc/gx3gBItQm1OSkWYSvI6XkJZZag4BKODr7UeD9D50ZW0lvPn7iwOuTnScP+
	1hCRPjI9U9F/1h3BfIeUCiu1e4iIG52wDkQN0bk1kVp7s+PAb8nCUPeUsrhjNW0Ys4DE1a8msurgj
	7A4zEQRaC2jlQI4oPexrS3PFBVLAkjSV8QLulsV6NQIRUCRNOwfH7ktXr5qQtJHHMJDIJzC6Kk7MF
	1Lg52ku8nnYRUj9X+jbvNMRM29b1EDP2VUFPNCXQCOJLoaL6PACRakaNwWI8vf9yZ/hMFwm0rcFh6
	k0TfQMmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8udh-00000004Skg-1bTX;
	Tue, 22 Sep 2026 07:10:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8udg-00000004SkA-21bV;
	Tue, 22 Sep 2026 07:10:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E547F44923;
	Tue, 22 Sep 2026 07:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1026C1F000FF;
	Tue, 22 Sep 2026 07:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061003;
	bh=zLBBmo4Xwhls1j1goGCjnxPnfdCheNpokxKYbGGW2ss=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=iP0yRwSiCrG2msgx9keRDUw5ehN82SWusxS6QeTmiKhXCFr5ZmoTruY9oYUej38qR
	 mSPpGwIDkB+HmLJNCFLXfJiVSiNjbGCaGAuFPBlRIQGx0kj2yOfCVLdPc87ki0imVr
	 tWUqSDQ6mHicF09joYCiK73W7Q46WiyG6wiYkAHc8YBDnS8+firHrI6OKNptPTVSSJ
	 tfC10wes5nA82AJlociWMAxb4ojKbSsgQYCp5sbX5Xsgw4BljYbrRjaeg8itdgptz4
	 ITKMpu5hipVPkDU6I6CVCAZagZDvHvJPYukzq66eTXi/4/jDjN9q/CwtVdZNV3T+z+
	 9zW9xj14VOvJA==
Message-ID: <638ca267e355bf5c28357aae09a1f2bf@kernel.org>
Date: Tue, 22 Sep 2026 07:10:00 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 14/19] drm/bridge: samsung-dsim: don't create a
 panel_bridge
In-Reply-To: <20260916-drm-bridge-every-panel-v3-14-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-14-83afb4f1a707@bootlin.com>
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

On Wed, 16 Sep 2026 15:45:38 +0200, Luca Ceresoli wrote:
> Now a panel_bridge is automatically created for every drm_panel and the
> panel-bridge API is just a deprecated wrapper to access it.
> 
> Update and simplify the code by just getting a reference to the
> already-existing bridge using of_drm_find_and_get_bridge().
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

