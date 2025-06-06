Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF1AC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 02:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDdlPdq69a7nPFc9C5e9QFJIdC8LMpCc/hzD2tHJwF4=; b=b4j+viR43seyFPOlWVwg+zs1l6
	cWjxBkbqkKmvy0tERIk0k1OhZl7c6n7WiDq89gEyl5lzJ//fFx7fD+GALzolD7+3i3zU4us/kB8Cd
	XfXylduVwmM7jLxn2TiRDkxY0lA3gl25cISu+4US1zXS4Z7KY/Ymst6GJ2cHm/D2IOylIMjSSzzlc
	Y1Hly8XkeC6aAA6PgnQPPPcezf7cnuUW5vUbPjBFSgby62djA6AEZyG4I3YCBa1HgltMZOE7IAiXX
	ZKqwoXaKe9gaSSxk0kt9094w/JX/CQzKjYQHA1DfH4qhW7a73aauHWEDMvA66mLiXaW5okigqGaDY
	mbhTQLeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNMfp-0000000Gxg3-3sza;
	Fri, 06 Jun 2025 02:19:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNMYp-0000000Gx8a-1PSt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 02:12:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05F3B482A8;
	Fri,  6 Jun 2025 02:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98B8C4CEE7;
	Fri,  6 Jun 2025 02:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749175918;
	bh=G0NA9QukdyKS4fk2n1Yl/YyeZJx+qnKUTJAd9JdBjK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TKZuavQnWCXtl7BTKihWvG8j/Lfe6N4iWrK7+Jze+SRinKdAv/HpDxvMLrsxz8GX5
	 YdA1sYlRtP0txd1nX5Gobn7XM9xlMxMkSNGSFebRm6oQxeVpj4emNA1dfZRDtPrnCa
	 mfoEUxeBoiMKd0p4W8BKWf9RmZxZEXhFXVRvBpwaN7wUM/7myPvTa9wAQK3n5I/P6g
	 fSY7NCGOfJNaur8NcvS4RL6J8x2Bm6s8Vd30o6CmEzNGgrfJ8rM1VBRqjz/FCJWf4a
	 8OAbRoa01AwKrwAK4rT2CNh6LJxRV44azNZ0Bps/uFlqf8Cqqk1+7EhXN9nOgkBVbI
	 nBcI1+HX66UCQ==
Date: Thu, 5 Jun 2025 21:11:56 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	imx@lists.linux.dev, wahrenst@gmx.net
Subject: Re: [PATCH v2 1/1] dt-bindings: ieee802154: Convert at86rf230.txt
 yaml format
Message-ID: <20250606021156.GA3780713-robh@kernel.org>
References: <20250602151601.948874-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151601.948874-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_191159_424234_AEE61234 
X-CRM114-Status: GOOD (  20.07  )
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

On Mon, Jun 02, 2025 at 11:15:58AM -0400, Frank Li wrote:
> Convert at86rf230.txt yaml format.
> 
> Additional changes:
> - Add ref to spi-peripheral-props.yaml.
> - Add parent spi node in examples.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - xtal-trim to uint8
> ---
>  .../bindings/net/ieee802154/at86rf230.txt     | 27 --------
>  .../net/ieee802154/atmel,at86rf233.yaml       | 65 +++++++++++++++++++
>  2 files changed, 65 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/ieee802154/at86rf230.txt
>  create mode 100644 Documentation/devicetree/bindings/net/ieee802154/atmel,at86rf233.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/ieee802154/at86rf230.txt b/Documentation/devicetree/bindings/net/ieee802154/at86rf230.txt
> deleted file mode 100644
> index 168f1be509126..0000000000000
> --- a/Documentation/devicetree/bindings/net/ieee802154/at86rf230.txt
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -* AT86RF230 IEEE 802.15.4 *
> -
> -Required properties:
> -  - compatible:		should be "atmel,at86rf230", "atmel,at86rf231",
> -			"atmel,at86rf233" or "atmel,at86rf212"
> -  - spi-max-frequency:	maximal bus speed, should be set to 7500000 depends
> -			sync or async operation mode
> -  - reg:		the chipselect index
> -  - interrupts:		the interrupt generated by the device. Non high-level
> -			can occur deadlocks while handling isr.
> -
> -Optional properties:
> -  - reset-gpio:		GPIO spec for the rstn pin
> -  - sleep-gpio:		GPIO spec for the slp_tr pin
> -  - xtal-trim:		u8 value for fine tuning the internal capacitance
> -			arrays of xtal pins: 0 = +0 pF, 0xf = +4.5 pF
> -
> -Example:
> -
> -	at86rf231@0 {
> -		compatible = "atmel,at86rf231";
> -		spi-max-frequency = <7500000>;
> -		reg = <0>;
> -		interrupts = <19 4>;
> -		interrupt-parent = <&gpio3>;
> -		xtal-trim = /bits/ 8 <0x06>;
> -	};
> diff --git a/Documentation/devicetree/bindings/net/ieee802154/atmel,at86rf233.yaml b/Documentation/devicetree/bindings/net/ieee802154/atmel,at86rf233.yaml
> new file mode 100644
> index 0000000000000..d84e05c133710
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ieee802154/atmel,at86rf233.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ieee802154/atmel,at86rf233.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AT86RF230 IEEE 802.15.4
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - atmel,at86rf212
> +      - atmel,at86rf230
> +      - atmel,at86rf231
> +      - atmel,at86rf233
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpio:
> +    maxItems: 1
> +
> +  sleep-gpio:
> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    maximum: 7500000
> +
> +  xtal-trim:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: |
> +      u8 value for fine tuning the internal capacitance
> +      arrays of xtal pins: 0 = +0 pF, 0xf = +4.5 pF

Drop 'u8 value for '

maximum: 0xf

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        zigbee@0 {
> +            compatible = "atmel,at86rf231";
> +            reg = <0>;
> +            spi-max-frequency = <7500000>;
> +            interrupts = <19 4>;
> +            interrupt-parent = <&gpio3>;
> +            xtal-trim = /bits/ 8 <0x06>;
> +        };
> +    };
> -- 
> 2.34.1
> 

