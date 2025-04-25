Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E689C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VKdFi7CCHu+4UWi9RgbhpKfpR9EUrIGjueKx0qMyfIE=; b=LLLJC1iEyg61ybsOBPET6XFllx
	QLVGGXgxBwq/JND7vPlONJan2ai1C1sJKJBouoSDUwu5TSeB/FZomg5NTkRH4hckuWh+cv2n2A4+J
	LDUZ1OhNJnjhca1VYfR8WxsnhpXdHa2Vsu9ZM61yI+IEBoTp8Fh6w7/mGKP/TNUPNxfF1d54m7+WU
	to+DpDDCj0OoaUj1/umFpd0029h7MZgbRMgclP4YRsUnqWfMY85Lb89D1ZXt4R8nF6iKcsKCnCvMF
	kt+lE6dW2ZYh6vt+sv5JPLkS3n07ipuIBPt2ushrJwaXBtNtGMHbbIy2f/8tmg4eN4o3bqgF/SesC
	1HnKsj+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MoV-00000000Nnf-1Z90;
	Fri, 25 Apr 2025 17:26:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KOr-0000000HUVq-1o0l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 14:51:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 412086847C;
	Fri, 25 Apr 2025 14:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1461C4CEE4;
	Fri, 25 Apr 2025 14:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745592692;
	bh=ORYV3pufFLavCcfuKAouL0/gfIikxzXt+cww9KaOuvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQopFPBfz4eaeHmTPdrBo20CUmVLaXX17oeKkMx5wNWr07sYNxRl95/penpfh4I0D
	 S20g7mvMty4Rz1xhCU7Ou0NEfGuMKntJ4asSGf6jRm9v+lvo6mzIO3AtyZv9taNdgb
	 c55scPrq8fogOVJ0Vmg7hF7OPoq4qNMqNaGFEh+F2sZaRNvABI29FAb3kAFimI0Uzh
	 65E0LXc17gk1J39kjClZZqgYv/Xe3XusbWY9Ei883mHuM//cB3wN7Clp67qAurYBUk
	 Hrq52ZmAGCoQP1oA3p4FKmyd7IMXLEg00L2NOPmp+fw3VpdZm2lPl2eB3Ztozl0VWs
	 K5VYfGaqfl5Ww==
Date: Fri, 25 Apr 2025 15:51:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper
 boards
Message-ID: <20250425-prewar-ranging-161ccd2b2468@spud>
References: <20250425-apc_paper_binding-v4-0-0ec2d0febe21@gmail.com>
 <20250425-apc_paper_binding-v4-1-0ec2d0febe21@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GjP52dV+jImYt1qm"
Content-Disposition: inline
In-Reply-To: <20250425-apc_paper_binding-v4-1-0ec2d0febe21@gmail.com>
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


--GjP52dV+jImYt1qm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 06:34:13PM +0400, Alexey Charkov wrote:
> APC Rock is a development board based on WonderMedia WM8950 SoC
> released around 2013. Paper is the same as Rock but lacking a
> VGA port and shipped with a recycled cardboard case.
>=20
> While at that, put myself as the maintainer, given that Tony is
> unavailable as of lately.
>=20
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/vt8500.yaml | 23 ++++++++++++++---=
------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/vt8500.yaml b/Document=
ation/devicetree/bindings/arm/vt8500.yaml
> index 5d5ad5a60451f569e6ef30c924a1964d02e1aa82..f2164144a7af29ca77761bc58=
fe7f4558e7d101c 100644
> --- a/Documentation/devicetree/bindings/arm/vt8500.yaml
> +++ b/Documentation/devicetree/bindings/arm/vt8500.yaml
> @@ -7,19 +7,24 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: VIA/Wondermedia VT8500 Platforms
> =20
>  maintainers:
> -  - Tony Prisk <linux@prisktech.co.nz>
> -description: test
> +  - Alexey Charkov <alchark@gmail.com>
> =20
>  properties:
>    $nodename:
>      const: '/'
>    compatible:
> -    items:
> -      - enum:
> -          - via,vt8500
> -          - wm,wm8505
> -          - wm,wm8650
> -          - wm,wm8750
> -          - wm,wm8850
> +    oneOf:
> +      - items:
> +          - enum:

This should just simplify from "items: - enum:" to "enum:".
With that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +              - via,vt8500
> +              - wm,wm8505
> +              - wm,wm8650
> +              - wm,wm8750
> +              - wm,wm8850
> +
> +      - description: VIA APC Rock and Paper boards
> +        items:
> +          - const: via,apc-rock
> +          - const: wm,wm8950
> =20
>  additionalProperties: true
>=20
> --=20
> 2.49.0
>=20

--GjP52dV+jImYt1qm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaAuhcAAKCRB4tDGHoIJi
0r+sAP9JVeKQ/4V3BSOMKHnQtJFsApmrTtpl1BBIw/1jAgjY8QEAymv8fvG7Ih53
kJEnD+pUrAVAeGtEOj3WVga4MaXX/QY=
=0wOS
-----END PGP SIGNATURE-----

--GjP52dV+jImYt1qm--

