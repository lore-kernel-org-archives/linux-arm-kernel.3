Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9977AC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 01:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wem6sNRnY30doJw+U7poipVgShNMLZwf2O/edq87Z4c=; b=3k8xgolMhsSm3wGMEBvCGGhiaW
	NTycoqm9kSuK5ITglV/h5vy79oDJH/KmvcuL9H2s3kXhfXs3oiS5abpE0ivwYpYEK4k3PP4/P9ZdG
	T3JWvO0MXR5PihHzG31Yx8nNM1BKzY6e29gezY6wI51ZXMARgQO3yVCKdKtU3Dm8v3y47lVeF/20u
	a1Bg4snD8ZHfbcKnZHDDzCP6h+cEwKby2CSERLTPKrOEP5b3arvlJyY2ZSKuLSw6TwqN0utHiI06Q
	GYljEkDXehgyiyd1i4WWAfrvh7BF5oh/Y5YyYu6ko9NYvz+eXr8kIDBF9c1ioZXhEpyKZpdifTFnh
	rfgkegSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo9h5-00000001kiP-0LJS;
	Mon, 27 Jul 2026 00:59:47 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo9h1-00000001ki1-3i0R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 00:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785113974;
	bh=Wem6sNRnY30doJw+U7poipVgShNMLZwf2O/edq87Z4c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YAF55WGKe7CUjz1wzdmUr4eKEYEB/bTanhieEjBYhte6/JxqrMNyHj4DHHrQJO6Mb
	 uhRXTx0SRTtXm2QRG7uNzmWwz8rs6J/6icb7XJ13zvNDka+DxeBb6XNAmb5C0pHkkw
	 1OEx9jTmZY+Z2x4pOyEqUDW/v+y7aDH+Lytxj9bVqjyVKhU4aLMVy9vBsgYZYIa+jV
	 lQOTiXwT3JYda5B9Gpflk6ncUO3n3votu1DGyCJeDVPATB31ahaZPNB13BXldO1ZqJ
	 HHgL+A3/f3gZBMebZgTwtIK9Wz74lPrvo13awshfc6LuP1owwpVdqyeO7eNlLO3lTk
	 ldqBNxkAOD+Xw==
Received: from [192.168.68.117] (unknown [180.150.113.112])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2D322608E3;
	Mon, 27 Jul 2026 08:59:32 +0800 (AWST)
