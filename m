Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A8ECD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 16:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5AoF1CgR3SeuoM3U90yaj2swTyLjVplvtydMY+eSdY=; b=smhFGvCQ7TUBpv9KMzf1Ed4jJi
	G4t9LDRBCHy0QYb4B3lCnhA1qU1rLqYDzB21oEsUD6IJU+0q/6l5RCNz1oSKy8wPwcO7LL4nhX2Gx
	rejKrfb+VkkwrMM+5y7f9q6KW1ed0zBzkqi6qAiyMQLPX/AQWUMtJjg5odpSOE3xAKBih4FRVoPtT
	Ejr8mA8R5Zv0GZ0mpLBNsuNtqj/qwwbEa67tNR5JD9+nP/aTSllyLDhVRlJvSJet5XKGZLXkNrZ6U
	Oin3DuVlBEi7f3sdGd37Abuc4N/kVExVdrtxaE2DkVotYS4o8+YDbIumJjXJbuDiw3wNPKZ04TQXx
	BsW6HsKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZssG-000000001gs-2nMg;
	Wed, 17 Jun 2026 16:12:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZssG-000000001gl-0Q4R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 16:12:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C650240335;
	Wed, 17 Jun 2026 16:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A831F000E9;
	Wed, 17 Jun 2026 16:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781712739;
	bh=p5AoF1CgR3SeuoM3U90yaj2swTyLjVplvtydMY+eSdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UVix7PrUEjcraezCIb8Lz7H52BKxB2lLcmg1z0YaJYHO6ZqrXUukbQlZEgTYL8xjD
	 VB0//PlM28SCLv4yn0VECdq9ckTQycDI6Bd+uoQmtggYKrsG4DsIg0/8iMq5hWv84r
	 GHA7FOfGq0dyqkt+ErXeMNCYuTPUBPetxYyiPkfga2+kVWSorjwKyVPnfpdP257vvg
	 DGqbedBk5C8kUxfC9Q6I8j6NgsCX1Dk8PTq/IhJDxVq49Bfec9pmGHvzJH6GU+lfwn
	 CC6YzSk03b+ulYrvyFNid/NDZIKyQh2/qtvPbSdPmFSbTL0BSOuNdgBh0sMVi1j4bX
	 MkkVcoh68bwwA==
Date: Wed, 17 Jun 2026 17:12:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v4 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP
 clock and reset bindings
Message-ID: <20260617-kept-flatfoot-1609674c3378@spud>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <20260616-zx29clk-v4-3-ca994bd22e9d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HopPo0aONrs9kOi9"
Content-Disposition: inline
In-Reply-To: <20260616-zx29clk-v4-3-ca994bd22e9d@gmail.com>
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


