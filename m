Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3D310775FC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YRy0Pd/5uPT795yyzCdE3iqFmEPncL9RAzmF1iiGZg=; b=fSDYDU5lGFzGcXa7KS6WJr2YRy
	BZcREGKHPlioWCW1wf0E/2AanQxwbjCRBmzk5zV7TtpQgnBpRq/8XrcpsHFv5V1pHfiaKO93mxEz5
	yu4bNyaIFWYft0JGJ3q1GnuO9rrmBPvUO3O9pXdQUeVGj0OAYzLOEbYqiJLRoTfdw4ksBaeNVEskk
	06TOSvn1aZI54C36rl7DwvTMKy+UkekVzuxCUuec0HB5Azq5J07mR5XkwFpc2wt8PpTSUw70EslLf
	QWMHyBhGx/WKR3hgnMkraB0/cIHdEjb64pWUCOmV8A3BYveHIPbpuokM3+B+DHX/sR6PWxwg3mFy3
	aZPhBVmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2v4k-000000097ki-2AMI;
	Wed, 18 Mar 2026 17:52:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2v4j-000000097kY-20Um;
	Wed, 18 Mar 2026 17:52:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E165160054;
	Wed, 18 Mar 2026 17:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97A2C19421;
	Wed, 18 Mar 2026 17:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773856376;
	bh=7RhELfoamd+1f1X8vuupz5lvW6wqDowxnnhYEeX4noA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FlkHo54TQPrdvX0KKoD5mQgS7R2ornPusMzZgXsAAjpK1wR14Q25dhL3FoO+NFRne
	 Tge8FZzhYFWJqLKEYm7pBjmeYQpMCnPNJcu702ZsOxL166yonfYSPEBekK5NZ53Zwa
	 KduLdF/9llG0ap1QNfaP//L1vXJ6QSbXyJAoZOW/5rpuqFVT/XB85bAKP202tlYa/H
	 cHsVssPe7EKhKlVl7iJB7wZaGMII93Ft8lagmNbsYIExi7BWTFxsGVQ1YfIohNt9uo
	 3/9pR8anHFvNTSpZupNKdtM4QCh5zOEQa43YtZBe0/vH4JfJQkmhyby5QLIrwyj+Z/
	 DdKRUi27K2cVw==
Date: Wed, 18 Mar 2026 17:52:50 +0000
From: Conor Dooley <conor@kernel.org>
To: michael.riesch@collabora.com
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/9] media: dt-bindings: add rockchip rk3588 vicap
Message-ID: <20260318-mumbo-lumber-b550932a5423@spud>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
 <20250430-rk3588-vicap-v2-2-77de5ee9048e@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jVdB2zejn0FZqmel"
Content-Disposition: inline
In-Reply-To: <20250430-rk3588-vicap-v2-2-77de5ee9048e@collabora.com>
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


--jVdB2zejn0FZqmel
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 10:32:20AM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
>=20
> Add documentation for the Rockchip RK3588 Video Capture (VICAP) unit.
> To that end, make the existing rockchip,rk3568-vicap documentation
> more general and introduce variant specific constraints.
>=20
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 191 +++++++++++++++=
+++---
>  1 file changed, 167 insertions(+), 24 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vica=
p.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> index 18cd0a5a5318..15a889ff8e52 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> @@ -15,9 +15,15 @@ description:
>    the data from camera sensors, video decoders, or other companion ICs a=
nd
>    transfers it into system main memory by AXI bus.
> =20
> +  The Rockchip RK3588 Video Capture (VICAP) is similar to its RK3568
> +  counterpart, but features six MIPI CSI-2 ports and additional connecti=
ons
> +  to the image signal processor (ISP) blocks.
> +
>  properties:
>    compatible:
> -    const: rockchip,rk3568-vicap
> +    enum:
> +      - rockchip,rk3568-vicap
> +      - rockchip,rk3588-vicap
> =20
>    reg:
>      maxItems: 1
> @@ -26,37 +32,23 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    items:
> -      - description: ACLK
> -      - description: HCLK
> -      - description: DCLK
> -      - description: ICLK
> +    minItems: 4
> +    maxItems: 5
> =20
>    clock-names:
> -    items:
> -      - const: aclk
> -      - const: hclk
> -      - const: dclk
> -      - const: iclk
> +    minItems: 4
> +    maxItems: 5
> =20
>    iommus:
>      maxItems: 1
> =20
>    resets:
> -    items:
> -      - description: ARST
> -      - description: HRST
> -      - description: DRST
> -      - description: PRST
> -      - description: IRST
> +    minItems: 5
> +    maxItems: 9
> =20
>    reset-names:
> -    items:
> -      - const: arst
> -      - const: hrst
> -      - const: drst
> -      - const: prst
> -      - const: irst
> +    minItems: 5
> +    maxItems: 9

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3568-vicap
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +          maxItems: 4

Anything here that repeats the outermost constraint should be dropped,
so no minItems here..

> +
> +        clock-names:
> +          items:
> +            - const: aclk
> +            - const: hclk
> +            - const: dclk
> +            - const: iclk
> +
> +        resets:
> +          minItems: 5
> +          maxItems: 5

=2E..or here...

> +
> +        reset-names:
> +          items:
> +            - const: arst
> +            - const: hrst
> +            - const: drst
> +            - const: prst
> +            - const: irst

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-vicap
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5

=2E..or maxItems here...

> +
> +        clock-names:
> +          items:
> +            - const: aclk
> +            - const: hclk
> +            - const: dclk
> +            - const: iclk0

> +            - const: iclk1
> +
> +        resets:
> +          minItems: 9
> +          maxItems: 9

=2E..or here.

> +
> +        reset-names:
> +          items:
> +            - const: arst
> +            - const: hrst
> +            - const: drst
> +            - const: irst0

Were you willing to reuse "irst" for the 0th irst, all the repetition
wouldn't be needed. I assume it represents the reset for the port at
address 0, so it wouldn't even be a different meaning on each device.

> +            - const: irst1
> +            - const: irst2
> +            - const: irst3
> +            - const: irst4
> +            - const: irst5
> +
>  additionalProperties: false
> =20
>  examples:
>=20
> --=20
> 2.39.5
>=20
>=20

--jVdB2zejn0FZqmel
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabrmcgAKCRB4tDGHoIJi
0kE+AQCiO8R6sREJ16rGB4nk0o2txYYzKiWx5flN3eu4tYAL+gD/RBcvFZzkcWgN
cce8jKdYN4Rihg2tKuLCrikL1c2BDAw=
=sCrK
-----END PGP SIGNATURE-----

--jVdB2zejn0FZqmel--

