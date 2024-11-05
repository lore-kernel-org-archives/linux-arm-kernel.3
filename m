Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B88D31768
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 17:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AN1bWAbi3duehwYx5SBuZr7Xa5uywTWSqhm9jKKAOk=; b=K+RWO2hDe3pXD8ru5HzH+ym1u8
	0z9vsmZkjAryM1Sp1NdjyJa1ZP/m4YpjHeoGyw3xH+L/Pjo92dKgN76MIMz++SWU13CSnSJUPouD2
	kSux5eZFlbW/yTtVfJLWf9Rs2fCz+fVXaykFcbQya3rw/ay8JGzTslo5E0iANS8pegpRoGLN3yzm0
	2sgnjlYbCJsBd8CrHJwvFlqG+H7ossQnitfVHNxT7unb2Sdwd0BO7h6jlrmwTSSXMn90/IWEgVQqP
	sXij1HYF2jiwNFTpnVwtB8Hxe1bMYLYRuhlV4iDvP/MHiyuLEfyGeKNYqZgTNWN81BVhhJVNI0F5k
	eAx1bg1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8N1B-000000009Yj-2VnK;
	Tue, 05 Nov 2024 17:07:01 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MQR-000000002ue-3NiZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 16:29:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E0EC60005;
	Tue,  5 Nov 2024 16:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730824138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4AN1bWAbi3duehwYx5SBuZr7Xa5uywTWSqhm9jKKAOk=;
	b=ARvzQqc5HPpCmHdnTV2rAb6bK/xZRs+BEcyWdS4dC/pjfvIUtH41X3QCUmZcFL2BFUml+3
	hhNxXYZlAJrAN6HCztj7pdW8ApgO+OxeFRkGngR865q/ykH9cCRbMu2lfbDUf6Tr+RQDei
	io4eHHm15qlQooA8v5SBu1AKl71tPBGHSgtcdexhg3OEXq3kn++qEBfSJRCsBP0R2I/zJ6
	x8QpGvYpfvgPFXEYm0EplDvjKky8lc3PoGKpgTJtn/6NdKmVj5GfCgk45Tj3fG4BLeO4cD
	M3SsaLCCrqNSTCyjlKD3BiiwCEloXaqBrdd0rsKR11wWyNORA48NtW6qiB2geQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH] arm64: dts: marvell: Drop undocumented SATA phy names
In-Reply-To: <20241014193528.1896905-2-robh@kernel.org>
References: <20241014193528.1896905-2-robh@kernel.org>
Date: Tue, 05 Nov 2024 17:28:57 +0100
Message-ID: <87r07p8x12.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_082904_132646_E3A8D7DE 
X-CRM114-Status: GOOD (  14.15  )
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

> While "phy-names" is allowed for sata-port nodes, the names used aren't
> documented and are incorrect ("sata-phy" is what's documented). The name
> for a single entry is fairly useless, so just drop the property.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied on mvebu/dt64

Thanks,

Gregory
> ---
> Cc: Frank Wunderlich <linux@fw-web.de>
>
> There's also this 2 year old patch fixing other SATA errors[1] which=20
> was never picked up. :(
>
> [1] https://lore.kernel.org/linux-arm-kernel/20220311210357.222830-3-linu=
x@fw-web.de/
>
>  arch/arm64/boot/dts/marvell/armada-7040-db.dts             | 1 -
>  arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts       | 2 --
>  arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 1 -
>  arch/arm64/boot/dts/marvell/armada-8040-db.dts             | 2 --
>  arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi         | 1 -
>  arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts    | 2 --
>  6 files changed, 9 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/=
boot/dts/marvell/armada-7040-db.dts
> index 5e5baf6beea4..1e0ab35cc686 100644
> --- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> @@ -214,7 +214,6 @@ &cp0_sata0 {
>=20=20
>  	sata-port@1 {
>  		phys =3D <&cp0_comphy3 1>;
> -		phy-names =3D "cp0-sata0-1-phy";
>  	};
>  };
>=20=20
> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts b/arch/=
arm64/boot/dts/marvell/armada-7040-mochabin.dts
> index 40b7ee7ead72..7af949092b91 100644
> --- a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> @@ -433,13 +433,11 @@ &cp0_sata0 {
>  	/* 7 + 12 SATA connector (J24) */
>  	sata-port@0 {
>  		phys =3D <&cp0_comphy2 0>;
> -		phy-names =3D "cp0-sata0-0-phy";
>  	};
>=20=20
>  	/* M.2-2250 B-key (J39) */
>  	sata-port@1 {
>  		phys =3D <&cp0_comphy3 1>;
> -		phy-names =3D "cp0-sata0-1-phy";
>  	};
>  };
>=20=20
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b=
/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
> index 67892f0d2863..7005a32a6e1e 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
> @@ -475,7 +475,6 @@ &cp1_sata0 {
>=20=20
>  	sata-port@1 {
>  		phys =3D <&cp1_comphy0 1>;
> -		phy-names =3D "cp1-sata0-1-phy";
>  	};
>  };
>=20=20
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/=
boot/dts/marvell/armada-8040-db.dts
> index 92897bd7e6cf..2ec19d364e62 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
> @@ -145,11 +145,9 @@ &cp0_sata0 {
>=20=20
>  	sata-port@0 {
>  		phys =3D <&cp0_comphy1 0>;
> -		phy-names =3D "cp0-sata0-0-phy";
>  	};
>  	sata-port@1 {
>  		phys =3D <&cp0_comphy3 1>;
> -		phy-names =3D "cp0-sata0-1-phy";
>  	};
>  };
>=20=20
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/ar=
m64/boot/dts/marvell/armada-8040-mcbin.dtsi
> index c864df9ec84d..e88ff5b179c8 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> @@ -245,7 +245,6 @@ &cp0_sata0 {
>  	/* CPM Lane 5 - U29 */
>  	sata-port@1 {
>  		phys =3D <&cp0_comphy5 1>;
> -		phy-names =3D "cp0-sata0-1-phy";
>  	};
>  };
>=20=20
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts b/ar=
ch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
> index 42a60f3dd5d1..3e5e0651ce68 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
> @@ -408,12 +408,10 @@ &cp0_sata0 {
>=20=20
>  	sata-port@0 {
>  		phys =3D <&cp0_comphy2 0>;
> -		phy-names =3D "cp0-sata0-0-phy";
>  	};
>=20=20
>  	sata-port@1 {
>  		phys =3D <&cp0_comphy5 1>;
> -		phy-names =3D "cp0-sata0-1-phy";
>  	};
>  };
>=20=20
> --=20
> 2.45.2
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

