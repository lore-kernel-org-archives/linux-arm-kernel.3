Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63849D29C40
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pPZdQPY4l/E6Ki51s+kyYAdtveDcn2eRM82KhpKvEs=; b=Jj4byXrFtHj48nogtrKpPDSe5r
	O09JT2g4SM4ffHrVa4Ou3kWZlDxqqvRv3AVhO3IPAzPfLlAVL3R8A9DVDCqpWGmR8RsgpXRRpS6KG
	vwWSNLtNZjWdD5F8Hxi8EQKVQolD+LeBhP51zHjNJEcR7P/++sT0dLXXN5cZW6Fz/2i4we6nvpruU
	muxsXANz+V0Ap6b48GcxOWMeM6l1a/iDqvE8E/SPzv+b+giDqX+kbkEHDNm8hUhU0ZiXZZRxNSB8u
	YX/DuYrB1LJxtSBFdBY+aGDyO7c9LhcQQ33ThpdyaOM5+mSC9QZRwldAPg7IRkXs0rHYtQ4h26Oat
	axXCFwvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrmj-00000002QTD-0oBM;
	Mon, 19 Jan 2026 16:07:21 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrmh-00000002QSa-2oDN;
	Mon, 19 Jan 2026 16:07:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=8pPZdQPY4l/E6Ki51s+kyYAdtveDcn2eRM82KhpKvEs=; b=NCLAf0GyaclQZPdMNf4kV+ydak
	6AOdai735qQfi6T1UQ3K+ccjB1uImgyZUNmG93Tm03D3La8nM6AWcjwQNRgGIpoZCVP9XmqhH2eG8
	cHedeNeY7IC4dYd0GYcW/QrLJxQ6jfW+7/H8ffARoq4O4fi3ye8TpQJheeEObtEde1vOd25ED51B/
	/BlMHAiDjORwBRjW9/ZR+4UDHdN+ZMJ3YQoKyYzy8O92PBa8FrpqzhuVDHd2BBtAQH3LqiA3utzWH
	s5GZF2eLd1PC5rgjvkWZ+xeBBkYm8asn/ll956TTgFVtFl/6vJSrvBBpzwFUCdc0NWg2VJaf5Q6YB
	Endu1X2g==;
Received: from i53875a9c.versanet.de ([83.135.90.156] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vhrmB-0037VG-F4; Mon, 19 Jan 2026 17:06:48 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v8 00/18] Apply drm_bridge_connector and panel_bridge helper for
 the Analogix DP driver
Date: Mon, 19 Jan 2026 17:06:46 +0100
Message-ID: <6571983.R56niFO833@diego>
In-Reply-To: <20251217093321.3108939-1-damon.ding@rock-chips.com>
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_080719_726474_E8A169C4 
X-CRM114-Status: GOOD (  16.78  )
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

Hi Damon,

Am Mittwoch, 17. Dezember 2025, 10:33:03 Mitteleurop=C3=A4ische Normalzeit =
schrieb Damon Ding:
> PATCH 1 is to ensure the last bridge declares OP_EDID or OP_MODES or both.
> PATCH 2 is a small format optimization for struct analogid_dp_device.
> PATCH 3 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 4 is to add a new parameter to store the point of next bridge.
> PATCH 5 is to make legacy bridge driver more universal.
> PATCH 6-11 are preparations for apply drm_bridge_connector helper.
> PATCH 12 is to apply the drm_bridge_connector helper.
> PATCH 13-15 are to move the panel/bridge parsing to the Analogix side.
> PATCH 16 is to attach the next bridge on Analogix side uniformly.
> PATCH 17-18 are to apply the panel_bridge helper.

On top of all the recent bridge-related commits, this series still works
on my rk3588-eDP board - when the display is plugged in on boot.

As that is the current state we also had before, this series:
Tested-by: Heiko Stuebner <heiko@sntech.de> on rk3588


=3D=3D=3D=3D=3D=3D
!!! The following should not hold up this series though, because the
analogix-dp not handling hotplug, is also the current state already!!!
=3D=3D=3D=3D=3D=3D

However, actually hotplugging the device does not seem to work.

With the hpd-gpio inside a dp-connector node.


(1) When booting connected and unplugging the display I get:

[   42.725888] rockchip-dp fdec0000.edp: Rx Max Link Rate is abnormal :0 !
[   42.733325] rockchip-dp fdec0000.edp: Rx Max Lane count is abnormal :0 !
[   42.764853] rockchip-dp fdec0000.edp: LT link start failed!
[   42.771105] rockchip-dp fdec0000.edp: eDP link training failed (-110)
[   42.778329] rockchip-dp fdec0000.edp: unable to do link train, ret=3D-110
[   42.785747] [drm:analogix_dp_bridge_atomic_enable] *ERROR* dp commit err=
or, ret =3D -110
( ... repeasts a bunch of times ... )
[   43.284897] rockchip-dp fdec0000.edp: failed to set bridge, retry: 4
[   43.292045] rockchip-dp fdec0000.edp: too many times retry set bridge, g=
ive it up

plugging the eDP back in reenables the display successfully though.

(2) Booting with the display unplugged

Same messages as above, but plugging the display in for the first time
does not create an output.

I'll try to dig more, but if you have an idea, what I should look at, I'd,
be really grateful.


Thanks
Heiko




