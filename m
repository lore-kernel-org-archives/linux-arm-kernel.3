Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A2BCD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bs6a6rB5aI/Hka37QMJwNctCWzcOa52N3mCrHuWGm3U=; b=wt9UdjTwIMj0i8SnaysnfDz3ay
	Ln46lHBMleLBKRGvL/bRdCN3dvrr8EUvh+pOCvvmKoZLXPDYTOc47E2sU7eW6Na04Sx61ts/U+3x9
	bqeG/VyiJsRmlWsvL9t/ZoqYEWJtNJsDXL3+TZPc19EI5ZNPkti/JYrk2YRGo7VQ0zg+zUz3jBAZ9
	U4PEFK3ZPLMmNFKSpcLojuSXwXNYyIaq6Roceu4yp2cE9S6z/FeCBRQypFZcKTBJlDWlLdY8CeooG
	70SUs/O+GP6oShyn7RTpHTjqh2tBawwy6b6s7hn1/axOfp8U3Rg+3+mHev09CPOSfpQGTh2oX3+0k
	z28XRDiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0NY-00000007vda-0EpH;
	Fri, 29 May 2026 16:48:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0NV-00000007vce-04lJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:48:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B8DB5441CA;
	Fri, 29 May 2026 16:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560031F00893;
	Fri, 29 May 2026 16:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780073288;
	bh=bs6a6rB5aI/Hka37QMJwNctCWzcOa52N3mCrHuWGm3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WOeAnlTLPLmawbXgDWlqkTuNi4tHXPBPP079Ithuy/3FhicMNSyMfuEV4+esoa2fn
	 oavNEvUChfbGTHyNm/251QopxKJjRsKleYv2+4D1bsvNBEnCZXUEW0yM5402UWiJ3G
	 bb0oGngwTcapoB0eQIZLRT7SiPNC1Fy//BCnsnSDfOOb5ccEIIbTvQ7lNY7neX2Qkl
	 RhNZV6CtUDYuY32UXetXudyA4nMXj6M09Xh7uOFTxnJVnWa8/4zhFnkAivnLgJ08aW
	 q6Vg0ST7sXxmr90ueD7ipBZrF2vjYX/ZJt+JayCaSQ5bBboYdAnp/BA9irZGnh03jP
	 nCTsJDB7wayOA==
Date: Fri, 29 May 2026 17:48:04 +0100
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
Subject: Re: [PATCH RFC v3 1/5] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset bindings.
Message-ID: <20260529-multiply-engraved-aab583ea4519@spud>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
 <20260529-zx29clk-v3-1-c7fe54ea388f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YBxRIz2Jfcjr4jMm"
Content-Disposition: inline
In-Reply-To: <20260529-zx29clk-v3-1-c7fe54ea388f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_094809_953860_E3EF5C41 
X-CRM114-Status: GOOD (  12.58  )
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


--YBxRIz2Jfcjr4jMm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 12:52:58AM +0300, Stefan D=F6singer wrote:
> +examples:
> +  - |
> +    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
> +
> +    osc26m: osc26m {
> +      compatible =3D "fixed-clock";
> +      clock-frequency =3D <26000000>;
> +      #clock-cells =3D <0>;
> +    };
> +
> +    osc32k: osc32k {
> +      compatible =3D "fixed-clock";
> +      clock-frequency =3D <32768>;
> +      #clock-cells =3D <0>;
> +    };

Drop these two nodes, the tooling will "fake" them when validating the
example.

> +
> +    topclk: clk@13b000 {

And drop the unused "topclk" label here.

> +        compatible =3D "zte,zx297520v3-topclk";
> +        reg =3D <0x0013b000 0x400>,
> +              <0x01306000 0x400>;
> +        reg-names =3D "top", "matrix";
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +        clocks =3D <&osc26m>, <&osc32k>;
> +        clock-names =3D "osc26m", "osc32k";
> +    };

> +#define ZX297520V3_TOPCLK_END			79

> +#define ZX297520V3_TOPRST_END			29

These are not permitted in bindings, please remove them.
Half the time they end up changing because people find other clocks, and
they never actually get used in a dts. If you need the definitions, add
them to the driver.

pw-bot: changes-requested

Cheers,
Conor.

--YBxRIz2Jfcjr4jMm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahnDRAAKCRB4tDGHoIJi
0hbiAPwNGAaPIyaReYqC+GSpDiH3tTgNnUmNDAzwD74p1ZTdLwEA7vQjl++6fHjP
3lt3ClNJwXDOdqTyumqbVJvnZTC8jQY=
=KNnD
-----END PGP SIGNATURE-----

--YBxRIz2Jfcjr4jMm--

