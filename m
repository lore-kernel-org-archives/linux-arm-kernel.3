Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C80CC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 06:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0rUAIhiX54ZyAFltGrt8Dw3miFYcZyAbImO8RoSkZY=; b=k6dbnfiJZA5jMshv1m9EeA/aOv
	/YrDoLCQYiE6WeZXFa08AilFCrCXH7D7Q52gzRS5lA2fvCOmT7BB/zg5brX4pD+NBDiMLGmL70t9l
	YoufqnCb1Q/U4FpSmtXaG30DFWTeo5Waza91qzRjsnOFhDd4akVMBAHf337psaWUrj0E3h2DoRub4
	I7ekgPq0Si6isHwcgZHH6j3XqEdvX7giiy1jI0uOLLIcQs7DWWmKTVVn1vFLsF39krzb39rcX6FDh
	UoKDpnzI3v+s5M4y9bGgEw8R4hHv84mZRrBl99nJxuHN1v/1N6upiCI1ZjRvjc/G+L33Ey3fiMthw
	FS+60avQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udkJ7-0000000GQ0G-12PS;
	Mon, 21 Jul 2025 06:47:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udkGS-0000000GPXw-3naM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 06:44:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 522E64566F;
	Mon, 21 Jul 2025 06:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD43DC4CEED;
	Mon, 21 Jul 2025 06:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753080284;
	bh=wvxEQfO5q7696mFzNxs9ne5fSgIF2uWYH+60V8ROAmo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=koyHUpY3JFkN64NrYE9EI1KXTEwY/vPI0Jp0RcWoI542qQcQxlthOETZ2QIzqKzaQ
	 HxWlFfgqat8RqDd+pQo4q7Y/pBuk8Ce+YdQdJovRuKjNkUBp+SE1xC6ZluHdzYPD6b
	 5svg/VaZN7OqRY1MRnIOZ0jxbd7NLHVK7LniR2mPO9XIffWPdd2UEi/fu42q1Sk7LZ
	 W45mf/I3UIsCiKmUirHIrbMMUWEs3RI3UTUJ/vw5KDztLAXQv9t8knQHzkuM85Nd/8
	 96UdFxayHhtlhJqx1VFA23Gl2bC3rskloySAw4BMvV7xkkjEuxjOCSH87F+w3Q/CrM
	 OVoffsOZUzfEg==
Message-ID: <6dc0c8d7-e081-4a3d-b289-368b6da69011@kernel.org>
Date: Mon, 21 Jul 2025 08:44:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] ASoC: dt-bindings: sound: Add Samsung ExynosAuto ABOX
 binding
To: ew kim <ew.kim@samsung.com>, broonie@kernel.org, s.nawrocki@samsung.com,
 robh@kernel.org, krzk+dt@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, conor+dt@kernel.org,
 alim.akhtar@samsung.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250721023052.3586000-1-ew.kim@samsung.com>
 <CGME20250721024611epcas2p47ebaf8cb494fc2bf71a83b00ba47f2b3@epcas2p4.samsung.com>
 <20250721023052.3586000-4-ew.kim@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250721023052.3586000-4-ew.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_234444_989466_257614EF 
X-CRM114-Status: GOOD (  21.93  )
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

On 21/07/2025 04:30, ew kim wrote:
> Add the device tree binding documentation for the Samsung Exynos Automotive
> ABOX generic audio management core. This binding describes how to configure
> the maximum number of PCM playback, PCM capture, and dummy I2S backend
> instances for the ABOX core. Actual hardware functionality is provided
> by child audio sub-drivers.
> 
> Signed-off-by: ew kim <ew.kim@samsung.com>
> ---
>  .../bindings/sound/samsung,exynosauto.yaml    | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml b/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
> new file mode 100644
> index 000000000000..b1e49f38ffe9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/samsung,exynosauto.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos Automotive Abox Generic
> +
> +maintainers:
> +  - Eunwoo Kim <ew.kim@samsung.com>
> +
> +description: |
> +  The Samsung Exynos Automotive Abox Generic node represents a
> +  generic audio management platform device inside Exynos Automotive SoCs.

No, we do not add bindings for "generic" stuff.

Describe the SoC.

> +  It does not directly control hardware resources itself, but acts as

Does not control hardware? so not suitable for bindings and DTS.

> +  a common interface to manage child audio sub-drivers for PCM playback,
> +  PCM capture, and I2S dummy backends.

Not relevant.

> +
> +  Typically, this node provides configuration for the maximum number of
> +  PCM playback and capture devices (ALSA PCM) and the maximum number
> +  of dummy I2S backend devices. The actual hardware control is handled
> +  by child drivers attached to this generic core.

Not relevant. Describe the hardware.

> +
> +  This node must exist for the platform driver to probe,
> +  even though it does not map any physical hardware address.

Drivers are not relevant, read writing bindings.

> +
> +properties:
> +  compatible:
> +    const: samsung,abox_generic

You did not implement previous feedback. This does not follow DTS coding
style and writing bindings.

I already asked you to read DTS coding style and nothing improved, no
issues were resolved.

> +
> +  samsung,num-pcm-playback:
> +    description: Maximum number of PCM playback instances (ALSA PCM devices).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  samsung,num-pcm-capture:
> +    description: Maximum number of PCM capture instances (ALSA PCM devices).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  samsung,num-i2s-dummy-backend:
> +    description: Maximum number of dummy I2S backend instances.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Nothing above describes hardware. Bindings are not for ALSA.

> +
> +  '#address-cells':
> +    description: Required for child nodes that may declare address space.
> +    const: 2
> +
> +  '#size-cells':
> +    description: Required for child nodes that may declare address space.
> +    const: 1
> +
> +required:
> +  - compatible
> +  - samsung,num-pcm-playback
> +  - samsung,num-pcm-capture
> +  - samsung,num-i2s-dummy-backend
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    abox_generic {

Did you read DTS coding style?

> +      compatible = "samsung,abox_generic";
> +      samsung,num-pcm-playback = <32>;
> +      samsung,num-pcm-capture = <32>;
> +      samsung,num-i2s-dummy-backend = <5>;
> +      status = "disabled";

No.

> +      #address-cells = <2>;
> +      #size-cells = <1>;
> +    };


Best regards,
Krzysztof

