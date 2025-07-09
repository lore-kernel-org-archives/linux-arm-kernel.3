Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4DDC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 08:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BS97jhDzzUjHilWkR1sT96zjI2f6GoRHScLPeEPg0RU=; b=mO+1svOG21Q7mSmZ5BZNovxL+o
	nvI0CoHr7jhXV2k+yoQnfvZu/VSDrDFYP8gFhPrTa3yLhcfICPqC8FU9vk76lLXoXHD5I4czo+Vbk
	/Oz1HbHno3/vV4Ld6bSyjczmrV3AmYywpkwBWFKWfj0/J/OGqkVeJz46TrX6Ceyg+cWV+AzjARX48
	V8ujYM7ZlOiMsZmCtrDRTgnj34GKIpGHg8pooCGK1fbvTLbgMq9f5ConAJGy6BNf3yW9KlzKADl/u
	ELIURtx1dGDX7uoKx1lxECVwrGdjDv3XzSjo9R4G/yocJlhdVONVg7/1RhsaahnqwItaIr24+M6M8
	faSq4V1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQRT-000000080rI-1kHi;
	Wed, 09 Jul 2025 08:46:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZP95-00000007nr9-3F4J;
	Wed, 09 Jul 2025 07:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=BS97jhDzzUjHilWkR1sT96zjI2f6GoRHScLPeEPg0RU=; b=orQ8efhAs5v/QafXjseL9pXPI/
	CgaVQ97Na5+Upe7AffCWgKzKclIueLLeSr2poR4A3+cdqCc5Tkufd4htI5GsURYhYZW5mxkfhnpXr
	5ezQccvInW7nwm1p1x2TFO8fAwLZvKI2sgNWQjAz0GoCsWvZNaJMra6m81ANjGODJ7PXvaQCYKESJ
	0Gw3nLDwyfs/UPk9uulyn8UZn2BGbrLZNcX6UYjg6sP0Iz3tUvBvwWyV8RcrddWFU59MvqiHEHiIz
	w5ZCETu3nbXgEWuguQe87tnyoP0eTCScwST/H1L3E3qYohjbgctjSV+rW8AT+0KMgP8cGSrTCqfSb
	Eef0xYSQ==;
Received: from i53875a79.versanet.de ([83.135.90.121] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZP8t-0001Yu-5E; Wed, 09 Jul 2025 09:22:59 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>,
 William Breathitt Gray <wbg@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Lee Jones <lee@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, kernel@collabora.com,
 Jonas Karlman <jonas@kwiboo.se>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v2 4/7] soc: rockchip: add mfpwm driver
Date: Wed, 09 Jul 2025 09:22:57 +0200
Message-ID: <8203440.zQ0Gbyo6oJ@diego>
In-Reply-To: <20250602-rk3576-pwm-v2-4-a6434b0ce60c@collabora.com>
References: <20250602-rk3576-pwm-v2-0-a6434b0ce60c@collabora.com>
 <20250602-rk3576-pwm-v2-4-a6434b0ce60c@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_002311_837288_41E6879A 
X-CRM114-Status: GOOD (  31.23  )
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

Hi Nicolas,

Am Montag, 2. Juni 2025, 18:19:15 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Nicolas Frattaroli:
> With the Rockchip RK3576, the PWM IP used by Rockchip has changed
> substantially. Looking at both the downstream pwm-rockchip driver as
> well as the mainline pwm-rockchip driver made it clear that with all its
> additional features and its differences from previous IP revisions, it
> is best supported in a new driver.
>=20
> This brings us to the question as to what such a new driver should be.
> To me, it soon became clear that it should actually be several new
> drivers, most prominently when Uwe Kleine-K=C3=B6nig let me know that I
> should not implement the pwm subsystem's capture callback, but instead
> write a counter driver for this functionality.
>=20
> Combined with the other as-of-yet unimplemented functionality of this
> new IP, it became apparent that it needs to be spread across several
> subsystems.
>=20
> For this reason, we add a new platform bus based driver, called mfpwm
> (short for "Multi-function PWM"). This "parent" driver makes sure that
> only one device function driver is using the device at a time, and is in
> charge of registering the platform bus devices for the individual device
> functions offered by the device.
>=20
> An acquire/release pattern is used to guarantee that device function
> drivers don't step on each other's toes.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---

> +/**
> + * mfpwm_register_subdev - register a single mfpwm_func
> + * @mfpwm: pointer to the parent &struct rockchip_mfpwm
> + * @target: pointer to where the &struct platform_device pointer should =
be
> + *          stored, usually a member of @mfpwm
> + * @name: sub-device name string
> + *
> + * Allocate a single &struct mfpwm_func, fill its members with appropria=
te data,
> + * and register a new platform device, saving its pointer to @target. The
> + * allocation is devres tracked, so will be automatically freed on mfpwm=
 remove.
> + *
> + * Returns: 0 on success, negative errno on error
> + */
> +static int mfpwm_register_subdev(struct rockchip_mfpwm *mfpwm,
> +				 struct platform_device **target,
> +				 const char *name)
> +{
> +	struct rockchip_mfpwm_func *func;
> +	struct platform_device *child;
> +
> +	func =3D devm_kzalloc(&mfpwm->pdev->dev, sizeof(*func), GFP_KERNEL);
> +	if (IS_ERR(func))
> +		return PTR_ERR(func);
> +	func->irq =3D mfpwm->irq;
> +	func->parent =3D mfpwm;
> +	func->id =3D atomic_inc_return(&subdev_id);
> +	func->base =3D mfpwm->base;
> +	func->core =3D mfpwm->chosen_clk;
> +	child =3D platform_device_register_data(&mfpwm->pdev->dev, name, func->=
id,
> +					      func, sizeof(*func));
> +
> +	if (IS_ERR(child))
> +		return PTR_ERR(child);
> +
> +	*target =3D child;
> +
> +	return 0;
> +}
> +
> +static int mfpwm_register_subdevs(struct rockchip_mfpwm *mfpwm)
> +{
> +	int ret;
> +
> +	ret =3D mfpwm_register_subdev(mfpwm, &mfpwm->pwm_dev, "pwm-rockchip-v4"=
);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D mfpwm_register_subdev(mfpwm, &mfpwm->counter_dev,
> +				    "rockchip-pwm-capture");
> +	if (ret)
> +		goto err_unreg_pwm_dev;
> +
> +	return 0;
> +
> +err_unreg_pwm_dev:
> +	platform_device_unregister(mfpwm->pwm_dev);
> +
> +	return ret;
> +}

I still had this lingering feeling that this _is_ a MFD just with added
sprinkles, so asked Lee on IRC about it:

	<lag> Looks like an MFD to me
	<lag> Yes, you can use an MFD core driver to control state / manage single=
=2Duse resources

So, citing Jean Luc Picard, "Make it so" ... please :-)

Heiko



