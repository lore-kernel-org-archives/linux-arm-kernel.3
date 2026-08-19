Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CB6C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofn2ZZ6XPlR/lPmYUjXtJeQNkxi/butXlRsGauSrOlc=; b=bW913wgRrMRTBYXJvjttvfazwk
	BAZcQKcflKg5CTMob/DHdQkHNB2RU1ytETkS7H5+F7u0p08vJG97e/+d3qrRc7It9TvA68oMGjqXW
	iVZW/FL9rhwcITBa8rnvjT3g3bEJSDtAhyK4PhpAoD4Qqty/Bw9Sra3XJw1UQq0xWMzaRS1E55ryD
	mhjFKEtQUNbUcmsYw0UWaW1gLXrEF+BNpRlujQDj2D0MZe01t4A0W7Ju4DISShHXifa0wvv/aqLZ7
	16FQ3nhn+cZ/trTK1SPEDCtNumYbONNQ8D6QI9m8RWLoP/kRH+aSDM+bVGvidv/zvj1ugAKG/WDzf
	LfSkDVKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdfb-00000009ZFB-3Q9X;
	Wed, 19 Aug 2026 10:37:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdfZ-00000009ZEb-2m6e;
	Wed, 19 Aug 2026 10:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ofn2ZZ6XPlR/lPmYUjXtJeQNkxi/butXlRsGauSrOlc=; b=rEWYxZDQRF3HvBIMiv+yoXDvJo
	cQALU3IXk3TYG8G+ih0Tt76d5TTQOvmtu2WqEuJ8glTMKwAKs9Yn1Q0rGE1efzNrn9S3pPeIKvDx9
	eygs1DIwW4lqO0geAU4dtPljbEXOvpXk03UPEjBKlqBkvG2SeE1xlTUjwrVKI9vhR4DUtajlaT3gd
	CYw//BQiWamdbW56G4+EqzgIRnDFvUZHcsItJsgEql0DvDm8rEA06c8rdAnAoC6LM+rsT+IBfTWop
	6WPIDz+kU3uvly6U8OWDfRqaZkkIwCkyaPj/OpfyMDVh9QWYl53PFI+zFHPeEeM5gFaI8Fos1pXrg
	W+ZxJJLw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Algea Cao <algea.cao@rock-chips.com>, Daniel Stone <daniels@collabora.com>,
 Liu Ying <victor.liu@nxp.com>, Phong LE <ple@baylibre.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v10 54/69] drm/rockchip: rk3066_hdmi: Advertise HDMI 1.4
 capabilities
Date: Wed, 19 Aug 2026 12:36:29 +0200
Message-ID: <7956767.Wku2Vz74k6@diego>
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-54-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-54-294364b2cf15@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_033717_847512_0789143D 
X-CRM114-Status: GOOD (  11.43  )
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

Am Freitag, 31. Juli 2026, 18:20:01 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Cristian Ciocaltea:
> Bridges using DRM_BRIDGE_OP_HDMI are now expected to also provide a
> supported HDMI version.  This is not yet enforced, but will become
> mandatory once the migration to the new caps-based HDMI connector
> initialization API is completed.
>=20
> The RK3066 HDMI TX supports HDMI 1.4a, as described in commit
> f84d3d37b7fb ("drm: rockchip: introduce rk3066 hdmi").  However, the
> driver does not currently enforce a maximum TMDS character rate, it only
> filters non-CEA modes and excludes VIC 1 (640x480) via the .mode_valid
> callback.
>=20
> Advertise HDMI 1.4 support for now so that modes exceeding the 340 MHz
> TMDS limit are rejected by the core.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



