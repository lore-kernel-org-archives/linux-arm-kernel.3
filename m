Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F59C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 14:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ilmNHW8IMsja1rXXFlK8PgaoXkE7Mg5ZUQV/X28rQ/w=; b=IMrcu4xIUQXaD/hnKcvDxr+4ZA
	U8+8xiqyMHLtYSD7WBwKavWgckeg2c3VCatWQLxPr4oq/4E4hchP9bT7Sa269oaKf5J5TecF7iYbh
	2YQhhq2PhpCCip0vwEafAXtynXfKaN/8c7w58m8a+ZobQ3Ei6qEhMvg4K+iCfVT0YdrQHWqOa8sgC
	URMheWNbmADqS4kudT76pjEksWAlW8PWHX7QKVqwtQznbasjvVgjd2kCL5wVtdgX6NjXUfHGrJXgn
	XD+B4LXNnFbfjGk7+N89edN7sY5iiMO/1nn8/KTvGEUiFIKB2vRB8k/fPjDMewpP59i0sDHwLQ7Bm
	Jbwqa0UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkg2-0000000D9JW-44fD;
	Wed, 19 Feb 2025 14:03:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkdW-0000000D88z-1Bjj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 14:01:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AD6A8A427F8;
	Wed, 19 Feb 2025 13:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77A5C4CED1;
	Wed, 19 Feb 2025 14:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739973673;
	bh=Ah42zirfWgU7LWvxY7zMUQ4RD7yPe5FX8hB+F2CoHHg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gYALs8mlbi80V0H9lBr2L6F0iHCBN4XUWOVGk+LKaazfCU1YIeJuhTiWtFu30Mdym
	 jFK0zrrdW2Z2r2o1RR+khR/GixdY2NgQ6ol1lcjyWOY8GuRlQzZZ/ydapTBTZaYnxS
	 JbmeTJLEIDvYn2zAFOpkqSRacgZ3UnXhTfdp4NxQBAG579XeRhgISYQZvEQoADPHcs
	 hDfAthn8qvHJMHmt64/YPbTmkbj8SXfMBkB3wj5vw6UzNOxCoxQrG6FJm6vC5hfuO1
	 bN7jNyw27C6lJa+N5UQIzhWw7LxBdf/wjKBxoXIwZH36zalnABun5AsqALa4xYBi+b
	 sm0DoNZ3StZCw==
Message-ID: <fd70f78c-68a5-43ec-9eb2-3f06c5d7a20d@kernel.org>
Date: Wed, 19 Feb 2025 15:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: emc2305: Add YAML binding
 documentation for emc2305 driver
To: florin.leotescu@oss.nxp.com, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: viorel.suman@nxp.com, carlos.song@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 Florin Leotescu <florin.leotescu@nxp.com>
References: <20250219133221.2641041-1-florin.leotescu@oss.nxp.com>
 <20250219133221.2641041-4-florin.leotescu@oss.nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250219133221.2641041-4-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_060114_460649_1CC96F4F 
X-CRM114-Status: GOOD (  19.47  )
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

On 19/02/2025 14:32, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 

A nit, subject: drop second/last, redundant "YAML binding
documentation". Three useless/redundant terms. The "dt-bindings" prefix
is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

And drop all driver references - you put it everywhere.


> Add yaml-based Device Tree bindings documentation for emc2305 driver
> The file provides the necessary structure, configuration
> and other parameters for Device Tree definition.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> ---
>  .../devicetree/bindings/hwmon/emc2305.yaml    | 95 +++++++++++++++++++

Filename matching compatible.

>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/emc2305.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/emc2305.yaml b/Documentation/devicetree/bindings/hwmon/emc2305.yaml
> new file mode 100644
> index 000000000000..51e2a82d8f25
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/emc2305.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/emc2305.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: EMC2305 i2c pwm fan controller
> +
> +maintainers:
> +  - Michael Shych <michaelsh@nvidia.com>
> +
> +description: |
> +  The driver implements support for Microchip EMC2301/2/3/5 PWM Fan Controller.

This is a binding so describe hardware, not your implementation.


> +  The EMC2301 Fan Controller supports only one controlled PWM fan channel.
> +  The EMC2305 Fan Controller supports up to 5 independently
> +  controlled PWM fan drives.
> +

Missing fan-common reference.

> +properties:
> +  compatible:
> +    enum:
> +      - hwmon,emc2301
> +      - hwmon,emc2302
> +      - hwmon,emc2303
> +      - hwmon,emc2305

Nope.

Was it ever internally reviewed?


> +
> +  reg:
> +    description: I2C address of the emc2305 device

Look how other bindings do it.

> +
> +  pwm_output:

NAK.

There are so many issues with this code, from trivial incorrect quotes
and not following DTS coding style, to actual duplicating other schemas
or common part.

Sorry, get it first internally reviewed.

> +    description: "PWM output type Push-Pull/ Open Drain"
> +    maxItems: 1
> +
> +  pwm_polarity:
> +    description: "PWM polarity"
> +    maxItems: 1
> +
> +  '#cooling-cells':
> +    description: "cooling state range"

Do you see any binding like that? Any?

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    thermal_zones {
> +        a55-thermal {
> +                trips {
> +                        atrip0: trip0 {
> +                                temperature = <55000>;
> +                                hysteresis = <2000>;
> +                                type = "active";
> +                        };
> +
> +                        atrip1: trip1 {
> +                                temperature = <65000>;
> +                                hysteresis = <2000>;
> +                                type = "active";
> +                        };
> +
> +                        atrip2: trip2 {
> +                                temperature = <75000>;
> +                                hysteresis = <2000>;
> +                                type = "active";
> +                        };
> +                };
> +
> +                cooling-maps {
> +                        map1 {
> +                                trip = <&atrip0>;
> +                                cooling-device = <&emc2301 4 6>;
> +                        };
> +
> +                        map2 {
> +                                trip = <&atrip1>;
> +                                cooling-device = <&emc2301 6 8>;
> +                        };
> +
> +                        map3 {
> +                                trip = <&atrip2>;
> +                                cooling-device = <&emc2301 8 10>;
> +                        };
> +                };
> +        };
> +
> +    }

This DTS is also in very poor shape - even your indentation does not
match. Drop redundant parts - entire thermal.

> +    emc2301: pwm@2f {
> +       compatible = "hwmon,emc2301";
> +       reg = <0x2f>;
> +       #cooling-cells = <2>;
> +       pwm_output = <0x1>;
> +       pwm_polarity = <0x1>;
> +    };


Best regards,
Krzysztof

