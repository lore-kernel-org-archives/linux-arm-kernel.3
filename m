Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E22C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ziQ3NW1LSgwDZe9di4b6yJwonh0oLPcxYpWPZN+JqI=; b=Zx8pKQClZzKuan1QjhB2Ijtuoy
	4uH137V4mGU3lrPmszf5vwoGALNuKoaFUxNTRspusoEaLVxkTtiBnOv07XT/p5GljHiYrzhKEUHD9
	kxS/3oA82uRCRDE6HHbQUNekq69X4XVLsozcspdgh47ZHWCZVF2VSrxyL5tTTEqqhTz+dPbv7Ubx/
	03T38+i07xCsK8bozhvTLu+slDNutXd5MMOQvdyHyrEkt9faDwh5TIwxP6w2aogwCiMROrnYgMs7P
	54HCvNXVxY4lwAWWu0aOcwFibVF6SmxrLARzbX1ovxNQ2fm5UW30R4ny0u87n8DUi7AQo7t2AG6zp
	N7ls2Wjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fbk-00000002Xpg-2Ah9;
	Mon, 21 Sep 2026 15:07:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fbc-00000002Xmh-0JWz;
	Mon, 21 Sep 2026 15:06:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B56DC43CA1;
	Mon, 21 Sep 2026 15:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3C91F000FF;
	Mon, 21 Sep 2026 15:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790003215;
	bh=/ziQ3NW1LSgwDZe9di4b6yJwonh0oLPcxYpWPZN+JqI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=lOrHKfrbJ7ahQcwnnVS4kIP0s3GNfPmgrb5Y5k4SU7coJMk/sM3m7J5uNTGZy+lmM
	 0ObsoCjw2DRp/0lyLYnfcxU5EmuG93OuYOzlVfvf45toocfFbh4FwxEJo+VtL/R1aL
	 4bdqbNGArvBVflbHpdfdKJold/G/S1evziVMvUrmrwd9/HWcrOmWCfgIRgW4TgKDhl
	 wOjKrBLFmkAyh1M4z1ir11oAIaYm+pGCodpG6qgf8l5jKu/0b4akexj8ufqRvrmecn
	 JZJoeuDKeXgS5XDwMUZfo3fzsaIEKAFekB2/UC5fJhjcYEIHwCREyGJc4DbF7qyvhJ
	 sB0WK9InErSzA==
Message-ID: <0e6f063b7e128c3713b68d217342f9f8@kernel.org>
Date: Mon, 21 Sep 2026 15:06:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 02/19] drm: of: remove now unnecessary forward
 declarations
In-Reply-To: <20260916-drm-bridge-every-panel-v3-2-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-2-83afb4f1a707@bootlin.com>
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

On Wed, 16 Sep 2026 15:45:26 +0200, Luca Ceresoli wrote:
> These forward declarations are now redundant after having moved
> drm_of_find_panel_or_bridge():
> 
>  * struct drm_panel is not referenced in this file
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

