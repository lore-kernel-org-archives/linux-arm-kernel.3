Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD45CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 03:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/MA4CH24q3vH1Fg6NkJo5567qQeBbiW70Nn6q7iLP0=; b=JTREN9ensOvYADK2w7vB95ekBt
	ZDPTD9OJcHv4PU3TrlB97/8QK1M4Sm3BuF3i68y4eAbOjWj31BhA1mAkXs3T8DJ1vdhQl8n4mx9nI
	j54k0TjTXJ1jopmienvddj+nrqR2DFtGyCXa4+JUpXvoYinM7kY6zTPcsesR96+88FZ560nKTHf5S
	PuQOc/Cog6zLUcrypO9EpgQVa8jFkoGTjIFuzsTxgh/ycTE8zBJqwh14SrPDLo9w1Je0g9GDqGZ41
	DBKlzvLXadKsgsq8rbvIIWDl9skTRwzR5QgI0Y6xfaSO1N0JR8kAGYn3chr2+dyW3T3z5U+fnKDhY
	aSpASVuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XLf-00000008hgF-185f;
	Mon, 22 Sep 2025 03:36:19 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XLc-00000008hfp-1d6W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 03:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1758512174;
	bh=C/MA4CH24q3vH1Fg6NkJo5567qQeBbiW70Nn6q7iLP0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PhyVxSFcTfc9Oo8dueczD60UiCANixn9E8qDfta9Ku/liDAwjXHVuX3vQnnsTrXJW
	 5ERAGjnfO5QiF0Jp+/d+0eK7IkwlFFCLbVlmAH4ahig3H73iQNgxAh67w+RG7UXo5M
	 3/9PtKiRLZiMgLKMCL9hnaEpr24Lf0eAZ41/oNFvHbezOxv9CFcTXWa5sU0jFQZqJc
	 L7XeCPEYyCbS6BDYCU63Sz662dbCACkN/l2TF0WT7KCCbVN8o8OsJCpTlyvdHG3zCU
	 us2wfYniNkbasR1sd6zDXKfcGK5+X/Od9nSaaB/AFZukn6uuE4jLfAtm0OoccZYxkS
	 89Hsty8AkIDBQ==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B4D2364755;
	Mon, 22 Sep 2025 11:36:13 +0800 (AWST)
Message-ID: <f76e867ca4dff82744958a8b555cf226139bcd78.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 3/4] ARM: dts: aspeed: harma: add sq52206 power
 monitor device
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org
Date: Mon, 22 Sep 2025 13:06:12 +0930
In-Reply-To: <20250917101828.2589069-4-peteryin.openbmc@gmail.com>
References: <20250917101828.2589069-1-peteryin.openbmc@gmail.com>
	 <20250917101828.2589069-4-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_203616_635595_5CAF1F29 
X-CRM114-Status: GOOD (  14.74  )
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

On Wed, 2025-09-17 at 18:18 +0800, Peter Yin wrote:
> Add the SQ52206 power monitor device and reorder the sequence.
>=20
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-harma.dts=C2=A0 | 28 +++++++++++=
------
> --
> =C2=A01 file changed, 17 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> index bcef91e6eb54..fe72d47a7632 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> @@ -353,14 +353,15 @@ eeprom@52 {
> =C2=A0		reg =3D <0x52>;
> =C2=A0	};
> =C2=A0
> -	power-monitor@69 {
> -		compatible =3D "pmbus";
> -		reg =3D <0x69>;
> +	power-monitor@40 {
> +		compatible =3D "infineon,xdp710";
> +		reg =3D <0x40>;
> =C2=A0	};
> =C2=A0
> -	temperature-sensor@49 {
> -		compatible =3D "ti,tmp75";
> -		reg =3D <0x49>;
> +	power-monitor@41 {
> +		compatible =3D "silergy,sq52206";
> +		reg =3D <0x41>;
> +		shunt-resistor =3D <500>;
> =C2=A0	};
> =C2=A0
> =C2=A0	power-monitor@44 {
> @@ -369,16 +370,21 @@ power-monitor@44 {
> =C2=A0		shunt-resistor-micro-ohms =3D <250>;
> =C2=A0	};
> =C2=A0
> -	power-monitor@40 {
> -		compatible =3D "infineon,xdp710";
> -		reg =3D <0x40>;
> -	};
> -
> =C2=A0	power-monitor@45 {
> =C2=A0		compatible =3D "ti,ina238";
> =C2=A0		reg =3D <0x45>;
> =C2=A0		shunt-resistor =3D <500>;
> =C2=A0	};
> +
> +	power-monitor@69 {
> +		compatible =3D "pmbus";

I realise you're just moving this node, but I'm surprised it hasn't
caused trouble otherwise. This happens to work due to a quirk of I2C
device IDs in the kernel but it's not a documented compatible.

Compatible strings need to represent the physical device. Can you
please split out a patch either dropping this node, or replacing the
compatible string with something appropriate?

Andrew

