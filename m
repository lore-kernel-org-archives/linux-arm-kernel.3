Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA513C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 11:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2ufdAi6iSu3pTvcPoy0tUq5hT+a+J5hPm89qRLVaWU=; b=y+cz0DqTtoWjNtJ5u7BTeMcM3W
	DUoscwBKleQzGtN1yUySRK+wyJbD7cHPrIeNxcJ7hte+L/AZHtLVmwLK8KJE8bkFVM9/9wFWcEELE
	dUorD8EesESDlMebFjP7HYxiSRQwBLULa0a8TCOUnrfbytRu2fUX8PDx0pH50okRbYVLQghbkogxg
	S3S6w9nM5zZVs2BycwGLUXLHTiaQl+fpqHGGuGTUtM6Bz/nNkRrCIe4GONX4nd8F5R5qHAqbBi2bB
	ppLHgla4BYJ+rdWfCfVwPWYikAgd0atzb/zhGFT1BoIiePIXfGtk94xnvTvUdwsyzIjUYqPnsLVko
	9ceOwtYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uHN-00000008uqU-47cx;
	Tue, 08 Sep 2026 11:46:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uHF-00000008uok-3GmH;
	Tue, 08 Sep 2026 11:46:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 098DA40BE9;
	Tue,  8 Sep 2026 11:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 389BD1F00A3A;
	Tue,  8 Sep 2026 11:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788867972;
	bh=f2ufdAi6iSu3pTvcPoy0tUq5hT+a+J5hPm89qRLVaWU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=CWQLX09KEKr34PuO3/HiRT5ISYG38N8NpIa3CLmXmDeuN0C4dJlz7vbqGR7Zc/XsZ
	 xkpnTFUYk7ffVxkEnwiDTSylk3JeWcsofNntzt13HtYEZQvGQKCpQuGYJsQgJeNBPs
	 0OeihzwkhTXazSwXZc2mOvlRR4ZHjCXYzyt9n0GZ/ERplaG9DuQ7EAsLjtCwWD8fms
	 3VLWTm60madjw/6IlaWP8w7Suhs+ShCkpzi2YbomcUfa2KHTqEk4OPx75SPJ5ve+rk
	 sQh6PYTK0eqpN0g9iWeqxHOBzYgWsd7M0zOFQVmAP6Mk3N1UKCBEVgxxOiFid2lwhK
	 f5OKrDJFI2GKw==
Message-ID: <5cd4202585d5d6a87a8614520efd0ed0@kernel.org>
Date: Tue, 08 Sep 2026 11:46:09 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v11 54/74] drm/bridge: ite-it66121: Advertise HDMI 1.2
 capabilities
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-54-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-54-bc12954a0688@collabora.com>
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

On Tue, 1 Sep 2026 21:51:18 +0300, Cristian Ciocaltea wrote:
> Bridges using DRM_BRIDGE_OP_HDMI are now expected to also provide a
> supported HDMI version.  This is not yet enforced, but will become
> mandatory once the migration to the new caps-based HDMI connector
> initialization API is completed.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

