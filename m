Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9787CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMwdJv+wJtqLW3chVUQ3IvOB2iB/ebloZFds4lrIsdE=; b=khaEVVDcajRT95J2HYyCc6LM0o
	DHClgmyD+r3UDnXFpuorYN4ZL3Gw5umMtN2LvhWrPlbVo5DAPR0vetBS/UaZcv8A+GPkS4F9OTBe+
	MfwfbEWjPd0N4bPeH8Woc0E0r+vBaHygtYwELavV0Meb2SZ26aNa41MAmNiOXNNCkte2QAwBFksf6
	VSHEGW5bU7MRPj/McEbRpMbiBgJXoKUqpW5GYsG5uleNKMrnM095Fctc9eYN+PzcQppvKnoP08tGb
	E+cI0famdXbtmN24XNBM+D1uAkrjGqZNAQRs3NXYMb/9fkxZV2copfn42HjHLUqnWBzteZ7SDtJKh
	zyxmQIGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utk4B-00000005yLC-0HTI;
	Wed, 03 Sep 2025 09:46:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiXk-00000005QIS-0dxS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:08:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D90F443260;
	Wed,  3 Sep 2025 08:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3043BC4CEF0;
	Wed,  3 Sep 2025 08:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756886915;
	bh=EMAfKG5WztTKvDmx2+gKQZ2+1J1TvqlSW1ctnPEBHNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M3/uVeBTi+xK76sun7oUdvRHtu8uyW3MPEyCizLqysjXs1iW5jiL/JcrfwrkbIgVd
	 0nUNFeChtEXOKMOL97pWuY8dSN/P2QETLkeXWbJd/5pk2B5/GR5ARwUBrbTi7cWOTx
	 lAvQPQ+ei/Tvf0bXHK4aHI9Xv39IvpzNCO+/KN94l7IJHuB3gFzpahMkIyd0zCHK+A
	 aScBW6MiGHRrmEeGmf/NHdwutn3oBvU7y9473mbov96FchaY0sx3YTa3neOMcr9vf6
	 xFA6OU/eNYpYhJlHglbdWuKGzSd2kOFgLIRRf3QYPe7TORLMrGwjxYAikl5SCAFbx/
	 qLhyjTTfwA7qw==
Date: Wed, 3 Sep 2025 10:08:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: clock: sun55i-a523-ccu: Add A523 CPU
 CCU clock controller
Message-ID: <20250903-meticulous-didactic-degu-621fe0@kuoka>
References: <20250903000910.4860-1-andre.przywara@arm.com>
 <20250903000910.4860-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250903000910.4860-2-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_010836_242613_F37A1278 
X-CRM114-Status: GOOD (  22.06  )
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

On Wed, Sep 03, 2025 at 01:09:06AM +0100, Andre Przywara wrote:
> There are four clock controllers in the A523 SoC, but only three are
> described in the DT binding so far.
> 
> Add a description for the CPU CCU, which provides separate clocks for
> the two CPU clusters and the DSU interconnect.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../clock/allwinner,sun55i-a523-ccu.yaml      | 25 +++++++++++++++++++
>  .../dt-bindings/clock/sun55i-a523-cpu-ccu.h   | 13 ++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> index 1dbd92febc471..367d26800fd0d 100644
> --- a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> @@ -19,6 +19,7 @@ properties:
>    compatible:
>      enum:
>        - allwinner,sun55i-a523-ccu
> +      - allwinner,sun55i-a523-cpu-ccu
>        - allwinner,sun55i-a523-mcu-ccu
>        - allwinner,sun55i-a523-r-ccu
>  
> @@ -64,6 +65,30 @@ allOf:
>              - const: iosc
>              - const: losc-fanout
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun55i-a523-cpu-ccu
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: High Frequency Oscillator (usually at 24MHz)
> +            - description: Low Frequency Oscillator (usually at 32kHz)
> +            - description: Internal Oscillator
> +            - description: Peripherals PLL 0 (1200 MHz output)
> +            - description: Peripherals PLL 0 (600 MHz output)
> +
> +        clock-names:
> +          items:
> +            - const: hosc
> +            - const: losc
> +            - const: iosc
> +            - const: pll-periph0-2x
> +            - const: pll-periph0-600m
> +
>    - if:
>        properties:
>          compatible:
> diff --git a/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h b/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
> new file mode 100644
> index 0000000000000..042f2310f64de
> --- /dev/null
> +++ b/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h

Filename based on compatible.


> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright 2025 Arm Ltd.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_
> +#define _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_
> +
> +#define CLK_CPU_L		7
> +#define CLK_CPU_DSU		8
> +#define CLK_CPU_B		9

I don't see the header being used by the driver and odd numbers (they
should start from 0 or 1) suggest these are not bindings.

Otherwise please explain in commit msg what exactly are you binding
here.

Best regards,
Krzysztof


