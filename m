Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43082C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 11:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Thmzt2bA5oDRdHIBsmWHHi7LxhCvKiJQFfK9uAWWp6I=; b=ayOUgBtvdaAUhj1r8nklBqdlkO
	ruxftKXUtWQtj+2SFxGexcGkWF37Aqiu6+ziBgH0h/0EunX7Eir9x1Xjsw3Xk5IiaZqvs118c8Fez
	MteOGzUEuQYEYYgvqRmRhyKBqqqIPM/B/DNnTze/ISP3w98qXif05nPAAJUJCRkt7GyTqzdlhZX3Q
	8NQ1bLfxd0wpOc6gDz7Tq3G4vBVEWx6+JUYlrgfol5jf7FWGoV7oKh85Yqf1ggKcSBXwg8BZJ3kyK
	1Rud+IlONOjV/71dKKUSYESBKOVFPipeQ94EJK/IRT0hY+tSGGSQlGJgfFZiPwPdBzd5pwtsEdh1e
	AdubWLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uHd-00000008ux9-0Eyk;
	Tue, 08 Sep 2026 11:46:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uHQ-00000008urd-27Tv;
	Tue, 08 Sep 2026 11:46:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ECC1460A9B;
	Tue,  8 Sep 2026 11:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF17F1F00A3D;
	Tue,  8 Sep 2026 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788867983;
	bh=Thmzt2bA5oDRdHIBsmWHHi7LxhCvKiJQFfK9uAWWp6I=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=H/ekudPMgJ3J+jTc+71sHPNQdwtVeyDUOof+Ch1isOl1fL3ScUIpdBNrFFqFvZU6I
	 6kZRGvza+AIlaSsGfs73K892T969F/JfZN8wJVkD3c2QIMdhiUKU0x3wAV84RnNvuw
	 kGAfT+S8Aq1qdy0I46HqN9BrFP+/78pv8K3lIWiQx3Bm0SFhcW2H+kNeGkdTJMQsxQ
	 s8yC9yidBrK7ZaKyU3nZmDUVRuXLFWXdyZgElpaBUDAB+lK/Wolr1Jh5cy/xBx3eLe
	 if6LnlxqxBuD/bx6L7aQjhh0pH4ESwSs2nUoFr6La5hceGZ4hhHNmfR7gUvg2zoCDT
	 nN4MvN0BYenmQ==
Message-ID: <a609592dd139aedc19fa400cfa55c048@kernel.org>
Date: Tue, 08 Sep 2026 11:46:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v11 55/74] drm/bridge: lontium-lt9611: Advertise HDMI
 1.4 capabilities
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-55-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-55-bc12954a0688@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Algea
 Cao" <algea.cao@rock-chips.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniels@collabora.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Helge Deller" <deller@gmx.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Phong LE" <ple@baylibre.com>, "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
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

On Tue, 1 Sep 2026 21:51:19 +0300, Cristian Ciocaltea wrote:
> Bridges using DRM_BRIDGE_OP_HDMI are expected to provide the supported
> HDMI version.  This is not enforced yet, but will become mandatory once
> the migration to the caps-based HDMI connector initialization API is
> complete.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

