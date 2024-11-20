Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A2FD6E2DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 08:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGrblXr7GVP96MrEeg8MHrHXTUdXTBT9h5NPE4/Y8Og=; b=oJzaghnMQiGakDkRImGLJHyjhu
	TAK9Lkzm6G5u6vW9mDuKGt+5lZGcJoFkOc9YrzOqpbisD735jW357RIeG1xtwqy2WSTm8/EFm0RvQ
	+F0hF2io88BVufDtvF5JvvCnKKY9QIN8FdZF8IemCdoWiZ+PiO+6GwHPMmZZrBxtgjtZZDJiLyW2Y
	+dS1Y9AqVOH46XD0xsPYPJ7pV0UKVJkv/PBvm4blzsVednF+d0twzCfAUOhp4zNeAveWGPZ+kQ+Ns
	XrssXECbzFFk0NTpvsiSZ9XSiaAXopHQmPZ22R8EwTBHIk9aop9+YfkpMkAjMyJx1+DkAZcep9V11
	D6W00p2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgIQ-0000000EnEe-04BU;
	Wed, 20 Nov 2024 08:42:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgHU-0000000En8E-02a9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 08:41:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B8FFBA42D7B;
	Wed, 20 Nov 2024 08:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CE1C4CECD;
	Wed, 20 Nov 2024 08:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732092106;
	bh=4rfnlRucQnUgzLpd0n5nAO1dDQNhlvEJVooFv39keHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VECQN232ULMNimccmpdbW1C1om6Kf4R7RvMR84F0yabWNow5lQfMHwQ/B6A/cjjh/
	 UTmHEGpksoGNB/8wgoqDIzJJCbZYoeQwWe1tHY4n1GhQIWdzN9vQHhUe9pnYv2EXBI
	 04Va3NGM4V+Z9XdwOoGO4GvfIvRBH3Yp4ZV1fCPvieTBvJIGpUd0qALi7JnI5WJe7y
	 IN2N//7VtZGwQBw8ViTaIssdg459szyR6JkL2rT0D6zpKKahEL3Mb5l8zhxKn5bm1V
	 kfaZcCnx0AsUpe5LmLvnv5gspYU6GRVNzfEqeoIz7N9GDVsF8CcW/GAFywkDJUYziB
	 NFfsHLsgZJJhw==
Date: Wed, 20 Nov 2024 09:41:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ming-Jen Chen <mjchen0829@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sudeep.holla@arm.com, 
	arnd@arndb.de, peng.fan@nxp.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Message-ID: <ql6m6qrdokwfu4iizn6wmvovawuc7kgg6jfzxebkmac5muz66e@myrjvq5jm7gg>
References: <20241119025954.4161-1-mjchen0829@gmail.com>
 <20241119025954.4161-2-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241119025954.4161-2-mjchen0829@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_004148_114567_17D613AF 
X-CRM114-Status: GOOD (  15.34  )
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

On Tue, Nov 19, 2024 at 02:59:53AM +0000, Ming-Jen Chen wrote:
> Add YAML bindings for MA35D1 SoC keypad.
> 
> Signed-off-by: Ming-Jen Chen <mjchen0829@gmail.com>
> ---
>  .../bindings/input/nuvoton,ma35d1-keypad.yaml | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> new file mode 100644
> index 000000000000..9ccd81a2574d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

Filename matching compatible. You got this comment already.


> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 Keypad
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
> +  debounce-delay-ms:
> +    description: Debounce delay time in milliseconds.
> +    maxItems: 1
> +
> +  scan-interval-ms:
> +    description: Scan interval time in milliseconds.
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1

Keep the same order of properties as in required: block.

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
> +  - keypad,num-rows
> +  - keypad,num-columns
> +  - debounce-delay-ms
> +  - scan-interval-ms
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/input/input.h>
> +    keypad@404A0000 {

Lowercase hex

> +      compatible = "nuvoton,ma35d1-kpi";
> +      reg = <0x404A0000 0x10000>;

Lowercase hex

Best regards,
Krzysztof


