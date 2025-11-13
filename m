Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758B9CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 19:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1g2uAAHBpa9kEgb8BSgIIglW2q6MZ1SvqzZJyZzTtU=; b=k4fAs7BsRQexugQGellOnif7DW
	AdbDv0y7FGGp3vWJ46UcalIwFheCzLpKTusS4JTdtbuNLnVoybG5hwvKlU07Y0qmFCCll7UFDOYsT
	vvhn5Rq1T5Z9dudt478tQ0K25PPVv9k9p4u/fCBxxECK2Sq3p1Utb2y1yH0Mk2OeYZu7ETNsYzJ0U
	GvHeLTuibm5yVZBmgtMpirK9LX5rvz6p8cF6CmAHWFPO6yipOuTzkkmZKjzkI/i2LGi7xX4cJokUg
	yO9WFRaOrfYY2t/c8Ln4XVFX4xLYSDO6SskFUkc+z9KU/ndrLrjzNzNSAmLYc7FrJEVk+aBIx3ZW6
	8ZFbBbfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJd2Q-0000000B0It-0evr;
	Thu, 13 Nov 2025 19:31:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJd2N-0000000B0IM-1Of6;
	Thu, 13 Nov 2025 19:31:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D69444394B;
	Thu, 13 Nov 2025 19:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34FF4C4CEF7;
	Thu, 13 Nov 2025 19:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763062278;
	bh=4LVICd0KpfhD0Pzdd2wqpdM1EZwj2tq855mXd7HvhI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c3cD3WECoEU3p+JUDQrpPxdRrwpS8HLDX3ypV2fdKSoXcGanMP0uBlSnskx7CLuI2
	 3cF1MyiLbt/wANFxAymHtkI/D9am1ChwYYMJWGSSKVcfrnJ9R5OvdLM6eLzwlT8Jj7
	 MlO6ekyWfeDRC0kZjDsLx/r7qSJn/OGZSc4KkhEYNT3ErW8xZzNC083RzQ1e5E2LaY
	 H8O0/g9uv767aCCzMm7F//Isw2qdUmv23Q18VFh2YwGvyIhv2apvgEbLOfUst5k9e2
	 Zicwd8itwzZBUssBoySUie1iY609vWNh/B+bulaEjyFRQeFJ3McBPRqmW4uLXCnVap
	 90p67wrlUKqnA==
Date: Thu, 13 Nov 2025 19:31:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: afaerber@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, lee@kernel.org, james.tai@realtek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cy.huang@realtek.com,
	stanley_chang@realtek.com
Subject: Re: [PATCH v2 2/3] dt-bindings: mfd: Add Realtek MISC system
 controller
Message-ID: <20251113-ritzy-excluding-e2067916896e@spud>
References: <20251113123009.26568-1-eleanor.lin@realtek.com>
 <20251113123009.26568-3-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dsTS7ISgoTlpn0Pw"
Content-Disposition: inline
In-Reply-To: <20251113123009.26568-3-eleanor.lin@realtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_113119_417520_3B98406D 
X-CRM114-Status: GOOD (  15.84  )
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


--dsTS7ISgoTlpn0Pw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 08:30:08PM +0800, Yu-Chun Lin wrote:
> Add DT binding schema for Realtek system controller.
>=20
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  .../devicetree/bindings/mfd/realtek,misc.yaml | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/realtek,misc.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/realtek,misc.yaml b/Do=
cumentation/devicetree/bindings/mfd/realtek,misc.yaml
> new file mode 100644
> index 000000000000..4f4a9ae250be
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/realtek,misc.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/realtek,misc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek MISC System Controller
> +
> +description:
> +  The Realtek MISC System Controller is a register area that contains
> +  miscellaneous system registers for the SoC and serves as a parent node
> +  for other functions.
> +
> +maintainers:
> +  - James Tai <james.tai@realtek.com>
> +  - Yu-Chun Lin <eleanor.lin@realtek.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - realtek,misc

You need a soc-specific compatible. It's hard to believe that every
realtek device will have the exact same miscellaneous register region ;)

> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  ranges:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +patternProperties:
> +  "^serial@[0-9a-f]+$":
> +    type: object
> +    description: UART controllers inside MISC area

How many of these actually are there?
If they're always dw uarts, please add a reference to that schema.

pw-bot: changes-requested

> +
> +required:
> +  - compatible
> +  - reg
> +  - ranges
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    syscon@7000 {
> +        compatible =3D "realtek,misc", "syscon", "simple-mfd";
> +        reg =3D <0x7000 0x1000>;
> +        ranges =3D <0x0 0x7000 0x1000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        uart0: serial@800 {
> +            compatible =3D "snps,dw-apb-uart";
> +            reg =3D <0x800 0x100>;
> +            clock-frequency =3D <432000000>;
> +            interrupts =3D <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> +            reg-io-width =3D <4>;
> +            reg-shift =3D <2>;
> +            status =3D "disabled";
> +        };
> +    };
> --=20
> 2.34.1
>=20

--dsTS7ISgoTlpn0Pw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRYyAQAKCRB4tDGHoIJi
0sgSAPkBwiptGwn86Ek/pm/Ba4xc+bKRJIdGKyrtJXrD9gKCAwEAiyjueLUkfRPc
m+DBjvBVNZdVUzIQ5KSvtJblfGLUqAw=
=75Qu
-----END PGP SIGNATURE-----

--dsTS7ISgoTlpn0Pw--

