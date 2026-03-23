Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F342F483EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUWHb/bHW5waMVeCr38IVfB8tbe00wSzOrDLomFNqS0=; b=W9xjk8VyStrNMI1Y7jF5x4Cbjy
	5Hd7XN/ewj39Hw7t1bR5wpiAs2tPYJ5i4sPHlbbnPpC+b86d6W2OQ32EfUaF1NQHlk2AXOoF+o5DI
	L9XQAMbIrFBcDLycaoai7cvTvMgIdgqODwDKIfWIvDRSjVxsA4+zhsuPTWYXQs7cN0isUDYS8gB4T
	VXaA9/19NwBVQZopaxaiTwyGYNTGogepnAsQCHbP/PziMi5hMKyv14AWcCG0/Fsbi8uaLeekp6Pvy
	/NznLbu0cjN928auGTOIuamHRwdXZuwpR2HW2gZr82iIsk6dzR8snd2sExmuPy3IpA7+G1GpHGn3M
	3t4BOJsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lFz-0000000HVNV-0894;
	Mon, 23 Mar 2026 19:48:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lFy-0000000HVN5-1ecs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:48:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B3A9A600C4;
	Mon, 23 Mar 2026 19:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AFBFC2BCB0;
	Mon, 23 Mar 2026 19:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774295289;
	bh=AhCkc7lJh+tz9nznn2qikIFM9LgmMt+FJIpbfD9+zwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NyUlUFmS/LZ/hU3F1BEvomKf3VoOzcAB/DkUDJjOIfymVW0mfAaAAFMEjr2b4dsbK
	 hs+w8lGQQXkhGA6hHV0qMc1nrHIdkCAmf61eq3Mw4UTX/IgW6WHfAQTrtnX1NL4Ss9
	 rT1c2b/+PPRo0JURucoqO1yseGb5JjEEixgjG4H52cfT4Ywusal/fqPMEBb4u/aniW
	 0QSQeW1ou4JTX6lgIGOWxJbsvWSglO9UBUW2b2PFtFJp7wQHeJfwZwXv6GxcHNGAfX
	 M345KBZiMMcFkoGlebugtUvBMflNNERpnG1xH+1taJGALArDgXRLjW23nE1+pyRd9V
	 xv3BYM372WCww==
Date: Mon, 23 Mar 2026 19:48:05 +0000
From: Conor Dooley <conor@kernel.org>
To: nick.hawkins@hpe.com
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Marie Verdun <verdun@hpe.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: hpe,gxp: Add HPE GSC platform
 compatible
Message-ID: <20260323-winnings-scalded-eb8ca95805ad@spud>
References: <20260323194223.683487-1-nick.hawkins@hpe.com>
 <20260323194223.683487-2-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dNqL46ltczVGst4z"
Content-Disposition: inline
In-Reply-To: <20260323194223.683487-2-nick.hawkins@hpe.com>
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


--dNqL46ltczVGst4z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 02:42:21PM -0500, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
>=20
> Add the HPE GSC ARM64 BMC SoC compatibles to the existing
> hpe,gxp.yaml binding.
>=20
> The initial board compatible is hpe,gsc-dl340gen12 for the DL340 Gen12
> server platform.
>=20
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  Documentation/devicetree/bindings/arm/hpe,gxp.yaml | 7 ++++++-
>  MAINTAINERS                                        | 7 +++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/hpe,gxp.yaml b/Documen=
tation/devicetree/bindings/arm/hpe,gxp.yaml
> index 224bbcb93f95..6f057cd58571 100644
> --- a/Documentation/devicetree/bindings/arm/hpe,gxp.yaml
> +++ b/Documentation/devicetree/bindings/arm/hpe,gxp.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/arm/hpe,gxp.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: HPE BMC GXP platforms
> +title: HPE BMC GXP and GSC platforms
> =20
>  maintainers:
>    - Nick Hawkins <nick.hawkins@hpe.com>
> @@ -18,6 +18,11 @@ properties:
>            - enum:
>                - hpe,gxp-dl360gen10
>            - const: hpe,gxp
> +      - description: GSC Based Boards
> +        items:
> +          - enum:
> +              - hpe,gsc-dl340gen12
> +          - const: hpe,gsc
> =20
>  required:
>    - compatible
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2265e2c9bfbe..33e4357f9011 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2859,6 +2859,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/g=
it/kristoffer/linux-hpc.git
>  F:	arch/arm/mach-sa1100/include/mach/jornada720.h
>  F:	arch/arm/mach-sa1100/jornada720.c
> =20
> +ARM64/HPE GSC ARCHITECTURE
> +M:	Nick Hawkins <nick.hawkins@hpe.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/arm/hpe,gxp.yaml

> +F:	arch/arm64/Kconfig.platforms

That doesn't look like a file that "belongs" to you.

> +F:	arch/arm64/boot/dts/hpe/

And both of the other two belong to the entry right below this one, that
already has your name on it. I don't understand why this MAINTAINERS
entry is needed.

> +
>  ARM/HPE GXP ARCHITECTURE

Couldn't you just modify this to "GXP/GSC"?

Binding change looks fine...

Conor.

>  M:	Jean-Marie Verdun <verdun@hpe.com>
>  M:	Nick Hawkins <nick.hawkins@hpe.com>
> --=20
> 2.34.1
>=20

--dNqL46ltczVGst4z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacGY9QAKCRB4tDGHoIJi
0vHEAQDS/lQdC/KAz3hJSrZQYllS3FrOrfpoVg65ox3t9KNaFQD8CqNkIP7JBhBw
HeVgd3M5fFUYmvbhXQ6hwNlYmykU8Qs=
=DBms
-----END PGP SIGNATURE-----

--dNqL46ltczVGst4z--

