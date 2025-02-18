Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE627C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 13:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oie+WZykjpaiAtBGt7Vl8jucV+kCiqDcQGg81BQanoE=; b=mUxCOCDK6WqAyf9QTAYiCYnhKu
	s04S5qwKndl2x9FciZbxLpcymGbCuYkK6utIMpX866F8ibC+mDIB9+/aGVmFUfQGeUpu1eY1F4P3V
	qZYOKEKI3D7vO9Y/V21jJl+f6yvrBn3Wio20hTJRT0akYt8Vkn5O9Ot04nVORtvrMbqPD7MuMTDMD
	Bpu5x2BQwiXcBfarJBILHlIdw2lk6bOrhN9CG0tRpOpsJ+BLH5GeeROh1tTtmSTE6QzApvkYDSiXi
	+gXTTv3w9ANkIiFuKpxUbGTLZoeSAWGtp3IvtFJo35GSUK/hWbHJeEf5JMfmcjCvFAm0xhlEA4px2
	guww0b1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNXm-00000008IYi-3SJn;
	Tue, 18 Feb 2025 13:21:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNUS-00000008Hnl-4B4Q;
	Tue, 18 Feb 2025 13:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739884698;
	bh=qRk4j53lVB7FEHXKltoWq+UEMmzfmhZUgATQ1zdoUhA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NEXXYBrlzizv19XYV6v6Mk7Kh6oUFjKcuqHZxeuwMjrxx5KkiHPaKs2Tftp9OS7oe
	 11M0LwsI7OPyhzIsB2CPUi/VCZrsEjWJ5v9mCDbbyx7ap/s3wIdHcDm6iLgYXeYsDi
	 RzsY0TX3IF8MJQglqvkoBzMITXMcnzJZdMZUujC3anU70NBUDNM8LitTPubbecl/dN
	 Xp4372euwvf9D7rpGTjviR4neFS2T80Fu7CDMFsDIQc3A3xyAm6Bg1VBbLr1K0nPnD
	 zh3gg4nT4ojSX4SFP4xIYoyrkGSt35hxGFm13h32GGypz/+Fd7aL06yUyvE9hW3fbH
	 YjyxuEHyBBAUg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DF03517E0657;
	Tue, 18 Feb 2025 14:18:17 +0100 (CET)
Message-ID: <89fb495b-0171-49b3-a34b-022ba04f54df@collabora.com>
Date: Tue, 18 Feb 2025 14:18:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] ASoC: dt-bindings: Add document for mt6359-accdet
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org
References: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
 <20250214-mt6359-accdet-dts-v1-1-677a151b9b4c@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250214-mt6359-accdet-dts-v1-1-677a151b9b4c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_051821_209748_DC447B34 
X-CRM114-Status: GOOD (  21.15  )
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

Il 14/02/25 18:18, Nícolas F. R. A. Prado ha scritto:
> Add dt-binding for the MT6359 ACCDET hardware block.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   .../bindings/sound/mediatek,mt6359-accdet.yaml     | 293 +++++++++++++++++++++
>   1 file changed, 293 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6359-accdet.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6359-accdet.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8922003d3b9d039d2a0355add7a90cf42b1a9da6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt6359-accdet.yaml
> @@ -0,0 +1,293 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt6359-accdet.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MT6359 Accessory Detection
> +
> +maintainers:
> +  - Nícolas F. R. A. Prado <nfraprado@collabora.com>
> +
> +description: |
> +  The MT6359 Accessory Detection block is part of the MT6359 PMIC and allows
> +  detecting audio jack insertion and removal, as well as identifying the type of
> +  events connected to the jack.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6359-accdet
> +
> +  mediatek,mic-vol:

mediatek,micbias1-microvolts = <1700000>;

enum: [1700000, 1800000 ... etc ]

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: MIC bias1 output voltage setting
> +    enum:
> +      - 0 # 1.7V
> +      - 1 # 1.8V
> +      - 2 # 1.9V
> +      - 3 # 2.0V
> +      - 4 # 2.1V
> +      - 5 # 2.5V
> +      - 6 # 2.6V
> +      - 7 # 2.7V
> +      - 8 # 2.8V
> +      - 9 # 2.85V
> +
> +  mediatek,mic-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Mic mode setting
> +    enum:
> +      - 1 # ACC
> +      - 2 # DCC mode. Low cost mode without internal bias
> +      - 6 # DCC mode. Low cost mode with internal bias

