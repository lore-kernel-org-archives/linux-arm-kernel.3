Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFEBCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 03:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNMTKt7YjJq48T2Pcq2cArq/vrX7B1+Cr2MDe+JTEgw=; b=yn1I1OoUWUPgPkiyiWClLBZFsy
	cQLy/Pf2XXCmoeam3ZQYS9NPkK7m4zpMOfFYN7co8e1OscmccUTbMxokCZMQA3JATfYAG1/7pDsTO
	oqBgQAinHE3OsUnD9vSWkwZ9KhKi4CVJ47sEtxazqTqzDS0OjMmgOEtMpqM6jqGTvce271m9VtwAU
	SjDVgoSvXF38JRNl4e2urRb6BWPWjD3qvgQN5wvofaN1qSEO7WS4Lb7nB3rUXY8BDXEOd2DX5K5Co
	I8roScoTFuZGAJ7piReQDslgeAiEuwcfzu3NTibKs1wnF4wPpRQYkyuNVlq3DWojbCQZxIJf/xP6M
	jDu1ovUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDa2Y-0000000F8yb-1f8m;
	Tue, 28 Oct 2025 03:06:30 +0000
Received: from mail-m49251.qiye.163.com ([45.254.49.251])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDa2U-0000000F8xu-2Khp;
	Tue, 28 Oct 2025 03:06:28 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 276a7504d;
	Tue, 28 Oct 2025 11:06:16 +0800 (GMT+08:00)
Message-ID: <ff9631f5-8fff-4be8-8b6f-807c29943ef6@rock-chips.com>
Date: Tue, 28 Oct 2025 11:06:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: pwm: Add a new binding for
 rockchip,rk3576-pwm
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Lee Jones <lee@kernel.org>, William Breathitt Gray <wbg@kernel.org>
Cc: kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
 Alexey Charkov <alchark@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20251027-rk3576-pwm-v3-0-654a5cb1e3f8@collabora.com>
 <20251027-rk3576-pwm-v3-1-654a5cb1e3f8@collabora.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20251027-rk3576-pwm-v3-1-654a5cb1e3f8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a28c7d7a403a3kunm3d7a8e9cae638
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR1NH1ZPQh5OGEpITh1MTR9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=GnW4Aw/dYogb45ppMn1qSoJSL2pNnFjBY0b/PtiQx/TSoajxTtANAPZYI2US7qTJxIytb8x03LMsWpn+ewbLYxi7VKk8//rVLAHcgXAfWEQR2cipDN5G90peVYads7hG4fsu94iGsxFccwarJeK+jGAhcKRDXCFx5toNeGHGRYQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=nNMTKt7YjJq48T2Pcq2cArq/vrX7B1+Cr2MDe+JTEgw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_200627_126634_35C9F34B 
X-CRM114-Status: GOOD (  21.41  )
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

Hi Nicolas,

On 10/28/2025 1:11 AM, Nicolas Frattaroli wrote:
> The Rockchip RK3576 SoC has a newer PWM controller IP revision than
> previous Rockchip SoCs. This IP, called "PWMv4" by Rockchip, introduces
> several new features, and consequently differs in its bindings.
> 
> Instead of expanding the ever-growing rockchip-pwm binding that already
> has an if-condition, add an entirely new binding to handle this.
> 
> There are two additional clocks, "osc" and "rc". These are available for
> every PWM instance, and the PWM hardware can switch between the "pwm",
> "osc" and "rc" clock at runtime.
> 
> The PWM controller also comes with an interrupt now. This interrupt is
> used to signal various conditions.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   .../bindings/pwm/rockchip,rk3576-pwm.yaml          | 77 ++++++++++++++++++++++
>   MAINTAINERS                                        |  7 ++
>   2 files changed, 84 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/rockchip,rk3576-pwm.yaml b/Documentation/devicetree/bindings/pwm/rockchip,rk3576-pwm.yaml
> new file mode 100644
> index 000000000000..48d5055c8b06
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/rockchip,rk3576-pwm.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/rockchip,rk3576-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip PWMv4 controller
> +
> +maintainers:
> +  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> +
> +description: |
> +  The Rockchip PWMv4 controller is a PWM controller found on several Rockchip
> +  SoCs, such as the RK3576.
> +
> +  It supports both generating and capturing PWM signals.
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: rockchip,rk3576-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Used to derive the PWM signal.
> +      - description: Used as the APB bus clock.
> +      - description: Used as an alternative to derive the PWM signal.
> +      - description: Used as another alternative to derive the PWM signal.
> +
> +  clock-names:
> +    items:
> +      - const: pwm
> +      - const: pclk
> +      - const: osc
> +      - const: rc
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 3
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3576-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        pwm@2add0000 {
> +            compatible = "rockchip,rk3576-pwm";
> +            reg = <0x0 0x2add0000 0x0 0x1000>;
> +            clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>, <&cru CLK_OSC_PWM1>,
> +                     <&cru CLK_RC_PWM1>;
> +            clock-names = "pwm", "pclk", "osc", "rc";
> +            interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> +            #pwm-cells = <3>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 252b06d4240c..baecabab35a2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22366,6 +22366,13 @@ F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
>   F:	drivers/media/platform/rockchip/rkisp1
>   F:	include/uapi/linux/rkisp1-config.h
>   
> +ROCKCHIP MFPWM
> +M:	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> +L:	linux-rockchip@lists.infradead.org
> +L:	linux-pwm@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/pwm/rockchip,rk3576-pwm.yaml
> +
>   ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
>   M:	Daniel Golle <daniel@makrotopia.org>
>   M:	Aurelien Jarno <aurelien@aurel32.net>
> 

The RK3506 and RV1126B platforms that are about to be upstream also use 
this PWM IP. Would it be better to name the yaml file 
"pwm-rockchip-v4.yaml"? Then subsequent platforms only need to expand 
the compatible property.

Best regards,
Damon


