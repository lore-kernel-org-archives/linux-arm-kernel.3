Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9776CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 16:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrqIXGDx98ujwPU/kKGerqfwnReSV56Yc/5SvP5eyQM=; b=oFyw0tVklaBoyOegmayWWHVXMI
	DUK28XhMOT8XO68aGQdEKs6lZuS0VA0JYi3wLGU1uuNSiF/P2uJbq4jPHgbsvKtTFLg9Irj87w2V4
	QXcBEnaJLZgV9lvKvfJEr28yE8drlIW6wb7Ie8rKT/TKumpadhHqlQ+L0TFybmzGXEtNG0HIPrVY0
	hzxiFqwOEcGVwZpXrSjFJQZb1urQ8hnMwNZajxBG/ESY45bXHblXvAibpp4nPjzKOBX1RMoopxr0N
	ruWAlRQMq5pzBOYkdnzasnmAQyBtXs1Hd/NvakkGELcT35s/snij97nLHzJk+ARNeL83n/nimHJOo
	XmDB87nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKYb-00000009xH4-2P9c;
	Fri, 24 Oct 2025 16:22:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKYY-00000009xGG-311O;
	Fri, 24 Oct 2025 16:22:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F63D43586;
	Fri, 24 Oct 2025 16:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D756FC4CEF1;
	Fri, 24 Oct 2025 16:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761322942;
	bh=Zpj0S9WlD9iwACSCKzt192WwYeTxAcEXiUm4xIx1l8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C14ROYCB3rxkIuXWxj9KaihCI0S3Q55HPeCbwzCfG2TdN6dGGimLB6rOm8D88UAFA
	 SliCh4L9PU1qhcI8+jPetpES5sp6adRnE24YiqCvQF6nnJGau7q99puV4HjyXSQYDS
	 LHKTufDVyxL+uVg+VbaS/enRUfWA1PdNNTsQoASyxj5RLQoIO73gu+TOi8OMViRTTy
	 a/jkDBYYpHj+MsqqTYbZzlHiXdkuGGfNexb+L9ZUszN1YEKKBctX2EKE8FE5MkfPLK
	 js66eEoCoBHXoU41/ff0j5VIqBSsJIYGWsFS2lRHzFj8gNX6P4vZEf9Lw//udPyhwL
	 kTmTJPo4NjBuQ==
Date: Fri, 24 Oct 2025 17:22:17 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 1/2] dt-bindings: rtc: Add MediaTek MT6685 PM/Clock IC
 Real Time Clock
Message-ID: <20251024-unleash-slouchy-ef6903088ffe@spud>
References: <20251024083318.25890-1-angelogioacchino.delregno@collabora.com>
 <20251024083318.25890-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xCs6VJHSU/yRmWkV"
Content-Disposition: inline
In-Reply-To: <20251024083318.25890-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_092222_818144_C6C558F2 
X-CRM114-Status: GOOD (  18.32  )
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


--xCs6VJHSU/yRmWkV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 10:33:17AM +0200, AngeloGioacchino Del Regno wrote:
> The MediaTek MT6685 PM / Clock IC contains various SPMI sub
> devices, of which two are Real Time Clock IPs, one usually
> reserved for the secure world and one for the unsecured one,
> reachable at different SPMI addresses.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>=20
> NOTE: This does not contain any example because the MT6685 RTC
>       will be added to the mfd binding for MediaTek SPMI PMICs
>       and examples will be there.

Were it not for this mfd stuff, could easily go in trivial-rtc.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>=20
> ** For reviewing purposes, this is how the example will look like: **
>=20
>   - |
>     #include <dt-bindings/interrupt-controller/irq.h>
>     #include <dt-bindings/spmi/spmi.h>
>=20
>     spmi {
>       #address-cells =3D <2>;
>       #size-cells =3D <0>;
>=20
>       pmic@9 {
>         compatible =3D "mediatek,mt6363";
>         reg =3D <0x9 SPMI_USID>;
>         interrupts =3D <9 1 IRQ_TYPE_LEVEL_HIGH>;
>         interrupt-controller;
>         #address-cells =3D <1>;
>         #interrupt-cells =3D <3>;
>         #size-cells =3D <0>;
>=20
>         clock-controller@514 {
>           compatible =3D "mediatek,mt6685-sck-top";
>           reg =3D <0x514>;
>           #clock-cells =3D <1>;
>         };
>=20
>         rtc@580 {
>           compatible =3D "mediatek,mt6685-rtc";
>           reg =3D <0x580>;
>           interrupts =3D <9 0 IRQ_TYPE_LEVEL_HIGH>;
>         };
>       };
>     };
>=20
>  .../bindings/rtc/mediatek,mt6685-rtc.yaml     | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/mediatek,mt6685=
-rtc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt6685-rtc.ya=
ml b/Documentation/devicetree/bindings/rtc/mediatek,mt6685-rtc.yaml
> new file mode 100644
> index 000000000000..1aec163b251a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/mediatek,mt6685-rtc.yaml
> @@ -0,0 +1,33 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/mediatek,mt6685-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6685 PM/Clock IC Real Time Clock
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6685-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> --=20
> 2.51.1
>=20

--xCs6VJHSU/yRmWkV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPunuQAKCRB4tDGHoIJi
0gAfAP4t8xpDdCTwJAnCsCY9dXmNmwwjQsHDr5SYXcCYPhhh6QD+Lc/9iY5UTGdo
YORX4SKxcq2wTSy8P4o9MdVtRdYbkQI=
=Bt/B
-----END PGP SIGNATURE-----

--xCs6VJHSU/yRmWkV--

