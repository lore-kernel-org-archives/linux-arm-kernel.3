Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09758CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 06:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jv49F2PUt5yh/jWsy0Oc4tt54+a1s+q3HYskLUQDwiE=; b=dgnHyV1xaXdwkIkAxCh5tG+x7r
	j8p1CQ3kfMxfNU6bbLAgrextY9rP5zz7fw5hgqL7HzMiELsW4t5NdVp7D1Dx75agDPG/KywoMpNQK
	dM17TyOydwyssqwx0pd7rkgDh7/2rafhcSChJzVXShSSDhU4oHDFa1IY3rJLC/DkjBS6N1jAcFCUZ
	d2aoz2t3z+/SngLySHzZ6d/oyU+9CmzwP+tPR78PQbXl53lLrPB9I0wMUZMD9H6PbCquKyjSNOAqt
	Yj8Zcj8jTGjumb9CYxozIecflv1BgsgEQ40l0IVfDwUPjhvw4fNqW4tuXfG6cIZqgzwGFzXWC59Xy
	KXFYE8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBo80-00000005C9B-21Zp;
	Wed, 30 Sep 2026 06:49:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBo7x-00000005C8a-2HjA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 06:49:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C82994E410C9;
	Wed, 30 Sep 2026 06:49:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93E6A60749;
	Wed, 30 Sep 2026 06:49:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71176103295D5;
	Wed, 30 Sep 2026 08:49:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790750953; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Jv49F2PUt5yh/jWsy0Oc4tt54+a1s+q3HYskLUQDwiE=;
	b=GURO+yMMIfSa5LwCdzuwM2Fy1yxfvWXa3oihCCLl2WeczkqmQC9VhCpae5duc1fEPxBYYu
	4y21VXIrV3oN5jeHXaOhmFBEnmqtKniaLYyhev2h/dhtIqk0YIQ074eafqxhxTJJjv2BL8
	fCSqROd8H2c3c4sJDsvmPCMe5tGV0Rtv3Bvc0HAGib8OEj5WSvaoDYGsavoQt+QgFcwT7I
	6G+40NTLKOrOpSA+fEV+4u69xoKXogDnu9vksnIQw5VtnYAv6Hvm/58fZY6Uey1zoJR5oi
	GWliNkwL83f4wCLaG21Q1TeanF+ntIROp0zyq5t3cMf8yMZgOw0Iz44sfWIyQQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "moderated list:ARM/Marvell Kirkwood and Armada
 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] ARM: dts: marvell: armada-388: use onnn,pca9655
 compatible
In-Reply-To: <20260908060438.43338-1-rosenp@gmail.com>
References: <20260908060438.43338-1-rosenp@gmail.com>
Date: Wed, 30 Sep 2026 08:49:10 +0200
Message-ID: <87a4oz8c9l.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_234917_721870_B2561026 
X-CRM114-Status: GOOD (  18.33  )
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

Rosen Penev <rosenp@gmail.com> writes:

> The PCA9655s on the ClearFog and Helios4 boards are
> register-compatible with the pca9555, and the gpio-pca953x driver has
> matched "onnn,pca9655" in its OF match table since
> commit 6d49b3a0f351 ("gpio: pca953x: Add support for the On Semi
> pca9655").  OF matching is tried before the legacy I2C ID-table
> matching that the old comment alluded to, so the restriction no longer
> applies.  List the real part and drop the stale comment.
>
> The I2C client is now named "pca9655" instead of "pca9555", but the
> expander is otherwise identical.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  v2: rebase.
>  arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi | 7 +------
>  arch/arm/boot/dts/marvell/armada-388-helios4.dts   | 9 +--------
>  2 files changed, 2 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi b/arch/ar=
m/boot/dts/marvell/armada-388-clearfog.dtsi
> index f8a06ae4a3c9..4a61e9d1a2c0 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
> @@ -131,12 +131,7 @@ &i2c0 {
>  	 * 15-SFP_MOD_DEF0
>  	 */
>  	expander0: gpio-expander@20 {
> -		/*
> -		 * This is how it should be:
> -		 * compatible =3D "onnn,pca9655", "nxp,pca9555";
> -		 * but you can't do this because of the way I2C works.
> -		 */
> -		compatible =3D "nxp,pca9555";
> +		compatible =3D "onnn,pca9655";
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
>  		reg =3D <0x20>;
> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index 39b2d4fa742c..bf6d70e2078b 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -160,14 +160,7 @@ i2c@11000 {
>  				 *  6-USB3 power
>  				 */
>  				expander0: gpio-expander@20 {
> -					/*
> -					 * This is how it should be:
> -					 * compatible =3D "onnn,pca9655",
> -					 *	 "nxp,pca9555";
> -					 * but you can't do this because of
> -					 * the way I2C works.
> -					 */
> -					compatible =3D "nxp,pca9555";
> +					compatible =3D "onnn,pca9655";
>  					gpio-controller;
>  					#gpio-cells =3D <2>;
>  					reg =3D <0x20>;
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

