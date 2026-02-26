Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5DBFD8FFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZxyYuzHNNIsJFokNcZiylF/FfYP3fm6+tmYjwSJRls=; b=bnpgn9BK6Ufu4ODPLuULcyGBgV
	EqwkWicHd+DYB8vNzy1/gfO8P60lcRm0gn6K8hyudi8Xj/Unl8kpELqH0e8fA30TQG/4TkR7VUEGX
	Yw53I4H0stO/GyuI96AsENYUoQw7KrL6fZ9+4N7hLvjm7wmHQ6AOxtgdZ+q7YeMbQMZZFTt53tO57
	98lhmf7mOU8UGBLnL92iwQbGt0kvoLQlWcsGmYIZRy66CXka25RteQI7QDrRObeWlRa35chltNVe9
	JPXB/mNxOlQpC5Pt+38HNLv3Zpgmg/6lo449geRYesw9zE0TZwTx10qRd7OC9y8gcBbXWom2ovQgS
	gqnLWIJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvgKs-00000006zOc-2o3W;
	Thu, 26 Feb 2026 18:43:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvgKq-00000006zOR-2meV;
	Thu, 26 Feb 2026 18:43:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BC9860126;
	Thu, 26 Feb 2026 18:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4F2C116C6;
	Thu, 26 Feb 2026 18:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772131418;
	bh=GgM263nGANWRLKxVMqunt8Sam3YSqtNlhozBs8g55Gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VFAVns0x9ryCBzjBY15Zb1+kXYi1Esaw1OUp/2iu0fBekK7EodMBq4NpO9PiSZRI6
	 86t+6Mqw4HLFI2DOCC2NyE8TP/yKJDAbQfr/1yARXFNymcvEGGy/XTta3dpTfElrtK
	 kOIg4/CPgIRjXAZk2av4DaMinmXFwuehEMMW9alvxXyPb7IAlJhQSW8QEJEYIXzuOI
	 vZR4RO5tqEOLRqluJ72TA4Y9r+Av264PenJv7tnsm24L0h+4swTxuiUM9fIrFo6OG4
	 eTtEBmi+GfRZp3UsleGDy0NB8jJ2Rwp5hhbxz1syGbzjRmdsqhfiFEvMJpXg8tEvfW
	 aqpI8DW/Dj/ug==
Date: Thu, 26 Feb 2026 18:43:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
Message-ID: <20260226-salute-threaten-a3eabb232396@spud>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kkAJ0O2ZXkCJsI6/"
Content-Disposition: inline
In-Reply-To: <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
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


--kkAJ0O2ZXkCJsI6/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
> With the introduction of the RK3588 SoC, and RK3576 afterwards, two more
> register blocks have been provided for the video decoder unit.
>=20
> However, the binding does not properly describe the new hardware layout,
> as it breaks the convention expecting the unit address to indicate the
> start of the first register range, i.e. 'function' block is listed
> before 'link' instead of the opposite.

I don't understand this commit message or rationale for an ABI break.
Changing the unit address seems like a "free" fix to your problem,
especially when reg-names is not a required property that you can rely
on. Actually, there may be a bug in the driver - it expects reg-names
for rk3576-vdec and rk3588-vdec but the binding doesn't mandate their
presence for those devices.

Deprecating the order also makes little sense to me, given that some of
these devices only have one reg entry, which as far as I can tell from
looking at the driver *is* the "function" region, so it can never be
entirely deprecated.

Confused,
Conor.

>=20
> Since the binding changes have been already released and a fix would
> bring up an ABI break, mark the current 'reg-names' ordering as
> deprecated and introduce an alternative 'link,function,cache' listing
> which follows the address-based ordering according to the TRM.
>=20
> Additionally, drop the 'reg' description items as the order is not fixed
> anymore, while the information they offer is not very relevant anyway.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  .../devicetree/bindings/media/rockchip,vdec.yaml     | 20 ++++++++++++--=
------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b=
/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> index 809fda45b3bd..c513b68d2c72 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> @@ -28,16 +28,20 @@ properties:
> =20
>    reg:
>      minItems: 1
> -    items:
> -      - description: The function configuration registers base
> -      - description: The link table configuration registers base
> -      - description: The cache configuration registers base
> +    maxItems: 3
> =20
>    reg-names:
> -    items:
> -      - const: function
> -      - const: link
> -      - const: cache
> +    oneOf:
> +      - items:
> +          - const: link
> +          - const: function
> +          - const: cache
> +      - items:
> +          - const: function
> +          - const: link
> +          - const: cache
> +        deprecated: true
> +        description: Use link,function,cache block order instead.
> =20
>    interrupts:
>      maxItems: 1
>=20
> --=20
> 2.52.0
>=20

--kkAJ0O2ZXkCJsI6/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaCUUwAKCRB4tDGHoIJi
0vUsAQC17KEoZ4NbwOQnXNQ7UeOV0pTQwc+PR0gNyi8SJ+okYwEA8EvoMZh0U7oE
B2SzgGvfagw4afxHel577llDgMmhfAg=
=GLLI
-----END PGP SIGNATURE-----

--kkAJ0O2ZXkCJsI6/--

