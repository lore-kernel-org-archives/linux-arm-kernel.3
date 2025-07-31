Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF9BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 10:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5oKwdxbuYAh1/EPi9eb9uLvwaxelHetpR8ngLYV+0CE=; b=3ZkgFRLE4crLUrzGVneAkxfqng
	7TM48F5K7OFxAPfOt9KgQJdGHoB02zZPH/kJHjKMdEncZ20/mWFKB2SOw5i2xA9yH0pG95gxanFT9
	1he+0j9y12jROasBSBkIXtq6L5wCJxGdBHY+IegSaLgDQYdAlftRmvcDNfK1KA9X7FwxcvEcDuqEB
	dyxClPKsFCR9MBnBObW6wyRbKImLGz203c0uiByA1WCNPyLwTTDfhtJXOoszfeBaCFU46qBsxEYoa
	/pZMkWBWLEJIljFcOv5c8HpPu8LZnQz/XdEqJd4OnKtNJTMnHmXnPFnazJzt2DZoCncenI5zQFsOH
	rQ+0Dt5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQ89-00000003KVw-45RX;
	Thu, 31 Jul 2025 10:03:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQ5V-00000003KJI-23wF;
	Thu, 31 Jul 2025 10:00:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 522ADA5501F;
	Thu, 31 Jul 2025 10:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C17C4CEEF;
	Thu, 31 Jul 2025 10:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753956036;
	bh=nIIy3EtagONm9o7fIocsy3fvnqj5DKyDI9AvQpz+YsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eLC7+6ijyBPGKVEMVLfwY+Uw6w5la+YyHP/0svxYWWgTFagJusQ8YCt5h4K9Qtm0W
	 fbrDqzIHcEFwXtz/8R1k+qnVGmHJN5o8B7/o2YJiD3ybv9+NhnnPJrBUd2iuVkpUa8
	 YYYqqfimZw0V4cfMDJIpaQjmGJiF4wX1cAEABFHg8Z8oTrFq9Q54sseSj4nJXfyJHX
	 EYltQcNTEyRH/UM9T21J0eGc3M9obqQuaUxWHB4BPHCl0GPUHmT76oqYxuQ03M1kEz
	 qe1lxG2BGYaCC71S+ehz0G2qPrCwVtDYWeuiROsBXwFkBUc87nrnR91ESTs81SFsj6
	 858ooeFMMIHTQ==
Date: Thu, 31 Jul 2025 12:00:33 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Aleksandr Shubin <privatesub2@gmail.com>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Cheo Fusi <fusibrandon13@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
Message-ID: <6d2cq657lkwrzntlwwyc5drgkh4vsetkppugrhjedpp7hlvdh5@lqwe34oyuuvb>
References: <20250427142500.151925-1-privatesub2@gmail.com>
 <20250427142500.151925-2-privatesub2@gmail.com>
 <20250512235619.30cff739@minigeek.lan>
 <20250619094407c4c849f3@mail.local>
 <20250619131044.20b45d8d@donnerap.manchester.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xadqunur2iav4gmf"
Content-Disposition: inline
In-Reply-To: <20250619131044.20b45d8d@donnerap.manchester.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_030037_665886_70D63C0E 
X-CRM114-Status: GOOD (  40.04  )
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


--xadqunur2iav4gmf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v12 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
MIME-Version: 1.0

Hello Andre,

