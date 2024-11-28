Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC15FD70DE9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 17:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQgDONGM9qS5HWQEL/tCqn7jwkXO3TZ8ELdZjJDVSFA=; b=vnHfPLx3dgEnYTUJJxOMeOgsE/
	EA5DZQlhOO8X1KhU+F8Xj3XnxxxJhEq6CT6jaymkS91GJ9Z4jHNt5phCEEkK2H66jA7N5l4lxUjBb
	M6f3FvmhnxZikYQo8lAJnQxeT+lGNnzGkgQFhyQTQdBv8onVhNt/9fAFoo7yQ5pxSL8lCqvIfl3Bf
	f0zaajps8DMMQzfAEYHx6KorpTPLtFmeCG0g5wOi/XruCPKpUz8cjTYvrMhlc3m4/uSHH4NsnEkwX
	KVAPMpKGXOtq0k306D28jF9X4YBBrfkVhnzSw5Oss9nQ80w8VqTKYj8KGVyWolagttyx7qPkhq6us
	TcI7eY3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGiPV-0000000G5IF-10Vb;
	Thu, 28 Nov 2024 17:34:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGiOW-0000000G5Cm-1Gdn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 17:33:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C2A95C5E01;
	Thu, 28 Nov 2024 17:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A05C4CECE;
	Thu, 28 Nov 2024 17:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732815215;
	bh=B2nYAoEIQoWi/DFs74I+a1xozDKaymnzpCVznyZhcjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RsQN9bXw4s/spD2Z5dQS0jLQfP/aM46YLuUjaE6hamAwckXy+ZdY+9fUPN92qxU+v
	 aQ24qgT0aeyVdYKUA1RCEvPDLH11dbJZ2DYKxZZeb7BhI9MtCGcpXnjm0p8pateNH+
	 eCuJRdCdkdSH6Z7WMIOBdW6LiWhQk6I6SXLXDEb/XiGiGBoam/FUnbXl5D+9mWEKxy
	 CuWkZK0pcKQtTxHmp407wZOXqpPIt0HNt0PsHbK0qq/gCNR16nEooKQuoNJzX3/Avz
	 bcL2+pt0njicj3mqfZGCZtPHnqIcrYFzbB6xr8WKYb7tyDfwTJ059p+FNZAzNZhGOu
	 6iE0YORmP7Ghw==
Date: Thu, 28 Nov 2024 17:33:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Frieder Schrempf <frieder@fris.de>
Cc: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Robin Gong <yibin.gong@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Joy Zou <joy.zou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 03/11] dt-bindings: regulator: pca9450: Document
 nxp,sd-vsel-fixed-low property for LDO5
Message-ID: <20241128-endanger-envy-d1b19f650b38@spud>
References: <20241127164337.613915-1-frieder@fris.de>
 <20241127164337.613915-4-frieder@fris.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g0GmbFduZp5Hkvg7"
Content-Disposition: inline
In-Reply-To: <20241127164337.613915-4-frieder@fris.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_093336_432576_88BF3FFB 
X-CRM114-Status: GOOD (  23.11  )
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


--g0GmbFduZp5Hkvg7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 05:42:19PM +0100, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>=20
> This new property can be used for boards which have the SD_VSEL tied
> to a fixed low level. The voltage of LDO5 is therefore only controlled
> by writing to the LDO5CTRL_L register.
>=20
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
> Changes for v2:
> * new patch
> ---
>  .../bindings/regulator/nxp,pca9450-regulator.yaml           | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regu=
lator.yaml b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regula=
tor.yaml
> index 5d0d684186c96..0e19c54aa5f8a 100644
> --- a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.y=
aml
> +++ b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.y=
aml
> @@ -49,6 +49,12 @@ properties:
>            Properties for single LDO5 regulator.
> =20
>          properties:
> +          nxp,sd-vsel-fixed-low:
> +            type: boolean
> +            description:
> +              Let the driver know that SD_VSEL is hardwired to low level=
 and
> +              there is no GPIO to get the actual value from.

Does this mean that if you don't provide the property or a GPIO it is tied
high or High-Z? If so, please mention it here. More likely, given the
context of this patch, no gpio and no tied low property means the driver
should handle things as they used to be - but you should call that out
in your commit message to be clear.

> +
>            sd-vsel-gpios:
>              description:
>                GPIO that can be used to read the current status of the SD=
_VSEL
> --=20
> 2.46.1
>=20

--g0GmbFduZp5Hkvg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0ipagAKCRB4tDGHoIJi
0kCrAP9N2emwE+htZGNB9lvu6CN6KHjIRKADtq875PoNHM6XiAEAsv0/3ontG5XF
9k8wV2+utMVxbd5jyPMTnNbdx/PzkwA=
=Uoob
-----END PGP SIGNATURE-----

--g0GmbFduZp5Hkvg7--

