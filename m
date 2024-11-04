Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F398D1BDE0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 18:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fme8EW8jc3y6JPC84QYCMcymRzk/dQDTf6uRMZGj7mo=; b=qQrzEuvfldc58DjU+DQfAGny1B
	/q9rN7Feudia6XlWp0pib5rP3MxDgv+M25UJ2HS/XqazXVQPe4nxJAA1S4OF9puSBTtax/YaFoh6K
	6nTTI/cmGI7pW3H6Ojsu7yCjDG1afwgfWhkzHTDoyRPSRCV+yHvxb1C5Y2rTMWT5W0Ur0NdZh6Ss4
	b359BBWWMalu9ySUD+zhUfCnunS3iJ82ErTyQhSHZpD5TW2FJZCdvxxsIaLKjI8uSVG9F2ClEvQiC
	j/ounZSySrXtjp7LdHDL4ze+Ve/tjkoTY5RxptTyQ7vwBxcuT0eH6KT8uCyj75EAUtHjSJG0jMCNy
	LL3cd3CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t829P-0000000Ep0F-1y8c;
	Mon, 04 Nov 2024 18:50:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t826g-0000000EoZm-3SfS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 18:47:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DF3F7A4327B;
	Mon,  4 Nov 2024 18:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029BAC4CECE;
	Mon,  4 Nov 2024 18:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730746037;
	bh=rWhTWVbW4mGA5mw9ohHUzN2aUaoDA1BFpsVVEDEm4CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NBdhTekTdA/WpeLSglViKAU25A+dbJ2m5atIn1kG9m3IG/PkMCnp9SsoMI7qveMN7
	 1RKFj2d5s3eR6cB8h1UtUItSmUErSlYA3V9P9rcVBvRGl1le/8fxHaYaQ42QqyaKU/
	 SwPoyHFMk1f0c3zu3JwsrfqJa+DZVaxwZQHx2jiIwH2Tpfo8+52y768Q76Ee52TT7P
	 wDQZdp298qgm6ALheVskJoyu52aQlLiM9M8SpPV8/WfaVcn1SEOMHQdK09dRdCM9K3
	 55Lbeh33zG+h3rxNQ+V8Xk4Zg0KfzOULGiuI0wNT6n73kV6cnlUAT2EQyssffP/5r+
	 +tH8DOCO1nhuQ==
Date: Mon, 4 Nov 2024 18:47:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Hari Nagalla <hnagalla@ti.com>, linux@ew.tq-group.com
Subject: Re: [PATCH 2/5] dt-bindings: arm: ti: Add compatible for AM625-based
 TQMa62xx SOM family and carrier board
Message-ID: <20241104-floral-dexterous-7d3fee2ff616@spud>
References: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
 <4f5ad877f44df35a3b2c7f336647f057c4e6377d.1730299760.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EATJd2ZSzXL2Ixpt"
Content-Disposition: inline
In-Reply-To: <4f5ad877f44df35a3b2c7f336647f057c4e6377d.1730299760.git.matthias.schiffer@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_104719_012802_F62B3FBB 
X-CRM114-Status: GOOD (  16.42  )
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


--EATJd2ZSzXL2Ixpt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2024 at 10:47:25AM +0100, Matthias Schiffer wrote:
> The TQMa62xx is a SoM family with a pluggable connector. The MBa62xx is
> the matching reference/starterkit carrier board.

Why all the wildcards? Why isn't there a compatible per device in the
family?

>=20
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documenta=
tion/devicetree/bindings/arm/ti/k3.yaml
> index b0be02f9d1253..d8b52b95fba7b 100644
> --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> @@ -73,6 +73,13 @@ properties:
>            - const: toradex,verdin-am62          # Verdin AM62 Module
>            - const: ti,am625
> =20
> +      - description: K3 AM625 SoC on TQ-Systems TQMa62xx SoM
> +        items:
> +          - enum:
> +              - tq,am625-tqma6254-mba62xx # MBa62xx base board
> +          - const: tq,am625-tqma6254
> +          - const: ti,am625
> +
>        - description: K3 AM642 SoC
>          items:
>            - enum:
> --=20
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> https://www.tq-group.com/
>=20

--EATJd2ZSzXL2Ixpt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZykWrwAKCRB4tDGHoIJi
0jo3AQC+LelXQR2pEsAaZyVgw5FfWNOZ0ohjhWoy+Oi8MG8yzgEAtUuldRsTZUU+
yG2hlyDNYR07kMS1/Md+DDOKJb2DJQ4=
=lA4g
-----END PGP SIGNATURE-----

--EATJd2ZSzXL2Ixpt--

