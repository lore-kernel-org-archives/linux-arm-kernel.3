Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC56AC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 09:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGUJHSEu1hIQgWU0nYHBosEKyRVcYuqWM0xfY1Ki/Rw=; b=vdBrNMycW4xJsp1GFH/raHZGqs
	qhYFUd3jIWHqsu00Y2QjM9v8r9X9Wft2h4em1ctlihu9QmfNbiL/EcbqVJYnogLWGk62fRPH4eVsW
	ZZqntf2p1aYSlSWDq2GaaqaszxCpxEjWDaCmdvLTm8tIeAnpud2bhnI055hLBWKgFEUsXjAmp8i0a
	zKxdNORZ6/UXbwtZuFixQPoi6j9ZmMO7V9WiIe5VOE5AJKrpAmwCmL7s0XB4KZt1+Td89DGk5XLFO
	IR0mSqgOwVuNv8gOGT5WN5L80RZGLUWgQCNTaXUz/3upbONBhLR6TWuUoAtEeWuG0bWwPTEvtr6OH
	+BnyjGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBh8-0000000HY6r-1CUa;
	Mon, 31 Mar 2025 09:44:38 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBfP-0000000HXm3-3lP5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 09:42:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D9E74322D;
	Mon, 31 Mar 2025 09:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743414167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JGUJHSEu1hIQgWU0nYHBosEKyRVcYuqWM0xfY1Ki/Rw=;
	b=Zj4lLPhKAt6zS5h9ISrWTFiLmzINzzkKyLaBzjodr6cS3OltZ3ExxB91azsxxAZH6RoPCX
	q5RIDyazeuZMT3xRWu07vJtvEkFyIM6IyLckbpz8ZbpfAo2ZQikqiWBEukjD2E/nzLzwbX
	wcVBhJWibinhK4kxKik8uVuPRZagQtoF4LTNOAuICQRG0voJ2kc0po7fpJ50hnZtK2/BBz
	eitfsUVrNAoHfly4I4REfInyRdMpixfnp06HTb55mYD2POFngYrFrXsM0hYBk56GHbLw/0
	hzY60JDIQkFkJLICg51Xr1JC/pyXZWHMjLtJdOuAVv2SA/QcWvLKycOt9M7jjw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/5] ARM: dts: marvell: use correct ohci/ehci node names
In-Reply-To: <20250330193833.21970-8-wsa+renesas@sang-engineering.com>
References: <20250330193833.21970-7-wsa+renesas@sang-engineering.com>
 <20250330193833.21970-8-wsa+renesas@sang-engineering.com>
Date: Mon, 31 Mar 2025 11:42:45 +0200
Message-ID: <87a591bkoa.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeelheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhgedvhefgtdejvdethfdvieekgfetuefhueekteetgfdvueeutedttdekgeevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjeelgegsmegshegttgemvdekfegvmegutdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjeelgegsmegshegttgemvdekfegvmegutdekledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrr
 gguvggrugdrohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhisehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehsvggsrghsthhirghnrdhhvghsshgvlhgsrghrthhhsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_024252_088616_12EF8AE2 
X-CRM114-Status: GOOD (  11.77  )
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

Hello Wolfram

> They should be named "usb@".
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied on mvebu/dt

Thanks,

Gregory

> ---
>  arch/arm/boot/dts/marvell/kirkwood-db.dtsi             | 2 +-
>  arch/arm/boot/dts/marvell/kirkwood-dir665.dts          | 2 +-
>  arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts | 2 +-
>  arch/arm/boot/dts/marvell/kirkwood.dtsi                | 2 +-
>  arch/arm/boot/dts/marvell/orion5x.dtsi                 | 4 ++--
>  5 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-db.dtsi b/arch/arm/boot/d=
ts/marvell/kirkwood-db.dtsi
> index 6fe2e31534af..8bacaeb4f4bd 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-db.dtsi
> +++ b/arch/arm/boot/dts/marvell/kirkwood-db.dtsi
> @@ -39,7 +39,7 @@ sata@80000 {
>  			status =3D "okay";
>  		};
>=20=20
> -		ehci@50000 {
> +		usb@50000 {
>  			status =3D "okay";
>  		};
>=20=20
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-dir665.dts b/arch/arm/boo=
t/dts/marvell/kirkwood-dir665.dts
> index 2f6793f794cd..36394d1ab3e2 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-dir665.dts
> +++ b/arch/arm/boot/dts/marvell/kirkwood-dir665.dts
> @@ -129,7 +129,7 @@ i2c@11000 {
>  			status =3D "okay";
>  		};
>=20=20
> -		ehci@50000 {
> +		usb@50000 {
>  			status =3D "okay";
>  		};
>  	};
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts b/arc=
h/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts
> index e3b41784c876..051579fc36b8 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts
> +++ b/arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts
> @@ -63,7 +63,7 @@ serial@12000 {
>  			status =3D "okay";
>  		};
>=20=20
> -		ehci@50000 {
> +		usb@50000 {
>  			status =3D "okay";
>  		};
>  	};
> diff --git a/arch/arm/boot/dts/marvell/kirkwood.dtsi b/arch/arm/boot/dts/=
marvell/kirkwood.dtsi
> index 815ef7719d13..8a1338e672b3 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood.dtsi
> +++ b/arch/arm/boot/dts/marvell/kirkwood.dtsi
> @@ -263,7 +263,7 @@ cesa: crypto@30000 {
>  			status =3D "okay";
>  		};
>=20=20
> -		usb0: ehci@50000 {
> +		usb0: usb@50000 {
>  			compatible =3D "marvell,orion-ehci";
>  			reg =3D <0x50000 0x1000>;
>  			interrupts =3D <19>;
> diff --git a/arch/arm/boot/dts/marvell/orion5x.dtsi b/arch/arm/boot/dts/m=
arvell/orion5x.dtsi
> index 2d41f5c166ee..939259c57e05 100644
> --- a/arch/arm/boot/dts/marvell/orion5x.dtsi
> +++ b/arch/arm/boot/dts/marvell/orion5x.dtsi
> @@ -146,7 +146,7 @@ wdt: wdt@20300 {
>  				status =3D "okay";
>  			};
>=20=20
> -			ehci0: ehci@50000 {
> +			ehci0: usb@50000 {
>  				compatible =3D "marvell,orion-ehci";
>  				reg =3D <0x50000 0x1000>;
>  				interrupts =3D <17>;
> @@ -218,7 +218,7 @@ cesa: crypto@90000 {
>  				status =3D "okay";
>  			};
>=20=20
> -			ehci1: ehci@a0000 {
> +			ehci1: usb@a0000 {
>  				compatible =3D "marvell,orion-ehci";
>  				reg =3D <0xa0000 0x1000>;
>  				interrupts =3D <12>;
> --=20
> 2.47.2
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

