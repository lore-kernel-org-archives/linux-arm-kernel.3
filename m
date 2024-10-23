Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93455D2E025
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 08:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UG9Ue1BQggQko55k/ZAoGkmWzjZsKw5/CffpCg23CBs=; b=Gg1S7yMdBISaXB8reTtpU4q3fv
	fN0CA7pps6Xh+7Zc6sUCZMmZs/YxoM/IBx6jcJfmuFhrUwkSxW1lFWwLHI6P1E4oBBZb5AQ2ylMhH
	oTqB5/OjFPTx15q7J3jaflmuQfbxS4gVyW9vJctk4VR39aekdpsEUVUTNGV3Z//Wv41Niv/l2iVki
	0ENu0X6pug7xyYM0UlxQWGob7IS9f9A6mrjzex20Ewo6RaU+kLk2aiewxzhfbf8XmJivbxm2FLgwx
	HlEYZMs+gm01FFkFExu8h581Wa1NRBt0sXso3cdc0y1Bw22uXKYW0FS2oBQvnijDUEDn9J2RpF94x
	V52ilxfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3X34-0000000DdFi-41m1;
	Wed, 23 Oct 2024 08:48:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Wv7-0000000Dbnm-1jGX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:40:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 69E17A44BE7;
	Wed, 23 Oct 2024 08:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D07C4CEC6;
	Wed, 23 Oct 2024 08:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729672844;
	bh=4H0UsMMCB9JmXCIXGi6MOZ2ghoBeo+pJlx+1NAUoIE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kVe91hxxIAj5lgLDqV3KLSD503KzeVxHdgwyPek9j+R3hPC4ysAw2q+78VZuDW4Di
	 HKjvz+zuaejEfSonQmlXo9YbCwTqADZxaUULGvURgtSmpoZcAdeOtwFgc83QeKJHKE
	 bELolJUT8cVHRDa+rE63dvfTgz6Bggp0NLjWgpwD7bB5aeFMpKTGUrwEVLb21ipj5d
	 MMS2QVkP5HxgB2x+B4vmqV5B2ZGfWZgf8k0Ri7r4Hw3rsMmw29Xtk3BOuKFOAF+1Fx
	 Hr6OHoLiW6pDSJZx5pX2zgd8sXtjUBXinYooAJRH14s6qfmDWk6cCmlWMSXED+UvXe
	 POwLXW/I5FBew==
Date: Wed, 23 Oct 2024 10:40:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: mjchen <mjchen0829@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mjchen@nuvoton.com, 
	peng.fan@nxp.com, sudeep.holla@arm.com, arnd@arndb.de, conor+dt@kernel.org, 
	krzk+dt@kernel.org, robh@kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Message-ID: <csbechg6iarxx52z2gqidszhvgjdvaraoumpfcsozelhuuhmtb@ec7es3txuzxc>
References: <20241022063158.5910-1-mjchen0829@gmail.com>
 <20241022063158.5910-2-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022063158.5910-2-mjchen0829@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_014045_635480_06B49B55 
X-CRM114-Status: GOOD (  17.07  )
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

On Tue, Oct 22, 2024 at 06:31:57AM +0000, mjchen wrote:
> From: mjchen <mjchen@nuvoton.com>
> 
> Add YAML bindings for MA35D1 SoC keypad.
> 
> Signed-off-by: mjchen <mjchen@nuvoton.com>
> ---
>  .../bindings/input/nvt,ma35d1-keypad.yaml     | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml
> 

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

> diff --git a/Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml
> new file mode 100755
> index 000000000000..3d9fc26cc132
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/nvt,ma35d1-keypad.yaml

Filename based on compatible. There is no nvt prefix. Entire filename is
somehowdifferent than compatible.

> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/nvt,ma35d1-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVT MA35D1 Keypad

NVT? Nuvoton?

> +
> +maintainers:
> +  - Ming-jen Chen <mjchen0829@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/input/matrix-keymap.yaml#
> +
> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-kpi
> +
> +  debounce-period:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Missing vendor prefix... or why are you not using existing properties?

> +    description: |
> +      key debounce period select

select? or clock cycles? I don't understand this. Say something useful
here.


> +      0  = 0 clock
> +      1  = 0 clock
> +      2  = 0 clock

Heh? So this is just 0

> +      3  = 8 clocks

This is 8

> +      4  = 16 clocks

16, not 4

> +      5  = 32 clocks
> +      6  = 64 clocks
> +      7  = 128 clocks
> +      8  = 256 clocks
> +      9  = 512 clocks
> +      10 = 1024 clocks
> +      11 = 2048 clocks
> +      12 = 4096 clocks
> +      13 = 8192 clocks

Use proper enum


> +
> +  per-scale:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Row Scan Cycle Pre-scale Value (1 to 256).

Missing constraints

> +
> +  per-scalediv:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Per-scale divider (1 to 256).

Missing constraints

Both properties are unexpected... aren't you duplicating existing
properties?

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
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - linux,keymap
> +  - debounce-period
> +  - per-scale
> +  - per-scalediv
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/input/input.h>
> +    keypad: keypad@404A0000 {

Lowercase hex and drop the unused label

> +      compatible = "nuvoton,ma35d1-kpi";
> +      reg = <0x404A0000 0x10000>;

Lowercase hex

Best regards,
Krzysztof


