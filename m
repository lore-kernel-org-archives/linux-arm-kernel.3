Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A697AF46456
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 11:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LLjJ8Qd6wNXbg06pYIRYcPmRb/RcOo68671SJw5PZI=; b=T3wvfOAml+PSUnq4IGOAa4TddP
	rp95JPoIbOS/0cUCmU1/r6uNiQu4XdN2cerlIA7MZLEML7ocqYZkgwi6WZsqj8csW3HraYIxmZ4ia
	qhshdJ4rEAxy4JufKKgXj/aJ4JbbqFEJowb6G8RasfHmc8iuE6kEXdUH1N70zkCAPZXsOh2X+0N+h
	0d2b4lTcRxqEOb1BrmT0uGb11/PU3qnaLz82amv9ZbhfprNsDYNbaEKX9+eN2OJJ+zyZqUU6hnqM8
	G8SVnIHWqU4ArUCFcXxD8JLAgFzfL24zBIwV2xzGEXgSrQd30WeqTULPN0mmCkKkw2CRXpjokyC+o
	14j1qZkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26IW-00000003qfD-3wCr;
	Mon, 16 Mar 2026 11:39:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26IR-00000003qeQ-3kqh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 11:39:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8BF781A2E6A;
	Mon, 16 Mar 2026 11:39:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4EB815FC4A;
	Mon, 16 Mar 2026 11:39:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7DF5310369E73;
	Mon, 16 Mar 2026 12:39:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773661176; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9LLjJ8Qd6wNXbg06pYIRYcPmRb/RcOo68671SJw5PZI=;
	b=YrywEDwd/DzMcHZz4wMx/qDUUpvovYoTrhVPGEOmyWw/GimO4aRGWgjfaRUp096SdfisEu
	fL7fyiN9g5ShHiC0bJ1HLcSiRmmromhJMWEGykRppDiKWCfJyd8CE9upne8c7MS4veJl9C
	F2567Jh16wPZp2rva8ZWs5sa/ktvOyV7GgKVD1l9lwwqvogkfchCWNn0uiaK9l1+o4CsY/
	8XM9Y78ODDYhIPF3fR5xInhUpzGGiyzeH9/8xsONdMXOwnDHMCWJaUzPBNzQ9Pm/aZwkh+
	4jh1gU77n4mMk8A8bpwAPpZU8p6RPatwWYKsvXQsYdR0qnmwUDqWFz4JFrOonQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 12:39:24 +0100
Message-Id: <DH46EQM1PED9.2BVW9DWVIMEJZ@bootlin.com>
Subject: Re: [PATCH v10 11/18] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <krzk@kernel.org>,
 <alim.akhtar@samsung.com>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <heiko@sntech.de>,
 <andy.yan@rock-chips.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <dianders@chromium.org>, <m.szyprowski@samsung.com>,
 <jani.nikula@intel.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260310012458.169272-1-damon.ding@rock-chips.com>
 <20260310012458.169272-12-damon.ding@rock-chips.com>
 <DH1TKWREZMFK.3BY4NY36BXLXG@bootlin.com>
 <bebadd3b-2fd1-404e-bc64-205c8b44880c@rock-chips.com>
In-Reply-To: <bebadd3b-2fd1-404e-bc64-205c8b44880c@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_043944_061184_97599471 
X-CRM114-Status: GOOD (  14.05  )
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

On Mon Mar 16, 2026 at 4:17 AM CET, Damon Ding wrote:
> Hi Luca,
>
> On 3/14/2026 1:10 AM, Luca Ceresoli wrote:
>> Hello Damon,
>>
>> On Tue Mar 10, 2026 at 2:24 AM CET, Damon Ding wrote:
>>> Initialize bridge_connector for both Rockchip and Exynos encoder sides.
>>> Then, make DRM_BRIDGE_ATTACH_NO_CONNECTOR mandatory for Analogix bridge
>>> side, as the private &drm_connector is no longer created.
>>>
>>> The previous &drm_connector_funcs and &drm_connector_helper_funcs APIs
>>> are replaced by the corresponding &drm_bridge_funcs APIs:
>>>
>>> analogix_dp_atomic_check() -> analogix_dp_bridge_atomic_check()
>>> analogix_dp_detect()       -> analogix_dp_bridge_detect()
>>> analogix_dp_get_modes()    -> analogix_dp_bridge_get_modes()
>>>                                analogix_dp_bridge_edid_read()
>>>
>>> Additionally, the compatibilities of Analogix DP bridge based on whethe=
r
>>> the next bridge is a 'panel'. If it is, OP_MODES and OP_DETECT are
>>> supported; If not (the next bridge is a 'monitor' or a bridge chip),
>>> OP_EDID and OP_DETECT are supported.
>>>
>>> The devm_drm_bridge_add() is placed in analogix_dp_bind() instead of
>>> analogix_dp_probe(), because the type of next bridge (the panel, monito=
r
>>> or bridge chip) can only be determined after the probe process has full=
y
>>> completed.
>>>
>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)
>>
>> ...
>>
>>> @@ -73,15 +72,12 @@ static int exynos_dp_bridge_attach(struct analogix_=
dp_plat_data *plat_data,
>>>   				   struct drm_bridge *bridge)
>>>   {
>>>   	struct exynos_dp_device *dp =3D to_dp(plat_data);
>>> -	enum drm_bridge_attach_flags flags =3D 0;
>>>   	int ret;
>>>
>>>   	/* Pre-empt DP connector creation if there's a bridge */
>>>   	if (plat_data->next_bridge) {
>>> -		if (dp->has_of_bridge)
>>> -			flags =3D DRM_BRIDGE_ATTACH_NO_CONNECTOR;
>>> -
>>> -		ret =3D drm_bridge_attach(&dp->encoder, plat_data->next_bridge, brid=
ge, flags);
>>> +		ret =3D drm_bridge_attach(&dp->encoder, plat_data->next_bridge, brid=
ge,
>>> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>
>> Should this be 'flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR' to be future-pro=
of?
>>
>
> Aha, the exynos_dp_bridge_attach() and even
> &analogix_dp_plat_data.attach() have been removed in [PATCH v10 16/18]
> for consistency and simplification. Since the only bridge flag supported
> right now is DRM_BRIDGE_ATTACH_NO_CONNECTOR, let=E2=80=99s leave this as =
is for
> now. ;-)

As you are going to send v11, I'd do that change. It is the right thing do
to, it's cheap, and in case patches up to 11/18 but not (yet) up to 16/18
we avoid ending up with unoptimal code until patch 16/18 is applied.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

