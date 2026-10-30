Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B6D606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3kHRBHZ5;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=U9kWFnfC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=usSQk3gmkVPvTdjKUU6vUCEb73RASrZuENLTQo/CskA=; b=3kHRBHZ5caveEiiAi3GUMdzTcJ
	xb3n9PMi2Ph470calOYxvm4ynS98oyGHaogIbw3G+SS4fFJEQUAoqOgvcgP86/phTgUyxkUC2FO47
	vaH6e6bAwiesvI1P3puls66bd0BDuT6YVXdYplXrg6N9Nd7jrRtwjt+zMeuy72rCs3b6IrSh75qoz
	CEymrODsRTOfCrt4rrZhBX9CulUm0/wdnDSnOrVwLPrK+8NzFF6QOd3tt+Z3atQZkEuG0F9S1uxz7
	f51idX32FrNedDp/Dz4nAfgFqGghCoVZSYeQ5+BcCCIMeZvC+ctWuUCjGENMp9Xv2DPbAD9ATBGNb
	gmBM6CYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqeL-0000000CGdu-03sz;
	Fri, 30 Oct 2026 17:44:21 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqeI-0000000CGdI-1mOX;
	Fri, 30 Oct 2026 17:44:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=usSQk3gmkVPvTdjKUU6vUCEb73RASrZuENLTQo/CskA=; b=U9kWFnfC3oQMbgDNWHcOQJ/NJT
	HfgLlU43wb+0bVziHK6qseWoW1WMNY9f8Yajz9bGzugJq2zGqk+5Zl/V7gMxjMMyR2ibJg2DM/cKq
	mFzfarqU1oKC/MKLL6HJdfJrlr9ls7aCcDDFy74PBnwrJJomtlNsDXUz13oWND07rvw4PsnCH04QP
	aYc/Td6PEoaEgs9zzYMyNlzWqaiAeywaleFvaOvv0NUvxO68TRI9g5PexamYMQFGhtIA9nmouBK2A
	hlhLO7I37xAuZou/gPdDekGMLTi100S6UetXWliTUUnG1AXLWeo3vVV6iXXbak+pKHorNBooaP+i1
	QmeOqqOg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Dominique Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Yakir Yang <kuankuan.y@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Conor Dooley <conor@kernel.org>, William Qiu <william.qiu@starfivetech.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, Sandy Huang <hjc@rock-chips.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maud Spierings <maud_spierings@murena.io>,
 Graham Markall <hello@big-grey.co.uk>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Joshua Peisach <jpeisach@ubuntu.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v6 02/18] drm/bridge: inno-hdmi: Don't dereference a NULL
 drm_device on hotplug
Date: Fri, 30 Oct 2026 18:43:47 +0100
Message-ID: <1844578.vCJZsxu672@phil>
In-Reply-To: <20261029-jh7110-clean-send-v6-2-759594e43acf@samsung.com>
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
 <CGME20261029075355eucas1p190ad652b6408201a2e04bc53c2717783@eucas1p1.samsung.com>
 <20261029-jh7110-clean-send-v6-2-759594e43acf@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_104418_464062_EB3C8964 
X-CRM114-Status: GOOD (  20.47  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Donnerstag, 29. Oktober 2026, 08:53:36 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Michal Wilczynski:
> inno_hdmi_irq() passes hdmi->bridge.dev to drm_helper_hpd_irq_event(),
> which dereferences it in its first statement:
>=20
> 	if (!dev->mode_config.poll_enabled)
>=20
> bridge.dev is assigned only by drm_bridge_attach(), but inno_hdmi_bind()
> unmutes the hotplug interrupt in inno_hdmi_init_hw() and installs the
> handler well before it attaches the bridge:
>=20
> 	inno_hdmi_init_hw(hdmi);		/* unmutes hotplug */
> 	devm_request_threaded_irq(...);		/* handler goes live */
> 	...
> 	hdmi->bridge.ddc =3D inno_hdmi_i2c_adapter(hdmi);
> 	devm_drm_bridge_add(dev, &hdmi->bridge);
> 	drm_bridge_attach(...);			/* bridge.dev set here */
>=20
> The bridge is allocated by devm_drm_bridge_alloc(), which kzalloc()s it,
> so bridge.dev is NULL for all of that window, and a hotplug event
> arriving in it enters drm_helper_hpd_irq_event(NULL).
>=20
> Before the conversion to a bridge the ordering was safe:
> inno_hdmi_register() called drmm_connector_hdmi_init(), which set
> connector.dev, before the interrupt was requested.
>=20
> Drop hotplug events that arrive before the bridge is attached.
>=20
> Fixes: 969325a2597e ("drm/rockchip: inno-hdmi: Convert to drm bridge")
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/gpu/drm/bridge/inno-hdmi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/=
inno-hdmi.c
> index d7c33b92e2ddf4ced84d17304463f44be52270b8..d29832249b942dec84fb9d07a=
0b21ee751fc0486 100644
> --- a/drivers/gpu/drm/bridge/inno-hdmi.c
> +++ b/drivers/gpu/drm/bridge/inno-hdmi.c
> @@ -929,7 +929,13 @@ static irqreturn_t inno_hdmi_irq(int irq, void *dev_=
id)
>  {
>  	struct inno_hdmi *hdmi =3D dev_id;
> =20
> -	drm_helper_hpd_irq_event(hdmi->bridge.dev);
> +	/*
> +	 * The interrupt is requested before the bridge is attached, and
> +	 * bridge.dev is only set by drm_bridge_attach(). Drop hotplug events
> +	 * that arrive before then rather than dereference a NULL drm_device.
> +	 */
> +	if (hdmi->bridge.dev)
> +		drm_helper_hpd_irq_event(hdmi->bridge.dev);

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Most other callers of drm_helper_hpd_irq_event() also do exactly this.


Heiko



