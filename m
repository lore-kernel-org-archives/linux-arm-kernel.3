Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3584AC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 16:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58gDZVLa6Ht0FSHmZITUm7NmcPXfc1FuPcB86sHdzp0=; b=D4wZA5UVkU4sQ6JvCBkzLoXs/G
	YWgwVLqn4Fye2DAxk/jCCBi1xibe62kSAGeLdvYtapDL+g8FjNjnX325igzlRbWqfvmMCHP1vYl7G
	irSjBJXSbptDoAEugGePINgtAh7jxL1iQe7lQ3ZMqlCbLzdb2mqcEQ/noX+okJHy9gkQ7wjzy4cS1
	XZI0M0mGFQtO6fVVaAqPi4bt3D8TOdlEzxiTIObYrTF5NqP5RltdBuYSU0+i4nlQcyV44kL+d8Hqe
	+zyIouZasj4rG9e3r/ipkm+TVoCJfK6t88h2GKinUgWN2RTNXT71Yq/fXSWVd+p4i0Y192TP5iYaf
	3hfG54ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPxU-0000000DYyv-0CRr;
	Tue, 20 May 2025 16:36:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPBw-0000000DOwc-1hQQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:47:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 809B461126;
	Tue, 20 May 2025 15:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6480CC4CEE9;
	Tue, 20 May 2025 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747756063;
	bh=Kx5G6jb5VVr3oqqGbr04JrYV0NFaNI05NayVcBLr/w4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hDHIr2ALlh8Morhko7v8apJ8Wf7asZINSwivtyHAkUn9ZrbEKdsayhHxZXZh4H+4R
	 Z7qxw5zKWSJGNISJvIzArsoDxoXB2buC5LyPKDBNpPJr7O2MZUxOaxZaw+kpW7d5Cb
	 qj48E+LAch77GIp6/cqnk13gPn3LIDDyS5QDyRcvM/Tdh513xGXroq6pmuAdjnP1Qe
	 cfwOsBrw6lNPMb7+gCZT+NDIHqIzRroJQfireRm6trozaM+8Xjv8IZCPfNyS/v4gZ4
	 SyDv93Q91Kh/KVnQ6AC1RwUzsRNMvruQ8QL8VizeKjtyO2s21zuvV0DPGgN3I575J1
	 tPbBN43Jku3qA==
Date: Tue, 20 May 2025 16:47:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de, BMC-SW@aspeedtech.com
Subject: Re: [net 1/4] dt-bindings: net: ftgmac100: Add resets property
Message-ID: <20250520-creature-strenuous-e8b1f36ab82d@spud>
References: <20250520092848.531070-1-jacky_chou@aspeedtech.com>
 <20250520092848.531070-2-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vqRuqlVkPNRifbyp"
Content-Disposition: inline
In-Reply-To: <20250520092848.531070-2-jacky_chou@aspeedtech.com>
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


--vqRuqlVkPNRifbyp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 05:28:45PM +0800, Jacky Chou wrote:
> Add optional resets property for Aspeed SoCs to reset the MAC and
> RGMII/RMII.
>=20
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml=
 b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> index 55d6a8379025..f7af2cd432d3 100644
> --- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> +++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> @@ -35,6 +35,11 @@ properties:
>        - description: MAC IP clock
>        - description: RMII RCLK gate for AST2500/2600
> =20
> +  resets:
> +    maxItems: 1
> +    description:
> +      Optional reset control for the MAC controller (e.g. Aspeed SoCs)

If only aspeed socs support this, then please restrict to just your
products.

> +
>    clock-names:
>      minItems: 1
>      items:
> --=20
> 2.34.1
>=20

--vqRuqlVkPNRifbyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCykGAAKCRB4tDGHoIJi
0ldUAQCs0SeY54j9yeQV50Qs6FaOw51w5rsiRnuKhNfqKgBERAD/bi4/ULFOC+eK
hIqwX2TOHjPWTh/uDyZS4qnyKuCRnAs=
=5R4U
-----END PGP SIGNATURE-----

--vqRuqlVkPNRifbyp--

