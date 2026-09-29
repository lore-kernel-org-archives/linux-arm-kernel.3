Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CCACA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWUhtc2EI4P8iKvvKNVdvZzhVvDwI9XwvEg+J4EFQOk=; b=zdTMke2UJ4Mb0SgkG5LQyNh7mD
	Z3WvbE5erW7Pfl222pT6/nS1ivb/spTgYa1VE/hiaiR6R5yrwnNdJVyuIxqP8BGbk6a9CMLUeqDKP
	kqwtLVyu0oDyaxAOFvsiGdA0JBWMzLsWaNdJQGSVeTM95YiiteDYK43q3QgnuN/O6nUzPuBN5CfHZ
	+dtFOFE3fW4KCoN7IpywQhHlNqCebDkVCHtvWxQBpWJqkp/f4jHzNowT4sJWoNRIKPGjYQSc4l/oJ
	IbvENUvNgIbm1ir7asdPxrqjOZBk6/nH0b/vJc7iovsJWH67mIdnnTPgflMR3IKM1BvhSQ3hHZL83
	tXdGhBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVN1-00000003JQl-0xKK;
	Tue, 29 Sep 2026 10:47:35 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVMf-00000003JMJ-2FdZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:47:16 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.96.244])
	by APP-05 (Coremail) with SMTP id zQCowAB34jwXl7tq7fmqCQ--.2307S2;
	Tue, 29 Sep 2026 18:46:48 +0800 (CST)
Message-ID: <c1b065c8bd926708500b7c42864279e055ed95d0.camel@iscas.ac.cn>
Subject: Re: [PATCH 0/7] drm: remove deprecated *_of_get_bridge() from
 non-OF drivers (fixes build regression)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Frank Li	 <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda	
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman	 <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Dave Stevenson	
 <dave.stevenson@raspberrypi.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal	
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance	
 <kernel-list@raspberrypi.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni	 <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 	imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Date: Tue, 29 Sep 2026 18:46:47 +0800
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: zQCowAB34jwXl7tq7fmqCQ--.2307S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFWxWFWxCw18Kw13Cry3urg_yoW5Xw1xpF
	4xtryYyry8JrZaqwsrAF1kAry5A3WDJa4fJr1UtF1Fvr1rZF10qw4q9ryF9ryUAFW8ZFn8
	tr1DXr1S9F17AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU3byCDUUUU
X-Originating-IP: [120.85.96.244]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_034713_940400_C102AD41 
X-CRM114-Status: GOOD (  15.48  )
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

=E5=9C=A8 2026-09-29=E4=BA=8C=E7=9A=84 12:36 +0200=EF=BC=8CLuca Ceresoli=E5=
=86=99=E9=81=93=EF=BC=9A
> After commit Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code
> to
> drm_panel.c") some drivers fail building:
>=20
> =C2=A0 error: implicit declaration of function 'devm_drm_of_get_bridge'
>=20
> This is because devm_drm_of_get_bridge() (and drmm_of_get_bridge())
> have
> been moved to drm-panel.h.
>=20
> The affected drivers are those which:
>=20
> =C2=A0* can be built without CONFIG_OF, and
> =C2=A0* don't include drm_panel.h
>=20
> The affected drivers are 3, fix them (patches 1-3) by replacing the
> deprecated *_of_get_bridge() calls with
> of_drm_get_bridge_by_endpoint().

The comment of drm_of_find_panel_or_bridge() still suggests
devm_of_get_bridge(), and the documentation at the head of drm_bridge.c
also mentions it.

Should this get fixed?

BTW should drm_of_get_bridge_by_endpoint() has some drmm/devm variant?

Thanks,
Icenowy

>=20
> While there, do the same for all drivers which be built without
> CONFIG_OF,
> even if they don't fail (patches 4-7).
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Luca Ceresoli (7):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/imx/lcdc: stop using deprecated devm_d=
rm_of_get_bridge()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm: verisilicon: stop using deprecated
> devm_drm_of_get_bridge()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: dw-mipi-dsi: stop using deprec=
ated
> devm_drm_of_get_bridge()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: dw-mipi-dsi2: stop using depre=
cated
> devm_drm_of_get_bridge()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/vc4: dpi: stop using deprecated drmm_o=
f_get_bridge()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/vc4: dsi: stop using deprecated drmm_o=
f_get_bridge()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm: renesas: shmobile: stop using depreca=
ted
> devm_drm_of_get_bridge()
>=20
> =C2=A0drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 9 +++------
> =C2=A0drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 9 +++------
> =C2=A0drivers/gpu/drm/imx/lcdc/imx-lcdc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c |=C2=A0 5 ++---
> =C2=A0drivers/gpu/drm/vc4/vc4_dpi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 9 ++-------
> =C2=A0drivers/gpu/drm/vc4/vc4_dsi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 10 ++++------
> =C2=A0drivers/gpu/drm/verisilicon/vs_bridge.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++----
> =C2=A0drivers/gpu/drm/verisilicon/vs_bridge.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A08 files changed, 19 insertions(+), 35 deletions(-)
> ---
> base-commit: 91ceac83e599c9d48da4c4d2d91410c588a215f7
> change-id: 20260929-drm-fix-of_get_bridge-build-regression-
> 98f22f8a1dcc
>=20
> Best regards,
> --=C2=A0=20
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


