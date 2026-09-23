Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51116C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUHuqGEWOOeL/Scqhd6mGhvk6nURogoQs+2z9NAzpcY=; b=TNW2V893L8Nz8/HBwHPLm5kgQl
	Pa+PRtjUTOP60/u+qn5aGaPfaWhQnzrje/mdPaMSMvz5ajcsHMQYeiocxtIZtn6yZkiCmC/GfBxUB
	W1OQc8TLySCXnInfydee6p8iRnbz+KZRmkHitp38f89ovxnTGYNdAUi2ihgyowMs7JFwBAChi2myN
	ctrm1qIf1DkDvkHkpkr4S490CkKaYEJSvEdIv72LDUVTNlAkuf8TwZn4uKRTp5jqNMoZXPnXVZeRT
	H0zQY9Dm+5K1WcnZRp2uwwahiZBLSOIswn8NRy5cKMa2XHh3TOQh4FLdrtfS8qJpMIM4gu+coNf+P
	BA33ZE1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Q4D-00000008uUE-3cYo;
	Wed, 23 Sep 2026 16:43:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Q2X-00000008u5l-3T6k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 16:41:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E32F401EC;
	Wed, 23 Sep 2026 16:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132D91F000FF;
	Wed, 23 Sep 2026 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790181709;
	bh=DUHuqGEWOOeL/Scqhd6mGhvk6nURogoQs+2z9NAzpcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fufJ+aIXbklBpgPFeTiHKgZ4SP61lqR5+OXDRzftNF/yQQvtTZOQMwGo/6ROkFxsU
	 ohyBPHQ26vexHvwDjsxe4ZPjWToS6/ch+38DTetWWvjwI9KrGTUMDi9cednUJ3YjdX
	 7YD9dagHjzsgTvRDNcCgEqYwC29bn0l5WpB3LX3mpLpC+jGn5KyFd9btlF2wWOduuY
	 jFmr9z5XIdjxg74SQTtqYIUu2j5IMfrBTCXZgNjJw00z2xG9MVWQoYeDTyVoBkvux8
	 BsOV1l+LMPaJedGBYwDsIO3iF/AzBnOsdiFgnq2367EM8ZGCPHwcIfrXN5hlfyl+U8
	 UwgD7VWTk/YXA==
Date: Wed, 23 Sep 2026 17:41:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Tushar Nimkar <tushar.nimkar@amd.com>
Cc: Anirudha Sarangi <anirudha.sarangi@amd.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, git@amd.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: interrupt-controller: Add Xilinx
 Versal NET SMMU CSR
Message-ID: <20260923-grafted-undergrad-9356739dd2b5@spud>
References: <20260923-smmu-changes-v2-v3-0-87bd09ba9605@amd.com>
 <20260923-smmu-changes-v2-v3-1-87bd09ba9605@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S144mpyO4atM9GmT"
Content-Disposition: inline
In-Reply-To: <20260923-smmu-changes-v2-v3-1-87bd09ba9605@amd.com>
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

--S144mpyO4atM9GmT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 12:46:31PM +0530, Tushar Nimkar wrote:
> From: Anirudha Sarangi <anirudha.sarangi@amd.com>
>=20
> Add a device tree binding schema for the Xilinx Versal NET SMMU CSR
> (Control and Status Register) interrupt controller.

This sounds like a very odd name for an interrupt controller.
What else does this block do?

You've actually got a 0x1000 carve out in the example, starting at a
round number, so I suspect this is "fine" and if there's other features
required later you've not painted yourself into a corner by defining a
device for one register. The driver having a starting offset of 0x24 is
another point in your favour.

I'm inclined to ack this, I just want to see an answer first.

Cheers,
Conor.
>=20
> The SMMU CSR block acts as a vendor-specific interrupt controller
> in front of the ARM SMMUv3, providing registers to enable and clear
> standard SMMU interrupts such as EVENTQ, CMDQ_SYNC, GERROR and PRIQ.
> Interrupts must be acknowledged in this block before being forwarded
> to the parent interrupt controller (e.g. GIC).
>=20
> Signed-off-by: Anirudha Sarangi <anirudha.sarangi@amd.com>
> Co-developed-by: Tushar Nimkar <tushar.nimkar@amd.com>
> Signed-off-by: Tushar Nimkar <tushar.nimkar@amd.com>
> ---
>  .../xlnx,versal-net-smmu-csr.yaml                  | 75 ++++++++++++++++=
++++++
>  1 file changed, 75 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/xlnx,=
versal-net-smmu-csr.yaml b/Documentation/devicetree/bindings/interrupt-cont=
roller/xlnx,versal-net-smmu-csr.yaml
> new file mode 100644
> index 000000000000..38b63e51b732
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-=
net-smmu-csr.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/xlnx,versal-net-=
smmu-csr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx Versal NET SMMU CSR Interrupt Controller
> +
> +maintainers:
> +  - Anirudha Sarangi <anirudha.sarangi@amd.com>
> +  - Tushar Nimkar <tushar.nimkar@amd.com>
> +
> +description: |
> +  The Versal NET platform includes a Xilinx-specific SMMU CSR (Control a=
nd
> +  Status Register) block that acts as an intermediate interrupt controll=
er
> +  for ARM SMMUv3.
> +
> +  The block provides registers to enable, disable and clear the
> +  standard SMMUv3 interrupt sources (EVENTQ, CMDQ_SYNC, GERROR and PRIQ)
> +  before forwarding them to the parent interrupt controller,
> +  typically a GIC.
> +
> +  The controller receives one parent interrupt and demultiplexes CSR
> +  status bits into the following child interrupt identifiers
> +    0 - EVENTQ
> +    1 - CMDQ_SYNC
> +    2 - GERROR (GLOBAL)
> +    3 - PRIQ
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: xlnx,versal-net-smmu-csr
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 1
> +    description: |
> +     Single cell containing the child interrupt identifier
> +      0 - EVENTQ
> +      1 - CMDQ_SYNC
> +      2 - GERROR (GLOBAL)
> +      3 - PRIQ
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    interrupt-controller@eca10000 {
> +        compatible =3D "xlnx,versal-net-smmu-csr";
> +        reg =3D <0xeca10000 0x1000>;
> +        interrupt-controller;
> +        #interrupt-cells =3D <1>;
> +        interrupt-parent =3D <&gic>;
> +        interrupts =3D <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
> +    };
>=20
> --=20
> 2.34.1
>=20

--S144mpyO4atM9GmT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarQBSAAKCRB4tDGHoIJi
0gnoAPoD3niCRrEz3R9dI5MIGi63vf8m0m0eKQOF+5uIjSSbigEA7r8IYj1Yc3b2
vwFXT9PUkBcVaflI98VTHUvDvvDP3w8=
=Qk+h
-----END PGP SIGNATURE-----

--S144mpyO4atM9GmT--

