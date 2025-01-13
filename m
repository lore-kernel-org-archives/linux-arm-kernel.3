Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276C2C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 18:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AjTyjCqCZ60FIygIkCEBpvVGwDak9bedCVsu0RjJTQ=; b=teC0txNEhwTLN2yz7+8C3eOmJM
	/PVPtQFFTmbBxGaHp+WFSazG3LHmn8rcdk+eCPJcEJvwvMGsT3mH8k6n7zV6woHmX+hGqEb8E+Vdw
	JPbwV0cZOAs7Y8lYJhFC/qFX5a6APkeWtpNqR2VS9gWcbZ55oirzhJhuU7QI77jdTS/zJxXMO1Swm
	cVRy4HVuIJ7e1qjhE1yOXVmRaDpnBxYGRbVf5s4P/kS77X4tkz7I5pOoIB5gU136ktJVIyI+M4QNB
	umsmMkDK9ir5brn27Rf3J4cLj39jJURpq1A2uA6yrNmHn5E17JfOyWV4KAD68X616bdO2BtiaRDmZ
	iFVxM31Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPER-00000006DBV-0fSo;
	Mon, 13 Jan 2025 18:32:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPD7-00000006Cv4-3AaR;
	Mon, 13 Jan 2025 18:30:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C425AA4101D;
	Mon, 13 Jan 2025 18:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA6EC4CED6;
	Mon, 13 Jan 2025 18:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736793048;
	bh=P6o9b9OJEbbN6mvPN7cHfla1Cu8ASLwXWJu0Q2N2xEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rEeA/yUKsAqWherMVsQL3MgtjM9tx+cBFSLOXmyVc9crUJyTMUG9rxP0Vj6vdShWB
	 moIFFK0hRAKiYEwRBHXj8WLwvYriZtvUG/AL98sZ42u8NGnWbO8lz9nNWZUTyGUm5h
	 b5ouCotv5ASLnK215CQQrEMGiz+gXx7VymMZNHDcy2YHQZ7NxPEsYkqiGGiXBLLkxm
	 a+5IOKKyx2Mf5dAGLtT1dX/5jK2AyXTZeiQcuUVk1cPw+TD3IacFa+J0oE2zlHGyWi
	 2F2Mm2ARw0gVyBDn9w/xftidEroQ8euUzLcyBfWbYtO23e+fxQ9MJkfwQYQd4oKCr6
	 bUr9vfV75pWhg==
Date: Mon, 13 Jan 2025 18:30:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add
 property to set disconnect threshold
Message-ID: <20250113-aerobics-tall-e570d8bbcf2c@spud>
References: <20250111141542.5007-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RGQVYqBrFU+TitZQ"
Content-Disposition: inline
In-Reply-To: <20250111141542.5007-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_103049_856192_67552DBE 
X-CRM114-Status: GOOD (  15.42  )
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


--RGQVYqBrFU+TitZQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 11, 2025 at 10:15:41PM +0800, Chunfeng Yun wrote:
> Add a property to tune usb2 phy's disconnect threshold.
> And add a compatible for mt8196.
>=20
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> based on kernel 6.13-rc1
>=20
> this property is porting from t-phy driver, due to the u2 phy are similar.
> ---
>  Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/=
Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> index a9e3139fd421..2e012d5e1da1 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> @@ -49,6 +49,7 @@ properties:
>        - enum:
>            - mediatek,mt3611-xsphy
>            - mediatek,mt3612-xsphy
> +          - mediatek,mt8196-xsphy
>        - const: mediatek,xsphy
> =20
>    reg:
> @@ -129,6 +130,13 @@ patternProperties:
>          minimum: 1
>          maximum: 7
> =20
> +      mediatek,discth:
> +        description:
> +          The selection of disconnect threshold (U2 phy)
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 15

What unit is this? Unitless? How are the values determined?

> +
>        mediatek,efuse-intr:
>          description:
>            The selection of Internal Resistor (U2/U3 phy)
> --=20
> 2.46.0
>=20

--RGQVYqBrFU+TitZQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4Vb0wAKCRB4tDGHoIJi
0vKoAP4zLF3EUp+hEhLKk1EO3mA43mZ+y4hvXWvOmzulSeWtcAD8DUyZ7/MQOMPF
usYBcosdsvVr84zavQbRDKFCKsLWQAY=
=5d+a
-----END PGP SIGNATURE-----

--RGQVYqBrFU+TitZQ--

