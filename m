Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CB4CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 14:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0RTs0mLiJP0YQJOpjwgxtc67UqnKyOdkCbLOvFlNsA=; b=uZpofKte1J+rwXq2gwTnr1cPGf
	0pqI28jPDZN2YQ8ZM/sL0OOT1mfFwoup1/2ufQ+8ga+ApCNpdaMd23BSNlZhHTtdvD11d/MdYH8x2
	apBN6ZpowPbpmU9xtWJVee6VilGd6Cg5EMlbWEnr17+SYn+DMFF9znKIF93ia8NVLuOKRNtqZqv8w
	XGtb2zUmt03hmzzO00I1KLw+nd9nm/ynZI+O0I9kpHhRZg0Cec8snGV2hR8Ct+suSaNoyWLRKBaVj
	KP+lX8kf0aHQ36ZY6j8WOUjQGz19WV0lCt3eqsBI+TH5VBb4cVf6dDbDbgFzLUtHUcWv0wyvI6At4
	qCrUXcAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISfr-00000005Ynb-0zX3;
	Mon, 10 Nov 2025 14:15:15 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISfo-00000005Ymr-1dmw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 14:15:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D45A4C108F1;
	Mon, 10 Nov 2025 14:14:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3CF98606F5;
	Mon, 10 Nov 2025 14:15:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AE0C7103718E3;
	Mon, 10 Nov 2025 15:15:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762784106; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r0RTs0mLiJP0YQJOpjwgxtc67UqnKyOdkCbLOvFlNsA=;
	b=12U+tPHJOwgSLsSFcsdUd0sMClp8mXzd6YcFS4JdNX3QesCpTtjGA03ZAvPtDPQOgo3sFK
	3MUKa5P/j8g0WG4cuGamytrO40gDSMlT3at4Hhof7kMgd5LvPTTBh1foHQiTOa0pCh+M7P
	z0qfUHul3B9v/7LoaxFn1p+iSs8tDqPJU5xAY5qa1DApfp82VAPmLSlLRDS6SRkazF53T4
	1zCKsRdr7ttupzVzAPJdSX4qqvHqnvpg3YqSNAqG9O+oAkl3BVWInxJwlwoV0KG8Yf4otZ
	V8Q9LODADlr0VPYpYRkOY18K+zc9KDXUPAKIyoQjgJv15otqp/AS/F9HRLp92A==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/arm: dts: marvell: Rename "nand-rb" pinctrl node
 names
In-Reply-To: <20251029153927.1065446-1-robh@kernel.org>
References: <20251029153927.1065446-1-robh@kernel.org>
Date: Mon, 10 Nov 2025 15:15:04 +0100
Message-ID: <87seemrn2v.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_061512_582570_F6EE1816 
X-CRM114-Status: GOOD (  11.74  )
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

> Update the "nand-rb" pinctrl child node names to use the defined "-pins"
> suffix fixing DT schema warnings.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>


Applied on mvebu/dt64

Thanks,

Gregory


> ---
>  arch/arm/boot/dts/marvell/armada-38x.dtsi         | 2 +-
>  arch/arm/boot/dts/marvell/armada-xp-98dx3236.dtsi | 2 +-
>  arch/arm64/boot/dts/marvell/armada-70x0.dtsi      | 2 +-
>  arch/arm64/boot/dts/marvell/armada-80x0.dtsi      | 2 +-
>  arch/arm64/boot/dts/marvell/cn9130-db.dtsi        | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-38x.dtsi b/arch/arm/boot/dt=
s/marvell/armada-38x.dtsi
> index 1181b13deabc..1d616edda322 100644
> --- a/arch/arm/boot/dts/marvell/armada-38x.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-38x.dtsi
> @@ -247,7 +247,7 @@ nand_pins: nand-pins {
>  					marvell,function =3D "dev";
>  				};
>=20=20
> -				nand_rb: nand-rb {
> +				nand_rb: nand-rb-pins {
>  					marvell,pins =3D "mpp41";
>  					marvell,function =3D "nand";
>  				};
> diff --git a/arch/arm/boot/dts/marvell/armada-xp-98dx3236.dtsi b/arch/arm=
/boot/dts/marvell/armada-xp-98dx3236.dtsi
> index 7a7e2066c498..a9a71326aafc 100644
> --- a/arch/arm/boot/dts/marvell/armada-xp-98dx3236.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-xp-98dx3236.dtsi
> @@ -322,7 +322,7 @@ nand_pins: nand-pins {
>  		marvell,function =3D "dev";
>  	};
>=20=20
> -	nand_rb: nand-rb {
> +	nand_rb: nand-rb-pins {
>  		marvell,pins =3D "mpp19";
>  		marvell,function =3D "nand";
>  	};
> diff --git a/arch/arm64/boot/dts/marvell/armada-70x0.dtsi b/arch/arm64/bo=
ot/dts/marvell/armada-70x0.dtsi
> index 293403a1a333..df939426d258 100644
> --- a/arch/arm64/boot/dts/marvell/armada-70x0.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-70x0.dtsi
> @@ -56,7 +56,7 @@ nand_pins: nand-pins {
>  			marvell,function =3D "dev";
>  		};
>=20=20
> -		nand_rb: nand-rb {
> +		nand_rb: nand-rb-pins {
>  			marvell,pins =3D "mpp13";
>  			marvell,function =3D "nf";
>  		};
> diff --git a/arch/arm64/boot/dts/marvell/armada-80x0.dtsi b/arch/arm64/bo=
ot/dts/marvell/armada-80x0.dtsi
> index ee67c70bf02e..fb361d657a77 100644
> --- a/arch/arm64/boot/dts/marvell/armada-80x0.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-80x0.dtsi
> @@ -89,7 +89,7 @@ nand_pins: nand-pins {
>  			marvell,function =3D "dev";
>  		};
>=20=20
> -		nand_rb: nand-rb {
> +		nand_rb: nand-rb-pins {
>  			marvell,pins =3D "mpp13", "mpp12";
>  			marvell,function =3D "nf";
>  		};
> diff --git a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi b/arch/arm64/boot=
/dts/marvell/cn9130-db.dtsi
> index 50e9e0724828..3cc320f569ad 100644
> --- a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
> +++ b/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
> @@ -379,7 +379,7 @@ nand_pins: nand-pins {
>  				       "mpp27";
>  			marvell,function =3D "dev";
>  		};
> -		nand_rb: nand-rb {
> +		nand_rb: nand-rb-pins {
>  			marvell,pins =3D "mpp13";
>  			marvell,function =3D "nf";
>  		};
> --=20
> 2.51.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

