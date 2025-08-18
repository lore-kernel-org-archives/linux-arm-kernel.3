Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE17CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fveELrcwPJ1qHSHr3I0l8L1ROl2qKoK8Ug6HcjVhzD4=; b=g4m/223gDg2ZGIQGs1ze8ldskA
	2WutxN6hYiUB8DPJ2nPySFCA041sjDgKTykPe6JouD1kS60LJNbOKFOFnoq7YiR15dDNq3i4pZo4B
	5qzhMtnNn3RNXsJR4WaW9Z4TRwRn/J4fT6E7JfBBDZ8D834ISr68DciBEOkDi0LCDAEsYEHSFUvD+
	n9BWXdB8vznF5WFYoQZFYWMoKFWvGxApuOKIYw4teITowhevpsEp/bEtaTvfdMCwkey3sfMAy3A4z
	d62rDOIBRF0OuNZ2cbT3TO9nMjPADLbPcQf5iEFzta4CdMDab/agbiXyGUhNJKXoIvit41dJlq84s
	HpYYo0DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3ke-00000008DYz-1Os7;
	Mon, 18 Aug 2025 17:34:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3Je-000000085m3-2Jr7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 17:06:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F2EFB600AE;
	Mon, 18 Aug 2025 17:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CBFC4CEEB;
	Mon, 18 Aug 2025 17:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755536797;
	bh=zoBUx4qB8f1MLgIpXLlf3KIgZIdGo3Y5op4r8llhgtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5hYa9v0xq5xmvg8i9Emrk6I/y6gBd9JYT0E5FB9urMyr3jczGLdQqKiKkBd/FRY9
	 eaML0Gae867cQbqXy10OpvnaHV0b4q21Bfajl7rxm59Qz4uJMk76UqUS9iFTd9clmu
	 0t5X7aTAehklAzN+9udM+QgplGHW3eOqQtHRTyZnEaxm6dJjS13PFtFXjU8/z58V0N
	 g4CDXsp3H99cV/7VQ7Ys/97yBMnIVRDPxo4VQstjBgk7X7E3najweMFrFBT8d8YD+x
	 hZT4rXfMEhUmSoI0LTqbQmpW0wf8ELH1RNrYz40KQUsSTbmFgy0zNE3SCeqkKx47di
	 bncedGnykODrA==
Date: Mon, 18 Aug 2025 18:06:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/5] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
Message-ID: <20250818-babbling-studio-81a974afc169@spud>
References: <cover.1755506608.git.christophe.leroy@csgroup.eu>
 <be8952a26d7a8d55ff96e4547f6c107094988220.1755506608.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r9pc0nvx4F9Bp7Ya"
Content-Disposition: inline
In-Reply-To: <be8952a26d7a8d55ff96e4547f6c107094988220.1755506608.git.christophe.leroy@csgroup.eu>
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


--r9pc0nvx4F9Bp7Ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 10:45:58AM +0200, Christophe Leroy wrote:
> The QUICC Engine provides interrupts for a few I/O ports. This is
> handled via a separate interrupt ID and managed via a triplet of
> dedicated registers hosted by the SoC.
>=20
> Implement an interrupt driver for it for that those IRQs can then
> be linked to the related GPIOs.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Fixed problems reported by 'make dt_binding_check'
> ---
>  .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,=
qe-ports-ic.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-port=
s-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-i=
c.yaml
> new file mode 100644
> index 000000000000..b7c74c66347c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.ya=
ml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale QUICC Engine I/O Ports Interrupt Controller
> +
> +maintainers:
> +  - Christophe Leroy <christophe.leroy@csgroup.eu>
> +
> +description:
> +  Interrupt controller for the QUICC Engine I/O ports found on some Free=
scale/NXP PowerQUICC and QorIQ SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,mpc8323-qe-ports-ic
> +      - fsl,mpc8360-qe-ports-ic
> +      - fsl,mpc8568-qe-ports-ic
> +
> +  reg:
> +    maxItems: 1
> +    description: Base address and size of the QE I/O Ports Interrupt Con=
troller registers.
> +
> +  interrupt-controller: true
> +
> +  '#address-cells':
> +    const: 0
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Interrupt line to which the QE I/O Ports controller is =
connected.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#address-cells'
> +  - '#interrupt-cells'
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@c00 {
> +      interrupt-controller;
> +      compatible =3D "fsl,mpc8323-qe-ports-ic";
> +      #address-cells =3D <0>;
> +      #interrupt-cells =3D <1>;
> +      reg =3D <0xc00 0x18>;

Your property order here is kinda wacky, please stick to the documented
order in dts-coding-style.rst.

Otherwise, this seems okay although I think the descriptions for
single-item properties could be removed. With the ordering fixed:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +      interrupts =3D <74 0x8>;
> +      interrupt-parent =3D <&ipic>;
> +    };
> --=20
> 2.49.0
>=20

--r9pc0nvx4F9Bp7Ya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKNdmQAKCRB4tDGHoIJi
0lkOAQD+gYbFPysEZ7FMHkPKOTKu3lQkiuVAYqWebn9qZGxrBQD/cDOIpOlHmXBN
PZXajWao16FHS+SHJLjv/KNc7P6fcAU=
=ZlEM
-----END PGP SIGNATURE-----

--r9pc0nvx4F9Bp7Ya--

