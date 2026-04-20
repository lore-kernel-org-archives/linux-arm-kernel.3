Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37442F588EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 16:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0j6Y5fo3lPBTeyE1P2x/R8t3RgjCaFMUua6bxb1xDA=; b=LQ6BCgR8nfr8yWY9s/fdLeYI9J
	nqgI8Uy4IaO6oqg+3RXqyiKR52/DNjFjBQwYsybFladYd38VvdHxxLPu0Pl6E8h2LK92SXECUNWyM
	4iG0UhYySiDxNyE3dQpEneZdMtsoJynjefRGdRgJA1nsCzMQJaKI74+eV9jeeYG9Gw1k3adQCNM3R
	5fOLN/BqdU/ggf+2hczgvzJn1HAm/fJD8nb3CsoVlKEgvI+UObmDiLkUtr7ttFy727Dfecg9/0jyC
	R1lVfYgWFPqsIXZqQqANykUqXw6zSP+iA0oRc5MdnI2TdWikPy+aztWUZmBFDerj0wxLnp7VEaulx
	PiWhKjJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErRB-00000007QXQ-0pZq;
	Mon, 20 Apr 2026 16:25:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErR9-00000007QX2-2VjF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 16:25:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2812600CB;
	Mon, 20 Apr 2026 16:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6C4C19425;
	Mon, 20 Apr 2026 16:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776702326;
	bh=vKSaU5HrcwkU18F3cmHI8YeCt5M+OLQJr3KqetRN3Tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7ocB/hfx9vZMQhnW0xfVtNS2JAGKGjcmR9qkjMPN9TLfeQjgmb7m5ml7xHRmjhj6
	 2F3HoRNq1GMTAPV8KdLt/yYi9LyJKVZBo78YexTJ4EvONtM1XOX3JSHFLZrDOyaV0r
	 RUECmfqEY7mDAje6eQz9dokd4OczJtTBr1vh6waRzA0zKn7onIc0yd9ObTNsUv7IaL
	 gFnXx/Uwu0BZDpRrdWVDAKqKA5wZZPCStjamKT6n5ABRGVlCziob9XjjmcJwXCVHhR
	 whFKSFLU4MspnnQSqMcRwe+lCIJIIqZ86T8dFbanbO3m7AZVdZmn4RMHZgNSKRSmzv
	 nEQY+2/sY/BIA==
Date: Mon, 20 Apr 2026 17:25:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v7 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Message-ID: <20260420-footprint-both-967ccd6c120c@spud>
References: <20260416-upstream_pinctrl-v7-0-d72762253163@aspeedtech.com>
 <20260416-upstream_pinctrl-v7-1-d72762253163@aspeedtech.com>
 <20260416-brutishly-saga-ba7168a4cd14@spud>
 <OSQPR06MB7252EB0C2A1A3313DE49406B8B202@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <20260417-anemia-borrower-fb90ac02b417@spud>
 <OSQPR06MB7252BD7967D2567AD6DA7A1D8B2F2@OSQPR06MB7252.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="roj+lL+oXiCy3ZFO"
Content-Disposition: inline
In-Reply-To: <OSQPR06MB7252BD7967D2567AD6DA7A1D8B2F2@OSQPR06MB7252.apcprd06.prod.outlook.com>
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


