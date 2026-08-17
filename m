Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF415C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 08:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVcnnxhAC6ik9HBcZiHCZjTu6N1T9t0ootidNbFO/U0=; b=bAdwk0GTkwLjkSBhxy706voJay
	IbftoYTU1PHvyv+mTV1WVg3SdFgfkXMq5umTJVn+t/HXoB4CX5mZnD9D9iKNZTnuSHxcP6ixmRRQb
	kzZrt369VjOCfU7IOOpfff27C3MHvS2fUZSL3BL2fFISnqffAc7wXM8ZeLcABCAg5put15oWe/oWS
	NGwXk9QxS/u8WPXjx0yB12vUcQImsJJzLsW0fYtcStfs35Fj+9kVC8UGOPAEg9F6M8+gVkVa2HgDm
	5aMcXXVWc5X7gOFCxS7vJcpUdKfcXDtgMVGcCEcleiQbv9OR5Xd59HTy30NtDyc5oSpqwl3fkq5xy
	FbpRp1yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsV4-00000005dgz-1uhk;
	Mon, 17 Aug 2026 08:15:18 +0000
Received: from out-135.mta0.migadu.com ([2001:41d0:1004:224b::87] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsUz-00000005dfo-3ir1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 08:15:17 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=C0O0F0T5Khr4i9evrKR9qQ1b3ukNc51FfJbV+j3oy3Q=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786954510; v=1; x=1787559310;
 b=hhVhQJO6LkgnZbGnPrn8ZOEQmZ7vWhS+ZVrfUmUxrqh+qv0Lrw3p1WOmQTwfA3WY2wTf5SBI
 0tDB9rb2tHUdFs9DxdaIjJJiMseOo/TUH43zMy4zDmw1i8uKCuhHLYknSM1JWHe94JQi4ZJRJOl
 y7DSQa1EYuOWLuLa5i3Yz4UuPqb4mxRmshbPhrWy2sBSremdXLazCLaAGqrt1wul74Ls8UgjAtQ
 FJ4oOXzu1Jy8RBfSiUyvZ2ZovLXnBlMoKdC6erXOqhkS5UNWGDOJMEIg1TMH8bEd6GJ/N3O0lsO
 95LPnVzzotiEKHIhkkGTkzVOYwfef25S4fEIDjh5vtdNg==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from localhost (92.254.112.55)
	by smtp.migadu.com with ESMTPS id 54f7be6b0ec37d4f;
	Mon, 17 Aug 2026 08:15:00 +0000
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 10:14:58 +0200
Message-Id: <DKR2I3X521F8.J6H7KW07GDD0@cknow-tech.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: crypto: rockchip: Add RK356x/RK3588
 crypto engine binding
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Dawid Olesinski" <dawidro@gmail.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
Cc: "Diederik de Haas" <diederik@cknow-tech.com>, "Eric Biggers"
 <ebiggers@kernel.org>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Conor Dooley" <conor+dt@kernel.org>, "Corentin
 Labbe" <clabbe@baylibre.com>, <linux-crypto@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <20260816194112.552100-1-dawidro@gmail.com>
 <20260816194112.552100-2-dawidro@gmail.com>
In-Reply-To: <20260816194112.552100-2-dawidro@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_011515_058297_9AA592CF 
X-CRM114-Status: GOOD (  17.05  )
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

Hi Dawid,

On Sun Aug 16, 2026 at 9:39 PM CEST, Dawid Olesinski wrote:
> Add a YAML device tree binding for the Rockchip second-generation (V2)
> cryptographic hardware accelerator present on the RK3568 and RK3588 SoCs.
>
> The IP block exposes AES-ECB, AES-CBC, AES-XTS block ciphers, SHA-1,
> SHA-224, SHA-256, SHA-384, SHA-512, MD5, and SM3 hash algorithms, each
> with a hardware DMA engine controlled via linked-list descriptors.
>
> The binding covers two compatible strings:
>
>   - rockchip,rk3568-crypto: clocks and resets are driven directly by the
>     non-secure CRU (accessible to Linux at EL1).
>   - rockchip,rk3588-crypto: clocks and resets live in SECURECRU, a
>     register bank sandboxed to TrustZone. Linux must request them through
>     the ARM SCMI firmware interface (scmi_clk / scmi_reset), as direct
>     MMIO access to SECURECRU from EL1 triggers a bus fault.
>
> Co-developed-by: Corentin Labbe <clabbe@baylibre.com>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> Signed-off-by: Dawid Olesinski <dawidro@gmail.com>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Quartz64-B,
> NanoPi R5S, NanoPC-T6 LTS

AFAIK these lines should not have a line break, ie must be on one line.

Cheers,
  Diederik

> ---
>  .../crypto/rockchip,rk3588-crypto.yaml        | 83 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +
>  2 files changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/rockchip,rk3=
588-crypto.yaml
>
> diff --git a/Documentation/devicetree/bindings/crypto/rockchip,rk3588-cry=
pto.yaml b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.=
yaml
> new file mode 100644
> index 000000000000..32d241c19453
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yam=
l
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/rockchip,rk3588-crypto.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip cryptographic offloader
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +  - Corentin Labbe <clabbe@baylibre.com>
> +  - Dawid Olesinski <dawidro@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: rockchip,rk3568-crypto
> +      - items:
> +          - enum:
> +              - rockchip,rk3588-crypto
> +          - const: rockchip,rk3568-crypto
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Core clock for the crypto IP internal logic
> +      - description: AXI interconnect clock interface
> +      - description: AHB interface clock
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: aclk
> +      - const: hclk
> +
> +  resets:
> +    minItems: 1
> +    maxItems: 3
> +
> +  reset-names:
> +    minItems: 1
> +    items:
> +      - const: core
> +      - const: aclk
> +      - const: hclk
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +
> +    bus {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      crypto@fe370000 {
> +        compatible =3D "rockchip,rk3588-crypto", "rockchip,rk3568-crypto=
";
> +        reg =3D <0x0 0xfe370000 0x0 0x2000>;
> +        interrupts =3D <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks =3D <&scmi_clk SCMI_CRYPTO_CORE>, <&scmi_clk SCMI_ACLK_SE=
CURE_NS>,
> +                 <&scmi_clk SCMI_HCLK_SECURE_NS>;
> +        clock-names =3D "core", "aclk", "hclk";
> +        resets =3D <&scmi_reset SCMI_SRST_CRYPTO_CORE>;
> +        reset-names =3D "core";
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c8d4b913f26c..50b77a750db3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23131,9 +23131,11 @@ F:	drivers/media/platform/rockchip/rkcif/
> =20
>  ROCKCHIP CRYPTO DRIVERS
>  M:	Corentin Labbe <clabbe@baylibre.com>
> +M:	Dawid Olesinski <dawidro@gmail.com>
>  L:	linux-crypto@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/crypto/rockchip,rk3288-crypto.yaml
> +F:	Documentation/devicetree/bindings/crypto/rockchip,rk3588-crypto.yaml
>  F:	drivers/crypto/rockchip/
> =20
>  ROCKCHIP I2S TDM DRIVER



