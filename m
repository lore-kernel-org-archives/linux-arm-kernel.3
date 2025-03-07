Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975B8C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 15:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJEhgvGQ/tBhoGGvhnVqIYKObOpu2eHYHIpaEY3cHog=; b=3iBPsjP1ynDhuKJ/xKXhk0hwtS
	IGHwTQYC8q0mDe9/CEI9bj55Gv5SsEmvcrCxKy5UsNf+lrbzOuQfFiq+yDOzjygayNZMhynb44PPV
	LBHj3rxgywL53lxgyk7ZmeG+CYwzkproHI5apIcVF1eUzITFB2ux4v07/bc9G9Q4ghn+VSHCIj7pt
	qGVvc3LJqwY8HOD9JYS0vzyBY2j7lf4xQUqTNL0p3c3JPOWEgAz02p9+ltfpi7S+RoSndp6BxCSlU
	DzAzUjOwfz02ERjeVBzW0CTTWPLlB9m9HjCCKWorB58NfnCDFE31248qTXT4XxMBFMm/BhNq1OB33
	EhO6WvFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZUW-0000000EcaL-3sQk;
	Fri, 07 Mar 2025 15:20:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZQO-0000000EbZ7-40BF;
	Fri, 07 Mar 2025 15:15:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B7835C5B75;
	Fri,  7 Mar 2025 15:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111A7C4CED1;
	Fri,  7 Mar 2025 15:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741360543;
	bh=H8n13blks6nrv7/hlDAzfpW6fo6pnvJRhIVCn9BJ3jc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZvVLK8weXD5lfjpk3JJDmKzcgvbIiQEjcP5RhNsRPDcz7HsGDiUO4zB+b46CKJi0h
	 OHECjDmW+r2aMgu4AawEnbs4hO72yXTLwx7z5oCmYfl5hTz9rb1CKTLS3shdY05R72
	 q0ii4qENMKF+N+FnLDpGu3IA0qFK6hPU7Bh3IXgu1pVkfwCS3zXReRf1pbbvhMR3UQ
	 Mg7VdJ/bU5ZiV955EdoO/Gm4d4UL4woEcS4+OEQLd82WlIEEu5hqVU1KBDx5q2IC/s
	 4uPu3dQoXyJzMBlDbZhEAgXIoNCJmSNOEp7Oyh3RT7SCc73FrKkcPBGOk+ElOYllv6
	 AQz40N+a2ssyQ==
Message-ID: <cfd05cd7-4541-476f-aafd-9e3239d88048@kernel.org>
Date: Fri, 7 Mar 2025 16:15:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] dt-bindings: mediatek: mt8196: add audio AFE
 document
To: "Darren.Ye" <darren.ye@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20250307124841.23777-1-darren.ye@mediatek.com>
 <20250307124841.23777-13-darren.ye@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250307124841.23777-13-darren.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_071545_081487_80B178CC 
X-CRM114-Status: GOOD (  19.18  )
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

On 07/03/2025 13:47, Darren.Ye wrote:
> From: Darren Ye <darren.ye@mediatek.com>
> 
> Add mt8196 audio AFE document.
> 
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

> ---
>  .../bindings/sound/mediatek,mt8196-afe.yaml   | 259 ++++++++++++++++++
>  1 file changed, 259 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> new file mode 100644
> index 000000000000..59f8fdf3167c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
> @@ -0,0 +1,259 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt8196-afe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Audio Front End PCM controller for MT8196
> +
> +maintainers:
> +  - Darren Ye <darren.ye@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-afe-pcm
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: audio hopping clock
> +      - description: audio f26m clock
> +      - description: audio ul0 adc clock
> +      - description: audio ul0 adc hires clock
> +      - description: audio ul1 adc clock
> +      - description: audio ul1 adc hires clock
> +      - description: audio apll1 clock
> +      - description: audio apll2 clock
> +      - description: audio apll tuner1 clock
> +      - description: audio apll tuner2 clock
> +      - description: vlp mux audio int
> +      - description: vlp mux aud engen1
> +      - description: vlp mux aud engen2
> +      - description: vlp mux audio h
> +      - description: vlp clock 26m
> +      - description: ck mainpll d4 d4
> +      - description: ck mux aud 1
> +      - description: ck apll1
> +      - description: ck mux aud 2
> +      - description: ck apll2
> +      - description: ck apll1 d4
> +      - description: ck apll2 d4
> +      - description: ck i2sin0 m sel
> +      - description: ck i2sin1 m sel
> +      - description: ck fmi2s m sel
> +      - description: ck tdmout m sel
> +      - description: ck apll12 div i2sin0
> +      - description: ck apll12 div i2sin1
> +      - description: ck apll12 div fmi2s
> +      - description: ck apll12 div tdmout m
> +      - description: ck apll12 div tdmout b
> +      - description: ck adsp sel
> +      - description: ck clock 26m
> +
> +  clock-names:
> +    items:
> +      - const: aud_hopping_clk

