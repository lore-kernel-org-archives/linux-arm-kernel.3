Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF819CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 09:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaXoJASViySO8hQHnbvUHikzZfdUFXuii1sojc9l76Y=; b=sQr7LoyHi5qZIJCSRijTijcLrS
	ubSn5nuqqSQ796SPogk+Kyw68g0goGERD0sIIuPMHfWTuNCEEM+cS2k2vVJv5lk7XEXNHHrrcSo4N
	0hrLNmWwp09uOFjXrjPt2orB5C2zx3DJj9DWIuAGBQdeeJq/9dIhv2wgLORlrXCYcKeAmZXCIWtwR
	R2bdcOjzc3AACk0PbQp3PDF31IxoBnrs3al1//HY0w+fkV++eTTM4pbX9lFz6SNvuzDsha+GniyyT
	gC2w4CPq0XTXuK9of6+p8JI9qc1cYl4DXvqUxClnzj6h5eKRaZ4ckC/XmBB7KZhpYey29rmSvttv2
	DDbTPrrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXc27-000000099yL-2BNX;
	Thu, 11 Jun 2026 09:49:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXc26-000000099xJ-0IXG;
	Thu, 11 Jun 2026 09:49:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5031A600B0;
	Thu, 11 Jun 2026 09:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E64D1F00893;
	Thu, 11 Jun 2026 09:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781171345;
	bh=PaXoJASViySO8hQHnbvUHikzZfdUFXuii1sojc9l76Y=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=bKK0PNb8qMFF5wpH05aFy7gNeTmuLz8Qh2Vn8uE7IV5mJszGi0+fkR4phVOFV3heL
	 l0GIgNeOJSH1OCBDDOe6Eh1BqIjCGQkddosFvKxJARxVHDmJe8sFxtt40EZMko0H2D
	 0yX0GYC5MSGusLcHQR/1ElhKLPdvUTUkER7oVobqm0RczwFfrAi+SDvqS7ec6Pwv9A
	 A2+P4Ghhp9mAjgAvd9QsaPR1CNighXOr6rC9lTHsh/wiEWx743+/SIt1AoNO5Dqbmg
	 2OcJcLuvhjWb85wVG2O1YcbIQfxahdVpIzGJQsHhE/ss9uGubzKvn5kQVB9EuouNIs
	 h1Hh4CkoufSEQ==
Message-ID: <be56d8fe4fe3e7bd1c37b92c273c414d@kernel.org>
Date: Thu, 11 Jun 2026 09:49:02 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v7 01/30] drm/fb-helper: Remove unused local variable in
 hotplug_event()
In-Reply-To: <20260602-dw-hdmi-qp-scramb-v7-1-445eb54ee1ed@collabora.com>
References: <20260602-dw-hdmi-qp-scramb-v7-1-445eb54ee1ed@collabora.com>
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

On Tue, 2 Jun 2026 01:44:01 +0300, Cristian Ciocaltea wrote:
> Remove the 'err' local variable in drm_fb_helper_hotplug_event() which
> only stores a return value that is never used beyond the immediate
> return statement.  This simplifies the code without behavior changes.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

