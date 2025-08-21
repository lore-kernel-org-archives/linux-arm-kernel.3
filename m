Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202BFCA0FE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0cO89z3PkoYbh97RT/8fb4C+lqpJkRVy3QDD3+pvdc=; b=keJyyxU8e4EQOCJYqhz6EFfhfK
	DVOSnkfN46ISuqNTi1cMOeY3+9dsakDGMF3/fFVmdAu4Iv4f7CyRNgUPy8r/uuR62kXDPHJ+uCEXU
	oPfDRtHYfwT4smrv5l3kjWZnGXuvJpAurQ45XizxgH/0P+Wg1wpRIF73I+FuKkzi+kAMY0nbwYiFi
	jaOeNfhwSKUQKYHiR9rQ3Ei5p0KV73hPf8/GtsOjDdJKYfrp/x3BTKaaH5G2oW0n6TsEVqm3pMFiG
	2QtUvyt2z4S5PYTCHRNBvbvrtviuqiY+jWf24krQRjL3dS4lZGcvG6oYXpjyzHj8VY5Cfx8B5H4AR
	P8oPPpgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upF1p-00000000xok-28SZ;
	Thu, 21 Aug 2025 23:49:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7uJ-0000000HWBi-1feZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 16:12:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9C468A584F5;
	Thu, 21 Aug 2025 16:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42AD8C4CEEB;
	Thu, 21 Aug 2025 16:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755792774;
	bh=MR+7f396WrEbtGRfUw87oG8dHsGs9G0ZUbfzqDxjrJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GNkjCTTkFAfE89O7CSkd8OPIM+LP6OHO/fGvcWd2Vx8ep5+8HTwEZA3C/JoRsZsq9
	 /cDw4G9Bp1nXa1Zh+A60Ll+Q4TJn8rGPwtmqJOJFfsC+wVO7MP4ad+FY7oazJZg/Sv
	 mmLsjkBDJZdPvm9BmMiAMf/60Wdf3v1HdEoOYDQKBp3gObAEcJdDHmsZi+OltD5T6l
	 kvu7Ay1cLDJKF7ssNzbHDIB3Lp2DgNDeFIVeFA0rQvUFDeAzawwAKYAqU7VFo0iUVc
	 4Rl75VNfxDt+KF8hWOO42gBFY05z71B4X5rqZafOnf8NHKQ8BdBEkdVIOVBAgNWr99
	 RyVxSccqkbYBg==
Date: Thu, 21 Aug 2025 23:55:38 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: timer: Add ARM SSE(Subsystems for
 Embedded) timer
Message-ID: <aKdBejl-aC4uNjh8@xhacker>
References: <20250821152429.26995-1-jszhang@kernel.org>
 <20250821152429.26995-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250821152429.26995-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_091255_566040_70CB1C19 
X-CRM114-Status: GOOD (  22.17  )
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

On Thu, Aug 21, 2025 at 11:24:28PM +0800, Jisheng Zhang wrote:
> Add binding doc for the ARM SSE(Subsystems for Embedded) timer. Here
> is the document URL:
> https://developer.arm.com/documentation/107610/0000/System-timer-components?lang=en
> 
> Although the IP is mostly seen on MCU SoC platforms, but nothing
> prevent it from being integrated into linux capable SoC platforms.
> 
> The IP core may have a system counter to generate timestamp value,
> a system timer to raise an interrupt when a period has elapsed, and
> a System Watchdog to detect errant system behaviour then reset the
> system if a period elapses without ping.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/timer/arm,sse_timer.yaml         | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/arm,sse_timer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/arm,sse_timer.yaml b/Documentation/devicetree/bindings/timer/arm,sse_timer.yaml
> new file mode 100644
> index 000000000000..37a79f9052d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/arm,sse_timer.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/arm,sse_timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM SSE(Subsystems for Embedded) system timer
> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +description: |+
> +  ARM SSE(Subsystems for Embedded) system timer core may have a system counter
> +  to generate timestamp value, a system timer to raise an interrupt when a
> +  period has elapsed, and a System Watchdog to detect errant system behaviour
> +  then reset the system if a period elapses without ping.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - arm,sse-timer
> +
> +  reg:
> +    maxItems: 1
> +    description: The system counter control frame base
> +
> +  clocks:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    enum: [1, 2]
> +
> +  '#size-cells':
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  '^frame@[0-9a-f]+$':
> +    type: object
> +    additionalProperties: false
> +    description: A timer node has some frame sub-nodes, each frame can be timer frame or watchdog frame. Each frame has the following properties.
> +    properties:
> +      interrupts:
> +        minItems: 1
> +        items:
> +          - description: timer irq
> +
> +      reg:
> +        minItems: 1
> +        items:
> +          - description: 1st view base address
> +          - description: 2nd optional view base address if this is a watchdog frame
> +
> +    required:
> +      - interrupts
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer@f7f3e000 {
> +      compatible = "arm,sse-timer";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +      reg = <0xf7f3e000 0x2000>;
> +      clocks = <&core_clk>;
> +
> +      frame@f7f20000 {
> +        reg = <0xf7f20000 0x1000>;
> +        interrupts = <0 26 0x8>;
> +      };
> +
> +      frame@f7f30000 {
> +        interrupts = <0 15 0x8>;
> +        reg = <0xf7f32000 0x1000>,
> +              <0xf7f33000 0x1000>;
> +      };
> +    };
> +
> +...
> -- 
> 2.50.1
> 

