Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06857CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Xt9kUxaqedEzy7mb2YdVsoY32BQaXwaTEeI7OTr1mI=; b=aSn2RhMKCQJbkEQdtiJAvJxWJH
	uRMPI7KATy9K7ApBKLJefIpG6vEwLEgpftmrvES1F/EJPWQ5bEjNmCTWV4dG/jwXZ+SaeEcitd24U
	82eTtK3XbxMX9m0cdQTV7BLeq2C0VhTLqBqkC9EBmvQicOXSwyz6kjmPIj030YY6nW/Zq0z8c3VY/
	v58LQkpx0QdEh+xZVT/xRjrH+2dUtcOhcUFR/45QDLsHllHaIhPCgMv7vOY3C3ZZhpbPpJFaI6Jd2
	T9P3FqEANjqo7QVMALFdB9b2xmDqejSHQcBnkCnSml231pmSptCbjdDvz8gfjLD4PUcI8Ct1VGL6I
	yh4FZfgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkdo-00000004SDc-3Mgi;
	Sat, 23 Aug 2025 09:34:29 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRaD-00000002aiN-2fgP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:13:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 952E3C6B3A2;
	Fri, 22 Aug 2025 13:13:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40A4B604AD;
	Fri, 22 Aug 2025 13:13:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E2881C22D64F;
	Fri, 22 Aug 2025 15:13:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755868405; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/Xt9kUxaqedEzy7mb2YdVsoY32BQaXwaTEeI7OTr1mI=;
	b=U19nGedyT/NWgRKxA+WD/R29xrHhG9nr2wfXWNXFRyfnhV+d4gf5yMaIoz++E9KbH66fbz
	Gq83IrRY5ZpSoJkHctNTLoTUzse7acZVa+0y53sGJxW0ywSMbI+HHL5QC+yFZI5OgRvr19
	oFIz9UTxepVGWNHzGbRYsfmzVKr2vo92txZAkHxiNgc7gcWEVyfTKYUveLhJHEaYO3Z4wI
	YbJn4nTCc7iVAa2odeR6jGBFA270hfJdlfnZzfuVFKRdfectOn9QPH3IXywP7QLgsEXgSb
	7R2KTV5sU04iw5L47uEkjilULQ1nCvCf/nvUVWmldT1tqpDEJgv/Ei5ZMQKgiQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: marvell: Minor whitespace cleanup
In-Reply-To: <20250819131633.86478-2-krzysztof.kozlowski@linaro.org>
References: <20250819131633.86478-2-krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:13:22 +0200
Message-ID: <87plcn5wjx.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_061329_814973_1F2B8763 
X-CRM114-Status: GOOD (  11.24  )
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

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> The DTS code coding style expects exactly one space around '=3D'
> character.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied on mvebu/dt64

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi   | 2 +-
>  arch/arm64/boot/dts/marvell/cn9132-clearfog.dts | 4 ++--
>  arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi b/arch/arm64/b=
oot/dts/marvell/ac5-98dx25xx.dtsi
> index 605f5be1538c..4878773883c9 100644
> --- a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
> @@ -322,7 +322,7 @@ spi1: spi@805a8000 {
>=20=20
>  		nand: nand-controller@805b0000 {
>  			compatible =3D "marvell,ac5-nand-controller";
> -			reg =3D  <0x0 0x805b0000 0x0 0x00000054>;
> +			reg =3D <0x0 0x805b0000 0x0 0x00000054>;
>  			#address-cells =3D <0x1>;
>  			#size-cells =3D <0x0>;
>  			interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts b/arch/arm64=
/boot/dts/marvell/cn9132-clearfog.dts
> index 0f53745a6fa0..c872c8eca518 100644
> --- a/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts
> +++ b/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts
> @@ -559,7 +559,7 @@ led@2 {
>  };
>=20=20
>  &cp2_ethernet {
> -	status =3D  "okay";
> +	status =3D "okay";
>  };
>=20=20
>  /* SRDS #2 - 5GE */
> @@ -572,7 +572,7 @@ &cp2_eth0 {
>  };
>=20=20
>  &cp2_gpio1 {
> -	pinctrl-names=3D "default";
> +	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&cp2_rsvd9_pins>;
>=20=20
>  	/* J21 */
> diff --git a/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi b/arch/arm64=
/boot/dts/marvell/cn9132-sr-cex7.dtsi
> index afc041c1c448..1c9996d8cb24 100644
> --- a/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi
> +++ b/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi
> @@ -442,7 +442,7 @@ tpm@0 {
>  		reg =3D <0>;
>  		compatible =3D "infineon,slb9670", "tcg,tpm_tis-spi";
>  		spi-max-frequency =3D <10000000>;
> -		pinctrl-names  =3D "default";
> +		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&cp1_tpm_irq_pins>;
>  		interrupt-parent =3D <&cp1_gpio1>;
>  		interrupts =3D <17 IRQ_TYPE_LEVEL_LOW>;
> --=20
> 2.48.1
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

