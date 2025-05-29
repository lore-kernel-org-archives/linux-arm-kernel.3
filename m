Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E30C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 13:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIeeZSl723f+EwuVarudVzrso0Jfx+QAyQgugmpdt/s=; b=g2+WJgZNGjurEdH46ogp6Gwa+G
	yKz/MUe4cgr5cEJFhFMqqqAIqZ1fQQYUtXnxxhGH7J+Jg3ZaUaeLVnF+5Lz9y8CexoulMZC5Q6rrE
	Gj36TS9Hem1mg26pK2PgydF9O4qem5pEPjTyCtY6g7Gckuufmb6B9Gl0pRmkEbhp5WGZPwaIWvnpO
	4nHSfwu+kPTR8sCpCx924U8nw6jNvHy1KP9JYTOEEdEIsslmbI0KEG2x+EX30gzC6C4u4Pn/9bMNO
	j6ZacPpWak7jpF3a1Ears+e94HVk8x20kjlIYvxQBCSV/QxBx8kY3GPyph5Jo3aZj15wPUq0yepHL
	rEzaJW4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdPO-0000000Frm8-41TM;
	Thu, 29 May 2025 13:34:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcjB-0000000FmrJ-27zV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 12:51:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C658614BA;
	Thu, 29 May 2025 12:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D782C4CEE7;
	Thu, 29 May 2025 12:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748523079;
	bh=N/k5MREBZu4ktJEu5uoYfUk/XOC53RtuRUTknxcukAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IK9kc6oGUgxlgbKvaQ0nUCSs5sBdVtDfgA5KQGSTuN23+qm/4xuYAPC+g+EPi9CNR
	 UKrm7kUUqzLXZH5kdozgjU9QWgfdX7s9YhSAZrrephnvPRNmZhKCtwTTidizK01jFr
	 GGk+Jju5D/fejd5JAUkb0LeWXPiw2RtAyE1us9h9rmOgvuEgS2Zs9cGFZedUQ3z/5f
	 /z7ziZvChpgVmoFNAfM95fdfGqlBQuAvqWCW/jsu9BPAdAC8/lRT+eeRyww5onSNu+
	 JuzylCnj9V7lU6XVmF/iWY5N9LfLmCHUHCpjX2U0hSb3jWw09v2j683d3Ic42HWin7
	 wxb4Kp6RFXjXw==
Date: Thu, 29 May 2025 07:51:17 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: convert mxs-lradc bindings to
 json-schema
Message-ID: <20250529125117.GA2750225-robh@kernel.org>
References: <20250529083201.2286915-1-dario.binacchi@amarulasolutions.com>
 <20250529083201.2286915-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529083201.2286915-2-dario.binacchi@amarulasolutions.com>
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

