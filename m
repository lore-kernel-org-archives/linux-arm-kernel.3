Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D659606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lsHU606a;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aKUSJkHE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ei1PcyW2bvlCuqWOURcTSE3dLB/l5Xm1TRmGcUX2JW4=; b=lsHU606ag/JE8vWFq+vkJzWLT2
	eJvA+fNRiPt32wKQKeWm6wLoK5aTQqSCqCt1UhxLd1QCT2VuR20xNXK0VXeMkN//i3KxFKXx1Mv5r
	WeYAu14xTo7tmBdxJEMJIVV/mXHDxOdf61Klh/ASk8ZA0RnvpUF0tbZ6tUqoCk9JGSr38S5oD+HXy
	Tut/Y9ADpfIv4LVlEr4OKSGXNZhACeNn+WGnwMeTGM3NQMvnIeiwmEDcvtKrurvYAr9EmU0fP11gC
	rxQ4wK9TWml/E3uBMwN5HT7WgjDktWqxI/LUkZpe6iEeNRflipFucoiOtD4OEWbyvpm91NWfhOpJJ
	N0F2ZviQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxsq-000000007Lc-3Lm2;
	Mon, 02 Nov 2026 19:39:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxsp-000000007Kx-0db6;
	Mon, 02 Nov 2026 19:39:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CAAA43A64;
	Mon,  2 Nov 2026 19:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886AC1F00A16;
	Mon,  2 Nov 2026 19:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793648394;
	bh=ei1PcyW2bvlCuqWOURcTSE3dLB/l5Xm1TRmGcUX2JW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aKUSJkHEjeliqo1dMG/1lWPIuVnBz8f7hQ4tTFS0ZU1ycTsBnlhsolsmLWwL/uWb2
	 u08mtLopleSjzGsdEEe5RzYgqeAOdwbW7d/yBT8UkDk0oT5f2NFzo5l7hiI1vsXtYV
	 +lXDxbtOkQKLT7QwPd5ylTPBZ/nak7MzgZuRMYjpYomrQ3w9hg1A4xH1KZB6jUxQ7M
	 0QKCVIgPI7pz0yLLZyCQvzLPtDEwP4pRx14wjotbFV922AN2yaJlCMyPgaBgXjIyr3
	 BCSuMu36L3NHPHzhcPR1XtQ+QK6jxYPktgdLoshoZnGEu5FoFqzvprNQG20wluoEJx
	 sDW+Wp63urkOg==
Date: Mon, 2 Nov 2026 19:39:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/9] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and
 BCM2712
Message-ID: <20261102-email-target-d3191584d234@spud>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
 <20261102090713.896324-2-pbrobinson@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HziPGci4IN+2yC0c"
Content-Disposition: inline
In-Reply-To: <20261102090713.896324-2-pbrobinson@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--HziPGci4IN+2yC0c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 09:06:51AM +0000, Peter Robinson wrote:
> Add compatibles for the BCM2711 40-bit DMA4 channels, which are
> described by a separate node covering channels 11-14, and for the
> BCM2712 DMA controllers. The register address of a node identifies its
> first channel, allowing a controller to be split across nodes.
>=20
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
>=20
> ---
>  .../bindings/dma/brcm,bcm2835-dma.yaml        | 31 +++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml =
b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> index c9b9a5490826c..31d97a10a0ea9 100644
> --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> @@ -9,18 +9,27 @@ title: BCM2835 DMA controller
>  maintainers:
>    - Nicolas Saenz Julienne <nsaenz@kernel.org>
> =20
> -description:
> +description: |
>    The BCM2835 DMA controller has 16 channels in total. Only the lower
>    13 channels have an associated IRQ. Some arbitrary channels are used b=
y the
>    VideoCore firmware (1,3,6,7 in the current firmware version). The chan=
nels
>    0, 2 and 3 have special functionality and should not be used by the dr=
iver.
> =20
> +  BCM2711 channels 11 to 14 are 40-bit capable DMA4 channels, described =
by a
> +  separate brcm,bcm2711-dma node. BCM2712 has 40-bit addressing on all
> +  channels, with channels 6 to 11 being DMA4 channels. A controller may =
be
> +  split across several nodes, the register address identifies the first
> +  channel of a node.

Uh no, a device should not be split across different nodes. This should
not be needed, why can't your driver handle the upper channels having
different capabilities?

Thanks,
Conor.

> +
>  allOf:
>    - $ref: dma-controller.yaml#
> =20
>  properties:
>    compatible:
> -    const: brcm,bcm2835-dma
> +    enum:
> +      - brcm,bcm2835-dma
> +      - brcm,bcm2711-dma
> +      - brcm,bcm2712-dma
> =20
>    reg:
>      maxItems: 1
> @@ -99,4 +108,22 @@ examples:
>          brcm,dma-channel-mask =3D <0x7f35>;
>      };
> =20
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    dma-controller@7e007b00 {
> +      compatible =3D "brcm,bcm2711-dma";
> +      reg =3D <0x7e007b00 0x400>;
> +      interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
> +                   <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +      interrupt-names =3D "dma11",
> +                        "dma12",
> +                        "dma13",
> +                        "dma14";
> +      #dma-cells =3D <1>;
> +      brcm,dma-channel-mask =3D <0x7000>;
> +    };
> +
>  ...
> --=20
> 2.56.0
>=20

--HziPGci4IN+2yC0c
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujnBQAKCRB4tDGHoIJi
0hRLAP0RLHp9wKJWp9KZvKHugGEw7nv+l/NCctuBP0UpDcirAQEA5THbx5eORWZq
KfVxUSY81BazlR4FE+rstFss+HAzyA0=
=gXCA
-----END PGP SIGNATURE-----

--HziPGci4IN+2yC0c--

