Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CA6C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 17:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKrq8RHcos0jhV5m+r54eMDE6Qo9xkFYYEcktoCk1RE=; b=BZ1Yey3SB5h1IPWGcJy/yWDlIZ
	2kTDSChz4mvLgSVrFCeI0RfF/+X8+SG+RuvtS6bXQ8r/RhxJc8ttF68bhqkDUjsIBTVezrwD6Z16R
	TeCcO+tv49HZ3EL5tznuuozQr4M3h2ZPRVl8u2qpFAuvMBipp0iovtjZkuRH1qb+xTK23g8Dyrosr
	hzfcChgfnD+FDLxdQC0p3jAodSMIF1Io0iAgkQIzhZ/ScStbgfr6byKO6JU7EKBe8YFcE4qJhZmfN
	wpl64xPkaBn4pDhpcsfII0gMj14sKwekPBR9ju/s0fuY4B2lxQTz+5CHrm2N9ihp+PuSjKgKUJFfb
	JeJnzsdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgll-00000004rHL-4BzE;
	Mon, 09 Jun 2025 17:58:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfiO-00000004j7K-07py;
	Mon, 09 Jun 2025 16:51:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 527CA61137;
	Mon,  9 Jun 2025 16:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8CEBC4CEEB;
	Mon,  9 Jun 2025 16:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749487875;
	bh=J/wylyJBSAScDQUJw/zDYET2lTL47mjtpTQjkyteLQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u5r97JiwYDZa4ls6z2jIQEW2MxkhwJfHKemvYoo983wJVF+y14yLbvOG8Cr2vw0Gi
	 BC4Q+y8s73xWh+oXW2zeLAVckjuSxM8urn9R3V2DNYrgw3C0xVsJL5IAeEH0fQF+62
	 DV0mOzVfj6epWGh65sBsutvM7MZYKGnwDuH6+jy3GixFFP0/2Bz5HycTQ12d0Kz24C
	 IY/V+q4vBoM7kn1yaawj3nQeluIEpgsBVQSAMfCTGDBoJTKSuS0ZsoWfS6qXE6VTy0
	 CVLZpjPIh4PaClGDJcuvuOX00nvCGgSo8DaaGjIFBTM4tvs9odK/NNFRAemtNh+w6o
	 MF7oZoG0Fo2cA==
Date: Mon, 9 Jun 2025 17:51:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: phy: airoha: Document support for
 AN7583 PCIe PHY
Message-ID: <20250609-shifty-dingbat-31aa70d7d7b1@spud>
References: <20250606192208.26465-1-ansuelsmth@gmail.com>
 <20250606192208.26465-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SBK47IYpTz9XKfGh"
Content-Disposition: inline
In-Reply-To: <20250606192208.26465-4-ansuelsmth@gmail.com>
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


--SBK47IYpTz9XKfGh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 06, 2025 at 09:22:04PM +0200, Christian Marangi wrote:
> Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
> work. Add the rwquired register to configure the PCIe PHY and provide an
> example for it.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/phy/airoha,an7583-pcie-phy.yaml  | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-p=
cie-phy.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy=
=2Eyaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml
> new file mode 100644
> index 000000000000..93252092c2e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN7583 PCI-Express PHY
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description:
> +  The PCIe PHY supports physical layer functionality for PCIe Gen2/Gen3 =
port.
> +
> +properties:
> +  compatible:
> +    const: airoha,an7583-pcie-phy
> +
> +  reg:
> +    items:
> +      - description: PCIE G3 analog base address
> +      - description: PCIE G3 PMA base address
> +      - description: PCIE QPhy analog base address
> +      - description: PCIE QPhy PMA base address
> +      - description: PCIE QPhy diagnostic base address
> +      - description: PCIE detection time base address
> +      - description: PCIE Rx AEQ base address
> +
> +  reg-names:
> +    items:
> +      - const: g3-ana
> +      - const: g3-pma
> +      - const: qp-ana
> +      - const: qp-pma
> +      - const: qp-dig
> +      - const: xr-dtime
> +      - const: rx-aeq
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/phy/phy.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        phy@11e80000 {
> +            compatible =3D "airoha,an7583-pcie-phy";
> +            #phy-cells =3D <0>;
> +            reg =3D <0x0 0x1fc7f000 0x0 0xfff>,
> +                  <0x0 0x1fc7e000 0x0 0xfff>,
> +                  <0x0 0x1fa5f000 0x0 0xff>,
> +                  <0x0 0x1fa5e000 0x0 0x8ff>,
> +                  <0x0 0x1fa5a000 0x0 0x3ff>,
> +                  <0x0 0x1fc30044 0x0 0x4>,
> +                  <0x0 0x1fc35030 0x0 0x4>;

Can you explain please why you have so many reg regions, some of which
are directly beside one another? Why is one (or more) larger region(s)
not viable here? Are some of these coming from a syscon that is not
modelled or are there other devices sharing in between?

> +            reg-names =3D "g3-ana", "g3-pma",
> +                        "qp-ana", "qp-pma", "qp-dig",
> +                        "xr-dtime", "rx-aeq";
> +        };
> +    };
> --=20
> 2.48.1
>=20

--SBK47IYpTz9XKfGh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcQ/gAKCRB4tDGHoIJi
0ghNAQDZVXyszTnaj2++b9YWhPi1v53MjfsCLhjAXHcqmT9OjQEAqFEmC+q6raBs
Ba9H2LAeRmFNXpoclo2Ls0FOBRskgg4=
=0D7n
-----END PGP SIGNATURE-----

--SBK47IYpTz9XKfGh--