--roj+lL+oXiCy3ZFO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 07:22:57AM +0000, Billy Tsai wrote:
> > > > > +=A0=A0=A0 properties:
> > > > > +=A0=A0=A0=A0=A0 function:
> > > > > +=A0=A0=A0=A0=A0=A0=A0 enum:
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMC
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGDDR
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGM0
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGPCIEA
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGPCIEB
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGPSP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGSSP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGTSP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGUSB3A
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGUSB3B
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - PCIERC0PERST
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - PCIERC1PERST
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - TSPRSTN
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - UFSCLKI
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AD0
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AD1
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AH
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AHP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AHPD0
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXH
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXH2B
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXHD1
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXHP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXHP2B
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXHPD1
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BD0
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BD1
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BH
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BHP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BHPD0
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXH
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXH2A
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXHD1
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXHP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXHP2A
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXHPD1
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXH
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXH2B
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXHD
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXHP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXHP2B
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXHPD
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXH
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXH2A
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXHD
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXHP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXHP2A
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXHPD
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VB
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VGADDC
> > > > > +
> > > > > +=A0=A0=A0=A0=A0 groups:
> > > > > +=A0=A0=A0=A0=A0=A0=A0 enum:
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCCDN
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCG1
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCG4
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCG8
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCWPN
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAG0
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - PCIERC0PERST
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - PCIERC1PERST
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - TSPRSTN
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - UFSCLKI
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2A
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AAP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2ABP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2ADAP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AH
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AHAP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2B
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BAP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BBP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BDBP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BH
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BHBP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3A
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AAP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3ABP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3B
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BAP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BBP
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VB0
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VB1
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VGADDC
> > > > > +=A0=A0=A0=A0=A0 pins:
> > > > > +=A0=A0=A0=A0=A0=A0=A0 enum:
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AB13
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AB14
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AC13
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AC14
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AD13
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AD14
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AE13
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AE14
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AE15
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AF13
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AF14
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AF15
>=20
> > > > Why do you have groups and pins?
> > > > Is it valid in your device to have groups and pins in the same node?
>=20
> > > The intent is to support both group-based mux selection and
> > > configuration, as well as per-pin configuration.
>=20
> > > In our hardware:
> > > - `function` + `groups` are used for pinmux selection.
> > > - `pins` is used for per-pin configuration (e.g. drive strength,
> > >=A0=A0 bias settings).
> > > - `groups` may also be used for group-level configuration.
>=20
> > > As a result, both `groups` and `pins` may appear in the same node,
> > > but they serve different purposes and do not conflict:
> > > - `groups` selects the mux function and may apply configuration to
> > >=A0=A0 the entire group.
> > > - `pins` allows overriding or specifying configuration for individual
> > >=A0=A0 pins.
>=20
> > > In most cases, only one of them is needed, but both are allowed when
> > > both group-level and per-pin configuration are required.
>=20
> > To be honest, that sounds like your groups are not sufficiently
> > granular and should be reduced such that you can use them for pin
> > settings.
>=20
> The intent was to keep the binding flexible, but in practice the mixed
> use of `groups` and `pins` in the same node is not expected to be used.
>=20
> Given that, I agree this flexibility is unnecessary and makes the
> binding semantics less clear. I'll rework the binding to make the
> expected usage explicit rather than allowing combinations that do not
> correspond to a real use case.
>=20
> In particular, I'll split the constraints as follows:
>=20
> - For pinmux, the presence of `function` will require `groups`, and
>   `pins` will not be allowed. This reflects the hardware design, where
>   the groups are defined by the pins affected by a given mux expression
>=20
> - For pin configuration, exactly one of `groups` or `pins` will be
>   required (using oneOf), so that configuration is applied either at
>   group level or per-pin, but not both.
>=20
>=20
> - if:
>     required:
>       - function
>   then:
>     required:
>       - groups
>     not:
>       required:
>         - pins
>   else:
>     oneOf:
>       - required:
>           - groups
>         not:
>           required:
>             - pins
>       - required:
>           - pins
>         not:
>           required:
>             - groups
> Does this match what you had in mind?

It's an improvement I think, but I am wondering why you cannot do
without pins entirely and apply pinconf stuff at the group level?
Of course that may not be possible with the current groups, but if you
made the groups more granular, would it be possible?

--roj+lL+oXiCy3ZFO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZTcAAKCRB4tDGHoIJi
0jjnAQCJjvUhxSmvm6JbWAIrKcOuvydUZBHto/wUhz9++BkJLwD9Fg/O6O+DtRL6
AYqmQLNXienEf51791AHyKXF5o+pJgs=
=NBXc
-----END PGP SIGNATURE-----

--roj+lL+oXiCy3ZFO--

