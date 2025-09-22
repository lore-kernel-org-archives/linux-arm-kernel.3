Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AF4CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 20:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnXnW8js8Oq/vJ/DzyORzAbIvwsFqQMreXDmB5yvaKU=; b=jEhyusPQYVCq44ydVfg/VMMUZD
	icAvBkPyeMmjweJyhgsIxEGcg7W5RZnLd/7uIJmF8+vPFB9xy/aI0VLHHOlvL3SZ6LdMFL/Ycx/+r
	EFZkzj7cKJBeh2wJUtEXigTCOl4knJWJOAY6n1c65c6SR4lCK2F/MzPYi+6RJt4QIunkFhK8IYDaq
	wYLBIeeeQy+ct9ubTioOhixLkqYSjJiYM0n3daB6g+lYWusDzU1OuF7fQgvmZrPn2sHRsTAEaMPvO
	1mO3sdYQ+Xp7jbx/z/oCdb2rJEIrhWGfJqEvmTln9yvmZmRn/ChC/2jY4Wg9XgWX0hj0Kc2F4PRIh
	ClWb8TbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nZG-0000000BUyh-2Ae3;
	Mon, 22 Sep 2025 20:55:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nZF-0000000BUyY-3f30;
	Mon, 22 Sep 2025 20:55:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E961A60241;
	Mon, 22 Sep 2025 20:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5211C4CEF0;
	Mon, 22 Sep 2025 20:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758574524;
	bh=tYpOjofHpW9mWp+Pr+zwn20aiOFBJXMUD80BxBDT1OE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=btMCe4pJzrjEFcSIlChfqpHzRKX9nmREvFuQo1txXzAfXiMm7dqUgVYz/Yg24jZfh
	 oEC0lhquRT3S7V6O3w4AhmbeOIoeL8PEjKvTuf9hYNW3DLFeoNTjSxSkZvta8koKyN
	 LXm5t6Kbm0VC1PdnmcRy/++FJf3w3qG5pOJYGUGf2wr2YowDAUyHurGLKeI6XZ6PwB
	 Qttw6vo5oui+LCk5cciNBbSNLP8Z/+yvxIQGRQ8bdkk9ytAxiuFaZRQtIXHpkPh1sN
	 HvoJimqkW8ltIgE5weKxlHGjBkju03NhQdRKOJ71ZfuCQERW+3wBIu9gPl3p041Bxy
	 XvQr5ridOkuaw==
Date: Mon, 22 Sep 2025 15:55:21 -0500
From: Rob Herring <robh@kernel.org>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mkl@pengutronix.de, kernel@pengutronix.de, mailhol.vincent@wanadoo.fr,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	cl@rock-chips.com, kever.yang@rock-chips.com,
	linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/4] dt-bindings: can: rockchip_canfd: add rk3576
 CAN-FD controller
Message-ID: <20250922205521.GA1307111-robh@kernel.org>
References: <20250922071543.73923-1-zhangqing@rock-chips.com>
 <20250922071543.73923-2-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922071543.73923-2-zhangqing@rock-chips.com>
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

On Mon, Sep 22, 2025 at 03:15:40PM +0800, Elaine Zhang wrote:
> Add documentation for the rockchip rk3576 CAN-FD controller.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../net/can/rockchip,rk3568v2-canfd.yaml      | 47 +++++++++++++++++--
>  1 file changed, 44 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
> index a077c0330013..74b1a502f0b7 100644
> --- a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
> +++ b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
> @@ -10,13 +10,11 @@ title:
>  maintainers:
>    - Marc Kleine-Budde <mkl@pengutronix.de>
>  
> -allOf:
> -  - $ref: can-controller.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
>        - const: rockchip,rk3568v2-canfd
> +      - const: rockchip,rk3576-canfd

Combine these 2 into an enum.

>        - items:
>            - const: rockchip,rk3568v3-canfd
>            - const: rockchip,rk3568v2-canfd
> @@ -43,6 +41,31 @@ properties:
>        - const: core
>        - const: apb
>  
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +
> +allOf:
> +  - $ref: can-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3576-canfd
> +      required:
> +        - compatible
> +    then:
> +      required:
> +        - dmas
> +        - dma-names
> +    else:
> +      properties:
> +        dmas: false
> +        dma-names: false
> +
>  required:
>    - compatible
>    - reg
> @@ -72,3 +95,21 @@ examples:
>              reset-names = "core", "apb";
>          };
>      };
> +
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        can@2ac00000 {
> +            compatible = "rockchip,rk3576-canfd";
> +            reg = <0x0 0x2ac00000 0x0 0x1000>;
> +            interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&cru CLK_CAN0>, <&cru PCLK_CAN0>;
> +            clock-names = "baud", "pclk";
> +            resets = <&cru SRST_CAN0>, <&cru SRST_P_CAN0>;
> +            reset-names = "core", "apb";
> +            dmas = <&dmac0 20>;
> +            dma-names = "rx";
> +        };
> +    };
> -- 
> 2.34.1
> 

