Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B63EF06FF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 06:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1YXR4/Tyv9LUkuxa8hny85fia7ireYDpMIuGkyTJqA=; b=NDIsJJzcqGjxISSgnG/AXugjqF
	iGl0VXYVhja5BcXykMI7VcVkSzllcKY9J+G7iun49DgJPyU1WhrKW9mtIXv+KIPyA2KueNNeJfU3Q
	anMAfblWfOv+kk8fpGmWFHHNyf91ny34uVeE4yce88tRvl1/lNmBH7dZkDLbrdYElMzsgfayh2ndj
	u6tWAVe/jCuD32H88AHIegRNOgTIB12Cy8KRED4BhZwPiXPUVEgXivrvXgMa/GND0cqfrqle74pUp
	W8vYI2lCqmEkPZiIGflOodaDzQ4UCTyk0WlILfZCBax5fiLARwDqlOYYFWIHxy1BF70SceFue0/kh
	dASu2U6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpKdw-0000000EtnM-0RJF;
	Mon, 09 Feb 2026 06:21:08 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpKds-0000000Etmy-005X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 06:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770618061;
	bh=y1YXR4/Tyv9LUkuxa8hny85fia7ireYDpMIuGkyTJqA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bMcV/fEZkzK7rGBH/FYv8Y0leVnfLwAoi4PIVFj+oNgOgyq9TVRwGUSwbe1V7Ruwf
	 einFWiOE/WXcWYyuDnJXLbqXH6nMUAq2DNakHJZZIzCtgUn9I7qEDq8YmpIso9VVt6
	 ddWSmTMEKtJ2S6bpOfuGE/ummOa236s06qQrQRUR36GxZmRiNAHzunqx9wzc0onDsq
	 +zxuUjOEUzdz2VGmytqSGeenN6rEPINEmVzDa43X8X3UyGHJrm2bCShaAjPkqWfNtm
	 0n8qZBXTHHWc+CQVu7mnw0wrK2F8ReiMQs/Gnjql4CWjsV5Bzu2srl1a5h4CnmBsgi
	 uWrYSuG/TM1lg==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 109B06024E;
	Mon,  9 Feb 2026 14:21:01 +0800 (AWST)
Message-ID: <73c63bc2f5eaae2c931a4ced1462024bd5a24237.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 5/7] ARM: dts: aspeed: yosemite5: Correct power
 monitor shunt resistor
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Amithash
 Prasasd	 <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, Ken
 Chen	 <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, Jackson
 Liu	 <Jackson.Liu@quantatw.com>
Date: Mon, 09 Feb 2026 16:51:00 +1030
In-Reply-To: <20260130-yv5_revise_dts-v4-5-4d924455f3a7@gmail.com>
References: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
	 <20260130-yv5_revise_dts-v4-5-4d924455f3a7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_222104_247008_62FE79A0 
X-CRM114-Status: GOOD (  17.17  )
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

Hi Kevin,

On Fri, 2026-01-30 at 16:20 +0800, Kevin Tung wrote:
> The shunt resistor value defined in the DTS was incorrect and did not
> reflect the resistor value populated on the board. As a result, power
> and current readings derived from this value were inaccurate.

Okay, but how did it come to be incorrect in the devicetree? Was the
documentation wrong and so someone entered the wrong value? Was the
documentation correct but there was a misunderstanding? Did the
hardware design change and the devicetree is now just inappropriate for
your needs?

Essentially, what's preventing this from happening again?

>=20
> This change=C2=A0
>=20

I'd rather you rephrase this to avoid using "This change ...".
Hopefully the commit message always refers to its change.

Generally, please write in the imperative mood (see [1])

[1]: https://docs.kernel.org/process/submitting-patches.html#describe-your-=
changes

> updates the DTS to use the correct shunt resistor value
> according to the hardware design, restoring accurate power and current
> measurements.
>=20
> Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 14 +++=
++++-------
> =C2=A01 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> index 84d3731b17f7c7c87338672bbcc859de2b89b722..524597a81365ef10cd03b67d3=
5eeb88a965cbe0a 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> @@ -415,7 +415,7 @@ power-sensor@42 {
> =C2=A0	power-monitor@43 {
> =C2=A0		compatible =3D "lltc,ltc4287";
> =C2=A0		reg =3D <0x43>;
> -		shunt-resistor-micro-ohms =3D <250>;
> +		shunt-resistor-micro-ohms =3D <100>;
> =C2=A0	};
> =C2=A0
> =C2=A0	power-sensor@44 {
> @@ -461,25 +461,25 @@ eeprom@57 {
> =C2=A0	power-monitor@58 {
> =C2=A0		compatible =3D "renesas,isl28022";
> =C2=A0		reg =3D <0x58>;
> -		shunt-resistor-micro-ohms =3D <1000>;
> +		shunt-resistor-micro-ohms =3D <10000>;
> =C2=A0	};
> =C2=A0
> =C2=A0	power-monitor@59 {
> =C2=A0		compatible =3D "renesas,isl28022";
> =C2=A0		reg =3D <0x59>;
> -		shunt-resistor-micro-ohms =3D <1000>;
> +		shunt-resistor-micro-ohms =3D <10000>;
> =C2=A0	};
> =C2=A0
> =C2=A0	power-monitor@5a {
> =C2=A0		compatible =3D "renesas,isl28022";
> =C2=A0		reg =3D <0x5a>;
> -		shunt-resistor-micro-ohms =3D <1000>;
> +		shunt-resistor-micro-ohms =3D <10000>;
> =C2=A0	};
> =C2=A0
> =C2=A0	power-monitor@5b {
> =C2=A0		compatible =3D "renesas,isl28022";
> =C2=A0		reg =3D <0x5b>;
> -		shunt-resistor-micro-ohms =3D <1000>;
> +		shunt-resistor-micro-ohms =3D <10000>;
> =C2=A0	};
> =C2=A0
> =C2=A0	psu@5c {
> @@ -723,13 +723,13 @@ gpio-expander@21 {
> =C2=A0	power-sensor@40 {
> =C2=A0		compatible =3D "ti,ina230";
> =C2=A0		reg =3D <0x40>;
> -		shunt-resistor =3D <2000>;
> +		shunt-resistor =3D <1000>;
> =C2=A0	};
> =C2=A0
> =C2=A0	power-sensor@41 {
> =C2=A0		compatible =3D "ti,ina230";
> =C2=A0		reg =3D <0x41>;
> -		shunt-resistor =3D <2000>;
> +		shunt-resistor =3D <1000>;
> =C2=A0	};
> =C2=A0
> =C2=A0	power-sensor@42 {

The way the commit message is written suggests it was just one shunt
resistor, but that's clearly not the case.

Andrew

