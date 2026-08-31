Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DF2C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 10:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ow2ViMeEMGTyK3UySqQVG82oOIdDJas1XKKjGfqN5Q=; b=cdr6rCsJo5FGM6tSvTqLnkCfpK
	q4fXxI3B1YDAVSz64mD3JAyKwCHwUWa75ui39eSqsIy5wdOblX0k2pRoQN4MRwlg+kLtVrwmc8tX5
	WC9xJYlt4rDUaY2IEDnOZVtic8WuZICxEwfcRJsdC4SSeQrnJ5p0T2ED3VelelDV73warATtIb9nA
	wjj6+msi18Sc2TeRGSBbHdofcrHLvm3IT0L5xHYMe6pTK3RPQeb5hQu7qtZ0dnGe/DYuEbRb3X+Qg
	uv2GN7B9GdGo8lad6ZnEVpcP71LiX0Qrh1EIyspvCR91G3aKq+venfnrQaRfdnGoIR5rQ4JR52Oz6
	cgEWGcjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0yoC-000000094jL-2KU4;
	Mon, 31 Aug 2026 10:00:08 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0yo6-000000094g3-2ByP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 10:00:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F037E1A18EF;
	Mon, 31 Aug 2026 10:00:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0ABB60231;
	Mon, 31 Aug 2026 10:00:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A36F11C78ACF;
	Mon, 31 Aug 2026 11:59:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788170395; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9ow2ViMeEMGTyK3UySqQVG82oOIdDJas1XKKjGfqN5Q=;
	b=jGQPAldeFoEaMiTrr6qe/vl94pp7XVReJhbW0eSfVXlZb0ztjBLdtYzJobMxKETVidDkJT
	fNjlkriHOTCGwtmZu1CTS0/xaJKlU8v9k2+pmGnPpI3kbbbt8c+ZFva7VKd4RcwG2YXTRs
	U1B3XRuHu9s6KqW8KViqQ1BnD1a8k7VhNhRch9rd5ODKt1tKwEhGy3olfR8NNk53CFkwIW
	kxaOqa9LoUUcPjGx793DjaWw2mzHrXa6fgjA91sG9wA965N7RoRVFU0MAjUltL1zujbEVq
	wJL7yjlzX8UHYivLuU3KYakf8bjmnl/pC4UH00uO+ggA9fb3YDo1ghrKkwbRmA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dennis Gilmore <dennis@ausil.us>, "moderated
 list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: helios4: fix spi1 location
In-Reply-To: <20260829203720.44633-1-rosenp@gmail.com>
References: <20260829203720.44633-1-rosenp@gmail.com>
Date: Mon, 31 Aug 2026 11:59:53 +0200
Message-ID: <878q5mpq3q.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_030002_711013_FF9543BD 
X-CRM114-Status: GOOD (  16.32  )
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

> This spi node is specified in armada-38x.dtsi with proper compatible
> strings whereas they are not present here. Instead of copy and pasting
> various lines, just reference the node in the dtsi.
>
> This dts seems to predate the move of spi from internal-regs to the soc
> node so this moves it in line there.
>
> Allows proper probing of SPI at runtime.
>
> Remove the microsom_spi1_cs_pins pinctrl group and its reference in
> &spi1. The group only muxed mpp59 to the "spi1" function, but that
> pin (SPI1 cs0) is already covered by spi1_pins, which selects the
> same function for mpp56-59 in armada-38x.dtsi.
>
> Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  .../arm/boot/dts/marvell/armada-388-helios4.dts | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index 9de9a8a4267c..ae03d42f92a0 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -254,13 +254,6 @@ sata3: sata-port@1 {
>  				};
>  			};
>=20=20
> -			spi@10680 {
> -				pinctrl-0 =3D <&spi1_pins
> -					     &microsom_spi1_cs_pins>;
> -				pinctrl-names =3D "default";
> -				status =3D "okay";
> -			};
> -
>  			sdhci@d8000 {
>  				bus-width =3D <4>;
>  				cd-gpios =3D <&gpio0 20 GPIO_ACTIVE_LOW>;
> @@ -327,11 +320,13 @@ helios_fan2_pins: helios_fan2_pins {
>  					marvell,pins =3D "mpp48", "mpp55";
>  					marvell,function =3D "gpio";
>  				};
> -				microsom_spi1_cs_pins: spi1-cs-pins {
> -					marvell,pins =3D "mpp59";
> -					marvell,function =3D "spi1";
> -				};
>  			};
>  		};
>  	};
>  };
> +
> +&spi1 {
> +	pinctrl-0 =3D <&spi1_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

