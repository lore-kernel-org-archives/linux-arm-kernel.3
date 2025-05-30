Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A071C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 14:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyVAQX0joFIksCWFAdgdsELtQX8CthYuIl66NHCVL6U=; b=DW1iZwvMDNavntY3q8gPBlMWtO
	Kb5ceJ9+jU7i9eaadFbYWGvHWkBUT/yWYFJIcjdBRD7IzBDa88h5ojsbioyLVlKmqAuYE/h2YWnf3
	Ntr70AnWyxsOxe7g+7jSI1KJxn+H8DgqOqrPszOqtcFCoujpUoSCxrIZO0SRW0STFWLXHih9PIQDE
	lWzBjVvWsdJjuYta3HXQr9Y8s//75JgbgJKViR2w22Dg5mC20Ig6MEprmPYU8xdRuFGh0m+aLCdZ8
	5OLSCn+gt9iywNCBc409n6BqmqE8IBpWcAbcCnXQ2pGets+QU9j01E8/19l5yQ8gD8/BbU+cxtcPD
	hjK557qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL0u3-00000000vD8-1NYS;
	Fri, 30 May 2025 14:40:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL0ru-00000000v4P-1ciE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 14:37:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D45DB5C03BB;
	Fri, 30 May 2025 14:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F35CC4CEE9;
	Fri, 30 May 2025 14:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748615877;
	bh=DcExpfUxA2y7MtLpRIkfyTCIoZyjbCW7UxtG5yfs9T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tSFMWDrjZ2HR7LSMPSo57mUpYR2XxepzeXCA6iv+/09XCbAjBI3b4PHs9q8YbeOtu
	 9nEwLWShgt77KCAV6ghfrs+XVUg8U9MFDRofWNciTyzq2N4IxdLk/4d2/oZOZ1zYUe
	 a1Vxt0EWAtXOho32Iqoo1tFaBKPRsUC8eUCvmOPIvPaIeYRR4rybAdhfH0ceCTdut2
	 nvBshykW/gRXjqow72O/J4KHPhEZytRmkTOGxgi4kQ1ITAuxpPYQCEPvsMDK/01B/e
	 OTwJQ/OibnkIzMGd9H+cutIfjWGZqDGBLDLKXhnc7wbW63tiKTtsiTry6gEoiFj3w6
	 INxsPugdbtRZA==
Date: Fri, 30 May 2025 09:37:55 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/6] dt-bindings: mfd: convert mxs-lradc bindings to
 json-schema
Message-ID: <20250530143755.GA1750861-robh@kernel.org>
References: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
 <20250529143544.2381031-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529143544.2381031-2-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_073758_513971_BA5F861B 
X-CRM114-Status: GOOD (  29.29  )
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

On Thu, May 29, 2025 at 04:35:08PM +0200, Dario Binacchi wrote:
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
> Changes in v4:
> - Fix typo Low-Resoulution -> Low-Resolution'
> - Wrap lines at 80 char.
> - Drop '|' from the description
> - Describe what each interrupt is for.
> - Move touchscreen-wires constraint for imx28 to the top level
> 
> Changes in v3:
> - Add Reviewed-by tag of Conor Dooley
> 
>  .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 ------
>  .../devicetree/bindings/mfd/mxs-lradc.yaml    | 131 ++++++++++++++++++
>  2 files changed, 131 insertions(+), 45 deletions(-)
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
> index 000000000000..f90fdfbb74a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mxs-lradc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale MXS Low-Resolution ADC (LRADC)
> +
> +maintainers:
> +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +
> +description:
> +  The LRADC provides 16 physical channels of 12-bit resolution for
> +  analog-to-digital conversion and includes an integrated 4-wire/5-wire
> +  touchscreen controller.
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
> +
> +  fsl,lradc-touchscreen-wires:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [4, 5]
> +    description:
> +      Number of wires used to connect the touchscreen to LRADC.
> +      If this property is not present, then the touchscreen is disabled.

Is this 1 paragraph or 2? If 1, it is not wrapped properly.

If 2, then it should have a blank line in between paragraphs and use 
'>':

    description: >
      Number of wires used to connect the touchscreen to LRADC.

      If this property is not present, then the touchscreen is disabled.


See writing-schema.rst for more details.

> +
> +  fsl,ave-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 32
> +    default: 4
> +    description: |

Don't need '|'.

> +      Number of samples per direction to calculate an average value.
> +
> +  fsl,ave-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 2
> +    maximum: 2048
> +    default: 2
> +    description:
> +      Delay between consecutive samples.
> +      It is used if 'fsl,ave-ctrl' > 1, counts at 2 kHz and its
> +      default value (i. e. 2) is 1 ms.

1 paragraph or 2?

> +
> +  fsl,settling:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 2047
> +    default: 10
> +    description:
> +      Delay between plate switch to next sample.
> +      It counts at 2 kHz and its default (i. e. 10) is 5 ms.

1 paragraph or 2?

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
> +    interrupts:
> +      items:
> +        - description: channel 0
> +        - description: channel 1
> +        - description: channel 2
> +        - description: channel 3
> +        - description: channel 4
> +        - description: channel 5
> +        - description: touchscreen
> +        - description: channel 6
> +        - description: channel 7
> +    fsl,lradc-touchscreen-wires:
> +      const: 4
> +else:
> +  properties:
> +    interrupts:
> +      items:
> +        - description: threshold 0
> +        - description: threshold 1
> +        - description: channel 0
> +        - description: channel 1
> +        - description: channel 2
> +        - description: channel 3
> +        - description: channel 4
> +        - description: channel 5
> +        - description: button 0
> +        - description: button 1
> +        - description: touchscreen
> +        - description: channel 6
> +        - description: channel 7
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

