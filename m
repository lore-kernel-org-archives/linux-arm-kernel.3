Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC66C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2GGkrgzKCsgm0mwf6UdJFHfN95qxznzs56jCuPDyFw=; b=zgsGMG88xuPSqKnJyLffn2aBMb
	JAPrwBYxOq61We+ggrQRLX8JvY6iHSQ1j79h8sFwo29en6KwApSKXZEEr+7DVDY8zx0Sm7guxBEiV
	oy5B+WpD/cdXWY9i9d2jG70y5mjxjXghWHCvad/RfnrVzaf5zKmMm8M95bKduq9ZTXZU+ZkLHdxID
	9+yjtF0HzdbMVzCIIhPFKWOPZRkzXjCB2g0yrI78GANEaMnRTRWJcCvK4wNAAJk46UrXjQiu1K6a2
	CXDcj1I45fmvWt/66QTK2GD/DUBEKJ/TIr3J6v9g5hf9p8e+XZsp2OlD0HW2uu3N4NzjQOrEFdgAb
	K5lrfygw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8udQ-00000004SeI-2V4r;
	Tue, 22 Sep 2026 07:09:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8udP-00000004Sdv-0RRE;
	Tue, 22 Sep 2026 07:09:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EF0D600CB;
	Tue, 22 Sep 2026 07:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD0F1F000FF;
	Tue, 22 Sep 2026 07:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060986;
	bh=y2GGkrgzKCsgm0mwf6UdJFHfN95qxznzs56jCuPDyFw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=EBphDY338h1X323tWP1cLxM2et1PqxVvsgo6xqwgld5xaEIPOb+VThqfivND4ugAT
	 8i6MaPiC07iPrjefCXEdKl0AybWYuoyRyjo4gOJ6Ip2+PniX1YOnyoIb9Ui40sgIvO
	 2miUtk0lbPFbAEeSjAVn5gF9ZqO/wG7WIzN1OcArF8pmYZHYtmGx8sY/nl8C4t0zK6
	 IKyPWGKm8AweRYEalzbwsykmKumd0k/sig1a0ztd8xsONgsEDzhEHC1POHcL/D5NUV
	 jIjcDd5U2fDg5m6oIegk+jwz9qXgrC6MQVqqzWRNt6CLaFj/YUNCbNGiKBamFyBO4P
	 58PtuvgAvPi2Q==
Message-ID: <ea873a72b009d3fc34feab6bd3cfaf01@kernel.org>
Date: Tue, 22 Sep 2026 07:09:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 13/19] drm/bridge: fsl-ldb: don't create a
 panel_bridge
In-Reply-To: <20260916-drm-bridge-every-panel-v3-13-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-13-83afb4f1a707@bootlin.com>
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

On Wed, 16 Sep 2026 15:45:37 +0200, Luca Ceresoli wrote:
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