--HopPo0aONrs9kOi9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 11:26:23PM +0300, Stefan D=F6singer wrote:
> +
> +    matrixclk: clock-controller@1306000 {
> +        compatible =3D "zte,zx297520v3-matrixclk", "syscon";
> +        reg =3D <0x01306000 0x400>;
> +        clocks =3D <&osc26m>, <&osc32k>,
> +                 <&topclk ZX297520V3_MPLL>, <&topclk ZX297520V3_MPLL_D2>,
> +                 <&topclk ZX297520V3_MPLL_D3>, <&topclk ZX297520V3_MPLL_=
D4>,
> +                 <&topclk ZX297520V3_MPLL_D5>, <&topclk ZX297520V3_MPLL_=
D6>,
> +                 <&topclk ZX297520V3_MPLL_D8>, <&topclk ZX297520V3_MPLL_=
D12>,
> +                 <&topclk ZX297520V3_MPLL_D16>, <&topclk ZX297520V3_MPLL=
_D26>,
> +                 <&topclk ZX297520V3_UPLL>, <&topclk ZX297520V3_UPLL_D2>,
> +                 <&topclk ZX297520V3_UPLL_D3>, <&topclk ZX297520V3_UPLL_=
D4>,
> +                 <&topclk ZX297520V3_UPLL_D5>, <&topclk ZX297520V3_UPLL_=
D6>,
> +                 <&topclk ZX297520V3_UPLL_D8>, <&topclk ZX297520V3_UPLL_=
D12>,
> +                 <&topclk ZX297520V3_UPLL_D16>,
> +                 <&topclk ZX297520V3_DPLL>, <&topclk ZX297520V3_DPLL_D2>,
> +                 <&topclk ZX297520V3_DPLL_D3>, <&topclk ZX297520V3_DPLL_=
D4>,
> +                 <&topclk ZX297520V3_DPLL_D5>, <&topclk ZX297520V3_DPLL_=
D6>,
> +                 <&topclk ZX297520V3_DPLL_D8>, <&topclk ZX297520V3_DPLL_=
D12>,
> +                 <&topclk ZX297520V3_DPLL_D16>,
> +                 <&topclk ZX297520V3_GPLL>, <&topclk ZX297520V3_GPLL_D2>,
> +                 <&topclk ZX297520V3_GPLL_D3>, <&topclk ZX297520V3_GPLL_=
D4>,
> +                 <&topclk ZX297520V3_GPLL_D5>, <&topclk ZX297520V3_GPLL_=
D6>,
> +                 <&topclk ZX297520V3_GPLL_D8>, <&topclk ZX297520V3_GPLL_=
D12>,
> +                 <&topclk ZX297520V3_GPLL_D16>;
> +        clock-names =3D "osc26m", "osc32k", "mpll", "mpll_d2", "mpll_d3",
> +                      "mpll_d4", "mpll_d5", "mpll_d6", "mpll_d8", "mpll_=
d12",
> +                      "mpll_d16", "mpll_d26", "upll", "upll_d2", "upll_d=
3",
> +                      "upll_d4", "upll_d5", "upll_d6", "upll_d8", "upll_=
d12",
> +                      "upll_d16", "dpll", "dpll_d2", "dpll_d3", "dpll_d4=
",
> +                      "dpll_d5", "dpll_d6", "dpll_d8", "dpll_d12", "dpll=
_d16",
> +                      "gpll", "gpll_d2", "gpll_d3", "gpll_d4", "gpll_d5",
> +                      "gpll_d6", "gpll_d8", "gpll_d12", "gpll_d16";
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +    };
> +
> +    clock-controller@1400000 {
> +        compatible =3D "zte,zx297520v3-lspclk";
> +        reg =3D <0x01400000 0x100>;
> +        clocks =3D <&matrixclk ZX297520V3_LSP_MPLL_D5_WCLK>,
> +                 <&matrixclk ZX297520V3_LSP_MPLL_D4_WCLK>,
> +                 <&matrixclk ZX297520V3_LSP_MPLL_D6_WCLK>,
> +                 <&matrixclk ZX297520V3_LSP_MPLL_D8_WCLK>,
> +                 <&matrixclk ZX297520V3_LSP_MPLL_D12_WCLK>,
> +                 <&matrixclk ZX297520V3_LSP_OSC26M_WCLK>,
> +                 <&matrixclk ZX297520V3_LSP_OSC32K_WCLK>,
> +                 <&matrixclk ZX297520V3_LSP_PCLK>,
> +                 <&matrixclk ZX297520V3_LSP_TDM_WCLK>,
> +                 <&matrixclk ZX297520V3_LSP_DPLL_D4_WCLK>;
> +        clock-names =3D "mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8", "mpl=
l_d12",
> +                      "osc26m", "osc32k", "pclk", "tdm_wclk", "dpll_d4";
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +    };

Same comment here on what's in scope.
pw-bot: changes-requested

Otherwise, once again, looks okay.

Cheers,
Conor.

--HopPo0aONrs9kOi9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajLHXwAKCRB4tDGHoIJi
0iJCAPsHXV69tC4JW8UOTRuVfq6jpJM766ZmudkvIXsqlh2uxAD/e393jygcVRZh
B3QiNEueumBDPDsxVuh9hiWPPsnsPQI=
=dbN/
-----END PGP SIGNATURE-----

--HopPo0aONrs9kOi9--

