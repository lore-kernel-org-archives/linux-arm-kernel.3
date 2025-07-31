Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4913EC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 14:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5ZOa5Bdzk2St6inmchEvW3Ga3OzI20QY+mKrMFR+D4=; b=Bynnvoi6kGn1Z/51ThLgbJ6Nwf
	VXr16tInZspvX+acTfN1o4ddttqlMTU0WkqyH03Xj0ij/OfM8pe5JP+7ytKmaPgsCjN12axuYsT5d
	PYvfqznl1WePHbpLewUKReYCeHnx2ZRFJdhy94HABK49Bg46Y8np5t5+rShzHZQm1LgkJA8A2+1bV
	RPXRZw8jv/5HUNEyMUZ+EbqFSSPwvXzXSRirLPnbJ9xpN7iZ7eAqe/PzwaxK2cjE9pnuvV3CFBizo
	UHHOCbZTk5K2hwKm2P+CezCCk2dowOdoZWJdn8hPAb+tgMmJXat6e698iAGmP+OYz3FRvYQrHqul4
	KZxLoA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUO8-00000003qTz-12Dv;
	Thu, 31 Jul 2025 14:36:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTk4-00000003kdA-2Idj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 13:54:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE6AB61126;
	Thu, 31 Jul 2025 13:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B785C4CEEF;
	Thu, 31 Jul 2025 13:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753970083;
	bh=eMaB/jC7BQOujSeVyd65hlSZ/jJUt5A5InXdWSnL42Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LfD/b5JDEM4tfHtFXQ7drTEt8aleNybYQzijLgWsq+p+xNnv2CcV45z6g8k5blx1h
	 LJf5RQXMtCD81I18Q730/r1cE/tRooUKRse/MQ/98Qlo+4ZFt5C5W6s1FmE+UiT+fF
	 fGCKKTUwxi15kn0RnwXrfshq0blX42oaFLSpFa3U91GiH3JSQOhvC16wow3IWEPPzg
	 +pTr7wJssZyyxv0p2wNtIHbABvZknQz/dtOcZFP113btCZgTq6Cw9xoAYeYBAp1nma
	 sfJnJs0Bctps/fzgTBSZSILD6YtS6wqLAFG+Uucid+jkpoas5T2SOHxJMNGtmE2Wsc
	 MbABvN8U+VXfA==
Date: Thu, 31 Jul 2025 08:54:42 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Le Goffic <legoffic.clement@gmail.com>,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 12/20] dt-bindings: perf: stm32: introduce DDRPERFM
 dt-bindings
Message-ID: <20250731135442.GA2139000-robh@kernel.org>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-12-03f1be8ad396@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250728-ddrperfm-upstream-v5-12-03f1be8ad396@foss.st.com>
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

On Mon, Jul 28, 2025 at 05:29:43PM +0200, Clément Le Goffic wrote:
> DDRPERFM is the DDR Performance Monitor embedded in STM32MPU SoC.
> It allows to monitor DDR events that come from the DDR Controller
> such as read or write events.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  .../devicetree/bindings/perf/st,stm32-ddr-pmu.yaml | 94 ++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml b/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml
> new file mode 100644
> index 000000000000..1d97861e3d44
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +maintainers:
> +  - Clément Le Goffic <legoffic.clement@gmail.com>
> +
> +title: STMicroelectronics STM32 DDR Performance Monitor (DDRPERFM)
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: st,stm32mp131-ddr-pmu
> +      - items:
> +          - enum:
> +              - st,stm32mp151-ddr-pmu
> +          - const: st,stm32mp131-ddr-pmu
> +      - items:
> +          - const: st,stm32mp251-ddr-pmu

This and the 1st entry can be a single enum.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  access-controllers:
> +    minItems: 1
> +    maxItems: 2
> +
> +  memory-channel:
> +    description:
> +      The memory channel this DDRPERFM is attached to.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp131-ddr-pmu
> +    then:
> +      required:
> +        - clocks
> +        - resets
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp251-ddr-pmu
> +    then:
> +      required:
> +        - access-controllers
> +        - memory-channel
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +
> +    perf@5a007000 {
> +        compatible = "st,stm32mp151-ddr-pmu", "st,stm32mp131-ddr-pmu";
> +        reg = <0x5a007000 0x400>;
> +        clocks = <&rcc DDRPERFM>;
> +        resets = <&rcc DDRPERFM_R>;
> +    };
> +
> +  - |
> +    ddr_channel: sdram-channel-0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "jedec,ddr4-channel";
> +        io-width = <16>;
> +    };
> +
> +    perf@48041000 {
> +      compatible = "st,stm32mp251-ddr-pmu";
> +      reg = <0x48041000 0x400>;
> +      access-controllers = <&rcc 104>;
> +      memory-channel = <&ddr_channel>;
> +    };
> 
> -- 
> 2.43.0
> 

