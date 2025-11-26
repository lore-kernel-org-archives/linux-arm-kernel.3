Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA8CD11195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 18:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ib2tplNfyo+QwZAc4rGlXV64eR9y1CRE05Zpi1i8XrY=; b=MUmChTf8TQB4uS7vtRUzeuhtG7
	nQfrQhQHZVq8HAFqPEAUMRPNr/vXBCndyOD2fMj3fHj4HLm4OWMp90nQFSehWOIKum1dKbOmumaqH
	kj4AM+QletJon3lqdioqC2exVuaiqOhrIfmg8r4MmYUly9rhDrjkf/OqTLPM/WkVbUu0yd1TQWCCX
	fW6fNAtOUiKjTeebOHpdwIE3SF1dczuUA/13m1BOxftDSmxtZlBZ/PoSSpFFAN8gx0DDQmJVv2cpe
	Qj/J/H0Mn/1QhxeX7+jLZc4SvBHqn0pumtNWrLw6WDD57aSJxYr/M26nUwC0H/XFhMZraQbZND7ix
	bflvGUvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKi2-0000000FWUQ-2CZ2;
	Wed, 26 Nov 2025 18:57:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKhz-0000000FWU3-46Xs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 18:57:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60E8C40521;
	Wed, 26 Nov 2025 18:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B269C4CEF7;
	Wed, 26 Nov 2025 18:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764183463;
	bh=5WZhiEaQvVblhY9cHM2bDr2i/VGrZtzzWJLLnZPv9/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SFP2/FOM2zXTrZN2QsYPPCPXEpFVOSFXEAZGmBRZ61FBruYQAQezRO2q3/C8mqgEp
	 UsmodebIZPM4M50YGMjgQpYsALxbwTOIDGs7D8Tf631RGMUUE48D9SSlRITcFqm4lx
	 SVNxcMsAhN16tIapEs4jJQsIz587hM82BNqZOdtyQpSv0fxx+4yQe/y5Tz4ChxkhXg
	 70SBH1LyAPX7iD2SDtkc7RoMXmvX6uH2FipmM/JdEDsWrxHZb5Oun1M49hSPZTkbcz
	 z1D5gRCMvzAKFYVTfz4xVp2vy0SMTyNu283EW2Xs84tXTSEu5vQvsGIXZbUS9mYqS6
	 DHWwoc69+l7jA==
Date: Wed, 26 Nov 2025 18:57:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: aspeed,usb-vhub: Add ast2700
 support
Message-ID: <20251126-protegee-ragged-067de2fd6488@spud>
References: <20251126-upstream_vhub-v1-0-910709937ee0@aspeedtech.com>
 <20251126-upstream_vhub-v1-1-910709937ee0@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uyAOyONr3gMni1/q"
Content-Disposition: inline
In-Reply-To: <20251126-upstream_vhub-v1-1-910709937ee0@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_105744_059643_78E95683 
X-CRM114-Status: GOOD (  16.81  )
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


--uyAOyONr3gMni1/q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 04:26:30PM +0800, Ryan Chen wrote:
> Add the "aspeed,ast2700-usb-vhub" compatible. The ast2700 vhub
> controller requires an reset, so make the "resets" property
> mandatory for this compatible to reflect the hardware requirement.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml | 14 ++++++++=
++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b=
/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> index 7f22f9c031b2..c9ebb6e004d1 100644
> --- a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> +++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> @@ -26,6 +26,7 @@ properties:
>        - aspeed,ast2400-usb-vhub
>        - aspeed,ast2500-usb-vhub
>        - aspeed,ast2600-usb-vhub
> +      - aspeed,ast2700-usb-vhub
> =20
>    reg:
>      maxItems: 1
> @@ -33,6 +34,9 @@ properties:
>    clocks:
>      maxItems: 1
> =20
> +  resets:
> +    maxItems: 1
> +
>    interrupts:
>      maxItems: 1
> =20
> @@ -107,6 +111,16 @@ required:
>    - aspeed,vhub-downstream-ports
>    - aspeed,vhub-generic-endpoints
> =20
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: aspeed,ast2700-usb-vhub
> +
> +then:
> +  required:
> +    - resets

Do other aspeed platforms have resets? If not, please add an else here
to block its use on other platforms.

> +
>  additionalProperties: false
> =20
>  examples:
>=20
> --=20
> 2.34.1
>=20

--uyAOyONr3gMni1/q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSdNogAKCRB4tDGHoIJi
0vfcAP4+UCM4+9oWQTzC169bxxTWFttidmoFlgVoPjRLljlb4wEA6tOi+qKVBja+
SvHDIXAz6NXJyWJc8UKtdaXJy+N1sw0=
=wiN/
-----END PGP SIGNATURE-----

--uyAOyONr3gMni1/q--

