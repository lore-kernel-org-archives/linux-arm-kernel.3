Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8A5CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 15:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28c7kE48N7xjxdMBXG72aK5f+72+xxiC+Mf8uQsdzvY=; b=UMAuo7xL7sgDPxqiR7yO46BLmr
	JIqZzBS5BfiulP3GCsVMXdXAFoI+NsSGloWC1TUJbd8fUkOyBOlbw9QzyzUcCNpFg2/zdXGPlepur
	sUFVeGjwClW0Blhvt2ljvP9f3fvR2o9qiSAT2MS3vBH4vr7GQsPoDy8682+K8MjRJ5cwH3bOcd4Vr
	nqxf9UhHj2Sywk1RKl16JEqyeI+2F8QgtbEOTMxyjYBBAymd4GOGp5BZQyjicwkitRXqqxGZhMYMN
	GPqQlTb2T2K0CuNjqXt/qif3oZRWnA9Hny53HceBmv2VmADJ7E0lVGHsY7rMDoc5PRXAtjDv5yzIy
	q6GAl2MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhBz-00000009fTo-3cEI;
	Thu, 11 Jun 2026 15:19:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhBy-00000009fTZ-2Eoi;
	Thu, 11 Jun 2026 15:19:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 59586600AA;
	Thu, 11 Jun 2026 15:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F7A1F00898;
	Thu, 11 Jun 2026 15:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781191177;
	bh=28c7kE48N7xjxdMBXG72aK5f+72+xxiC+Mf8uQsdzvY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=Sg9gAoyR72sLzbmyaHYiKZePL+6yRvjflirMaehl2jqek7CuVSbv97qgN+zz4tc5V
	 dDN8CgNOySokjqRq0Y6JYB6pF+KY4FR8917omVcSeer5b2DiflwT6icPRAI9FGKr4v
	 70alWR0susjbOymSmjfofooZ02DFXEjagsWLwUlLOIQRXSn71pE2XoJ6fU4zBolehm
	 SiJdVYOWz23MHn8SD1TW32sgbpvSm4m8i0anxDw0sOzLBNhhWBpY/LqusCqQ0UAs+m
	 H9y9WcOZLpkaXLCD6MVHksd+iUWnr8hAKWOvFCUaHthnJIBnW56PJFGi0Or7AbTXKQ
	 w3FjaM+Fdir1w==
Message-ID: <404cdc5ee5da868c0f0cb17d19dcebd8@kernel.org>
Date: Thu, 11 Jun 2026 15:19:34 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v7 03/30] drm/display: scdc_helper: Add macro for
 connector-prefixed debug messages
In-Reply-To: <20260602-dw-hdmi-qp-scramb-v7-3-445eb54ee1ed@collabora.com>
References: <20260602-dw-hdmi-qp-scramb-v7-3-445eb54ee1ed@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>, "Daniel
 Stone" <daniels@collabora.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert Foss" <rfoss@kernel.org>, "Sandy
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

On Tue, 2 Jun 2026 01:44:03 +0300, Cristian Ciocaltea wrote:
> Introduce the drm_scdc_dbg() wrapper over drm_dbg_kms() to help getting
> rid of the boilerplate around prefixing the debug messages with the
> connector information.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