On Thu, Jun 19, 2025 at 01:10:44PM +0100, Andre Przywara wrote:
> On Thu, 19 Jun 2025 11:44:07 +0200
> Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
>=20
> Hi Alexandre,
>=20
> > On 12/05/2025 23:56:19+0100, Andre Przywara wrote:
> > > On Sun, 27 Apr 2025 17:24:53 +0300
> > > Aleksandr Shubin <privatesub2@gmail.com> wrote:
> > >=20
> > > Hi,
> > >  =20
> > > > Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
> > > > controller witch is different from the previous pwm-sun4i.
> > > >=20
> > > > The D1 and T113 are identical in terms of peripherals,
> > > > they differ only in the architecture of the CPU core, and
> > > > even share the majority of their DT. Because of that,
> > > > using the same compatible makes sense.
> > > > The R329 is a different SoC though, and should have
> > > > a different compatible string added, especially as there
> > > > is a difference in the number of channels.
> > > >=20
> > > > D1 and T113s SoCs have one PWM controller with 8 channels.
> > > > R329 SoC has two PWM controllers in both power domains, one of
> > > > them has 9 channels (CPUX one) and the other has 6 (CPUS one).
> > > >=20
> > > > Add a device tree binding for them.
> > > >=20
> > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
> > > > ---
> > > >  .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 84 +++++++++++++++=
++++
> > > >  1 file changed, 84 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner=
,sun20i-pwm.yaml
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i=
-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> > > > new file mode 100644
> > > > index 000000000000..4b25e94a8e46
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.ya=
ml
> > > > @@ -0,0 +1,84 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-pwm.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Allwinner D1, T113-S3 and R329 PWM
> > > > +
> > > > +maintainers:
> > > > +  - Aleksandr Shubin <privatesub2@gmail.com>
> > > > +  - Brandon Cheo Fusi <fusibrandon13@gmail.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - const: allwinner,sun20i-d1-pwm
> > > > +      - items:
> > > > +          - const: allwinner,sun50i-r329-pwm
> > > > +          - const: allwinner,sun20i-d1-pwm
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  "#pwm-cells":
> > > > +    const: 3
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description: Bus clock
> > > > +      - description: 24 MHz oscillator
> > > > +      - description: APB clock
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: bus
> > > > +      - const: hosc
> > > > +      - const: apb
> > > > +
> > > > +  resets:
> > > > +    maxItems: 1
> > > > +
> > > > +  allwinner,npwms:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    description: The number of PWM channels configured for this in=
stance
> > > > +    enum: [6, 8, 9] =20
> > >=20
> > > Do we really need to be so restrictive here? The IP has an
> > > "architectural" limit of 16 channels (due to the MMIO register layout
> > > and status/control bits usage in some registers), so can't we just le=
ave
> > > this value to be anything between 1 and 16 here? If people configure
> > > this wrongly, it's their fault, I'd say? Without confining this furth=
er
> > > based on the respective compatible strings this enum is less useful
> > > anyway, I think. The Allwinner A523 uses the same IP, and supports all
> > > 16 channels, the V853 implements 12, that's what I quickly found
> > > already, and there might be more examples in the future, so I'd rather
> > > open this up.
> > >  =20
> >=20
> > Do we really need this property? I feel like the number of PWM channels=
 should be
> > something the driver could infer from the compatible string as we are g=
oing to
> > have one compatible string per SoC anyway.
>=20
> Well yes, this would work, but I feel like it creates unnecessary churn to
> touch the driver every time some new SoC with the same IP pops up, and
> where just the number of channels is different - see above for a list of
> SoCs we already know about, and there are more in the pipe. It also means
> stable kernels would already work.

Having a property that specifies the number of PWM outputs is fine for
me.

There is some prior art for that: mxs-pwm.yaml has fsl,pwm-number;
pwm-st.txt has st,pwm-num-chan with that semantic.

Given that this is a fundamental concept of a pwm chip, I'd say giving
that a generic name without vendor prefix is justified. I suggest to go
for

	npwms =3D <..>;

which matches ngpios that is specified for gpio chips.

Best regards
Uwe

--xadqunur2iav4gmf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmiLPr4ACgkQj4D7WH0S
/k6qWwf/UfJJoL8d1i9SVPk/Syl4ySb6I9d8VOpLaDSJfkSpXLfkxhBEvlXyOXAn
FzlTMz893YPQTTpTeuEmFMebZhM62aQoFwRTw8NecOLepM3Y/3ia5Q+wS/goyNf3
NKMXMcqIeyF2BiQc1PvBTInND72IGsRqzuScnGVZtoAgz8IOEgigclMY5cc4mbGX
CsbLwoTC9F9MXYHQp2j+2VpL3qf89ug6zXdXq+j4YSRYaBj9LuPCFhTN921V6MfP
18OK7KI7rfJpJUuVPcpnmM0nH7Z9hTXM3kQFdiSwGd6QexuESuw3KBCdfDwuRpoI
4nSRBPbwtqh1Eq7AwAuqT07vbY/DRQ==
=JDZ2
-----END PGP SIGNATURE-----

--xadqunur2iav4gmf--

