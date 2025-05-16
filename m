Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947A6C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYDNnlexDZMrbKqXTMkALgJPeEm5+zICpIV6zR8yjtM=; b=4BMazv3zD7eQgypMD7UzijTm/7
	GGD4rGBSAQKC0eY5D35hcfgqBigwDmzsFKFIR8B/IoWnXtkfEor+9DiUGo4Bq0kmz6nO7aEvdXHdT
	uThsn6fGSjukaxT63weZ+/hCpnttdF7ZQ9LZ4IJ6WXEcMZ5n8G+ZIUr0MTNjmKspp3PjR5Y42dPsi
	OpFQ6n/t7LukzbZ1CHWanFkaPDFiIsESGMZe3xnfLM8A+u9VTuuBtbON6mKyEkmbpWazh3MzEZuEG
	1NckLXfkc94Y85kIXtLJCqRtHhsUl/wdwoUb72OjIw9wFHAYcoU3BGgw9mRPDwYeDIRm/94Q85+aR
	QEzd2TIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFx3y-00000003rkw-1AyX;
	Fri, 16 May 2025 15:33:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvvj-00000003eYa-30gp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 14:20:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E60F14A71C;
	Fri, 16 May 2025 14:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D105C4CEE4;
	Fri, 16 May 2025 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747405254;
	bh=R7IzZ+E4n4fy5bHk20LY8LFQxi9liKPZf9W5SmiiXgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N1d2aH/ZymXUKtVmEKSo0wq/ORTu4b3Z+Dhp1bhYh+zsh1gNxbCqUBz9vnksrDNSn
	 zD5Q/KVGDOZYelp1UYVIMEgWEU1t4uWjLP7H8nat1u/1BGELXdI7e736GPSoxs3ZXC
	 0uvGxNPm+rvEUn0vyWZZGECywZZGM7SwMMphzzAwsr3G/6rKgD45IdUL/OF5hWKyHW
	 6tfhHt6/M4vGnZ2mAEZFT7a1+tTUy3gIBpNk2BO39VqaBnNeekm+DUIGR3xlPtQo+w
	 mstQydv5a9GdB1QRZy4zC+DyIXJ4ZX8NVQf0a0FXkmNZ0NjQont4rBPFERjX0oxxAe
	 Ta6IkMlTRbaSw==
Date: Fri, 16 May 2025 15:20:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N
 (R9A09G056) support
Message-ID: <20250516-unpaid-reexamine-922bbecd4cbb@spud>
References: <20250515182207.329176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250515182207.329176-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="88xPX6GY1mTCQwI+"
Content-Disposition: inline
In-Reply-To: <20250515182207.329176-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_072055_796676_E274C0BA 
X-CRM114-Status: GOOD (  21.03  )
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


--88xPX6GY1mTCQwI+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 07:22:06PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document support for the Renesas OS Timer (OSTM) found on the Renesas
> RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
> other RZ families, so no driver changes are required as `renesas,ostm`
> will be used as fallback compatible.
>=20
> Also update the bindings to require the "resets" property for RZ/V2N
> by inverting the logic: all SoCs except RZ/A1 and RZ/A2 now require
> the "resets" property.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
> - No changes in this version.
>=20
> v2->v3:
> - Added Acked-by tag from Conor.

But v3 -> v4 doesn't mention why it was dropped?

>=20
> v1->v2:
> - Inveted the logic in the dt-bindings to require the "resets" property
> - Updated commit message
> - Added a Reviewed-by tag from Geert.
> ---
>  .../devicetree/bindings/timer/renesas,ostm.yaml      | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/=
Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> index 9ba858f094ab..0983c1efec80 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> @@ -26,6 +26,7 @@ properties:
>            - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
>            - renesas,r9a07g044-ostm # RZ/G2{L,LC}
>            - renesas,r9a07g054-ostm # RZ/V2L
> +          - renesas,r9a09g056-ostm # RZ/V2N
>            - renesas,r9a09g057-ostm # RZ/V2H(P)
>        - const: renesas,ostm        # Generic
> =20
> @@ -54,12 +55,11 @@ required:
>  if:
>    properties:
>      compatible:
> -      contains:
> -        enum:
> -          - renesas,r9a07g043-ostm
> -          - renesas,r9a07g044-ostm
> -          - renesas,r9a07g054-ostm
> -          - renesas,r9a09g057-ostm
> +      not:
> +        contains:
> +          enum:
> +            - renesas,r7s72100-ostm
> +            - renesas,r7s9210-ostm
>  then:
>    required:
>      - resets
> --=20
> 2.49.0
>=20

--88xPX6GY1mTCQwI+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCdJwQAKCRB4tDGHoIJi
0mvIAQDauy3Hd/nBGPUcMQK3MebaA9RozB2H7bmL2zx8VKNLSAEAgRw7hsp/2Rjh
5C8Wbm9MLFseOKB6HArt1synqePz2wA=
=uGiL
-----END PGP SIGNATURE-----

--88xPX6GY1mTCQwI+--

