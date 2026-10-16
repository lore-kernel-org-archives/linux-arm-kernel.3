Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6C7CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChS8CbLEvyFZVuYslDWXhsoD8DGk8VUp5ILUon7wnlY=; b=NDFa8eAwjOAAC5f7UtLcj75+ay
	OIP+A7gAM3dE09l98Igy2SwavJ89YG6EAnte2foPlaz/RXOW9hXQNMaxywpn/VS7j+c+vIazxzDv0
	ZnG26gBUQUyiHEgKf1gmPSyB1AhqQObI2lUBagF+VS5x2Kk8o/T3u3Yv6CCeH91RAuwJDfF9/w+V1
	5RRw8/a13tFYCJzhVdiW47WOPJ3AraPpXrepjpVz91UnP047yBHUKe2QHZ4HsuUpj93p2GuNEN4T7
	9nvY9rV5kW7JeFxDf8pC2NXaojwgJW3X+4T7rQFtmKT/A0Q69mOBH1Cvi3t5OIyWuolXnUcyfqMj4
	EfAQEH4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdfU-00000002NS0-02zK;
	Fri, 16 Oct 2026 08:52:00 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdfP-00000002NOq-122c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 08:51:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7A43C4E4124C;
	Fri, 16 Oct 2026 08:51:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48DB36075D;
	Fri, 16 Oct 2026 08:51:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5481B10328C00;
	Fri, 16 Oct 2026 10:51:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792140708; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ChS8CbLEvyFZVuYslDWXhsoD8DGk8VUp5ILUon7wnlY=;
	b=FyCLCVxkCDn6SxkXHmUNA69irjP1CxhoV/CWQHtcj/s82zfmdSuPFeHZcqDwuI6y2RZgwc
	wIev23C/pJfx83qUOIuOWk1zftExtkKtkdIwQ0IIFjjI/xCSIGSzbK+8YtsHQMksKb5QOW
	gVpfKo+NHJiF47Q8YidnxrqEySqpEmuRheElrrfeFa9rtFMRHDWYM/Qzn6+tRRBQ9i21ii
	NmV0nCvarkBkTupW8iHUMUonhdAMrNN0Q/O7QPLlV5V18cL6gu+QH4QFF2Y4yOnNh1DIN5
	LT1+gdlbxOSU71IeNW1Xhtw34nFeySDy3R+5ybE2YAAC95oEvPJWD1RCm6YHTw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 5/8] drm/bridge: ite-it66121: Advertise HDMI 1.2
 capabilities
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andy Yan <andy.yan@rock-chips.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261001-bridge-advert-hdmi-caps-v1-5-f8806570e243@collabora.com>
References: <20261001-bridge-advert-hdmi-caps-v1-0-f8806570e243@collabora.com>
 <20261001-bridge-advert-hdmi-caps-v1-5-f8806570e243@collabora.com>
Date: Fri, 16 Oct 2026 10:51:32 +0200
Message-Id: <179214069221.3071818.10591269637696395115.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_015155_422010_D2BAAE76 
X-CRM114-Status: UNSURE (   7.57  )
X-CRM114-Notice: Please train this message.
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

On Thu, 01 Oct 2026 04:14:36 +0300, Cristian Ciocaltea <cristian.ciocaltea@collabora.com> wrote:
> Bridges using DRM_BRIDGE_OP_HDMI are now expected to also provide a
> supported HDMI version.  This is not yet enforced, but will become
> mandatory once the migration to the new caps-based HDMI connector
> initialization API is completed.
> 
> Since none of the chip variants handled by the driver can drive a TMDS
> character rate exceeding 148.5 MHz, advertise HDMI 1.2 as the supported
> version.  HDMI 1.2 allows up to 165 MHz, so set the bridge's
> max_tmds_char_rate to ensure the connector limit derived from
> supported_hdmi_ver remains within the hardware capabilities.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


