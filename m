Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30EAC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 06:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xC/PhptF14VeztLYAsEO8pCcnPUWsP9GLAXS3cNIZA=; b=OObYU+3NbAkdwRriSK3lBzW3wE
	go3DgMw7gqBzp4+fcanPODd5+JNO3Pitfy2CCAa8IPuwqQkH6gecH4Qz5qCEzQpAZkaQwr1iKieN4
	CmWw1wRW5w0SIfLvkSQzOGe1IVXXXcOOkUPm78Ns8rdjAitZHMhRbXTZl3fAhXXx/eLBnNvA5NCaY
	52RSWQyH1jkqfJZxBWef6aBXIgl5oOpa3m6rlz9Si2tXKdIqA4wOX2T54B97fSfjtxCtI8S+vnR7/
	IcdKHTfswt0dci3lTPWnU6Zf4cugr0WMQwDCopI/AX2QFmmIFZKE8UjpWHzzyR8g8tC9jmmWS+rCK
	iys+tsAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5J1Q-0000000Bwo8-1sqk;
	Thu, 17 Apr 2025 06:46:52 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ItQ-0000000Bvch-2bof
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 06:38:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D2F71039EF2D;
	Thu, 17 Apr 2025 08:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744871913; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=4xC/PhptF14VeztLYAsEO8pCcnPUWsP9GLAXS3cNIZA=;
	b=CF/2hWxCbLmyznN+D4w1XLf9hTfNa3IlQGV9P1xLRtiTkTvKB2rsUefG/fnIWMApKDFrVg
	Eo8CffVpxeFD8qYq3PJrrHiZ0M1gurjKANoN7D5hro8xGyYGCvQykMdCCO8sMfW3ilD4sT
	Cmo4SFGJavrJmq60/84/o24mKLIntvXyxzWAiDm75u4pNpLp4Z13Nm9n+ECRri1l4vZ5Jr
	9PLe/U1RWkGlHcaxdhDwM3DfIPzpl169Waw6jqTCPagNVug+Eh6p7JTfdM1Tkypxz1X0VF
	Pe4ukl4Q0Zs7kZGfsjcgcWWV8l/QRarunsHL7SyXZShxBiAlwWxmkuJpt5RN2Q==
Date: Thu, 17 Apr 2025 08:38:30 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Simon Horman
 <horms@kernel.org>
Subject: Re: [net-next v5 1/6] dt-bindings: net: Add MTIP L2 switch
 description
Message-ID: <20250417083830.2517e1d3@wsk>
In-Reply-To: <bc818477-509d-4561-905a-743feeea6a74@gmx.net>
References: <20250414140128.390400-1-lukma@denx.de>
	<20250414140128.390400-2-lukma@denx.de>
	<bc818477-509d-4561-905a-743feeea6a74@gmx.net>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZnpQTjJr3BoJn5+lo3OMTMV";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_233836_952445_29CD3C45 
X-CRM114-Status: GOOD (  27.32  )
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

--Sig_/ZnpQTjJr3BoJn5+lo3OMTMV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

> Hi Lukasz,
>=20
> Am 14.04.25 um 16:01 schrieb Lukasz Majewski:
> > This patch provides description of the MTIP L2 switch available in
> > some NXP's SOCs - e.g. imx287.
> >
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > ---
> > Changes for v2:
> > - Rename the file to match exactly the compatible
> >    (nxp,imx287-mtip-switch)
> >
> > Changes for v3:
> > - Remove '-' from const:'nxp,imx287-mtip-switch'
> > - Use '^port@[12]+$' for port patternProperties
> > - Drop status =3D "okay";
> > - Provide proper indentation for 'example' binding (replace 8
> >    spaces with 4 spaces)
> > - Remove smsc,disable-energy-detect; property
> > - Remove interrupt-parent and interrupts properties as not required
> > - Remove #address-cells and #size-cells from required properties
> > check
> > - remove description from reg:
> > - Add $ref: ethernet-switch.yaml#
> >
> > Changes for v4:
> > - Use $ref: ethernet-switch.yaml#/$defs/ethernet-ports and remove
> > already referenced properties
> > - Rename file to nxp,imx28-mtip-switch.yaml
> >
> > Changes for v5:
> > - Provide proper description for 'ethernet-port' node
> > ---
> >   .../bindings/net/nxp,imx28-mtip-switch.yaml   | 141
> > ++++++++++++++++++ 1 file changed, 141 insertions(+)
> >   create mode 100644
> > Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> > b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> > new file mode 100644 index 000000000000..6f2b5a277ac2 --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> > @@ -0,0 +1,141 @@ +# SPDX-License-Identifier: (GPL-2.0-only OR
> > BSD-2-Clause) +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/nxp,imx28-mtip-switch.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP SoC Ethernet Switch Controller (L2 MoreThanIP switch)
> > +
> > +maintainers:
> > +  - Lukasz Majewski <lukma@denx.de>
> > +
> > +description:
> > +  The 2-port switch ethernet subsystem provides ethernet packet
> > (L2)
> > +  communication and can be configured as an ethernet switch. It
> > provides the
> > +  reduced media independent interface (RMII), the management data
> > input
> > +  output (MDIO) for physical layer device (PHY) management.
> > +
> > +$ref: ethernet-switch.yaml#/$defs/ethernet-ports
> > +
> > +properties:
> > +  compatible:
> > +    const: nxp,imx28-mtip-switch
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  phy-supply:
> > +    description:
> > +      Regulator that powers Ethernet PHYs.
> > +
> > +  clocks:
> > +    items:
> > +      - description: Register accessing clock
> > +      - description: Bus access clock
> > +      - description: Output clock for external device - e.g. PHY
> > source clock
> > +      - description: IEEE1588 timer clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: ipg
> > +      - const: ahb
> > +      - const: enet_out
> > +      - const: ptp
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Switch interrupt
> > +      - description: ENET0 interrupt
> > +      - description: ENET1 interrupt =20
> sorry for the late suggestion, but can we have additional=20
> interrupt-names here, please?

I've extended the proper *.yaml file and modified the driver to use
platform_get_irq_byname().


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/ZnpQTjJr3BoJn5+lo3OMTMV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmgAoeYACgkQAR8vZIA0
zr0R0wf/UwSt8TP7hDCj2Np3vpeG1t+lQve+Zir7IsS5QK++xCMrXzUVm0u1eXoS
qSXBPridMN46qYCVZsLlR5Aa2hH8Kx5eJKKX101zMUswou2/nSKYGO698PbEGy7A
oNkfP5Frd6jlhyCkku0X1wpuTXNO0m7qG0CHxuzVK7LbEnTsiYleOIZXy0MxCs7r
tfGGxhfQXqnHZPGszZJsKgtCAW+F8lq7jLjB/hOuq/84yOItO5a65oEHIWGNGOfw
8b4/vaD0nia9TNdE8sHpnt7fwIJ7OjMQZ4n1Uw9SKr8eWgn9P/8jkmj+mY+qGgGj
KMdkdjax5kKRdc8xFUbsQt80zab+dg==
=CRSJ
-----END PGP SIGNATURE-----

--Sig_/ZnpQTjJr3BoJn5+lo3OMTMV--

