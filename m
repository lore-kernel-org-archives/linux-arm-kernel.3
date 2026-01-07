Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F516D0D142
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcgCX2fXWS5eVlssZfM9EdZK5PhnReDDhnViyjK0RKE=; b=Ko4T6jaW1RBXY93ljPU6y//4ii
	TVgmuyOXHsBf+79lvzqIreR41GjoI4QlL5h756FbJk6ecCFCN3DQ/0NbLtrKinrwLJEqtPWFOZFjR
	+Yl3Z07+Bid17qGM7jztEuHjVgmFKhgjRS9GN0DWvf/4HrOmcD7GrDJwvxoDY2QgNv8AW2XTuKL90
	gpztM+KDU9lOnYzSlQ6+0WI5SK1rLYBQF4AQhlbm6mDhaARSt6P8yU2voXYFNioBUAmUDq1D7QkNp
	t3XibGnD0RmT1+6YKU5RZ/i5kqmg/DhgrEh6aH/g6ILtBH3YNqBmCWhBRLQnnUj5YEaArmt61vTkf
	nAbeifGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWio-0000000FKZL-1kxR;
	Wed, 07 Jan 2026 16:49:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWil-0000000FKXz-3Kbr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:49:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F41444E41FDE;
	Wed,  7 Jan 2026 16:49:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C86B8606F8;
	Wed,  7 Jan 2026 16:49:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5BB65103C821A;
	Wed,  7 Jan 2026 17:49:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767804557; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rcgCX2fXWS5eVlssZfM9EdZK5PhnReDDhnViyjK0RKE=;
	b=HvIHGLHnT3ueEo1ltCuVNUyLDP1qzs6rcBf/DrbmZM/iepDZncyzfzKFdfykUzpMIwFx8S
	dhewcLQGrlRWTo1Lp51qC/bqtAHNHKYcsjx80JdctqUDFZ3sSF2ALP+gBdIUOmGilgD8rU
	lmfwNucTQKb3Ljw38GVubI9GcNY44GUZPm/IckncCMxLaSMJkLJeJFuLv8gL7SVdq8xo4r
	v5275JXffurOgRIyKNdWEGf8S/xJYM0IErClXSNec6caSeFNn2bqA0tZXS0PqPpAqdmoTz
	I4bPfDFp2DaS2livYxohSf7fJSX0KszCnO7j1qjQE2w7kTtW6BKfhTjWHiboyg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: marvell: Fix stray and typo "pinctrl-names"
 properties
In-Reply-To: <20260105194642.3189113-1-robh@kernel.org>
References: <20260105194642.3189113-1-robh@kernel.org>
Date: Wed, 07 Jan 2026 17:49:16 +0100
Message-ID: <87eco1qsfn.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_084919_966653_569361A1 
X-CRM114-Status: GOOD (  14.64  )
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

"Rob Herring (Arm)" <robh@kernel.org> writes:

> There's several cases of "pinctrl-names" used without any "pinctrl-0"
> properties. Drop them.
>
> Fix the typo "pintrl-names" as well.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied on mvebu/dt64

Thanks,

Gregory
> ---
>  arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts | 1 -
>  arch/arm64/boot/dts/marvell/cn9130-cf-base.dts                | 2 +-
>  arch/arm64/boot/dts/marvell/cn9130-crb.dtsi                   | 1 -
>  arch/arm64/boot/dts/marvell/cn9130-db.dtsi                    | 2 --
>  arch/arm64/boot/dts/marvell/cn9132-db.dtsi                    | 1 -
>  5 files changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dt=
s b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
> index e82284888b9a..0ab33aa928e7 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
> @@ -42,7 +42,6 @@ usb3_phy: usb3-phy {
>  	};
>=20=20
>  	gpio-leds {
> -		pinctrl-names =3D "default";
>  		compatible =3D "gpio-leds";
>  		/* No assigned functions to the LEDs by default */
>  		led1 {
> diff --git a/arch/arm64/boot/dts/marvell/cn9130-cf-base.dts b/arch/arm64/=
boot/dts/marvell/cn9130-cf-base.dts
> index 788a5c302b17..212865f6cf6a 100644
> --- a/arch/arm64/boot/dts/marvell/cn9130-cf-base.dts
> +++ b/arch/arm64/boot/dts/marvell/cn9130-cf-base.dts
> @@ -137,7 +137,7 @@ led@1 {
>=20=20
>  &cp0_pinctrl {
>  	pinctrl-0 =3D <&sim_select_pins>;
> -	pintrl-names =3D "default";
> +	pinctrl-names =3D "default";
>=20=20
>  	rear_button_pins: cp0-rear-button-pins {
>  		marvell,pins =3D "mpp31";
> diff --git a/arch/arm64/boot/dts/marvell/cn9130-crb.dtsi b/arch/arm64/boo=
t/dts/marvell/cn9130-crb.dtsi
> index 5689a8bdfd03..c9050e707a60 100644
> --- a/arch/arm64/boot/dts/marvell/cn9130-crb.dtsi
> +++ b/arch/arm64/boot/dts/marvell/cn9130-crb.dtsi
> @@ -93,7 +93,6 @@ &uart0 {
>=20=20
>  /* on-board eMMC U6 */
>  &ap_sdhci0 {
> -	pinctrl-names =3D "default";
>  	bus-width =3D <8>;
>  	status =3D "okay";
>  	mmc-ddr-1_8v;
> diff --git a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi b/arch/arm64/boot=
/dts/marvell/cn9130-db.dtsi
> index 7156739aa31a..8e413286e019 100644
> --- a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
> +++ b/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
> @@ -111,7 +111,6 @@ &uart0 {
>=20=20
>  /* on-board eMMC - U9 */
>  &ap_sdhci0 {
> -	pinctrl-names =3D "default";
>  	bus-width =3D <8>;
>  	vqmmc-supply =3D <&ap0_reg_sd_vccq>;
>  	status =3D "okay";
> @@ -166,7 +165,6 @@ &cp0_i2c0 {
>  	/* U36 */
>  	expander0: pca953x@21 {
>  		compatible =3D "nxp,pca9555";
> -		pinctrl-names =3D "default";
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
>  		reg =3D <0x21>;
> diff --git a/arch/arm64/boot/dts/marvell/cn9132-db.dtsi b/arch/arm64/boot=
/dts/marvell/cn9132-db.dtsi
> index f82d45e62753..98eee9e4e10b 100644
> --- a/arch/arm64/boot/dts/marvell/cn9132-db.dtsi
> +++ b/arch/arm64/boot/dts/marvell/cn9132-db.dtsi
> @@ -142,7 +142,6 @@ i2c@1 {
>  			/* U12 */
>  			cp2_module_expander1: pca9555@21 {
>  				compatible =3D "nxp,pca9555";
> -				pinctrl-names =3D "default";
>  				gpio-controller;
>  				#gpio-cells =3D <2>;
>  				reg =3D <0x21>;
> --=20
> 2.51.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

