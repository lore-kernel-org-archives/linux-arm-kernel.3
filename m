Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC76C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 15:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6BLQhWfPEb3RjuSi7nFDbdiLZza3hK4II394oCdm8Y=; b=0JWbyor+avB7mGrIzyY4nYNKt3
	4lqukAt45l2olUM5BVAfm7SoZv/bXxilk0z+FrGKpVZfmdmH1dN1oERcSKsvBPjWkoyXr78HcH7kn
	ZmZ4O5AbKfuj+kt01vYuVkjZ2sDPaeDzVEEyNDnKtiBFX+2Cb7/UMWhn8auT7nazti6RzDz/WAwPA
	/GllsMiNxrUwLz6ZfOWyYyaCCpas3H2Gev+juUfOMSOcbydsbqA+skLKiafFvMr0AoJzY0BlJ3zOH
	BF+aZacB/w5opDsAq6ywOFZCw7X9NrEPgp8axF9th4qms5qHE88VkujzoZoYkONmQgOsyFgGAOGrL
	S/M3qbkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZvn-0000000EkyR-3Zem;
	Fri, 07 Mar 2025 15:48:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZqV-0000000EjfI-3VZq;
	Fri, 07 Mar 2025 15:42:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 609E7A4588B;
	Fri,  7 Mar 2025 15:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D3FC4CED1;
	Fri,  7 Mar 2025 15:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741362162;
	bh=/6SO0EcADvKbiU2IUbCpmVnHTLreXfwak6PliDc6LIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KpRVUrtEQlJ/hOslRpwQkyvvb8x0q7U4z7yGhb4IqPrOi132Pl5AhyBUKor82AU88
	 YuCBNG8P0re5CI4t6N4R/Jo8X6lEAiujVN5BVJ8fxSZosNSrsQPnj4ulUvG3dL8h0N
	 WM1nK1DFWuePX1WRRJOp+OopOssB8j59RDKFTUqpLaF7au3H6Oq6CnK+4eSJIF6Wxi
	 ero7/47yLDfxcyeJs1cHxDLrqL75KcnaKl6w8nIpiAiRFDGnIBxdE1w1I3lF+BGLUn
	 J3CCCiR5JyvBvMv5TmGnXQKg4xH9rlHMPQBZxLFi/AAj3+U8/1NHLjewvghgaLYhdw
	 aviKA5meeNWug==
Date: Fri, 7 Mar 2025 15:42:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Wu <david.wu@rock-chips.com>, Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: net: rockchip-dwmac: Add compatible
 string for RK3528
Message-ID: <20250307-tipping-womanlike-a1ce2370d8d3@spud>
References: <20250306221402.1704196-1-jonas@kwiboo.se>
 <20250306221402.1704196-2-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nXvMqSCu4bHBti4w"
Content-Disposition: inline
In-Reply-To: <20250306221402.1704196-2-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_074244_044813_C0F4B0FC 
X-CRM114-Status: GOOD (  20.36  )
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


--nXvMqSCu4bHBti4w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 06, 2025 at 10:13:54PM +0000, Jonas Karlman wrote:
> Rockchip RK3528 has two Ethernet controllers based on Synopsys DWC
> Ethernet QoS IP.
>=20
> Add compatible string for the RK3528 variant.
>=20
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> I was not able to restrict the minItems change to only apply to the new
> compatible, please advise on how to properly restrict the minItems
> change if needed.

What do you mean by that? As in, what did you try and did not work?
Usually you do something like
if:
  not:
    compatible:
      contains:
        rockchip,rk3528-gmac
then:
  properties:
    clocks:
      minItems: 5

>=20
> Also, because snps,dwmac-4.20a is already listed in snps,dwmac.yaml
> adding the rockchip,rk3528-gmac compatible did not seem necessary.
> ---
>  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/=
Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> index 05a5605f1b51..3c25b49bd78e 100644
> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> @@ -24,6 +24,7 @@ select:
>            - rockchip,rk3366-gmac
>            - rockchip,rk3368-gmac
>            - rockchip,rk3399-gmac
> +          - rockchip,rk3528-gmac
>            - rockchip,rk3568-gmac
>            - rockchip,rk3576-gmac
>            - rockchip,rk3588-gmac
> @@ -49,6 +50,7 @@ properties:
>                - rockchip,rv1108-gmac
>        - items:
>            - enum:
> +              - rockchip,rk3528-gmac
>                - rockchip,rk3568-gmac
>                - rockchip,rk3576-gmac
>                - rockchip,rk3588-gmac
> @@ -56,7 +58,7 @@ properties:
>            - const: snps,dwmac-4.20a
> =20
>    clocks:
> -    minItems: 5
> +    minItems: 4
>      maxItems: 8
> =20
>    clock-names:
> --=20
> 2.48.1
>=20

--nXvMqSCu4bHBti4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8sT7AAKCRB4tDGHoIJi
0udWAQDKedml54kYUJVxrtEqR1NZzEn4apvbK6/9yyqKPmhoTgEAm7XXd7+22bQ4
e+hQ7xUKSRFfeiw9diT+3VJ3kwyPBQY=
=97ov
-----END PGP SIGNATURE-----

--nXvMqSCu4bHBti4w--

