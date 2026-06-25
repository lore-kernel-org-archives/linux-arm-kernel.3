Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A60CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 07:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6+j+T3qBfbWMzZ/XJLC8q7RGgqdlanRoej/U73dd/I=; b=ZJWsu+f5D/tz25sYZz2UA+cP6E
	VM30MQTDIbqIWXNCvG7b6Pfb+xrqwHa6XPgm5JeR67T0DYuAHalFw6FfjfersFAyodQk15UlmQ0Kf
	2WR7vefw4hDjqZY97bboo5QLL0a68QLYpmZ2Hp33FM7BastcjXTLyeqEA2dYhCfygZk/Uf9Wtm3Aq
	+9elkrVcQJh8a19IqkY07IDV7IKTgGSzxqzruNR2Juj5xZp0Aof+PKZvwA3Bwa5JecgDTYtqNqDvI
	5bFGIK45MO4c6bvxFiuACk2j8umA3uQ9c9R55PTHdD4Gm18HcE0PN/FVeZVwEh5Jv0kj1i0jzMZA5
	htua+9WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wceyc-00000008nr4-12Tb;
	Thu, 25 Jun 2026 07:58:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wceyb-00000008nqt-1RO6;
	Thu, 25 Jun 2026 07:58:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5646F60217;
	Thu, 25 Jun 2026 07:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1073F1F000E9;
	Thu, 25 Jun 2026 07:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782374300;
	bh=X6+j+T3qBfbWMzZ/XJLC8q7RGgqdlanRoej/U73dd/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=at08tizQtpIsG9o+H++Qq4dr/9Nk8mtocexVu+bpTgKUUBRjluKs5CsuT+q8p1+Ks
	 OfutjiEP6C4iFQjmrAjAWTMYbLBAiItV0jy81jpEP/7YvbnGcK13bTLheJa4+m1QAL
	 IEwdXLlp/T3DZseHj3YfMO3zPwmwOBLw0fpET+FSezjoTjPaoNNhIpldGJXFJy1GUZ
	 xUGxTtQPpVzwmKJMdsbbwIngEAaIlupkyGsolTg4gocuegovzKT2yaVAaahUeBGTNw
	 YSC8ZsMhuiPZ1DT6UrTlV3KONnFBFYd01mHaWzHXRgxhVYtJIfTdVllSz5b4TCe4ed
	 KvKvwnsNOWs4A==
Date: Thu, 25 Jun 2026 09:58:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend
 for dual-port OTG support
Message-ID: <20260625-sexy-black-tarantula-4031a6@quoll>
References: <20260625023958.569299-1-a0987203069@gmail.com>
 <20260625023958.569299-3-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625023958.569299-3-a0987203069@gmail.com>
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

On Thu, Jun 25, 2026 at 10:39:56AM +0800, Joey Lu wrote:
>  properties:
>    compatible:
>      enum:
>        - nuvoton,ma35d1-usb2-phy
>  
> +  reg:
> +    maxItems: 1
> +
>    "#phy-cells":
> -    const: 0
> +    const: 1
> +    description:
> +      The single cell selects the PHY port. 0 selects the OTG port (USB0,
> +      shared with DWC2 gadget controller) and 1 selects the host-only port
> +      (USB1).
>  
> -  clocks:
> -    maxItems: 1

This is odd, considering that parent does not have clocks. So explain me
this:
1. USB PHY needed clocks.
2. You extend USB PHY to cover second part.
3. That extension for second part means that clocks are not needed.
Really, how? How is it possible in hardware?

> +  nuvoton,rcalcode:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 2

You should require two values. I understand that any PHY is optional,
thus you skip the entry, so how would you provide value for PHY1 only?

> +    items:
> +      minimum: 0
> +      maximum: 15
> +    description:
> +      Resistor calibration trim codes for PHY0 and PHY1 respectively.
> +      Each 4-bit value is written to the RCALCODE field in USBPMISCR and
> +      adjusts the PHY's internal termination resistance. Both entries are
> +      optional; when absent the hardware reset default is used.
>  
> -  nuvoton,sys:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> +  nuvoton,oc-active-high:
> +    type: boolean
>      description:
> -      phandle to syscon for checking the PHY clock status.
> +      When present, the over-current detect input from the VBUS power switch
> +      is treated as active-high. The default (property absent) is active-low.
> +      This setting is shared by both USB host ports.
>  
>  required:
>    - compatible
> +  - reg

That's ABI break which was not explained in the commit msg - neither
specifying impact nor actually providing reasons why you break ABI.

And honestly, you have no resources here except the address, so now it
is clear that this should be folded into parent. See DTS101 talk slides.

>    - "#phy-cells"
> -  - clocks
> -  - nuvoton,sys
>  
>  additionalProperties: false
>  
>  examples:
>    - |
> -    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +    system-management@40460000 {
> +        compatible = "nuvoton,ma35d1-reset", "syscon", "simple-mfd";
> +        reg = <0x40460000 0x200>;
> +        #reset-cells = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;

Drop. Keep only child node and make parent binding example complete.

>  
> -    usb_phy: usb-phy {
> -        compatible = "nuvoton,ma35d1-usb2-phy";
> -        clocks = <&clk USBD_GATE>;
> -        nuvoton,sys = <&sys>;
> -        #phy-cells = <0>;
> +        usb-phy@60 {
> +            compatible = "nuvoton,ma35d1-usb2-phy";
> +            reg = <0x60 0x14>;
> +            #phy-cells = <1>;
> +        };
>      };
> -- 
> 2.43.0
> 

