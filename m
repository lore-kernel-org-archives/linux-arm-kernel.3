Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C36AC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 09:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdvPpAswqw4/3CBhh1oPtwObG87J59MBx/ZFjS/sjZ4=; b=WhKQfXg1l1RKV7xbYF/slT9MUz
	wn7aLygDYqf6uCylHRyjVU7jQu+PhzsileivMGm9jmsY7LuZtUOkAjm3L5fGYIKb1MZfP1sR0QmAn
	BFLVTfK8dvNcz106b3ypXn0PzjHHjY/lMDLG87vygQ8e9H4/jKSqAtsjYzFnNuEzzK/OUYvq0BbMU
	4kBBkyqmbB+OLT8Ruhm+gdTaqEZfX83+o7hamK0MRAyRHONP3jP2KwfkrH3l0EjPvxoV+3vsfMHGF
	9uCbh3Zl2PmPaOcoB5jRxMZQWSkNmy2QxnEeuaTv5sTpnWr1sH7bm2JPMncdEBKGmjrsxTdf8tyJr
	juU6GN0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMEU-0000000BOEs-32PO;
	Mon, 10 Aug 2026 09:23:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMES-0000000BOEI-3I1o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 09:23:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E42E860052;
	Mon, 10 Aug 2026 09:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285BC1F000E9;
	Mon, 10 Aug 2026 09:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786353823;
	bh=IdvPpAswqw4/3CBhh1oPtwObG87J59MBx/ZFjS/sjZ4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=IVZbQw1uWdTUO6bW6TK+IUk/hHy1q2s7kOEkTjNWa4XzEJ7N5L4oBWdsOJBOG/BQL
	 uFQWH/vvS0l9j8DYBrYYi13Khavxk/4QTZvquJX9eYmDZakA2UetFCL9yTymPoTHMg
	 pkoJ3tfo3//cjHiBwPDSATQ2ddyXX3e7Xs0lMcMVCGTwd02Zxv3VmPBI3yZJcnFgN6
	 0Ebbc+U5q5CbiL6bjBK1yjoh9Z9T/zo/X0nGcWqIcltxTUB7tvvdyjyLgHOKj0hUTC
	 xKr5Sk1GL+VAu+kZpKMgFKX8fWatXNVtEaKFUfSyP2zjo4ZJKxhGrzLa7GwRWe0dXr
	 oYXfb6zHaqdZg==
Message-ID: <4ffd340eee7fbcaafdb93f203a319416@kernel.org>
Date: Mon, 10 Aug 2026 09:23:41 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v9 2/5] drm/scdc-helper: Add scdc_status debugfs entry
In-Reply-To: <20260724-scdc-link-health-v9-2-bdda406d016d@collabora.com>
References: <20260724-scdc-link-health-v9-2-bdda406d016d@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniel@fooishbar.org>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Hans Verkuil" <hverkuil+cisco@kernel.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Fri, 24 Jul 2026 16:22:37 +0200, Nicolas Frattaroli wrote:
> SCDC provides status information on the current display link. At the
> very least, it may be useful to expose this info through debugfs.
> 
> Add a debugfs entry for it under the connector, which displays a few
> more details parsed out of the SCDC registers. A new
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

