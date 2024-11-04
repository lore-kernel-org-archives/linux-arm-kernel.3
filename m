Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42227D1BDE3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 18:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZMR4Ee7nam7yQpTkUNDBQyuycSaR5uHnu6Aa872VtA=; b=gZ7rQz59G/fisHGZArA33yxGJ7
	PCNNv0kAc7U7frhFbqn3ROHwasSYKjGurgt0N5ECVIS2pusw4oq1PKA5vToDgsZAi/ruMcFj0a71U
	MaaA8jdQuVxv4g3bdnOl8Q5IvmvKC7f8enQvRu9nUHZP3wZShjXJOnuMQBFrUFzTyp4aRqhRPokuR
	4itdgzFc1JIdBZPT+TTDO0S3kwxZpmjDpJjfwASkfYzVnSDL5hFWkxeus4QhLcS+MvDGLH9jg5xag
	uF+OjDKtLju7jKGamVEje/aoXjfIAIxmOQ8jV9m+9p8WVrKYwIKxJK7I3ESL8c/YjJP23PBMs2zTy
	FgARmPNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82Cp-0000000EpMW-0nab;
	Mon, 04 Nov 2024 18:53:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t828y-0000000EowI-0EbA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 18:49:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E976B5C5435;
	Mon,  4 Nov 2024 18:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C24C4CECE;
	Mon,  4 Nov 2024 18:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730746178;
	bh=6xH53IhT0TJpyNorkchqFjFvXwlo4Osd48zybI+w52w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AiHaKP8+Aqe9E4ixvWAlPw8snyH+4TsToC8aOcmTaKI3EdTgvUJ+veldiNqt3FPIs
	 SEo7xwUpNLVFKyoxFa8LIOJ3oS+fURHUwPXId/H+T5YUMDeMzD2pUVKE5g7HjgjS7S
	 25zGYOUcsSYYkOTxgZ3MX4OYaXroGl6nZhHXIHsgxmCxsJ2VOmcZsDYkTZvpKDG8jx
	 BSprX9Bz3p0bHuS4TFuUEG84Z+21wKVZOEejaStaz7OhDM/ljiuveyVqRQhwidhg5h
	 PcFI7MAJvKiX9afUKlU5yb0nQebLUaugv/8QmFUIxhUx+2TlGwj7U0EXpMFv23bg18
	 wkCmrh0LLzLIw==
Date: Mon, 4 Nov 2024 18:49:33 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Naresh Solanki <naresh.solanki@9elements.com>, jdelvare@suse.com,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org, sylv@sylv.io,
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
	linux@roeck-us.net, Joel Stanley <joel@jms.id.au>,
	conor+dt@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
Message-ID: <20241104-saturate-device-d020a0d7321f@spud>
References: <20241104092220.2268805-1-naresh.solanki@9elements.com>
 <173072771091.3690717.11563964377469449295.robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aHEnBD9/syuq+wBO"
Content-Disposition: inline
In-Reply-To: <173072771091.3690717.11563964377469449295.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_104940_205904_CF3470BA 
X-CRM114-Status: GOOD (  19.93  )
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


--aHEnBD9/syuq+wBO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2024 at 08:39:21AM -0600, Rob Herring (Arm) wrote:
>=20
> On Mon, 04 Nov 2024 14:52:14 +0530, Naresh Solanki wrote:
> > Document the new compatibles used on IBM SBP1.
> >=20
> > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > Changes in V4:
> > - Retain Acked-by from v2.
> > - Fix alphabetic order
> > ---
> >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> New warnings running 'make CHECK_DTBS=3Dy aspeed/aspeed-bmc-ibm-sbp1.dtb'=
 for 20241104092220.2268805-1-naresh.solanki@9elements.com:

Really? This many warnings on a v6?

>=20
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: timer: 'clocks' does no=
t match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /sdram@1e6e0000: failed=
 to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon=
']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: bus@1e600000: compatibl=
e: ['aspeed,ast2600-ahbc', 'syscon'] is too long
> 	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.y=
aml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: syscon@1e6e2000: 'smp-m=
emram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-=
f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0=
-9a-f]+$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.ya=
ml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb@1e6e0000/sysco=
n@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['as=
peed,ast2600-smpmem']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb@1e6e0000/sysco=
n@1e6e2000/interrupt-controller@560: failed to match any schema with compat=
ible: ['aspeed,ast2600-scu-ic0']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb@1e6e0000/sysco=
n@1e6e2000/interrupt-controller@570: failed to match any schema with compat=
ible: ['aspeed,ast2600-scu-ic1']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb@1e6e0000/displ=
ay@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-g=
fx', 'syscon']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: adc@1e6e9000: 'interrup=
ts' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-ad=
c.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: adc@1e6e9100: 'interrup=
ts' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-ad=
c.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: crypto@1e6fa000: 'aspee=
d,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acr=
y.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/video@1e700000: fa=
iled to match any schema with compatible: ['aspeed,ast2600-video-engine']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: sdc@1e740000: sdhci@1e7=
40100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
> 	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: sdc@1e740000: sdhci@1e7=
40200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
> 	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/sdc@1e740000/sdhci=
@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdh=
ci', 'sdhci']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/sdc@1e740000/sdhci=
@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdh=
ci', 'sdhci']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb@1e780000/timer=
@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-tim=
er']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: lpc@1e789000: lpc-snoop=
@80: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: lpc@1e789000: reg-io-wi=
dth: 4 is not of type 'object'
> 	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: kcs@24: 'clocks' does n=
ot match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-b=
mc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: kcs@28: 'clocks' does n=
ot match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-b=
mc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: kcs@2c: 'clocks' does n=
ot match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-b=
mc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: kcs@114: 'clocks' does =
not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-b=
mc.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb@1e780000/lpc@1=
e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast260=
0-lhc']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb@1e780000/lpc@1=
e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast26=
00-ibt-bmc']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb@1e780000/bus@1=
e78a000/i2c@280/bmc-slave@10: failed to match any schema with compatible: [=
'ipmb-dev']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: fsi@1e79b000: compatibl=
e: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
> 	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-ma=
ster.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb@1e790000/fsi@1=
e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-m=
aster', 'fsi-master']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: fsi@1e79b100: compatibl=
e: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
> 	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-ma=
ster.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb@1e790000/fsi@1=
e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-m=
aster', 'fsi-master']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb@1e790000/dma-c=
ontroller@1e79e000: failed to match any schema with compatible: ['aspeed,as=
t2600-udma']
>=20
>=20
>=20
>=20
>=20

--aHEnBD9/syuq+wBO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZykXPQAKCRB4tDGHoIJi
0rMWAQDlKZmiJuot7oP6aowJtnVfHH76ohyheufSc66w5m0cpQEAnaA4tO/Xidyx
qN6rj7vtGBTORT4bzSgiKVOGQ9hkqgw=
=xs2s
-----END PGP SIGNATURE-----

--aHEnBD9/syuq+wBO--

