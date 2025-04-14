Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F40C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 14:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmeS8sIawvFkEyCe9XAgryQ4ImIg70CDZn/i+5o9wo0=; b=WYSK288XBnhXFTCYCawdn7APjE
	UykHL+0h+AQJV+azvWFsxLXYPOCnhFpQHQ/bBhEeyd7qe24JGSSnY1WxF4G/TTPzbkVp0nOm/8Oug
	C/NhetrsHNTjeBCFSjfIcoihREHyeaai/Uy28e3ArkbwSIivkrkfVICXtBEOAjR337NnLlfvAkIJg
	fc4BiTiste29GI5mh9p+pHt5poE7OGIToaLzyxN6ENfcwuoTz5K0K+Rc2sPlEgvYtMxSEYiSJl3In
	WpUaJH81RnnJSuHyWrV3N4lpUyJelPxh0IiMhSp6j64XnL85ltZP1I/S6JE0r65noo08D/hIxvFJ4
	DW1ZDRvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4L2b-00000002RzT-37OQ;
	Mon, 14 Apr 2025 14:44:05 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Krr-00000002Oly-45VD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 14:33:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0C3C42E7E;
	Mon, 14 Apr 2025 14:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744641176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmeS8sIawvFkEyCe9XAgryQ4ImIg70CDZn/i+5o9wo0=;
	b=RIk4W9LxCYBAuZHjyklMCeibQOFt9Qsqy5UtK9fMdXaMA5h5snaQUoDMCfq6OHEDNadfZk
	kBN53B3n1XrDbNZWKbeeeh+l3f32ExahjdaGH+L4wMDn2xcKTagihl+cldN0yJ6WMCEP73
	bFcHtgigg/CvbgTZFen+NtoUK1YugTuKDdXIoPFiTqDNxbyviI1O1CyLgynAWn8KZxB5RF
	AGYNO4r4yJJtg2K89dtdz42oAjaREKB7MzKBitIBWlBvnCuA/CNUmwH6s8gIvfsKcZHCtH
	1xlm032Vj3IkOhkBqM/cHf52iS6fLIBgzaa307AQjUVCeQDFUyzvo/RsN/OczA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: marvell: Drop unused "pinctrl-names"
In-Reply-To: <20250409204936.1521405-1-robh@kernel.org>
References: <20250409204936.1521405-1-robh@kernel.org>
Date: Mon, 14 Apr 2025 16:32:55 +0200
Message-ID: <87jz7mhkyw.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhgedvhefgtdejvdethfdvieekgfetuefhueekteetgfdvueeutedttdekgeevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemiegrlegsmeelhegvtdemheejrgefmeegugehugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemiegrlegsmeelhegvtdemheejrgefmeegugehugdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepshgvsggrshhtihgrnhdrhhgvshhsvghlsggrrhhthhesg
 hhmrghilhdrtghomhdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_073300_303759_79EEC921 
X-CRM114-Status: GOOD (  11.83  )
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

Hello Rob,

> "pinctrl-names" depends on "pinctrl-[0-9]" properties, but none are
> present for the pca9555 nodes.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/marvell/armada-7040-db.dts | 1 -
>  arch/arm64/boot/dts/marvell/armada-8040-db.dts | 2 --
>  arch/arm64/boot/dts/marvell/cn9130-db.dtsi     | 1 -
>  3 files changed, 4 deletions(-)


Applied on mvebu/dt64

Thanks,

Gregory


>
> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/=
boot/dts/marvell/armada-7040-db.dts
> index 2b5e45d2c5a6..3add6506ff20 100644
> --- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> @@ -124,7 +124,6 @@ &cp0_i2c0 {
>=20=20
>  	expander0: pca9555@21 {
>  		compatible =3D "nxp,pca9555";
> -		pinctrl-names =3D "default";
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
>  		reg =3D <0x21>;
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/=
boot/dts/marvell/armada-8040-db.dts
> index 9d45e881a97d..21ecb9c12505 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
> @@ -122,7 +122,6 @@ &cp0_i2c0 {
>  	/* U31 */
>  	expander0: pca9555@21 {
>  		compatible =3D "nxp,pca9555";
> -		pinctrl-names =3D "default";
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
>  		reg =3D <0x21>;
> @@ -131,7 +130,6 @@ expander0: pca9555@21 {
>  	/* U25 */
>  	expander1: pca9555@25 {
>  		compatible =3D "nxp,pca9555";
> -		pinctrl-names =3D "default";
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
>  		reg =3D <0x25>;
> diff --git a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi b/arch/arm64/boot=
/dts/marvell/cn9130-db.dtsi
> index be56a2336265..50e9e0724828 100644
> --- a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
> +++ b/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
> @@ -209,7 +209,6 @@ i2c@1 {
>  			/* U12 */
>  			cp0_module_expander1: pca9555@21 {
>  				compatible =3D "nxp,pca9555";
> -				pinctrl-names =3D "default";
>  				gpio-controller;
>  				#gpio-cells =3D <2>;
>  				reg =3D <0x21>;
> --=20
> 2.47.2
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