On Thu, May 29, 2025 at 10:31:04AM +0200, Dario Binacchi wrote:
> Convert the Freescale MXS Low-Resoulution ADC (LRADC) device tree
> binding documentation to json-schema.
> 
> The clocks and #io-channel-cells properties have also been added; They
> are present in the respective SoC DTSI files but were missing from the
> old mxs-lradc.txt file.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> ---
> 
> Changes in v3:
> - Add Reviewed-by tag of Conor Dooley
> 
>  .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 --------
>  .../devicetree/bindings/mfd/mxs-lradc.yaml    | 106 ++++++++++++++++++
>  2 files changed, 106 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.txt b/Documentation/devicetree/bindings/mfd/mxs-lradc.txt
> deleted file mode 100644
> index 755cbef0647d..000000000000
> --- a/Documentation/devicetree/bindings/mfd/mxs-lradc.txt
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -* Freescale MXS LRADC device driver
> -
> -Required properties:
> -- compatible: Should be "fsl,imx23-lradc" for i.MX23 SoC and "fsl,imx28-lradc"
> -              for i.MX28 SoC
> -- reg: Address and length of the register set for the device
> -- interrupts: Should contain the LRADC interrupts
> -
> -Optional properties:
> -- fsl,lradc-touchscreen-wires: Number of wires used to connect the touchscreen
> -                               to LRADC. Valid value is either 4 or 5. If this
> -                               property is not present, then the touchscreen is
> -                               disabled. 5 wires is valid for i.MX28 SoC only.
> -- fsl,ave-ctrl: number of samples per direction to calculate an average value.
> -                Allowed value is 1 ... 32, default is 4
> -- fsl,ave-delay: delay between consecutive samples. Allowed value is
> -                 2 ... 2048. It is used if 'fsl,ave-ctrl' > 1, counts at
> -                 2 kHz and its default is 2 (= 1 ms)
> -- fsl,settling: delay between plate switch to next sample. Allowed value is
> -                1 ... 2047. It counts at 2 kHz and its default is
> -                10 (= 5 ms)
> -
> -Example for i.MX23 SoC:
> -
> -	lradc@80050000 {
> -		compatible = "fsl,imx23-lradc";
> -		reg = <0x80050000 0x2000>;
> -		interrupts = <36 37 38 39 40 41 42 43 44>;
> -		fsl,lradc-touchscreen-wires = <4>;
> -		fsl,ave-ctrl = <4>;
> -		fsl,ave-delay = <2>;
> -		fsl,settling = <10>;
> -	};
> -
> -Example for i.MX28 SoC:
> -
> -	lradc@80050000 {
> -		compatible = "fsl,imx28-lradc";
> -		reg = <0x80050000 0x2000>;
> -		interrupts = <10 14 15 16 17 18 19 20 21 22 23 24 25>;
> -		fsl,lradc-touchscreen-wires = <5>;
> -		fsl,ave-ctrl = <4>;
> -		fsl,ave-delay = <2>;
> -		fsl,settling = <10>;
> -	};
> diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
> new file mode 100644
> index 000000000000..90391b02c715
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mxs-lradc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale MXS Low-Resoulution ADC (LRADC)
> +
> +maintainers:
> +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +
> +description: |

Don't need '|' unless there is formatting to preserve. 

> +  The LRADC provides 16 physical channels of 12-bit resolution
> +  for analog-to-digital conversion and includes an integrated
> +  4-wire/5-wire touchscreen controller.

Wrap lines at 80 char.

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,imx23-lradc
> +          - fsl,imx28-lradc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +
> +  interrupts:
> +    minItems: 9
> +    maxItems: 13

Please describe what each interrupt is. Unless they are all the same 
(e.g. 1 interrupt per ADC channel), you need to list them out.

> +
> +  fsl,lradc-touchscreen-wires:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Number of wires used to connect the touchscreen to LRADC.
> +      If this property is not present, then the touchscreen is disabled.

Don't need '|'. Unless this is supposed to be 2 paragraphs. In that 
case, add a blank line between paragraphs. Same comment on the rest.

> +
> +  fsl,ave-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 32
> +    default: 4
> +    description: |
> +      Number of samples per direction to calculate an average value.
> +
> +  fsl,ave-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 2
> +    maximum: 2048
> +    default: 2
> +    description: |
> +      Delay between consecutive samples.
> +      It is used if 'fsl,ave-ctrl' > 1, counts at 2 kHz and its
> +      default value (i. e. 2) is 1 ms.
> +
> +  fsl,settling:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 2047
> +    default: 10
> +    description: |
> +      Delay between plate switch to next sample.
> +      It counts at 2 kHz and its default (i. e. 10) is 5 ms.
> +
> +  "#io-channel-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - fsl,imx23-lradc
> +then:
> +  properties:
> +    fsl,lradc-touchscreen-wires:
> +      const: 4
> +else:
> +  properties:
> +    fsl,lradc-touchscreen-wires:
> +      enum: [4, 5]

Move this constraint to the top level and drop the 'else'.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    lradc@80050000 {
> +        compatible = "fsl,imx23-lradc";
> +        reg = <0x80050000 0x2000>;
> +        interrupts = <36>, <37>, <38>, <39>, <40>,
> +                     <41>, <42>, <43>, <44>;
> +        clocks = <&clks 26>;
> +        #io-channel-cells = <1>;
> +        fsl,lradc-touchscreen-wires = <4>;
> +        fsl,ave-ctrl = <4>;
> +        fsl,ave-delay = <2>;
> +        fsl,settling = <10>;
> +    };
> -- 
> 2.43.0
> 

