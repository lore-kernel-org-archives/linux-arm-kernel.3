Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC76E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 07:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vd508iuSiCH5fQUn/4ZIO2+EzG3cLNirt2SjA1BSUXc=; b=Ng9Q33lC6o2+C58gMWp3KUCvCP
	HtsO7dio5sDE8NFBeewoV7/XKCyzbf+eIc1xsYl+/0T0XdIbNaY4UPCQ9Nmqft1PHM722cadu5ZIr
	6PbNxzXJLmxizmngVEUGQcvUq9wIxWR+NWzPOv76l+Du6hsXsnDt4KVwL6HmUrgQQkQO99Uf32+O+
	T+eq+KTU5ICH8uLDV8pntSIXYbkYeRMHPYkUb98q7B24KqBWPX88PYjvvgklMuvzqRdlsferkL9yd
	HiSIxUM6t5Zw6l50EdzFKJP3iQe1rZpJLtqGfIkocGkhXMgZ8HTvFZD5XSN+rbO288xsiN0/21SPv
	UKYJVrUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV3ic-00000003jF5-2kXc;
	Tue, 07 Jan 2025 07:09:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV3hM-00000003j70-2N71
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 07:08:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F0B81A40277;
	Tue,  7 Jan 2025 07:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC357C4CED6;
	Tue,  7 Jan 2025 07:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736233699;
	bh=R8h9eLfpu3xvbqL1BO+eFKtQtfe7sm2Zwb1q9DoGnrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U5OVSucKvFdrOhO+k/lAkfQjEvBEBrt/yTbAsyIHLY8P9NzbulizOX2EbuDdm2XbB
	 w8X00HgngAr3UEqsK404FmI4/JpdStdRUVQe2H5HUKuRn0x1ojRR9nB3quLpMVkbqE
	 rXDW+Hl0Ip52LjfbqqHT2VvajsaaLDmViY7KQUiXTYUa+3gPZRJ0VLGetZ+7kf2t1a
	 GChhTxJOZ/+FyE+TMNTaabUJ21a0ZsDSkqxEvE1YGLZ9TbFg7gJfRgFvpQY9xi/3jQ
	 fRzAlLJJf7wuMQR/XysRaeOd4FneWv3hwm7US1lub/XOUXtJIrtlxynrF4P81wnn6+
	 nS2a3/U/HsJ5A==
Date: Tue, 7 Jan 2025 08:08:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/6] dt-bindings: clock: convert stm32 rcc bindings to
 json-schema
Message-ID: <tedqfrtcnx66j5tlkgmiv4wr6towpwwso4pjzraxm76cjejory@3cktakntjbab>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
 <20250105181525.1370822-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250105181525.1370822-2-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_230820_741734_DC42AD60 
X-CRM114-Status: GOOD (  22.86  )
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

On Sun, Jan 05, 2025 at 07:14:13PM +0100, Dario Binacchi wrote:
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> new file mode 100644
> index 000000000000..ae9e5b26d876
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> @@ -0,0 +1,143 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/st,stm32-rcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Reset Clock Controller
> +
> +maintainers:
> +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +
> +description: |
> +  The RCC IP is both a reset and a clock controller.
> +
> +  This binding uses common clock and reset bindings
> +  Documentation/devicetree/bindings/clock/clock-bindings.txt
> +  Documentation/devicetree/bindings/reset/reset.txt

Drop paragraph.

> +
> +  Specifying softreset control of devices
> +  =======================================
> +
> +  Device nodes should specify the reset channel required in their "resets"
> +  property, containing a phandle to the reset device node and an index specifying
> +  which channel to use.

Drop paragraph and rephrase it that reset phandle argument is "... the bit
number within the RCC...."

> +  The index is the bit number within the RCC registers bank, starting from RCC
> +  base address.
> +  It is calculated as: index = register_offset / 4 * 32 + bit_offset.
> +  Where bit_offset is the bit offset within the register.
> +
> +  For example, for CRC reset:
> +  crc = AHB1RSTR_offset / 4 * 32 + CRCRST_bit_offset = 0x10 / 4 * 32 + 12 = 140
> +
> +  The list of valid indices is available in:
> +  - include/dt-bindings/mfd/stm32f4-rcc.h for STM32F4 series
> +  - include/dt-bindings/mfd/stm32f7-rcc.h for STM32F7 series
> +  - include/dt-bindings/mfd/stm32h7-rcc.h for STM32H7 series
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: st,stm32f42xx-rcc
> +          - const: st,stm32-rcc
> +      - items:
> +          - enum:
> +              - st,stm32f469-rcc
> +          - const: st,stm32f42xx-rcc
> +          - const: st,stm32-rcc
> +      - items:
> +          - const: st,stm32f746-rcc
> +          - const: st,stm32-rcc
> +      - items:
> +          - enum:
> +              - st,stm32f769-rcc
> +          - const: st,stm32f746-rcc
> +          - const: st,stm32-rcc
> +      - items:
> +          - const: st,stm32h743-rcc
> +          - const: st,stm32-rcc

Old binding did not mention any fallbacks, so you need to explain this
in commit msg. You only said "st,stm32h743-rcc"

> + 
> +  reg:
> +    maxItems: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#clock-cells':
> +    enum: [1, 2]
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 3

You need to list the items with description. Narrow the clock numbers
per varian in allOf:if:then and explain this in commit msg (old binding
did not say three clocks, so that's another change).

> +
> +  st,syscfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to system configuration controller. It can be used to control the
> +      power domain circuitry.
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#reset-cells'
> +  - '#clock-cells'
> +  - clocks
> +  - st,syscfg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32h743-rcc
> +    then:
> +      properties:
> +        '#clock-cells':
> +          const: 1
> +          description: |
> +            The clock index for the specified type.
> +    else:
> +      properties:
> +        '#clock-cells':
> +          const: 2
> +          description: |
> +            - The first cell is the clock type, possible values are 0 for
> +              gated clocks and 1 otherwise.
> +            - The second cell is the clock index for the specified type.
> +
> +additionalProperties: false
> +
> +examples:
> +  # Reset and Clock Control Module node:
> +  - |
> +    rcc@40023800 {
> +        #reset-cells = <1>;
> +        #clock-cells = <2>;
> +        compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
> +        reg = <0x40023800 0x400>;

compatible and reg are alwys the first.

> +        clocks = <&clk_hse>, <&clk_i2s_ckin>;
> +        st,syscfg = <&pwrcfg>;

Only one example.

> +    };
> +
> +  - |
> +    rcc@40023800 {
> +        #reset-cells = <1>;
> +        #clock-cells = <2>;
> +        compatible = "st,stm32f746-rcc", "st,stm32-rcc";
> +        reg = <0x40023800 0x400>;
> +        clocks = <&clk_hse>, <&clk_i2s_ckin>;
> +        st,syscfg = <&pwrcfg>;
> +    };
> +
> +  - |
> +    rcc@58024400 {

clock-controller@58024400

> +        compatible = "st,stm32h743-rcc", "st,stm32-rcc";
> +        reg = <0x58024400 0x400>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +        clocks = <&clk_hse>, <&clk_lse>, <&clk_i2s>;
> +        st,syscfg = <&pwrcfg>;

So maybe just keep this example only.

> +    };
> +
> +...
> -- 
> 2.43.0
> 

