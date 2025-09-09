Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FA1CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zh5sY06tAQIi2285XtWukLXdwjEX7/VCKB/pF8NtVww=; b=CuRHQ81+6lX41YZOw21HG7es4E
	C3Y4ZTIBCEqzYWW8w3aa12jA2n65HFW7v6//LKFAKVCdEeppaCYnxoZJzgKSPLczMHIdh9NUKAoEo
	b2WtDf3vvd7JP1GjSOi8hQSs9cQ8pAIJFjWAd4R8P4665GZf4sFGli4LBpJfCVTjA7jYnAKiklbWA
	cYtkFQ0iyI5BLcs7JeaY1e4Q/GpmFhG5KfCvy/V8CM8dsOlRKHoz3q9bqZcPoHWK9pEQTpuA1yzNK
	LtMXSmWsVwN95OofjHdejcbG0DC2YyKUWDpB8T3GfgHnNJBJk/0VqL72xEsukWW8x3WlEiPSq11MU
	FHryiCXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1xx-00000008qso-3zNd;
	Tue, 09 Sep 2025 17:17:14 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxFG-000000070CB-0ODb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 12:14:47 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=j8qY2/7a8ePIxrqZQXvrBmH0RKrjQLpb5akUZKSCAGk4EvB2bmcXG21rNMv52eQrtguTCUVHjyeQLMhjpcNqCU84f2G/+z4nlfLW2GW0qVAIwCzUS3/FLMuEIe3JG2MYmAMZaoiz6ztxfmVXcWmFrmn48S9fSwCF3+ZV6eNzYyk9a13n2GdR5d9Amz8DjJnMWfSv71o3w6agMPE5bsrC4ohM5ALnASOaQs5LmOKfgDs6+/OxidJvnD65EoM5LaUx/S8pnqbRND7urnx/PmzS+PgQC2+eh9ZEcrHdwdz/WMbNWh9lraIyUFcGvAdSkLbOXEOolZ3s+MfP7LfUPoblhQ==; s=purelymail2; d=purelymail.com; v=1; bh=IsdM/3F1Q6gkhhBr0tu3r8LDY45Dp22k/hV+pt0fo2M=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -824743633;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 09 Sep 2025 12:14:11 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Sep 2025 14:14:08 +0200
Message-Id: <DCO9EWX469HR.2R09YSL967MSV@mentallysanemainliners.org>
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: mediatek: Document MT6878 pin
 controller bindings
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Igor Belwon"
 <igor.belwon@mentallysanemainliners.org>
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Sean Wang" <sean.wang@kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org> <20250908-mt6878-pinctrl-support-v1-1-3fb78c8ab4e8@mentallysanemainliners.org> <20250909-mellow-eminent-duck-4c4619@kuoka>
In-Reply-To: <20250909-mellow-eminent-duck-4c4619@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_051446_210489_BCFE6429 
X-CRM114-Status: GOOD (  21.83  )
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

On Tue Sep 9, 2025 at 9:37 AM CEST, Krzysztof Kozlowski wrote:
> On Mon, Sep 08, 2025 at 09:17:55PM +0200, Igor Belwon wrote:
>> Add device-tree bindings for the pin controller and the EINT controller
>> found in the MediaTek MT6878 SoC.
>>=20
>> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
>> ---
>>  .../bindings/pinctrl/mediatek,mt6878-pinctrl.yaml  |  209 ++++
>>  include/dt-bindings/pinctrl/mt6878-pinfunc.h       | 1201 +++++++++++++=
+++++++
>>  2 files changed, 1410 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-p=
inctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pin=
ctrl.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..ecd24ab23a0c41810828ddb8=
827ab39c4cd3d2fc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.=
yaml
>> @@ -0,0 +1,209 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6878-pinctrl.yaml=
#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek MT6878 Pin Controller
>> +
>> +maintainers:
>> +  - Igor Belwon <igor.belwon@mentallysanemainliners.org>
>> +
>> +description:
>> +  The MediaTek MT6878 Pin controller is used to control SoC pins.
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt6878-pinctrl
>> +
>> +  reg:
>> +    items:
>> +      - description: pin controller base
>> +      - description: bl group IO
>> +      - description: bm group IO
>> +      - description: br group IO
>> +      - description: bl1 group IO
>> +      - description: br1 group IO
>> +      - description: lm group IO
>> +      - description: lt group IO
>> +      - description: rm group IO
>> +      - description: rt group IO
>> +      - description: EINT controller E block
>> +      - description: EINT controller S block
>> +      - description: EINT controller W block
>> +      - description: EINT controller C block
>> +
>> +  reg-names:
>> +    items:
>> +      - const: base
>> +      - const: bl
>> +      - const: bm
>> +      - const: br
>> +      - const: bl1
>> +      - const: br1
>> +      - const: lm
>> +      - const: lt
>> +      - const: rm
>> +      - const: rt
>> +      - const: eint-e
>> +      - const: eint-s
>> +      - const: eint-w
>> +      - const: eint-c
>> +
>> +  gpio-controller: true
>> +
>> +  '#gpio-cells':
>> +    description:
>> +      Number of cells in GPIO specifier. Since the generic GPIO binding=
 is used,
>> +      the amount of cells must be specified as 2. See the below mention=
ed gpio
>> +      binding representation for description of particular cells.
>> +    const: 2
>> +
>> +  gpio-ranges:
>> +    maxItems: 1
>> +
>> +  gpio-line-names: true
>
> How many GPIOs do you have? No limit?
>

How shall I limit the GPIOs?
The maximum amount that this SoC supports is 216, looking into
dt-bindings for pinctrl, I haven't seen a SoC that limits them in
bindings. Maybe I missed it though...

