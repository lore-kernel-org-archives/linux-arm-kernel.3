Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CB5D3B7E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 06:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vltCbyJ2QcxKkOmEXSg2gdYksJv3HWYGpxo1GUdp78Y=; b=LgfF90gKuOvuOeqeBBMfgV/7vo
	g+3ecJvaYk5hbBVhuc7FqHVF9ULCwnF3yfCtmv42QmgfafU1o8KHkfcwGgp2vAa+VK6+3clKzRzfm
	ETrwWYaCU5rlj5tb+m6wAdd8bp4L89Osd+z3DoyCzCo+kNrLYhY+w07K+z8PZAMi6oEdpqCSZ0FYn
	0mctTs6BdGSgwlIRUggWcG+CHtwSyDgUYaud7Ube5kSt4QgNeVSS0Aff7aewSUMAOG1VxebLwQJFz
	OdqiD2FaPO+/Dl6RYpx6uNS+Ussd5esWxxGOEJgjSbJ6SOPyVAxaETm8nk/S4PrfI6EzByvdfYhj6
	ogbndXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUkt-0000000Cgsb-3INx;
	Mon, 08 Dec 2025 06:29:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUks-0000000CgsL-1EqA;
	Mon, 08 Dec 2025 06:29:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A06C6013F;
	Mon,  8 Dec 2025 06:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03D0C4CEF1;
	Mon,  8 Dec 2025 06:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765175393;
	bh=BNL8+owLhbO9teOYyNVriq9viH9YuOxeblnmtV4NFco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Adp7hNF8uf+sca8VaTE6dkzXOihGGqJBrNksUNoNA5ao9JDXdYwvTUB6u/nJTBuFE
	 Yp34u8aXIE2zd/nPu4Q4kATUtCUULw7f6qn50NnYEb8Y9UP9RwCVTVLjP46/rZVL+W
	 I2bAU0j+2YotigSlLJoWWf8hr5C2uESoLToaTRuKW52bUM5LPCg6mPns9Yqx7pPp9D
	 TyVtmDTaVM4u00yHu/sn66vv4l66FQSEex3jsmhz7grRJghQeJG+sCUeC5xMgWe263
	 EaRlVCD9DGRpWwgCb7YQkPLO8mO4qkjVx11IZS0gwYeQTPLZM7mfYTRGBZcmbGneYm
	 GS0IvVXtW0nUA==
Date: Mon, 8 Dec 2025 07:29:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Subject: Re: [PATCH v2 7/8] dt-bindings: pinctrl: rockchip: Add RMIO
 controller binding
Message-ID: <20251208-invisible-crazy-squirrel-bb3af0@quoll>
References: <20251206050844.402958-1-ye.zhang@rock-chips.com>
 <20251206050844.402958-8-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251206050844.402958-8-ye.zhang@rock-chips.com>
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

On Sat, Dec 06, 2025 at 01:08:43PM +0800, Ye Zhang wrote:
> Add device tree binding for the RMIO (Rockchip Matrix I/O) controller
> which is a sub-device of the main pinctrl on some Rockchip SoCs.
> 
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>  .../bindings/pinctrl/rockchip,pinctrl.yaml    |   9 ++
>  .../bindings/pinctrl/rockchip,rmio.yaml       | 130 ++++++++++++++++++
>  2 files changed, 139 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> index 93bf8f352e48..01df0a51ff83 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> @@ -83,6 +83,15 @@ required:
>    - rockchip,grf
>  
>  patternProperties:
> +  "rmio[0-9]*$":
> +    type: object
> +
> +    $ref: "/schemas/pinctrl/rockchip,rmio.yaml#"
> +
> +    description:
> +      The RMIO (Rockchip Matrix I/O) controller node which functions as a
> +      sub-device of the main pinctrl to handle flexible function routing.
> +
>    "gpio@[0-9a-f]+$":
>      type: object
>  
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
> new file mode 100644
> index 000000000000..28ec5ad62061
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/rockchip,rmio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RMIO (Rockchip Matrix I/O) Controller
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description: |
> +  The RMIO controller provides a flexible routing matrix that allows mapping
> +  various internal peripheral functions (UART, SPI, PWM, etc.) to specific
> +  physical pins. This block is typically a sub-block of the GRF
> +  (General Register Files).
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rmio

Nope, you need Soc specific compatibles. Please see writing bindings
doc first.


> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:

Huh? That's already in the parent, no?

> +      The phandle of the syscon node for the GRF registers.
> +
> +  rockchip,offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The offset of the RMIO configuration registers within the GRF.
> +
> +  rockchip,pins-num:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The number of physical pins supported by this RMIO instance.
> +      Used for boundary checking and driver initialization.
> +
> +additionalProperties:
> +  type: object
> +  additionalProperties:
> +    type: object
> +    properties:
> +      rockchip,rmio:
> +        $ref: "/schemas/types.yaml#/definitions/uint32-matrix"
> +        description: |
> +          A list of pin-function pairs. The format is <pin_id function_id>.
> +          - pin_id: The index of the RMIO pin (0 to pins-num - 1).
> +          - function_id: The mux value selecting the peripheral function.
> +        minItems: 1
> +        items:
> +          items:
> +            - minimum: 0
> +              maximum: 31
> +              description:
> +                RMIO Pin ID.
> +            - minimum: 0
> +              maximum: 98
> +              description:
> +                Function ID.
> +
> +    required:
> +      - rockchip,rmio
> +
> +    additionalProperties: false
> +
> +  additionalProperties: false
> +
> +required:
> +  - compatible
> +  - rockchip,grf
> +  - rockchip,offset
> +  - rockchip,pins-num
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/pinctrl/rockchip.h>
> +    #include <dt-bindings/pinctrl/rockchip,rk3506-rmio.h>
> +
> +    pinctrl {
> +        #address-cells = <1>;
> +        #size-cells = <1>;

Drop all this and below. Parent node should have complete example.

> +        ranges;
> +
> +        rmio {
> +            compatible = "rockchip,rmio";
> +            rockchip,grf = <&grf_pmu>;
> +            rockchip,offset = <0x80>;
> +            rockchip,pins-num = <32>;
> +
> +            rmio-uart {
> +                rmio_pin27_uart1_tx: rmio-pin27-uart1-tx {
> +                    rockchip,rmio = <RMIO_PIN27 RMIO_UART1_TX>;
> +                };
> +
> +                rmio_pin28_uart1_rx: rmio-pin28-uart1-rx {
> +                    rockchip,rmio = <RMIO_PIN28 RMIO_UART1_RX>;
> +                };
> +            };
> +        };
> +
> +        pcfg_pull_default: pcfg-pull-default {
> +          bias-pull-pin-default;
> +        };
> +
> +        rm {
> +          rmio_pin27_pins: rmio-pin27-pins {
> +            rockchip,pins = <1 RK_PC2 7 &pcfg-pull-default>;
> +          };
> +
> +          rmio_pin28_pins: rmio-pin28-pins {
> +            rockchip,pins = <1 RK_PC3 7 &pcfg-pull-default>;
> +          };
> +        };
> +    };
> +
> +    uart1: serial@20064000 {
> +      compatible = "snps,dw-apb-uart";

Do not add irrelevant examples. Please read carefully writing bindings,
writing schema and for example by talk for beginners in DT.

This patchset does not make me happy, too many trivial issues.

Best regards,
Krzysztof


