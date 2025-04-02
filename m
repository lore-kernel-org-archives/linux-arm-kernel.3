Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D76C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 13:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhN0jf54YW44wiYTwDQ5S9Mu2XPez7+mG8cEN+yKQ+w=; b=LX2OnPMAdz5P9mDQNad2sx59Ru
	H+mVaNIEp7ISVPV8UiJthsbTEcvnkLLR+oWGN6ZLKLRIjG4dhlH4nGrYsBwInzLdwfiNHwEZijsnH
	f4h16sj8bUCmfP13Zr76qyhgc+J0i6uH2aZq9bjJPWuiIvw2ybYnZSAWJuOZIOu2y49WmVymnlXKv
	eJLHyVDkxmXKJsAI53ghu3kn5CsfVz2NJFxtiKM9LDVbUJ1Fqia/PAuGbf1VWdzyAEKTv3A3sREz8
	PN8b1iIFrkhnbfRsUcwBo53jHjqq9/vyp+Xjy8mjmzzFOyC0ShMBxl6O+i7/DYpYRhup8ls5aF4cW
	cqC5IoNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyHu-00000006Gim-21QR;
	Wed, 02 Apr 2025 13:37:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzy9R-00000006EfN-14Ez
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 13:29:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C808C61163;
	Wed,  2 Apr 2025 13:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D19C4CEDD;
	Wed,  2 Apr 2025 13:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743600544;
	bh=J8Cb8WfrOi04FgY+I+b68wymSxxbztaQD6sKD+oS7zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rHQr1qkE3buusVy8ANjaLnBQ4zFUyD7GilFdYyHgonPwzXV4aOCz4Y9erDD26d/jY
	 f5yO9EoQXQjoJFF0wd2cfxPa3hwTQYqJxD/GgOAPbx3ewUN5oS/8qQXZrlwHSaGtc7
	 6eXf+l8fvvg/MLbu09N9vycPmtgAx6SrALgiZdi4rMfD7VOQ2lsYEqD27M+jbaNIPa
	 eVfcbagk0M6Cpz/2z4yxYDgS68pqrtgz3dOSmCgNshDmhnZfRuWTQ+2//mQVJnQOQT
	 0mS0vVIHFqktcXzu5bnWyX9oJ4TjbU+nGSbYxKemOtgrSJzial7Jyv4SeFbg/yPuKt
	 HQqyqoA510bGw==
Date: Wed, 2 Apr 2025 14:28:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan.Wanner@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/6] dt-bindings: net: cdns,macb: add sama7d65 ethernet
 interface
Message-ID: <20250402-scribing-doorknob-53a67e9e27cd@spud>
References: <cover.1743523114.git.Ryan.Wanner@microchip.com>
 <392b078b38d15f6adf88771113043044f31e8cd6.1743523114.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZH+IhbSqEBnXm3HD"
Content-Disposition: inline
In-Reply-To: <392b078b38d15f6adf88771113043044f31e8cd6.1743523114.git.Ryan.Wanner@microchip.com>
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


--ZH+IhbSqEBnXm3HD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 01, 2025 at 09:13:17AM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>=20
> Add documentation for sama7d65 ethernet interface.
>=20
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/net/cdns,macb.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Docum=
entation/devicetree/bindings/net/cdns,macb.yaml
> index 3c30dd23cd4e..eeb9b6592720 100644
> --- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
> +++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> @@ -62,6 +62,7 @@ properties:
>        - items:
>            - enum:
>                - microchip,sam9x7-gem     # Microchip SAM9X7 gigabit ethe=
rnet interface
> +              - microchip,sama7d65-gem   # Microchip SAMA7D65 gigabit et=
hernet interface
>            - const: microchip,sama7g5-gem # Microchip SAMA7G5 gigabit eth=
ernet interface
> =20
>    reg:
> --=20
> 2.43.0
>=20
>=20

--ZH+IhbSqEBnXm3HD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+07mwAKCRB4tDGHoIJi
0oaaAQDZCHsKizxzSW01d9pShvwWkQbjhsKYMyc+Dx+WthYU/AD/QMHJfPRMRa92
2cV+g+ELOsKdCKbzefq6+0KCssfZrAg=
=l9g7
-----END PGP SIGNATURE-----

--ZH+IhbSqEBnXm3HD--

