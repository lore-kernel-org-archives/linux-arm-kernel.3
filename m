Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E1CC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQU0DqV0qfBEK9TRDFVfOF6Vo7kBjX+TmXYI0dc7YLs=; b=YKkcYJdozpzJJvWQfGyvrxYA0Q
	BbRU0PkDrbn5t2+2tDMwFRtathPm2glsacmy/ZAhnJ8n1HX2YRWX+qF8szNCYwx6SmLx8/K2yHf79
	AB58blbgToyNlGGMA8amOLDibQ4lxR2S0xO7gYdfCTB/yKQWRNAiC1hGWkQnfo3EEzmNAOmDEEH1l
	114ACbTPecpg2ccrP4xxqwWo0LFNcGM+JW25yH/hsEBgGsQfE2D5cP74yh6hs/+Espk1XV8owkXav
	MVGW6cq1Efrb/gOIxSh58JqVY3PTyDtafzcNGBj23fLZEVO1uaih3MtnwXYZysRWkqxieQMkMqvdO
	dm6nFmVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLBs-00000003JrR-35yM;
	Fri, 09 May 2025 10:42:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKTx-00000003BBt-3bhG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 09:57:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04C4D2576
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 May 2025 02:57:16 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BAD5E3F673
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 May 2025 02:57:26 -0700 (PDT)
Date: Fri, 9 May 2025 10:57:15 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: timer: Convert arm,mps2-timer to DT schema
Message-ID: <aB3Re4ZR85jJkMH8@e110455-lin.cambridge.arm.com>
References: <20250506022210.2586404-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022210.2586404-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_025729_981722_33838460 
X-CRM114-Status: GOOD (  20.46  )
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

On Mon, May 05, 2025 at 09:22:09PM -0500, Rob Herring (Arm) wrote:
> Convert the Arm MPS2 Timer binding to DT schema format. It's a
> straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  .../bindings/timer/arm,mps2-timer.txt         | 28 -----------
>  .../bindings/timer/arm,mps2-timer.yaml        | 49 +++++++++++++++++++
>  2 files changed, 49 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/arm,mps2-timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/arm,mps2-timer.txt b/Documentation/devicetree/bindings/timer/arm,mps2-timer.txt
> deleted file mode 100644
> index 48f84d74edde..000000000000
> --- a/Documentation/devicetree/bindings/timer/arm,mps2-timer.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -ARM MPS2 timer
> -
> -The MPS2 platform has simple general-purpose 32 bits timers.
> -
> -Required properties:
> -- compatible	: Should be "arm,mps2-timer"
> -- reg		: Address and length of the register set
> -- interrupts	: Reference to the timer interrupt
> -
> -Required clocking property, have to be one of:
> -- clocks	  : The input clock of the timer
> -- clock-frequency : The rate in HZ in input of the ARM MPS2 timer
> -
> -Examples:
> -
> -timer1: mps2-timer@40000000 {
> -	compatible = "arm,mps2-timer";
> -	reg = <0x40000000 0x1000>;
> -	interrupts = <8>;
> -	clocks = <&sysclk>;
> -};
> -
> -timer2: mps2-timer@40001000 {
> -	compatible = "arm,mps2-timer";
> -	reg = <0x40001000 0x1000>;
> -	interrupts = <9>;
> -	clock-frequency = <25000000>;
> -};
> diff --git a/Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml b/Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml
> new file mode 100644
> index 000000000000..64c6aedd7e8e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm,mps2-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM MPS2 timer
> +
> +maintainers:
> +  - Vladimir Murzin <vladimir.murzin@arm.com>
> +
> +description:
> +  The MPS2 platform has simple general-purpose 32 bits timers.
> +
> +properties:
> +  compatible:
> +    const: arm,mps2-timer
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
> +  clock-frequency:
> +    description: Rate in Hz of the timer input clock
> +
> +oneOf:
> +  - required: [clocks]
> +  - required: [clock-frequency]
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer@40000000 {
> +        compatible = "arm,mps2-timer";
> +        reg = <0x40000000 0x1000>;
> +        interrupts = <8>;
> +        clocks = <&sysclk>;
> +    };
> -- 
> 2.47.2
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

