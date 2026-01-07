Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2A4D0D142
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhPMqt25ZCX2W1/vXPkG3dGGj3DkqSNpqIcLjfvvbPc=; b=Vuu6sl3B6RZNl93dwAimovM+M3
	uIzaqIixji3hhqT8qGyeVRa9CaRxT8e3KJ7+1w7t/6IKlzrcmLiRe/K3TjFXiPtYDKmL4Sr3poxcO
	KnwI8q4PoJu/8X5VvRxPw1ohy8OHWZZWZK8ntU/Fed+cKcohgKMdWaUe7ZFIFOkKP6Gu7M+l4/aTv
	RF+g8wuv97ZNmAQmoEXdtGa8w7FG6f20JCDfo6KeTee7f4f60uzNh68f+Sa8L74CiA8NQFpQ2EdXq
	VEM+sDml1FRkOUshDeZRi1SNDO1BBg3DbUde4FBmhniny9lU7wcGMEjapR3eCgdllwH94ze9CxTP8
	OM6Gi6LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWi2-0000000FKNT-47Gv;
	Wed, 07 Jan 2026 16:48:34 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWhz-0000000FKLy-0hcm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:48:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9A49AC1EC93;
	Wed,  7 Jan 2026 16:48:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A7A86606F8;
	Wed,  7 Jan 2026 16:48:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 154B8103C821A;
	Wed,  7 Jan 2026 17:48:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767804508; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bhPMqt25ZCX2W1/vXPkG3dGGj3DkqSNpqIcLjfvvbPc=;
	b=bpkXCUQADWlTbLZlOs+eWNY3Td76NGf09IxeXsiYtO014EjvhqoSljggwGfYxih+jd3Reu
	3dc8QA0+/W3qxOZkaHKkIUrePDjCfQm1cCrr+Lvuh4/1fnzHy6AWPo+EXeFnD3RQvyGpkQ
	J0Eb8uLuSCGXoYU4CuGh4QFctcnAgcizWxI7/4gqzKVxTlCwcK4ddj/nsKZlv22jEZXVQK
	8UIbQg7aw3JrG0YUwz3DpuJJ6pPrD3532rJ1aX5s/0ItjuX9q7GVHizd7b2Hu4i09+IO31
	m4Ib/sXOp75k1O+ByowKHyca2Ala291gbSpXrwZBa3mFJu7xeHDxHksUEc/JCw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: marvell: Add missing "#phy-cells" to
 "usb-nop-xceiv"
In-Reply-To: <20260105194636.3188884-1-robh@kernel.org>
References: <20260105194636.3188884-1-robh@kernel.org>
Date: Wed, 07 Jan 2026 17:48:25 +0100
Message-ID: <87h5sxqsh2.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_084831_346715_1FD466CE 
X-CRM114-Status: GOOD (  13.14  )
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