Message-ID: <3a997fc11b172a5b93cb04307a6ad2bdfd5845cf.camel@codeconstruct.com.au>
Subject: Re: [PATCH v8 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org
Date: Mon, 27 Jul 2026 10:29:31 +0930
In-Reply-To: <CAF7HswMG1HWxELQxTSaEWVeWi2Mjk8HpuM18AAVLCV5j_r467Q@mail.gmail.com>
References: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
	 <20260615-ventura2_initial_dts-v8-2-c89f92c80447@gmail.com>
	 <de6f82c5601a4481e418270171e803340368bd2a.camel@codeconstruct.com.au>
	 <CAF7HswMG1HWxELQxTSaEWVeWi2Mjk8HpuM18AAVLCV5j_r467Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_175944_166907_22122090 
X-CRM114-Status: GOOD (  24.28  )
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

On Thu, 2026-07-23 at 16:40 +0800, Kyle Hsieh wrote:
> Hi Andrew,
>=20
> Thanks for taking the time to review this.
> On Wed, Jul 22, 2026 at 7:46=E2=80=AFPM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > On Mon, 2026-06-15 at 10:46 +0800, Kyle Hsieh wrote:
> > > Ventura2 is a Rack Management Controller. It is a modular
> > > device designed to manage liquid cooling systems and monitor hardware
> > > states within an IT rack. The system uses an AST2600 BMC for manageme=
nt.
> > >=20
> > > RMCv2 serves several critical roles:
> > > - Detects liquid leakage at both tray and rack levels.
> > > - Communicates with and controls liquid cooling equipment.
> > > - Manages leakage events and executes system recovery protocols.
> > >=20
> > > Key hardware features include:
> > > - An extensive I2C and IO expander topology to support comprehensive
> > > =C2=A0 sensor monitoring and backward compatibility with legacy trays=
.
> > > - MCTP over I2C support for asynchronous device communications.
> > > - A dual-flash design for BMC firmware redundancy.
> > >=20
> > > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> > > ---
> > > =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0=C2=A0 1 +
> > > =C2=A0.../dts/aspeed/aspeed-bmc-facebook-ventura2.dts=C2=A0=C2=A0=C2=
=A0 | 2903 ++++++++++++++++++++
> > > =C2=A02 files changed, 2904 insertions(+)
> >=20
> > We now have scripts/dtc/dt-check-style. Running it over the dts with '-
> > -mode relaxed' yields 49 instances of 'mixed-indent-chars' - these must
> > be fixed. Further, can you please look at the output with '--mode
> > strict', address all the warnings that are reasonable, and then discuss
> > what's left?
> I have fixed all 49 instances of the 'mixed-indent-chars' formatting issu=
es.
> I also ran it with '--mode strict' and addressed the formatting
> warnings accordingly.

Thanks.

> >=20
> > Otherwise, there are still some concerns reported against the bindings:
> >=20
> > =C2=A0=C2=A0 $ make CHECK_DTBS=3Dy aspeed/aspeed-bmc-facebook-ventura2.=
dtb W=3D1
> > =C2=A0=C2=A0 ...
> > =C2=A0=C2=A0=C2=A0=C2=A0 DTC [C] arch/arm/boot/dts/aspeed/aspeed-bmc-fa=
cebook-ventura2.dtb
> > =C2=A0=C2=A0 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb:=
 /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: =
['aspeed,ast2600-lhc']
> > =C2=A0=C2=A0 /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_=
g5/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: fan-controlle=
r@20 (maxim,max31790): 'channel@2', 'channel@5' do not match any of the reg=
exes: '^fan@[0-9]+$', '^pinctrl-[0-9]+$'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from schem=
a $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml
> > =C2=A0=C2=A0 /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_=
g5/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: i2c@400 (aspe=
ed,ast2600-i2c-bus): Unevaluated properties are not allowed ('aspeed,hw-tim=
eout-ms' was unexpected)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from schem=
a $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml
> > =C2=A0=C2=A0 /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_=
g5/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: adc@48 (ti,ad=
s1015): '#address-cells' is a required property
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from schem=
a $id: http://devicetree.org/schemas/iio/adc/ti,ads1015.yaml
> > =C2=A0=C2=A0 /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_=
g5/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: adc@48 (ti,ad=
s1015): '#size-cells' is a required property
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from schem=
a $id: http://devicetree.org/schemas/iio/adc/ti,ads1015.yaml
> > =C2=A0=C2=A0 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb:=
 /ahb/apb/bus@1e78a000/i2c@580/power-monitor@69: failed to match any schema=
 with compatible: ['pmbus']
> > =C2=A0=C2=A0 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb:=
 /ahb/apb/bus@1e7a0000/syscon@0: failed to match any schema with compatible=
: ['aspeed,ast2600-i3c-global', 'syscon']
> >=20
> > Can you please tidy these up?
> The board-specific bindings have been fixed:
> - Removed the invalid `channel@X` subnodes from the `maxim,max31790`
> fan controller.
> - Dropped the deprecated `aspeed,hw-timeout-ms` property from the I2C bus=
.
> - Removed the incomplete `ti,ads1015` ADC and generic `pmbus` power
> monitor nodes to fully comply with upstream schemas.

Thanks.

>=20
> However, the warnings for `aspeed,ast2600-lhc` and
> `aspeed,ast2600-i3c-global` still remain.
> Since these nodes are inherited directly from the SoC level
> (`aspeed-g6.dtsi`), it seems their YAML bindings are not yet merged
> upstream.

Yes, it is fine to disregard these for now.

Andrew

