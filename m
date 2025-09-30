Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CF0CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 18:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjMNQlPFX12EnNDO8Z2EwPoW4DtnYdcs2sYymHZeOjs=; b=y3uHQcHugBQeFRxGTfnXUS2akJ
	LY/nuiljHZPHPIvEHv5xZuwcaepLqCVQ3bN3c+LhsXWtN7vcuDsu1QxTVfbc0f3EXMlHT6hs+9rZZ
	E4R2ezWtZzim/S+RSQtBEytUlF358AyXdXCfvX9EkhSRoD9ghC8qDnA6WMFk/HnWN+S4ejneB/1KO
	Kr7Lds8TiLZ5hnCLKraz6iI6sMts2ecfH5vYfOpfUgdfveBqCyUl1cQ8cN/EMt5jYCgRTu6xOc3/m
	yyaNdqGsPlzuiuUkVkCkDECS4rCRta26yQTZUEWsGtOkzaWS2WqpUgQ5lGPnJ99b5pzfmxPF3VVmb
	OaHlp+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fSA-000000060gJ-2yiT;
	Tue, 30 Sep 2025 18:51:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fSA-000000060fx-1Bl3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 18:51:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 89EAE611D1;
	Tue, 30 Sep 2025 18:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF398C4CEF0;
	Tue, 30 Sep 2025 18:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759258317;
	bh=jyBHzsxRS2jxhYbpoIYY4zJABy0+Tr0/8Tj/357Ar9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TaDSCduObxABjop7cQX8B8UhPwkoWFb9DqDzPG2QVBMfWbM936Kp2ypzO0dkZDuOD
	 VwBGOAQq6JEziFjCtXicd/IVG7Yh9NwMdIz0kNHTdZlOhD596ATISkf64SqI8z4e2e
	 R9c9VjR+pJQzXCak7W+W6ZAdES2fnJg45zgznv3c+jjoHy/clX8fRjVtZBrstCcehW
	 qvgrPxWb9GmyvvCdShYS511Eu0nzamkWYRcTVEjhQ+jnlSZ3M7MSbL4s6L4ZKHkc/Z
	 /zhqAR0+IDat+ws1aQH8nyRxVG6BG8iVkgY957HgkjZPc0obTfRISSQeMicXUc/Gqh
	 oV51LZ+3nTSmA==
Date: Tue, 30 Sep 2025 19:51:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Jun Guo <jun.guo@cixtech.com>
Cc: peter.chen@cixtech.com, fugang.duan@cixtech.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
	linux-spi@vger.kernel.org, michal.simek@amd.com,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: spi: spi-cadence: document optional
 fifo-width DT property
Message-ID: <20250930-vocally-closable-136829bc9fed@spud>
References: <20250930075644.1665970-1-jun.guo@cixtech.com>
 <20250930075644.1665970-2-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2UGIE5QG3NgUNc7j"
Content-Disposition: inline
In-Reply-To: <20250930075644.1665970-2-jun.guo@cixtech.com>
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


--2UGIE5QG3NgUNc7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 03:56:42PM +0800, Jun Guo wrote:
> Add documentation for the optional 'fifo-width' device tree property
> for the Cadence SPI controller.
>=20
> Signed-off-by: Jun Guo <jun.guo@cixtech.com>
> ---
>  .../devicetree/bindings/spi/spi-cadence.yaml          | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/spi-cadence.yaml b/Doc=
umentation/devicetree/bindings/spi/spi-cadence.yaml
> index 8de96abe9da1..b2e3f217473b 100644
> --- a/Documentation/devicetree/bindings/spi/spi-cadence.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-cadence.yaml
> @@ -62,6 +62,17 @@ properties:
>      items:
>        - const: spi
> =20
> +  fifo-width:
> +    description: |
> +      This property specifies the FIFO data width (in bits) of the hardw=
are.
> +      It must be configured according to the actual FIFO width set during
> +      the IP design. For instance, if the hardware FIFO is 32 bits wide,
> +      this property should be set to 32.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 8
> +    maximum: 32
> +    default: 8

I assume this differs from fifo-depth because this is the actual width
of the registers rather than the number of elements of that width the
FIFO can contain?

However, this isn't something defined as common in spi-controller.yaml
so you'll need a vendor prefix for the property if the property stays.
This does, however, seem like something that can just be determined by
the compatible and that your omission of a soc-specific one is what's
lead you to introduce this property. Why not just use a sky1-specific
compatible here?

> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.34.1
>=20

--2UGIE5QG3NgUNc7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNwmyAAKCRB4tDGHoIJi
0preAQCGJTXoWL3uSSINEjlopPAGGVgwBWAKQr9EmEat9qGu1wD6Av/DN+YvByfy
v3+e5PUmjSfWH/El5UQ+yc5rLpm7cgw=
=Sl04
-----END PGP SIGNATURE-----

--2UGIE5QG3NgUNc7j--

