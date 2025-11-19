Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B8CCF58C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkVTBEWqVaZ94WPO1n0cpMljTE5QytXBtSx70+iCgmI=; b=MW3wFk5H2WPTpyn4+NZ6+FUYQq
	tF3QDMXrTSZHSHB0DpDlVhWgzmIUBfGcEgMqy+TXyP5pp9/HEKVyETStWgNxKm7SgSHTk0XMRn2vJ
	c3JosvF12fjtrkVPaBzBE4QDeDyE/3swvhm/b3z6t5Vf6dChsKxA3zb9eYlXdlZIR1stTv1YcnL+y
	rESTrfmQzscFjaedxy6CjgOjQe7noHBwdO4FZnsy36isFgtUMgTxhKWXhM96AX9QxSeqGNyODXHEu
	DKSrbGAYj9X2qbMntwR+RCAKpVexv8nn5c1NO2FLdaCqSJUTa7ZtW6lfrHEaR0aQRqTO9WzCM7kCD
	28y9P5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLn7B-00000004gcN-1j9b;
	Wed, 19 Nov 2025 18:41:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLn7A-00000004gcG-0Dqv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:41:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 383B160134;
	Wed, 19 Nov 2025 18:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83CDC4CEF5;
	Wed, 19 Nov 2025 18:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763577670;
	bh=jPiEf9D0enUbIPbwxeeiH63YOLo0c0B5JvI5bNTryrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KOgLihFq4e/zbXry3OmMxJlk6/wjfu+Jr63VKL/cUMy8nfY0GxXWpBkKYZ1QGc0pk
	 Um07NKpisn+tyRjh2S/CXmXsUP+rEuir7t5OsaER3oyjiogna/0vI5rFEoiE1KF0yt
	 qdfubygGYscPwGZWQX58N7otP6RQ8wxvOwoHBFY7pE8B7jbUxwJl0WIfleN6HIOruG
	 UrN0npsdRbxaD41STo+S2rD1KA8Pv7d+0JAutXnz/HUO7YYgSoyP84CD07pW8NFWW3
	 FYAR3znkbbNwNFk7Etp1O1A4Ekbi2Uj3RWiWDvGyHx8tfdkad/o2xcSnTRDZ9akjzu
	 pVDIKc8TNSA5g==
Date: Wed, 19 Nov 2025 18:41:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Andrew Jeffery <andrew@aj.id.au>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] dt-bindings: net: aspeed: add AST2700 MDIO
 compatible
Message-ID: <20251119-gooey-wifi-413598a8a1d7@spud>
References: <20251117-aspeed_mdio_ast2700-v1-1-8ecb0032f554@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2bWqpCW/1YghVWvY"
Content-Disposition: inline
In-Reply-To: <20251117-aspeed_mdio_ast2700-v1-1-8ecb0032f554@aspeedtech.com>
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


--2bWqpCW/1YghVWvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 03:30:18PM +0800, Jacky Chou wrote:
> Add "aspeed,ast2700-mdio" compatible to the binding schema with a fallback
> to "aspeed,ast2600-mdio".
>=20
> Although the MDIO controller on AST2700 is functionally the same as the
> one on AST2600, it's good practice to add a SoC-specific compatible for
> new silicon. This allows future driver updates to handle any 2700-specific
> integration issues without requiring devicetree changes or complex
> runtime detection logic.
>=20
> For now, the driver continues to bind via the existing
> "aspeed,ast2600-mdio" compatible, so no driver changes are needed.
>=20
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml | 8 +++++=
++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.ya=
ml b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
> index d6ef468495c5..1c90e7c15a44 100644
> --- a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
> +++ b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
> @@ -13,13 +13,19 @@ description: |+
>    The ASPEED AST2600 MDIO controller is the third iteration of ASPEED's =
MDIO
>    bus register interface, this time also separating out the controller f=
rom the
>    MAC.
> +  The ASPEED AST2700 MDIO controller is similar to the AST2600's.

This statement disagrees with your commit message that claims
functionally identical, and implies that the 2700 supports some extra
features or whatever.
I think I'd drop this entirely from the patch, rather than try to reword
it. Remove it and then:
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: changes-requested

>  allOf:
>    - $ref: mdio.yaml#
> =20
>  properties:
>    compatible:
> -    const: aspeed,ast2600-mdio
> +    oneOf:
> +      - const: aspeed,ast2600-mdio
> +      - items:
> +          - enum:
> +              - aspeed,ast2700-mdio
> +          - const: aspeed,ast2600-mdio
> =20
>    reg:
>      maxItems: 1
>=20
> ---
> base-commit: c9dfb92de0738eb7fe6a591ad1642333793e8b6e
> change-id: 20251117-aspeed_mdio_ast2700-aa089c4f0474
>=20
> Best regards,
> --=20
> Jacky Chou <jacky_chou@aspeedtech.com>
>=20

--2bWqpCW/1YghVWvY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaR4PQQAKCRB4tDGHoIJi
0sqUAP9r+wKYrCdpXMLj+cK8mnW1jeDSeXieLhR1kXkxcYrCUgEAvz3f7zkatpMU
AoB7sxn/YdlOC4WEHCby7J2J47TRzAo=
=rJkd
-----END PGP SIGNATURE-----

--2bWqpCW/1YghVWvY--