This is already defined in mt6359.yaml....?!

> +
> +  mediatek,eint-cmpmen-pwm-width:

mediatek,eint-cmpm-pwm-width-ms:

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: EINT CMPMEN PWM width

P.S.: CMPMEN = CoMParator Monitor ENable

description: EINT Comparator Monitor PWM Width

enum: [50, 80, 100, 200, 400, 500, 800, 1000]

> +    enum:
> +      - 0 # 50ms
> +      - 1 # 80ms
> +      - 2 # 100ms
> +      - 3 # 200ms
> +      - 4 # 400ms
> +      - 5 # 500ms
> +      - 6 # 800ms
> +      - 7 # 1000ms
> +
> +  mediatek,eint-cmpmen-pwm-thresh:

mediatek,eint-cmpm-pwm-threshold-ms:

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: EINT CMPMEN PWM threshold

description: EINT Comparator Monitor PWM Threshold

enum: [1, 2, 3, 4, 5, 8, 10, 20, 30]

> +    enum:
> +      - 0 # 1ms
> +      - 1 # 2ms
> +      - 2 # 4ms
> +      - 3 # 5ms
> +      - 4 # 8ms
> +      - 5 # 10ms
> +      - 6 # 20ms
> +      - 7 # 30ms
> +
> +  mediatek,pwm-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: PWM width
> +    minimum: 0
> +    maximum: 65535
> +
> +  mediatek,pwm-thresh:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: PWM threshold
> +    minimum: 0
> +    maximum: 65535

You can simplify those two with one param "mediatek,pwm-duty-cycle", I think.
But then, regardless, you still need to express this in decent units...

make a few calculations - but the equation is...

PWM Width      = (32768 / (mediatek,pwm-width + 1)) [hertz]
PWM Duty Cycle = ((mediatek,pwm-thresh + 1) / (mediatek,pwm-width + 1)) [ns?]
PWM High Time  = (mediatek,pwm-thresh + 1) / 32768 [seconds]

> +
> +  mediatek,pwm-rise-delay:

mediatek,pwm-rise-delay-cycle:

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Rise delay for PWM

description: Rising delay of PWM waveform in cycles

> +    minimum: 0
> +    maximum: 65535
> +
> +  mediatek,pwm-fall-delay:

same for the falling one

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Fall delay for PWM
> +    minimum: 0
> +    maximum: 65535
> +
> +  mediatek,debounce0:

mediatek,adc-debounce-ns = < debounce0 debounce1 debounce2 debounce3 >

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Debounce time for state 0
> +    minimum: 0
> +    maximum: 65535
> +
> +  mediatek,debounce1:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Debounce time for state 1
> +    minimum: 0
> +    maximum: 65535
> +
> +  mediatek,debounce3:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Debounce time for state 3
> +    minimum: 0
> +    maximum: 65535
> +
> +  mediatek,debounce-auxadc:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Debounce time for AUXADC
> +    minimum: 0
> +    maximum: 65535
> +

mediatek,eint-debounce-ns = < same as adc-debounce-ns >

