Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2793ACD98D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 19:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjNTfX9qsyG2BosjClH9M3Nm9++o3pe8nvYaw1YQOU0=; b=h8j9MpVJ/wcVQZbiKNFC3cP80z
	cBzW2c8xMEImIBTaJiXtfpKlFyKnY0KYqmXtCdxk8/xMjkrs1qhM3g1xYKhDMAtgDY6hNe6b5VPVH
	78GrBY7fA4H+80sXzT4RuxHyAykzPQmOk2cJ9bQwCLm43fxpIEVDR2d+29KPLbz9uRSrXKWsFmiQ1
	BFdZmEtneULIBiIjG1D01i2fmLoYwUhaUyWMGsFIZc9qNpAc21ZRUEfcQtcENaqfLIN6m/uPjQ5Iq
	1T+4y5j9wR9SJbV6K7cDpDz8wIyz7haDzZ4FV/BvambCCUhliKG2Cryf1RYZHpvdbHVg3RsSckMov
	QbZCRhIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJd7K-0000000B15n-4C2T;
	Thu, 13 Nov 2025 19:36:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJd7J-0000000B15C-1L9h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 19:36:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03CA141984;
	Thu, 13 Nov 2025 19:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06EAC4CEF5;
	Thu, 13 Nov 2025 19:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763062584;
	bh=OUQ+Qmgs7ku22AW5gxYYNj5W9qbgTRyidFX1ThPc08Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fVo5395uuWVkGDkpQEn4MEn43J6l9a+VMxco++53CmD15eZPSt9Ip6/9SLG9XruF5
	 GVFH3+fUSYwGzKI5/V8g1PLnc2vK4qkCt2F5Y8zjVavMmASmJ69d6YuBSOl8IsNFlZ
	 VGfQgRXxVAOpPadLloiVmKEierKsdndDvxomHfGzjI5vE5ZXR8bYt6XemLEMnVf8+T
	 heiYU2s4fwklhs5rVDpO0e9zowxf9NgZvx2CwS7YbL9ziWtOBDlngJCKhR/7cndQoZ
	 e2Gjn1ELU9XgKPgBzh3lcOdRhzOeiLHvjYg13zTvW1Wdu+uZja9/eLxK1qeMxuBV6C
	 4Z+xEHCc26R7A==
Date: Thu, 13 Nov 2025 19:36:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, clg@kaod.org,
	clg@redhat.com, broonie@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH 1/4] dt-bindings: spi: aspeed,ast2600-fmc: Add AST2700
 SoC support
Message-ID: <20251113-reroute-backlit-b2e1d1b6dc04@spud>
References: <20251113085332.89688-1-chin-ting_kuo@aspeedtech.com>
 <20251113085332.89688-2-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LS0ZL1mlvV8tsXyl"
Content-Disposition: inline
In-Reply-To: <20251113085332.89688-2-chin-ting_kuo@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_113625_377593_39FF41F7 
X-CRM114-Status: GOOD (  16.17  )
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


--LS0ZL1mlvV8tsXyl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 04:53:29PM +0800, Chin-Ting Kuo wrote:
> Add AST2700 to the list of supported SoCs in the ASPEED FMC/SPI bindings.

Please add information here as to why these devices are not compatible
with the ast2600 ones. With that info,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: changes-requested

>=20
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yam=
l b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> index 57d932af4506..80e542624cc6 100644
> --- a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> +++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> @@ -12,7 +12,7 @@ maintainers:
> =20
>  description: |
>    This binding describes the Aspeed Static Memory Controllers (FMC and
> -  SPI) of the AST2400, AST2500 and AST2600 SOCs.
> +  SPI) of the AST2400, AST2500, AST2600 and AST2700 SOCs.
> =20
>  allOf:
>    - $ref: spi-controller.yaml#
> @@ -20,6 +20,8 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - aspeed,ast2700-fmc
> +      - aspeed,ast2700-spi
>        - aspeed,ast2600-fmc
>        - aspeed,ast2600-spi
>        - aspeed,ast2500-fmc
> --=20
> 2.34.1
>=20

--LS0ZL1mlvV8tsXyl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRYzMwAKCRB4tDGHoIJi
0hcsAP9GQ4eMq05L+q3QOeYKmFSX9l0RK7CzAFAaEFVK2vQKoAD/cOZK1QxP2nV7
sUnhA4Tv0TcCZ4ixDmGcDKByRdBFwgo=
=8VOg
-----END PGP SIGNATURE-----

--LS0ZL1mlvV8tsXyl--

