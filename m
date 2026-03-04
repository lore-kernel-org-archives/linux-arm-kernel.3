Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94C8EB7EAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkMYwkNSiGtDPUi1WZOI6Yu1/NtIpt5k3EIXGbXTmvg=; b=dMquDfwgWMlxLTIIPs0avJYyVd
	2U84mB9h6k/Iw77wA6lGIZscRmPPW3zHxb70rI9o9u4uy9Df4EoAI+zI0dyDkOdbCX2QuQAxnzWQq
	S4q0sxsRsTm2Gs5yYRr6031fmHaG0Dvyb+gtMbAeXV2lZ4rOd9uX4x1I8tZ9L+VjW1UnywzeAi/qL
	XT/IO8atcYWpS05uCnZcc/8iy/wGlSGAdz4vpZwlQpCeyAthSgmARo/Q51CTt1VhXeQlm7r5HBCLE
	C6r38Vk2VhWryxNEXKpTYrJyMsCcFhZi42slrPzyBXTLSEAPsdJ+ENfav7ckfVkPM8Oz2BbtV5B47
	ZOhSTNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhlc-0000000GlJX-0qrY;
	Wed, 04 Mar 2026 08:39:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhlY-0000000GlIo-3z5l;
	Wed, 04 Mar 2026 08:39:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D6649417F6;
	Wed,  4 Mar 2026 08:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31FECC19425;
	Wed,  4 Mar 2026 08:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772613575;
	bh=BW1MAMlh/nk9MxeyiUabogHzZOl5p0qUa7BasAromto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfR5j+GgtqBCJg9fn4WlhlRXNMZoren5zEMp9IawERa7OzBlNPqY3ntehvva1btFW
	 8xsJbUsmmWUhHnyf+jBxr2ja0Z8XZPiZal3Ylk/3mOuZJejvLg3d75YRVyKtZdprcg
	 du8ajEQ+Ke7oW16KjYjfs9lxtrhRAWfHdC2W7FfL0ikdn7SSR3xv6tA9gxGOn+61Uc
	 aJoEXQO1hg25LbX54rzdUD9KMQBbAsnJUoTM2OgDHwScrid+WkGTn1iv8KsLAC7UNK
	 PXbWKWLa+44L3myxtKVDYzc3noL5tTlb/+Kj7FWnBEPU6Tksq/+2cPWi+vHz59pIZ2
	 X/LjKrskKwZJA==
Date: Wed, 4 Mar 2026 09:39:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tsbogend@alpha.franken.de, ryder.lee@mediatek.com, 
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	bhelgaas@google.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	p.zabel@pengutronix.de, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	nbd@nbd.name, ansuelsmth@gmail.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] dt-bindings: clock, reset: Add econet EN751221
 bindings
Message-ID: <20260304-accomplished-helpful-orca-5d6b81@quoll>
References: <20260303190948.694783-1-cjd@cjdns.fr>
 <20260303190948.694783-2-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260303190948.694783-2-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_003937_120882_4D7765A1 
X-CRM114-Status: GOOD (  20.74  )
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

On Tue, Mar 03, 2026 at 07:09:41PM +0000, Caleb James DeLisle wrote:
> Add clock and reset bindings for EN751221 as well as
> a "chip-scu" which is an additional regmap that is used
> by the clock driver as well as others. This split of the
> SCU across two register areas is the same as the Airoha
> AN758x family.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../bindings/clock/airoha,en7523-scu.yaml     | 19 ++++++-
>  .../mips/econet,en751221-chip-scu.yaml        | 41 ++++++++++++++++
>  MAINTAINERS                                   |  3 ++
>  .../dt-bindings/clock/econet,en751221-scu.h   | 15 ++++++
>  .../dt-bindings/reset/econet,en751221-scu.h   | 49 +++++++++++++++++++
>  5 files changed, 126 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml
>  create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
>  create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index a8471367175b..e60e54273393 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> @@ -32,6 +32,7 @@ properties:
>        - enum:
>            - airoha,en7523-scu
>            - airoha,en7581-scu
> +          - econet,en751221-scu
>  
>    reg:
>      items:
> @@ -67,7 +68,10 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          const: airoha,en7581-scu
> +          items:

Drop items, it's just enum

> +            - enum:
> +                - airoha,en7581-scu
> +                - econet,en751221-scu
>      then:
>        properties:
>          reg:
> @@ -98,3 +102,16 @@ examples:
>                #reset-cells = <1>;
>        };
>      };
> +
> +  - |
> +    soc {
> +      #address-cells = <1>;
> +      #size-cells = <1>;

No need for new example, especially without any differences. You already
have there two.

> +
> +      scuclk2: clock-controller@1fb00000 {
> +        compatible = "econet,en751221-scu";
> +        reg = <0x1fb00000 0x970>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml b/Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml
> new file mode 100644
> index 000000000000..7c7c8cf8d2a5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/econet,en751221-chip-scu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: EcoNet Chip SCU Controller for EN751221 SoC
> +
> +maintainers:
> +  - Caleb James DeLisle <cjd@cjdns.fr>
> +
> +description:
> +  The EcoNet chip-scu block provides a configuration interface for clock,
> +  io-muxing and other functionalities used by multiple controllers (e.g. clock,
> +  pinctrl, ecc) on EN751221 SoC.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: econet,en751221-chip-scu
> +      - const: syscon

And it does not fit existing syscon bindings file, because ... ?

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      syscon@1fa20000 {
> +        compatible = "econet,en751221-chip-scu", "syscon";
> +        reg = <0x1fa20000 0x388>;
> +      };
> +    };

...

> +
> +#define EN751221_MAX_CLKS	6

Drop, not a binding.

> +
> +#endif /* _DT_BINDINGS_CLOCK_ECONET_EN751221_SCU_H_ */
> diff --git a/include/dt-bindings/reset/econet,en751221-scu.h b/include/dt-bindings/reset/econet,en751221-scu.h
> new file mode 100644

Best regards,
Krzysztof


