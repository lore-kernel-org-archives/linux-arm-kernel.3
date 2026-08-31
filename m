Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB14AC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxPJ66xv/m8p7z+wgFkwlta0qkVfk6x+8jdgBQHqV0Q=; b=u012Tuj5eS3dA+EGMHAoD2fOIs
	w30gmMCKBjluQK6J9OhsIS3SanrcXLb8Ghx3eWJ5FHmW7nW0xFaCoQtVxdYK0wbaRTM8qVgEK1Tsc
	QqhT2uO4c3r1MROQe3lANBgctDyBlVeKQ0CTseMZBd1JKt8WmC8H12n1yhtw+JjfagtLQAQTpBtNL
	wEMDtpMsB9zeuGH4o9EXCAGJt/UtFyT0tCL+i97ClQWVQYLXDY4yhjsqG7+OUcHL3o3kW3uSzRCZL
	Jmqb2CaiO12y8E1tqCSdBRs2CFmhl7Piak7DUuDWDSTHhcBEZZMsu3kuBKKD0B502v3hMeXLw0vcz
	92Okc6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x128k-00000009Q7r-1xJ1;
	Mon, 31 Aug 2026 13:33:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x128g-00000009Q6O-1dm0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 13:33:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AE199436D7;
	Mon, 31 Aug 2026 13:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A1F1F00A3D;
	Mon, 31 Aug 2026 13:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183209;
	bh=wxPJ66xv/m8p7z+wgFkwlta0qkVfk6x+8jdgBQHqV0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NkreY35hnBgnlJR0I22JY3/sH6vJCMAsqYJphyey7jJ1YPxfIfBn5ZLnbrWNMm+qO
	 ZTK8TH6e54EyPnkc/MbLu1hvyL4UPDWrrvfP8XxDBUEq4wcI9Pas2lcx59dXrxEv4Y
	 ezCv0OHkcdQHlDzasHpLBDlcs6HdDcWCXm8WRddwj2wzp97WcC1I2A8aprKWzacW1q
	 t/ayJUem0QcChgEf/QKCHKTDd8w79O5od+Rl6ySzuna5KmzWk85zVYmJWljuPDn+Xk
	 Tcyy/lmEZ9UDqneCCobJFLAr/BRJA7NdMChJisudulVGcENau5Zfhce9UeQO2vCC91
	 pMq+McTz9Em4Q==
Date: Mon, 31 Aug 2026 08:33:28 -0500
From: Rob Herring <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, goledhruva@gmail.com,
	m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com
Subject: Re: [PATCH v3 2/2] dt-bindings: spi: ti,davinci-spi: convert to DT
 schema
Message-ID: <20260831133328.GA703892-robh@kernel.org>
References: <20260817-ti-davinci-spi-v3-0-23844cfb5e6a@gmail.com>
 <20260817-ti-davinci-spi-v3-2-23844cfb5e6a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-ti-davinci-spi-v3-2-23844cfb5e6a@gmail.com>
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

On Mon, Aug 17, 2026 at 03:25:26AM +0530, Bhargav Joshi wrote:
> Convert the TI DaVinci/Keystone SPI controller binding from text format
> to DT schema.
> 
> Changes during the conversion:
> - Create a separate ti,davinci-spi-peripheral-props.yaml schema to
>   properly define the ti,spi-wdelay peripheral property.
> - Add missing dmas and dma-names properties.
> - Add constraints to ti,spi-wdelay based on the 6-bit width
>   of the SPIFMTn.WDELAY hardware register field.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../devicetree/bindings/spi/spi-davinci.txt        | 100 -----------------
>  .../bindings/spi/spi-peripheral-props.yaml         |   1 +
>  .../spi/ti,davinci-spi-peripheral-props.yaml       |  25 +++++
>  .../devicetree/bindings/spi/ti,davinci-spi.yaml    | 124 +++++++++++++++++++++
>  4 files changed, 150 insertions(+), 100 deletions(-)


> diff --git a/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml b/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml
> new file mode 100644
> index 000000000000..5bf74f3ca588
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/ti,davinci-spi.yaml
> @@ -0,0 +1,124 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/ti,davinci-spi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI DaVinci/Keystone SPI Controller
> +
> +maintainers:
> +  - Bartosz Golaszewski <brgl@kernel.org>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - ti,da830-spi
> +          - ti,keystone-spi
> +          - ti,dm6441-spi
> +      - items:
> +          - const: ti,keystone-spi
> +          - const: ti,dm6441-spi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +    description:
> +      Should contain a phandle to a PM domain provider node
> +      and an args specifier containing the SPI device id
> +      value.
> +
> +  num-cs:
> +    minimum: 1
> +    default: 1
> +    description:
> +      Number of chip selects supported by the controller. This
> +      includes both internal and GPIO chip selects.
> +
> +  ti,davinci-spi-intr-line:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    description:
> +      Interrupt line used to connect the SPI IP to the interrupt
> +      controller within the SoC.  The SPI peripheral can route its
> +      interrupt output to one of two lines (INT0 or INT1). Set
> +      this based on the SoC-specific wiring to the interrupt
> +      controller.
> +
> +  dmas:
> +    items:
> +      - description: RX DMA channel
> +      - description: TX DMA channel
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +      - const: tx
> +
> +  "#address-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - ti,davinci-spi-intr-line
> +  - num-cs
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          const: ti,keystone-spi
> +    then:
> +      required:
> +        - power-domains
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi@20bf0000 {
> +        compatible = "ti,keystone-spi","ti,dm6441-spi";

Missing space between compatible strings. The newish dt-check-style 
should catch this.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

