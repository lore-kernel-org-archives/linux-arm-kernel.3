Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501A3C282E5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 17:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vPDi1Ay7jp0BDlAY0A0QECjWaYzMr9Shmsur02Eb9uU=; b=OFIaBPFzqFAnW/sEH05nYHPFOT
	H5eXnnZQlJg/Ivjb65TaljtIqvXtNZUfd0/U7XhFL8OLy5S6unjMsngz9zcSEHmxXZFtYDlqIxy3X
	U+YhYsn1cjY+DuhfjvOTuSCxEWre8FM5acB7kX4wIh1UFsZ+YgM10+N8F6HLm977VbcDjO/gv1CPA
	PEMv9gkPhFpVsHv3Bd4WdXe0V4aKgN/3GYpyWOCrQfrmtNTZ16YME4hldP5HrN07AJdMmclJY5iVU
	FspEkPY+F0u5Iw4vgo50PCZ149Clrv30kR6e9JI5XYcUv1V3lWrMvQpHosH56mt3GXrH1Vc7BwNNh
	bGX+NjLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpscp-00000008o3o-3iwy;
	Wed, 05 Mar 2025 17:33:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpreb-00000008frP-20vz;
	Wed, 05 Mar 2025 16:31:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CFB7DA45B55;
	Wed,  5 Mar 2025 16:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCFF4C4CED1;
	Wed,  5 Mar 2025 16:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741192288;
	bh=mjfercYvHY6XW4hH6LajRSUm1yvoytFiSmictk11u7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PdkYWWY56USlcELtkXOwMTB0B7NndvMTFbHWm5Ez1ffZ0OqyMcPXJw/cZOJ7PvwWQ
	 M7dU8sf4Zuc6QsozhigHmnHDk23XVG4RDTxL+4VJFuNWDjqDgEFxlsC+GDS5cALLVD
	 VRXXDM6ZHQpf+Nl0iLbwdqs4K9ud2YMqVG8V484AYlfl2Zcs38b4WZtkGI8kx4n8Ex
	 zttMpJTanbvdpSEmZoTTnnrPD5LcMiTek6zeT18QEJWDSj+XwLSeXK5fgoc97bcv1U
	 KA9HSh9MhayMoQSl907mwR6zeVrPoSEvAxf0Ove4v0BFWrdq3inptn1Gw+Jjzgbz87
	 KbLsJf+5Ko0Rg==
Date: Wed, 5 Mar 2025 16:31:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Jjian Zhou <jjian.zhou@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jason-ch Chen <jason-ch.chen@mediatek.com>
Subject: Re: [PATCH RFC 3/3] dt-bindings: mailbox: mtk,vcp-mbox: add mtk
 vcp-mbox document
Message-ID: <20250305-chewing-henchman-aea98c18b412@spud>
References: <20250305082047.15746-1-jjian.zhou@mediatek.com>
 <20250305082047.15746-4-jjian.zhou@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wpgFucSmUGsB0HoE"
Content-Disposition: inline
In-Reply-To: <20250305082047.15746-4-jjian.zhou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_083129_646198_51F69396 
X-CRM114-Status: GOOD (  16.71  )
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


--wpgFucSmUGsB0HoE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2025 at 04:20:40PM +0800, Jjian Zhou wrote:
> This patch adds document for mediatek vcp mbox.
>=20
> Signed-off-by: Jjian Zhou <jjian.zhou@mediatek.com>
> ---
>  .../bindings/mailbox/mtk,vcp-mbox.yaml        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,vcp-mbo=
x.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/mtk,vcp-mbox.yaml =
b/Documentation/devicetree/bindings/mailbox/mtk,vcp-mbox.yaml
> new file mode 100644
> index 000000000000..d5afe295af14
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mtk,vcp-mbox.yaml

When you go !RFC, filename matching compatible please.

> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/mtk,vcp-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Video Companion Processor (VCP) mailbox
> +
> +maintainers:
> +  - Jjian Zhou <Jjian.Zhou@mediatek.com>
> +
> +description: |
> +  The MTK VCP mailbox enables the SoC to communicate with the VCP by pas=
sing
> +  messages through 64 32-bit wide registers. It has 32 interrupt vectors=
 in
> +  either direction for signalling purposes.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8196-vcp-mbox
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#mbox-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    vcp_mailbox0: mailbox@31b80000 {

label here is unused, please drop it.

Cheers,
Conor.

> +        compatible =3D "mediatek,mt8196-vcp-mbox";
> +        reg =3D <0x31b80000 0x1000>;
> +        interrupts =3D <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH 0>;
> +        #mbox-cells =3D <0>;
> +    };
> --=20
> 2.45.2
>=20

--wpgFucSmUGsB0HoE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8h8WwAKCRB4tDGHoIJi
0rmzAQDC6tROpS/C3bfqeRalnd+CJF3nrU5drTadY8j4LSJBswD/SAnH+kW5P5Zz
1XAoP++vVC0+C1lqWccMOwxtkJk6nwo=
=N2nw
-----END PGP SIGNATURE-----

--wpgFucSmUGsB0HoE--