Look how other bindings call it. s/_clk//

> +      - const: aud_f26m_clk
> +      - const: aud_ul0_adc_clk
> +      - const: aud_ul0_adc_hires_clk
> +      - const: aud_ul1_adc_clk
> +      - const: aud_ul1_adc_hires_clk
> +      - const: aud_apll1_clk
> +      - const: aud_apll2_clk
> +      - const: aud_apll_tuner1_clk
> +      - const: aud_apll_tuner2_clk
> +      - const: vlp_mux_audio_int
> +      - const: vlp_mux_aud_eng1
> +      - const: vlp_mux_aud_eng2
> +      - const: vlp_mux_audio_h
> +      - const: vlp_clk26m_clk
> +      - const: ck_mainpll_d4_d4

What does ck stand for? You should name and explain the clocks based on
this block, not the source.


> +      - const: ck_mux_aud_1
> +      - const: ck_apll1_ck
> +      - const: ck_mux_aud_2
> +      - const: ck_apll2_ck
> +      - const: ck_apll1_d4
> +      - const: ck_apll2_d4
> +      - const: ck_i2sin0_m_sel
> +      - const: ck_i2sin1_m_sel
> +      - const: ck_fmi2s_m_sel
> +      - const: ck_tdmout_m_sel
> +      - const: ck_apll12_div_i2sin0
> +      - const: ck_apll12_div_i2sin1
> +      - const: ck_apll12_div_fmi2s
> +      - const: ck_apll12_div_tdmout_m
> +      - const: ck_apll12_div_tdmout_b
> +      - const: ck_adsp_sel
> +      - const: ck_clk26m_clk

s/ck//
s/clk// and this goes probably first. Look at other bindings.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  cksys:

Again, open existing bindings.

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the cksys clock controller.

This tell me not much. Why do you need it?

Drop redundant 'Phandle to' and explain how it is used.

> +
> +  vlpcksys:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the vlpcksys clock controller.

No, because you keep encoding clock information via non-clock API.

> +
> +  memory-region:
> +    $ref: /schemas/types.yaml#/definitions/phandle

Drop, see other bindings.


> +    description: Phandle to the reserved memory region for AFE DMA.
> +
> +  pinctrl-names:

Drop

> +    items:
> +      - const: default
> +
> +  pinctrl-0:

Drop

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the pin control group for default state.
> +
> +  mediatek,etdm-out-ch:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Number of ETDM output channels.
> +    enum: [2]

That's pointless.

> +
> +  mediatek,etdm-in-ch:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Number of ETDM input channels.
> +    enum: [2]
> +
> +  mediatek,etdm-out-sync:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: ETDM output synchronization.
> +    enum: [0, 1]
> +
> +  mediatek,etdm-in-sync:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: ETDM input synchronization.
> +    enum: [0, 1]
> +
> +  mediatek,etdm-ip-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: ETDM IP mode.
> +    enum: [0, 1]

Drop all above properties or explain why they make any sense in the
terms of board configuration.


> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +  - cksys
> +  - vlpcksys
> +  - memory-region

> +  - pinctrl-names
> +  - pinctrl-0

Why?

> +  - mediatek,etdm-out-ch
> +  - mediatek,etdm-in-ch
> +  - mediatek,etdm-out-sync
> +  - mediatek,etdm-in-sync
> +  - mediatek,etdm-ip-mode
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8196-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/mt8196-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        afe: mt8196-afe-pcm@1a110000 {

Again... look at other bindings.


Best regards,
Krzysztof