>> +
>> +  interrupts:
>> +    description: The interrupt outputs to sysirq
>> +    maxItems: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  '#interrupt-cells':
>> +    const: 2
>> +
>> +# PIN CONFIGURATION NODES
>> +patternProperties:
>> +  '-pins$':
>> +    type: object
>> +    additionalProperties: false
>> +
>> +    patternProperties:
>> +      '^pins':
>> +        type: object
>> +        allOf:
>> +          - $ref: /schemas/pinctrl/pincfg-node.yaml
>> +          - $ref: /schemas/pinctrl/pinmux-node.yaml
>> +        description:
>> +          A pinctrl node should contain at least one subnodes represent=
ing the
>> +          pinctrl groups available on the machine. Each subnode will li=
st the
>> +          pins it needs, and how they should be configured, with regard=
 to muxer
>> +          configuration, pullups, drive strength, input enable/disable =
and input
>> +          schmitt.
>> +
>> +        properties:
>> +          pinmux:
>> +            description:
>> +              Integer array, represents gpio pin number and mux setting=
.
>> +              Supported pin number and mux are defined as macros in
>> +              arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h for this So=
C.
>> +
>> +          drive-strength:
>> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
>> +
>> +          drive-strength-microamp:
>> +            enum: [125, 250, 500, 1000]
>> +
>> +          bias-pull-down:
>> +            oneOf:
>> +              - type: boolean
>> +              - enum: [75000, 5000]
>> +                description: Pull down RSEL type resistance values (in =
ohms)
>> +            description:
>> +              For normal pull down type there is no need to specify a r=
esistance
>> +              value, hence this can be specified as a boolean property.
>> +              For RSEL pull down type a resistance value (in ohms) can =
be added.
>> +
>> +          bias-pull-up:
>> +            oneOf:
>> +              - type: boolean
>> +              - enum: [10000, 5000, 4000, 3000]
>> +                description: Pull up RSEL type resistance values (in oh=
ms)
>> +            description:
>> +              For normal pull up type there is no need to specify a res=
istance
>> +              value, hence this can be specified as a boolean property.
>> +              For RSEL pull up type a resistance value (in ohms) can be=
 added.
>> +
>> +          bias-disable: true
>> +
>> +          output-high: true
>> +
>> +          output-low: true
>> +
>> +          input-enable: true
>> +
>> +          input-disable: true
>> +
>> +          input-schmitt-enable: true
>> +
>> +          input-schmitt-disable: true
>> +
>> +        required:
>> +          - pinmux
>> +
>> +        additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-controller
>> +  - '#interrupt-cells'
>> +  - gpio-controller
>> +  - '#gpio-cells'
>> +  - gpio-ranges
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/pinctrl/mt65xx.h>
>
> Why including mt65xx?
>
>> +    #define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
>
> I don't understand why do you need it? Didn't you have header for that?
> Or you prepared for header removal (see my further comment), but then it
> is just confusing.
>

Will use the new header in V2.

>> +    #define PINMUX_GPIO99__FUNC_SCL0 (MTK_PIN_NO(99) | 1)
>> +    #define PINMUX_GPIO100__FUNC_SDA0 (MTK_PIN_NO(100) | 1)
>> +
>> +    pio: pinctrl@10005000 {
>> +        compatible =3D "mediatek,mt6878-pinctrl";
>> +        reg =3D <0x10005000 0x1000>,
>> +              <0x11d10000 0x1000>,
>> +              <0x11d30000 0x1000>,
>> +              <0x11d40000 0x1000>,
>> +              <0x11d50000 0x1000>,
>> +              <0x11d60000 0x1000>,
>> +              <0x11e20000 0x1000>,
>> +              <0x11e30000 0x1000>,
>> +              <0x11eb0000 0x1000>,
>> +              <0x11ec0000 0x1000>,
>> +              <0x11ce0000 0x1000>,
>> +              <0x11de0000 0x1000>,
>> +              <0x11e60000 0x1000>,
>> +              <0x1c01e000 0x1000>;
>> +        reg-names =3D "base", "bl", "bm", "br", "bl1", "br1",
>> +                    "lm", "lt", "rm", "rt", "eint-e", "eint-s",
>> +                    "eint-w", "eint-c";
>> +        gpio-controller;
>> +        #gpio-cells =3D <2>;
>> +        gpio-ranges =3D <&pio 0 0 220>;
>> +        interrupt-controller;
>> +        interrupts =3D <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH 0>;
>> +        #interrupt-cells =3D <2>;
>> +
>> +        gpio-pins {
>> +            pins {
>> +                pinmux =3D <PINMUX_GPIO0__FUNC_GPIO0>;
>> +                bias-pull-up =3D <4000>;
>> +                drive-strength =3D <6>;
>> +            };
>> +        };
>> +
>> +        i2c0-pins {
>> +            pins-bus {
>> +                pinmux =3D <PINMUX_GPIO99__FUNC_SCL0>,
>> +                         <PINMUX_GPIO100__FUNC_SDA0>;
>> +                bias-pull-down =3D <75000>;
>> +                drive-strength-microamp =3D <1000>;
>> +            };
>> +        };
>> +    };
>> diff --git a/include/dt-bindings/pinctrl/mt6878-pinfunc.h b/include/dt-b=
indings/pinctrl/mt6878-pinfunc.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..4e8e475a74549b513ac7075a=
c2ef0fe6f7f1d097
>> --- /dev/null
>> +++ b/include/dt-bindings/pinctrl/mt6878-pinfunc.h
>
> This is now in DTS.

Will move over in V2.

>
>> @@ -0,0 +1,1201 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>
> Otherwise wrong license and wrong filename (vendor prefix, filename
> matching binding).
>
> Best regards,
> Krzysztof

Thanks,
Igor

