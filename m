Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A1FC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 15:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WxImzVP6Rd99rs7UUCZ7B+v16yP/b0p9KMScAca8yI=; b=CQH6Dis3LoAttku4xcFoFekPny
	oIhqWiZMpeC1dxp+eeo3c4RtV4PLZ1aA3jGSb3kYtTMcpPNzzge5JMNSksXnhMRBVCw/fpWyDD20m
	pTIXEzugORxPGW8l6xHk/Q52dvRrmTJmimsCFPBCwdbgmbgzkNqmer+4cGOC9sTHJ84Hu+73pMr/8
	iMwUFVkpPcRjLifpLZK1qjI/MlkS4mkbGkR8P2hA8TiBAtS6Ou0cceWZF2CuN0SfN2kC7hBiCZ9gp
	On5F0DDeTI6ZfvDhqo75dRLsyahygWEGrUFntmSqtYd/HyFJYR2okKb5+XD7vu02DLsNyJkqEunO7
	nipePzjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWQR-000000096n3-1jjI;
	Wed, 09 Jul 2025 15:09:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTjw-00000008bU1-3jkt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 12:17:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1E3CBA53E99;
	Wed,  9 Jul 2025 12:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5067C4CEEF;
	Wed,  9 Jul 2025 12:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752063451;
	bh=bAemRyyhGncCCDGcLOv/rDMSzxPTbiBd+gD8PwD8fgY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aYfoydNzAOLtaiLOUN8IupS68jWBAsYg1/6lh+WPg01ZmILMXfRcTRGKoKTSmzH0F
	 cinKeRo1TAc1CoPYVIxKOfSOpwy86SctX5Mhux65yLWWOr3kpx7NH+0jJLSN5ejR6v
	 66Wg6hcZIM3/j9aEWrdG0DJC4j180fudR5x3znMA8nDbifv2Qf+dqEAPppeGTIPSfs
	 LBgWvqh0+E780gQVeBnLKNUK45vmF45qN/JnfaQwN+wyv250hi2QYmgQizZMx8pwsL
	 MvYv5Zi38ktodrImrbYmsmwC4cV7TpnN5cOMJSRHgAmphsHlCuVP1F+WxGLbs8X3e+
	 oPCvYUpZqBGuA==
Message-ID: <c8ddfc31-95a5-4879-b392-18b915095b5d@kernel.org>
Date: Wed, 9 Jul 2025 14:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: fsl,fpga-qixis-i2c: extend support to
 also cover the LX2160ARDB FPGA
To: Ioana Ciornei <ioana.ciornei@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-3-ioana.ciornei@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250709112658.1987608-3-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_051733_074857_0E8D222F 
X-CRM114-Status: GOOD (  18.04  )
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

On 09/07/2025 13:26, Ioana Ciornei wrote:
> Extend the list of supported compatible strings with fsl,lx2160ardb-fpga.
> 
> Since the register map exposed by the LX2160ARDB's FPGA also contains
> two GPIO controllers, accept the necessary GPIO pattern property. At the
> same time, add the #address-cells and #size-cells properties as valid
> ones.
> 
> This is needed because when defining child devices such as the GPIO
> controller described in the added example, the child device needs a the
> reg property to properly identify its register location.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
>  .../bindings/board/fsl,fpga-qixis-i2c.yaml    | 35 +++++++++++++++++++

So here is the board? Why FPGA is in the board...

>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> index 28b37772fb65..e8981f974210 100644
> --- a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> +++ b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> @@ -22,6 +22,13 @@ properties:
>                - fsl,lx2160aqds-fpga
>            - const: fsl,fpga-qixis-i2c
>            - const: simple-mfd
> +      - const: fsl,lx2160ardb-fpga

Weird, your first patch added three compatibles, this adds only one.

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
>  
>    interrupts:
>      maxItems: 1
> @@ -32,6 +39,10 @@ properties:
>    mux-controller:
>      $ref: /schemas/mux/reg-mux.yaml
>  
> +patternProperties:
> +  "^gpio(@[0-9a-f]+)?$":

Why unit address is optional? Anyway, this is wrong. You do not have
ranges here and earlier you already said children do not have any
addressing. Look at mux.

> +    $ref: /schemas/gpio/fsl,fpga-gpio.yaml
> +
>  required:
>    - compatible
>    - reg
> @@ -68,3 +79,27 @@ examples:
>          };
>      };
>  
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        board-control@66 {
> +            compatible = "fsl,lx2160ardb-fpga";
> +            reg = <0x66>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            gpio@19 {

And what is the meaning of @19?


Best regards,
Krzysztof

