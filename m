Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9CCC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 05:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRobWP6n1AiKHaLfEqZBRc9yJTt8XaDKvvceGQNL7lY=; b=gp8bVFUU4NO39mldLc2tk43OZs
	M30vTkDUBneQezEfI8cpk8BLeOZJ1xWQyQ6MaqpCzTKlGl2fSu74X7YJRbAgNQiwqC4cQvhdyxHQ8
	7ZWipIJ2w2v0wXJb6rQzd5TR7pNJivrmknoRtOtCB+HTbpxAYtssI+fNY2ipt1QZi0Sm6j0KB7yk/
	BacUm3Ka6squiUPQBngTU/A8XXV2KiXPgMA2W3xIq4PyeuYv59HzxvUt/oQ0QWHhYR/KBdp3LCfiJ
	UlGtzsPrEgGY6rY02dIXxMeQz1nEuX8KX2GPTHcIUA7OPvmqmW7qtArw+D2AmFia9lADBywIfpUam
	o7a0KaFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBB0-0000000AWc4-2wDk;
	Tue, 06 May 2025 05:49:10 +0000
Received: from golan.tkos.co.il ([84.110.109.230] helo=mail.tkos.co.il)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC8n8-00000009wVN-1nQA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 03:16:24 +0000
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id 3A59B440EA1;
	Tue,  6 May 2025 06:16:09 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1746501369;
	bh=BvOr7NK5R2aGH1ZVeHRXfa7u1FmSfQWOwX4gQOAnSvo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QEzvMZMw4a6uOv9CxaGuj+i4uu+7yVAVgs3F74nLbhHrichdcXqSdsugr3kFzQ9+6
	 K3kx5ajkGVv5PvRTcmX39/BLk8zKVJEMvknm/hXXLK8hRVLxWuImC2YC5UZHWKYaej
	 hHwipghZCzA761JXtMh8W0mRjwTr8/EATBPR/g740s63+b9EUkFg+5Mprv8Q2+c9eN
	 6zyhk1vm/xSeTaThKNpyQBO05/SwbkG17OqY6J4LFz9SUdnJNbgwdDpRY5NGBfd43D
	 yNEEh8BeH26y9QtV35Xpd74blUl5Es+zr+rTb2GfKgMZ/fxMg8ZeK+f165JMpzfkAB
	 q5bZ5X03sbq+g==
From: Baruch Siach <baruch@tkos.co.il>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,  Thomas Gleixner
 <tglx@linutronix.de>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  linux-kernel@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: timer: Convert cnxt,cx92755-timer to DT
 schema
In-Reply-To: <20250506022232.2587186-1-robh@kernel.org> (Rob Herring's message
	of "Mon, 5 May 2025 21:22:31 -0500")
References: <20250506022232.2587186-1-robh@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 06 May 2025 06:16:16 +0300
Message-ID: <87plgmzawv.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_201623_127851_142FC981 
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

Hi Rob,

On Mon, May 05 2025, Rob Herring (Arm) wrote:

> Convert the Conexant Digicolor SoCs Timer binding to DT schema format.
> It's a straight-forward conversion.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  .../bindings/timer/cnxt,cx92755-timer.yaml    | 49 +++++++++++++++++++
>  .../bindings/timer/digicolor-timer.txt        | 18 -------
>  2 files changed, 49 insertions(+), 18 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml
>  delete mode 100644 Documentation/devicetree/bindings/timer/digicolor-timer.txt
>
> diff --git a/Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml
> b/Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml
> new file mode 100644
> index 000000000000..8f1a5af32a36
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cnxt,cx92755-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Conexant Digicolor SoCs Timer Controller
> +
> +maintainers:
> +  - Baruch Siach <baruch@tkos.co.il>
> +
> +properties:
> +  compatible:
> +    const: cnxt,cx92755-timer
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: Contains 8 interrupts, one for each timer
> +    items:
> +      - description: interrupt for timer 0
> +      - description: interrupt for timer 1
> +      - description: interrupt for timer 2
> +      - description: interrupt for timer 3
> +      - description: interrupt for timer 4
> +      - description: interrupt for timer 5
> +      - description: interrupt for timer 6
> +      - description: interrupt for timer 7
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer@f0000fc0 {
> +      compatible = "cnxt,cx92755-timer";
> +      reg = <0xf0000fc0 0x40>;
> +      interrupts = <19>, <31>, <34>, <35>, <52>, <53>, <54>, <55>;
> +      clocks = <&main_clk>;
> +    };
> diff --git a/Documentation/devicetree/bindings/timer/digicolor-timer.txt
> b/Documentation/devicetree/bindings/timer/digicolor-timer.txt
> deleted file mode 100644
> index d1b659bbc29f..000000000000
> --- a/Documentation/devicetree/bindings/timer/digicolor-timer.txt
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Conexant Digicolor SoCs Timer Controller
> -
> -Required properties:
> -
> -- compatible : should be "cnxt,cx92755-timer"
> -- reg : Specifies base physical address and size of the "Agent Communication"
> -  timer registers
> -- interrupts : Contains 8 interrupts, one for each timer
> -- clocks: phandle to the main clock
> -
> -Example:
> -
> -	timer@f0000fc0 {
> -		compatible = "cnxt,cx92755-timer";
> -		reg = <0xf0000fc0 0x40>;
> -		interrupts = <19>, <31>, <34>, <35>, <52>, <53>, <54>, <55>;
> -		clocks = <&main_clk>;
> -	};

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

