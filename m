Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10023C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7A9sj2I+9f+ApBdCNkzkJ0UFPvM5uYskNE27rgUXC0=; b=yoG3BDGV18kPzmqKEKpUtV9Lk7
	wtPZvdpe5GkqxmLN6PYu2IvRmQD4imO4leAfZYJFX5f65m0WCmrR2+mmSwW7l7IoQkSVcLNfNGpR2
	nnhf75LVjSsAYAxYOfX9tpmBul25SRkAnrXPZ6lWlho+Ml+kZZt2IpTlDRILVsyATG5C+qYKVv6me
	W+DhKlHNYieBRKdiymSymchjBFBkxFfJsjZ2WSnnZMO5K5+embUI1qAyA7jEdkqjNZ2RU9PTzE0fQ
	ZvX72Ugb8s6Q/ZOn2WWaR3QoOjEYdmEzPX/oFJuBQhpJJQlyucoXpQkv878rZn8oJRYcg32pAYQeW
	9te5vuYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzt8-0000000BLkV-3lmc;
	Thu, 20 Aug 2026 10:20:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzt7-0000000BLjz-0hts;
	Thu, 20 Aug 2026 10:20:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 98FEF60A5C;
	Thu, 20 Aug 2026 10:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49E41F000E9;
	Thu, 20 Aug 2026 10:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787221244;
	bh=Y7A9sj2I+9f+ApBdCNkzkJ0UFPvM5uYskNE27rgUXC0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=lIrrhK1JB67kNZSh544PmkOfj3zrHAYu14z4pU7Riw+0oAf3zbkx7OQ0llVWpHM2T
	 hWL5biFZJUzn/MAiLQh68SZ13pxPIX8S+8XmewhfPwVUOk42WWoB2wI0igVWZ6XTr5
	 Vy4jPaH+Bxv5idq+wPN+bMKb03Axhav95v7nTVMIiXqaUUZH5SRnClfrHhf8TO1Skq
	 pG+l9c36qQ2nCqOCQGXYNt49gwHTaqsE/CCq/Il2tulS1T46qcNIX1hFYg3GD9a5Na
	 vzqkSz5ITVgQu7hRL4MMcyn15NpMyuzQQ9UigvIA2nX2KXesP+H+YhEtVkY3pcBLZj
	 +CYil+z/iD2tA==
Message-ID: <63f164a4dba863e1b6b356fac4c87a7e@kernel.org>
Date: Thu, 20 Aug 2026 10:20:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v10 68/69] drm/connector: Drop redundant hdmi
 supported_formats field
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-68-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-68-294364b2cf15@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Algea
 Cao" <algea.cao@rock-chips.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniels@collabora.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Diederik de Haas" <diederik@cknow-tech.com>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Phong
 LE" <ple@baylibre.com>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
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

On Fri, 31 Jul 2026 19:20:15 +0300, Cristian Ciocaltea wrote:
> Now that all users migrated to the new drmm_connector_hdmi_init()
> signature, supported_formats is provided through struct
> drm_connector_hdmi_funcs, a reference to which is already stored in
> drm_connector_hdmi.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