> +  mediatek,eint-debounce0:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Debounce time for EINT state 0
> +    enum:
> +      - 0 # 0ms
> +      - 1 # 0.12ms
> +      - 2 # 0.25ms
> +      - 3 # 0.5ms
> +      - 4 # 0.75ms
> +      - 5 # 1ms
> +      - 6 # 2ms
> +      - 7 # 4ms
> +      - 8 # 8ms
> +      - 9 # 16ms
> +      - 10 # 32ms
> +      - 11 # 48ms
> +      - 12 # 64ms
> +      - 13 # 128ms
> +      - 14 # 256ms
> +      - 15 # 512ms
> +
> +  mediatek,eint-debounce1:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Debounce time for EINT state 1
> +    enum:
> +      - 0 # 0ms
> +      - 1 # 0.5ms
> +      - 2 # 0.75ms
> +      - 3 # 0.9ms
> +      - 4 # 1.5ms
> +      - 5 # 1.8ms
> +      - 6 # 3ms
> +      - 7 # 3.5ms
> +      - 8 # 3.8ms
> +      - 9 # 16ms
> +      - 10 # 32ms
> +      - 11 # 48ms
> +      - 12 # 64ms
> +      - 13 # 128ms
> +      - 14 # 256ms
> +      - 15 # 512ms
> +
> +  mediatek,eint-debounce2:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Debounce time for EINT state 2
> +    enum:
> +      - 0 # 0ms
> +      - 1 # 0.5ms
> +      - 2 # 0.75ms
> +      - 3 # 0.9ms
> +      - 4 # 1.5ms
> +      - 5 # 1.8ms
> +      - 6 # 3ms
> +      - 7 # 3.5ms
> +      - 8 # 3.8ms
> +      - 9 # 4ms
> +      - 10 # 4.5ms
> +      - 11 # 5ms
> +      - 12 # 7ms
> +      - 13 # 9ms
> +      - 14 # 19ms
> +      - 15 # 25ms
> +
> +  mediatek,eint-debounce3:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Debounce time for EINT state 3
> +    enum:
> +      - 0 # 0ms
> +      - 1 # 0.12ms
> +      - 2 # 0.25ms
> +      - 3 # 0.5ms
> +      - 4 # 0.75ms
> +      - 5 # 1ms
> +      - 6 # 2ms
> +      - 7 # 4ms
> +      - 8 # 8ms
> +      - 9 # 16ms
> +      - 10 # 32ms
> +      - 11 # 48ms
> +      - 12 # 64ms
> +      - 13 # 128ms
> +      - 14 # 256ms
> +      - 15 # 512ms
> +
> +  mediatek,eint-inverter-debounce:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Debounce time for EINT inverter
> +    enum:
> +      - 0 # 0ms
> +      - 1 # 0.12ms
> +      - 2 # 0.25ms
> +      - 3 # 0.5ms
> +      - 4 # 0.75ms
> +      - 5 # 1ms
> +      - 6 # 2ms
> +      - 7 # 4ms
> +      - 8 # 8ms
> +      - 9 # 16ms
> +      - 10 # 32ms
> +      - 11 # 48ms
> +      - 12 # 64ms
> +      - 13 # 128ms
> +      - 14 # 256ms
> +      - 15 # 512ms
> +
> +  mediatek,eint-detect-mode:

This is fine, I think.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: EINT detection mode
> +    enum:
> +      - 0 # Higher detection power
> +      - 1 # Lower detection power
> +      - 2 # SW moisture detection mode1
> +      - 3 # HW moisture detection mode1
> +      - 4 # HW moisture detection mode2
> +
> +  mediatek,eint-num:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: EINT interrupt that should be enabled
> +    enum:
> +      - 0 # EINT0
> +      - 1 # EINT1
> +      - 2 # EINT0 | EINT1
> +
> +  mediatek,eint-use-ext-res:
> +    type: boolean
> +    description:
> +      Whether an external resistor should be used for the HP_EINT signal.
> +      By default an internal pull-up resistor is used.
> +
> +  mediatek,eint-comp-vth:

mediatek,eint-comp-vth-microvolts = ....

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: EINT comparator threshold
> +    enum:
> +      - 0 # 2.4V
> +      - 1 # 2V
> +      - 2 # 1.6V
> +      - 3 # 1.2V
> +      - 4 # 0.8V
> +

...and that's more or less it....

Cheers,
Angelo

> +  mediatek,eint-level-pol:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: EINT interrupt polarity
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    accdet: accdet {
> +        compatible = "mediatek,mt6359-accdet";
> +        mediatek,mic-vol = <8>;
> +        mediatek,mic-mode = <2>;
> +        mediatek,pwm-width = <0x500>;
> +        mediatek,pwm-thresh = <0x500>;
> +        mediatek,pwm-fall-delay = <1>;
> +        mediatek,pwm-rise-delay = <0x1f0>;
> +        mediatek,debounce0 = <0x800>;
> +        mediatek,debounce1 = <0x800>;
> +        mediatek,debounce3 = <0x20>;
> +        mediatek,debounce-auxadc = <0x44>;
> +        mediatek,eint-cmpmen-pwm-width = <4>;
> +        mediatek,eint-cmpmen-pwm-thresh = <1>;
> +        mediatek,eint-debounce0 = <5>;
> +        mediatek,eint-debounce1 = <3>;
> +        mediatek,eint-debounce2 = <3>;
> +        mediatek,eint-debounce3 = <5>;
> +        mediatek,eint-inverter-debounce = <0xe>;
> +        mediatek,eint-detect-mode = <4>;
> +        mediatek,eint-num = <0>;
> +        mediatek,eint-comp-vth = <2>;
> +        mediatek,eint-level-pol = <IRQ_TYPE_LEVEL_LOW>;
> +    };
> 


