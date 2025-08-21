Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DD4CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 07:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOPorWl5Uhit+PYqtGOxV4ZjgLuFoKweoFQEWjf558M=; b=olWZdGLA/K8YdoeKz9cmNeb8CA
	tpqq8pKOe4rUKrqLwAf9Qm3S1bWYn6xUo3Md/wSOjREEhLTo6gygKmw5D4a8kcYTHUngtmxslPFnZ
	ZZPedF37HvDw63UqwoAHFMcKeBQivN7i0G2sWfmZ9Chb8mtBgdaf2SQ7kcXYhTf/HNgPmHFKDEZ93
	EO9/kr1hYa6DLJhFpiat+IINeyKPt3ezfHVKuY4Osw9Ka7mQLGGHQ+L+VeXe7v+BXS82lbXguuvO5
	NVB4aoYiB6ZKdziFibqKzj7vkdQY7+slqmcajvvHBCK50BhjFZJ6MFDxHFTjD70jmwBiemQ8ABPXH
	MMRdYsiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozVW-0000000G4RN-1KgZ;
	Thu, 21 Aug 2025 07:14:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozAc-0000000G0xA-3mim;
	Thu, 21 Aug 2025 06:53:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 016B0601D7;
	Thu, 21 Aug 2025 06:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22860C4CEED;
	Thu, 21 Aug 2025 06:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755759189;
	bh=Bq9tP1dBXwQ3sRC4YKUxmHUFPSXpyXHLlJKSZ1attcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qs7XcmMvSsV7ZlsJpkSxU/mY6+27bCRXN2nW1JYMEkIZbbbxqeCb++SHayuZouPBe
	 pXLdV6i4y+uV93jaiaeZXB1iriW3zE/bbKi69plgG3xa5OIs0Qi76qhRmK7VU1E6ss
	 LtnBtwtwFnfX6J44cs071lPZ9x5vD+8uwLd7zPounkMciOpdxkDvBvqh8jlNUP8dii
	 u2f72i1+0PrrVy50oULnOBet9AcjJiPjRXovxGrycQLyhLCkK3Ylvj06fa/HZTKOhm
	 8BZFUH4yFIxuQlwwigXeCGWanttsE4WFa/g75aoSrNq3PTsRHEf2r+EsWQcMVJMPEe
	 J0JNPZ+l1tSHA==
Date: Thu, 21 Aug 2025 08:53:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org, davem@davemloft.net, 
	dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com, 
	houlong.wei@mediatek.com, jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, 
	krzk+dt@kernel.org, kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, 
	lgirdwood@gmail.com, linus.walleij@linaro.org, louisalexis.eyraud@collabora.com, 
	maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, mchehab@kernel.org, 
	minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v1 10/14] regulator: dt-bindings: Convert Dialog
 Semiconductor DA9211 Regulators to YAML
Message-ID: <20250821-practical-coyote-of-hail-d2fddb@kuoka>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-11-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-11-ariel.dalessandro@collabora.com>
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

On Wed, Aug 20, 2025 at 02:12:58PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Dialog Semiconductor DA9211
> Voltage Regulators family to a YAML schema. Examples are simplified, as
> these are all equal.

Also not wrapped... fix your editor to recognize how commits are
written.

> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---

...

> +---
> +$id: http://devicetree.org/schemas/regulator/dlg,da9211.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: |

Drop |

> +  Dialog Semiconductor DA9211/DA9212/DA9213/DA9223/DA9214/DA9224/DA9215/DA9225
> +  Voltage Regulator
> +
> +maintainers:
> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - "dlg,da9211"
> +      - "dlg,da9212"
> +      - "dlg,da9213"
> +      - "dlg,da9223"
> +      - "dlg,da9214"
> +      - "dlg,da9224"
> +      - "dlg,da9215"
> +      - "dlg,da9225"

No quotes. I don't think this was ever tested.

Also, keep it properly ordered


> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +    additionalProperties: false
> +    description: |

Drop |

> +      List of regulators provided by the device
> +
> +    patternProperties:
> +      "^BUCK([A-B])$":

[AB]

> +        type: object
> +        $ref: regulator.yaml#
> +        description: |
> +          Properties for a single BUCK regulator
> +
> +        properties:
> +          regulator-initial-mode:
> +            items:
> +              enum: [ 1, 2, 3 ]
> +            description: Defined in include/dt-bindings/regulator/dlg,da9211-regulator.h
> +
> +          regulator-allowed-modes:
> +            items:
> +              enum: [ 1, 2, 3 ]
> +            description: Defined in include/dt-bindings/regulator/dlg,da9211-regulator.h
> +
> +          enable-gpios:
> +            maxItems: 1
> +            description: Specify a valid GPIO for platform control of the regulator

Drop description, obvious.

> +
> +        unevaluatedProperties: false

For nested blocks this goes after $ref: regulator.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - regulators
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/regulator/dlg,da9211-regulator.h>
> +
> +    i2c1 {

i2c

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        da9212: da9212@68 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof


