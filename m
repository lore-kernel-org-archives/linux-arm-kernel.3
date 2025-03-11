Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05967C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 13:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLCwXswZYSBkxPn1XmrO4lSU/EWMfOdaRIt9MMThb2c=; b=mpDIB44Yn9VmQCMu1iXIBL4TF3
	rgWCTKyT7V8s2Oi8lZ9VtH+uqLvxicawMkQZqLOcDqG94M5DdV0WgjXugIcHJDjaRjffphLSI1VRB
	ZvLN7MQNC2DA1eHhiKni2GWPi4FN/fJjqdYrRmp9K/oqG84ejdD0RHQGKVSCff97UCh9Rb2bCuINw
	68Hv6jyAP17AIre3tH0dIBuI1wKpWXGhRkixII35bhJ1YCeCWlFsUigaLhRdoC5S9LFgtGd6fpaLz
	pmjgK7EtXxAZOSSWcZjtj3/kLvjOYFaWImUucw3hbdIdsoATSUvs12cA2gbeVRII5o4tebNGMUyDb
	kFPBftrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trzby-00000005pmu-3bVo;
	Tue, 11 Mar 2025 13:25:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trzZX-00000005p7T-1Icy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 13:23:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E0D015C03CD;
	Tue, 11 Mar 2025 13:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B581DC4CEE9;
	Tue, 11 Mar 2025 13:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741699382;
	bh=i+BKXnNSu0U4NhBbJQA6jSH5xRp79OrcRQjZJgO6OG8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U0cOEBxVXPj9IXB917QVtzUpCxA15Cn8oMgtrQq7H9jUUCyjZXOcpyMZ4h98Uh5Z/
	 dr7Jdd0Jc4ai5w5Kjit5U9F+Mw/4MFwvbPlptsZC3ZWVNC+5aQisIkDtDCKZ3VqXkt
	 oW8AiSLqWIaqrYR1Aa33rUKvEKzglTuqew3WNwqmJu/d9iOuVBiztCv1wTj1cgeYkP
	 HZ8YBIB0Fnk0je+h7PlEOsQ5R5LqkpGv1e9bvytRLWQDRxb0ct1h6hh1baUdnonhEL
	 M6K/NDkfgsgug66YjSbU3olmCdOZMNMLxXSxe0nT3qI3MHZHCUaTu2uN/Jnc9KVne9
	 dPsGlhOtsQrRg==
Message-ID: <af6ebce2-7256-48bd-94d4-dc81e2944966@kernel.org>
Date: Tue, 11 Mar 2025 14:22:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pwm: Convert lpc32xx-pwm.txt to YAML schema
To: Purva Yeshi <purvayeshi550@gmail.com>, ukleinek@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, vz@mleia.com,
 piotr.wojtaszczyk@timesys.com
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250311125756.24064-1-purvayeshi550@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250311125756.24064-1-purvayeshi550@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_062303_462444_8ED2100A 
X-CRM114-Status: GOOD (  17.69  )
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

On 11/03/2025 13:57, Purva Yeshi wrote:
> Convert the existing `lpc32xx-pwm.txt` bindings documentation into a
> YAML schema (`lpc32xx-pwm.yaml`).
> 
> Changes:
> 
> Add SPDX license identifier `(GPL-2.0-only OR BSD-2-Clause)`.

That's not a change in the binding.

> Define `$id` and `$schema` fields for proper schema validation.
> Set `title` to describe the LPC32XX PWM controller.

Neither these.

> Add maintainers as per `scripts/get_maintainer.pl` output.

These should not be subsystem maintainers.

> Reference `pwm.yaml#` in `allOf` to inherit common PWM properties.

Not a change to the binding.

> 
> Define properties:
> Restrict `compatible` to `"nxp,lpc3220-pwm"` using `const`.
> Limit `reg` to `maxItems: 1` to ensure a single register range.
> Set `"#pwm-cells"` to `const: 3` for expected PWM cell properties.
> 
> Mark `compatible` and `reg` as required properties.

So it wasn't before? What are you implying here?

> Set `unevaluatedProperties: false` to enforce strict validation.
> 
> Validate the YAML schema using dt-validate and yamllint.

None of above is suitable for commit msg.

> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> ---
>  .../devicetree/bindings/pwm/lpc32xx-pwm.yaml  | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)

Where is the conversion?

>  create mode 100644 Documentation/devicetree/bindings/pwm/lpc32xx-pwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.yaml b/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.yaml
> new file mode 100644
> index 000000000..3e41cd291
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/nxp,lpc32xx-pwm.yaml#

Filename matching compatible.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LPC32XX PWM controller
> +
> +maintainers:
> +  - "Uwe Kleine-König <ukleinek@kernel.org>"
> +  - "Vladimir Zapolskiy <vz@mleia.com>"
> +  - "Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>"

Look at other bindings - none of them use quotes.

> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    const: nxp,lpc3220-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 3
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    pwm@4005c000 {
> +        compatible = "nxp,lpc3220-pwm";
> +        reg = <0x4005c000 0x4>;
> +        #pwm-cells = <3>;
> +    };
> +  - |
> +    pwm@4005c004 {
> +        compatible = "nxp,lpc3220-pwm";

One example is enough.



Best regards,
Krzysztof