> The "usb-nop-xceiv" binding requires "#phy-cells" property with a value
> of 0 though it is not really used. Add it where missing from Marvell
> platforms.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied on mvebu/dt64

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-3720-db.dts                | 1 +
>  arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts | 1 +
>  arch/arm64/boot/dts/marvell/armada-8040-db.dts                | 2 ++
>  arch/arm64/boot/dts/marvell/cn9130-crb.dtsi                   | 2 ++
>  arch/arm64/boot/dts/marvell/cn9130-db.dtsi                    | 2 ++
>  arch/arm64/boot/dts/marvell/cn9131-db.dtsi                    | 1 +
>  arch/arm64/boot/dts/marvell/cn9132-db.dtsi                    | 2 ++
>  7 files changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-db.dts b/arch/arm64/=
boot/dts/marvell/armada-3720-db.dts
> index bd4e61d5448e..06d4a3a93f84 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-db.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-db.dts
> @@ -41,6 +41,7 @@ exp_usb3_vbus: usb3-vbus {
>=20=20
>  	usb3_phy: usb3-phy {
>  		compatible =3D "usb-nop-xceiv";
> +		#phy-cells =3D <0>;
>  		vcc-supply =3D <&exp_usb3_vbus>;
>  	};
>=20=20
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dt=
s b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
> index 97a180c8dcd9..e82284888b9a 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
> @@ -37,6 +37,7 @@ reg_usb3_vbus: usb3-vbus {
>=20=20
>  	usb3_phy: usb3-phy {
>  		compatible =3D "usb-nop-xceiv";
> +		#phy-cells =3D <0>;
>  		vcc-supply =3D <&reg_usb3_vbus>;
>  	};
>=20=20
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/=
boot/dts/marvell/armada-8040-db.dts
> index 21ecb9c12505..c7102f74d4d5 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
> @@ -51,6 +51,7 @@ cp0_reg_usb3_1_vbus: cp0-usb3-1-vbus {
>=20=20
>  	cp0_usb3_0_phy: cp0-usb3-0-phy {
>  		compatible =3D "usb-nop-xceiv";
> +		#phy-cells =3D <0>;
>  		vcc-supply =3D <&cp0_reg_usb3_0_vbus>;
>  	};
>=20=20
> @@ -65,6 +66,7 @@ cp1_reg_usb3_0_vbus: cp1-usb3-0-vbus {
>=20=20
>  	cp1_usb3_0_phy: cp1-usb3-0-phy {
>  		compatible =3D "usb-nop-xceiv";
> +		#phy-cells =3D <0>;
>  		vcc-supply =3D <&cp1_reg_usb3_0_vbus>;
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/marvell/cn9130-crb.dtsi b/arch/arm64/boo=
t/dts/marvell/cn9130-crb.dtsi
> index 5e7d6de3cdde..5689a8bdfd03 100644
> --- a/arch/arm64/boot/dts/marvell/cn9130-crb.dtsi
> +++ b/arch/arm64/boot/dts/marvell/cn9130-crb.dtsi
> @@ -47,10 +47,12 @@ cp0_reg_usb3_vbus1: regulator-2 {
>=20=20
>  	cp0_usb3_0_phy0: usb-phy-1 {
>  		compatible =3D "usb-nop-xceiv";
> +		#phy-cells =3D <0>;
>  	};
>=20=20
>  	cp0_usb3_0_phy1: usb-phy-2 {
>  		compatible =3D "usb-nop-xceiv";
> +		#phy-cells =3D <0>;
>  		vcc-supply =3D <&cp0_reg_usb3_vbus1>;
>  	};
>=20=20
> diff --git a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi b/arch/arm64/boot=
/dts/marvell/cn9130-db.dtsi
> index 3cc320f569ad..7156739aa31a 100644
> --- a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
> +++ b/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
> @@ -50,6 +50,7 @@ cp0_reg_usb3_vbus0: regulator-2 {
>=20=20
>  	cp0_usb3_0_phy0: usb-phy-1 {
>  		compatible =3D "usb-nop-xceiv";
> +		#phy-cells =3D <0>;
>  		vcc-supply =3D <&cp0_reg_usb3_vbus0>;
>  	};
>=20=20
> @@ -64,6 +65,7 @@ cp0_reg_usb3_vbus1: regulator-3 {
>=20=20
>  	cp0_usb3_0_phy1: usb-phy-2 {
>  		compatible =3D "usb-nop-xceiv";
> +		#phy-cells =3D <0>;
>  		vcc-supply =3D <&cp0_reg_usb3_vbus1>;
>  	};
>=20=20
> diff --git a/arch/arm64/boot/dts/marvell/cn9131-db.dtsi b/arch/arm64/boot=
/dts/marvell/cn9131-db.dtsi
> index 626042fce7e2..26dc91c88677 100644
> --- a/arch/arm64/boot/dts/marvell/cn9131-db.dtsi
> +++ b/arch/arm64/boot/dts/marvell/cn9131-db.dtsi
> @@ -31,6 +31,7 @@ cp1_reg_usb3_vbus0: regulator-6 {
>=20=20
>  	cp1_usb3_0_phy0: usb-phy-3 {
>  		compatible =3D "usb-nop-xceiv";
> +		#phy-cells =3D <0>;
>  		vcc-supply =3D <&cp1_reg_usb3_vbus0>;
>  	};
>=20=20
> diff --git a/arch/arm64/boot/dts/marvell/cn9132-db.dtsi b/arch/arm64/boot=
/dts/marvell/cn9132-db.dtsi
> index f91fc69905b8..f82d45e62753 100644
> --- a/arch/arm64/boot/dts/marvell/cn9132-db.dtsi
> +++ b/arch/arm64/boot/dts/marvell/cn9132-db.dtsi
> @@ -28,6 +28,7 @@ cp2_reg_usb3_vbus0: regulator-7 {
>=20=20
>  	cp2_usb3_0_phy0: usb-phy-4 {
>  		compatible =3D "usb-nop-xceiv";
> +		#phy-cells =3D <0>;
>  		vcc-supply =3D <&cp2_reg_usb3_vbus0>;
>  	};
>=20=20
> @@ -42,6 +43,7 @@ cp2_reg_usb3_vbus1: regulator-8 {
>=20=20
>  	cp2_usb3_0_phy1: usb-phy-5 {
>  		compatible =3D "usb-nop-xceiv";
> +		#phy-cells =3D <0>;
>  		vcc-supply =3D <&cp2_reg_usb3_vbus1>;
>  	};
>=20=20
> --=20
> 2.51.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

