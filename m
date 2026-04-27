Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD68FFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 19:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Jf04DItQUT71No2PBi41LRPib7T5yDet3U3GeZREwo=; b=zq7ps1wOotM9xBLSuzIK0LzoV1
	ty0tfCHqb7O8Ht+n4NL/nD4hKpo8U/Mql/5U4IE2s/gZNgInC2yspdaPE1vzdxnxB+mlKYYAMlvEk
	8ApomI936bO2cOncMT+337N+iG1xDgr6T0mWDU4shOZXVy1lVxEiQoLen1mi/vQ1jCY2knzSJ0TKv
	/0RWK8cousA/ILSJ+qjx471qWjj3+UsNm0Ia5gADTi0+I2205WGsI8ehp4j+shvoZS+bA6MaRSw3s
	mxNlU26qbEYpMAQtd7NRM19JGvRnUDKiv7L+FLqc5q+BUv/DDkynT57RCZP1UehCnFkUcYUnxdHxu
	VnC9KJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRRY-000000003AM-1S6p;
	Mon, 27 Apr 2026 19:16:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRRW-0000000039p-07DM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 19:16:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF57B41B0C;
	Mon, 27 Apr 2026 19:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94AAC19425;
	Mon, 27 Apr 2026 19:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777317389;
	bh=ixckm2P4vuXIw7DV3No6tQyUzz3TqNd6xEhgFTEaVpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nheMo4pnun3AlAxdrXBXdrTdhbFj7DbwfjQ9v17CQFZiUGrfmP/8RVGiSHHzXF5O9
	 xOGMHybsUViXE8W6LuvKguTjlEwy3Ek0m1WbZidjCkivf/V/nKbMufcBlVuKoloWLE
	 31zFEItHru0ZV4XyqwIP71uYEqxzDA5l/KOwpHonsp3F0FKZHmD2ujDP24qEQ5EHpr
	 3JdEJCDezFWzmp1i7K2CosqsvVJ7SAY9CXZQ95xoXfoedgTWtBbIAySaUX4UhvOdme
	 biVvIpA15xp3EF90HoZ7xON2d+EBnRJ6D2CIpYa8jgwLtNT+DcS/4nKXpc515In90P
	 AR8XC//rg0Ylw==
Date: Mon, 27 Apr 2026 20:16:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/4] dt-bindings: timer: allwinner,sun5i-a13-hstimer:
 add H616 and D1
Message-ID: <20260427-glider-cause-f6e015c6595a@spud>
References: <20260426-h616-t113s-hstimer-v2-0-e65e9dc0c9da@mmpsystems.pl>
 <20260426-h616-t113s-hstimer-v2-1-e65e9dc0c9da@mmpsystems.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pNK/41k60Ogg+RgS"
Content-Disposition: inline
In-Reply-To: <20260426-h616-t113s-hstimer-v2-1-e65e9dc0c9da@mmpsystems.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_121630_107485_974BCB44 
X-CRM114-Status: GOOD (  16.50  )
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


--pNK/41k60Ogg+RgS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 12:15:26PM +0200, Michal Piekos wrote:
> D1 is similar to existing sun5i, but with different register offsets.
> H616 uses same offsets as D1.
>=20
> Add allwinner,sun20i-d1-hstimer
> Add allwinner,sun50i-h616-hstimer with fallback to
> allwinner,sun20i-d1-hstimer
> Extend schema condition for interrupts to cover D1 compatible variant.
>=20
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  .../devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml   | 9 +++=
+++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-=
hstimer.yaml b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-=
hstimer.yaml
> index f1853daec2f9..3e2725c56995 100644
> --- a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer=
=2Eyaml
> @@ -15,9 +15,13 @@ properties:
>      oneOf:
>        - const: allwinner,sun5i-a13-hstimer
>        - const: allwinner,sun7i-a20-hstimer
> +      - const: allwinner,sun20i-d1-hstimer
>        - items:
>            - const: allwinner,sun6i-a31-hstimer
>            - const: allwinner,sun7i-a20-hstimer
> +      - items:
> +          - const: allwinner,sun50i-h616-hstimer
> +          - const: allwinner,sun20i-d1-hstimer
> =20
>    reg:
>      maxItems: 1
> @@ -45,7 +49,10 @@ required:
>  if:
>    properties:
>      compatible:
> -      const: allwinner,sun5i-a13-hstimer
> +      anyOf:
> +        - const: allwinner,sun5i-a13-hstimer
> +        - contains:
> +            const: allwinner,sun20i-d1-hstimer
> =20
>  then:
>    properties:
>=20
> --=20
> 2.43.0
>=20

--pNK/41k60Ogg+RgS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCae+2CAAKCRB4tDGHoIJi
0nS7AP4/CDhqa4Ux2Wj5qHy3wSqDPSDnHczo2iuNR62MTBa6EAEAiZz+CQNqwujG
BD7yUhD4X39xYTXU1o1JE7Ek1rLTqws=
=YqUz
-----END PGP SIGNATURE-----

--pNK/41k60Ogg+RgS--

