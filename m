Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAC5C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 14:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/g2hnhfNktPdj9e67Wgyyngm8wK93yZzPoeQY4hpjt0=; b=13OKQcNGZ17tT4BHtZgkI7emdw
	Jiby7/046xPYudeHy2g4a2D1c8AGUvn4EMqXesCqDVJjPtBHXyPKtDSVUArJQes9DarLk48WXCv4l
	HO4H4lSa2C6ip0O6YsKmT90tTpGE+dF/1LRdvtHax9A8R0W1LrjETY6bgizHEH+Od/FP4UFfvoNiB
	VWDEhFmf0KeJI/OblemE/tOFpHm76xN4iFRg/sQoCHrA2qrrsc3R1XbjKL/a3YslqKnq9Ma9FygP+
	kiFkWr8ZpzAVpIo/Dzi45WqLsorpcL4FDXrVgsecbHbuauneMZhXWRpZqzPrIzuoaoRPVAIGdzx0Y
	Jp4m+WtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpT2q-00000004wPa-0dMP;
	Tue, 04 Mar 2025 14:14:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSzY-00000004vgo-1phI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 14:11:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D19A05C5D14;
	Tue,  4 Mar 2025 14:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CAAC4CEE5;
	Tue,  4 Mar 2025 14:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741097487;
	bh=uZAr3o4anHDvD9RQXrKUeVfxL/By4d6vCjGFzZTYNJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cXcEid9Ufzy2HTrGc7vpehSk3qt9XEZnJuIj0o5jqXiT51j7xjCxC/Rs8SWaMGubz
	 p6EWZPC3NYKj6sYy3kZRE8CMuSG80bADbm8prImUYIIiZdZ7RBS8q3+qEPwWs0JGy3
	 xQGlN2ixEzXRvi/6bT21yzJr7RhwRzPos2fFaNifnGPEJkKXnm6MaDAUfHpfm0oiT9
	 2ZgAGUnrb2cjyNq4oEvpS4wkngjptSYGnrW7VeblRca/T1Sekxxg55j92gS8WndiDa
	 PDCkeO85jGWgFkv5edfvIQhXXPt/epi1L9N3GUKx8nZfIpaUthb+qHW10km/ijfb4E
	 RBlLQfoe33FmA==
Date: Tue, 4 Mar 2025 08:11:25 -0600
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/15] dt-bindings: clk: sunxi-ng: document Allwinner
 A523 CCU
Message-ID: <20250304141125.GA2518548-robh@kernel.org>
References: <20250304012805.28594-1-andre.przywara@arm.com>
 <20250304012805.28594-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304012805.28594-5-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_061128_584596_0B78D2BC 
X-CRM114-Status: GOOD (  19.91  )
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

On Tue, Mar 04, 2025 at 01:27:54AM +0000, Andre Przywara wrote:
> The Allwinner A523/T527 SoCs have four CCUs, this adds the binding for
> the main CCU.
> 
> The source clock list differs in some annoying details, and folding this
> into the existing Allwinner CCU clock binding document gets quite
> unwieldy, so create a new document for these CCUs.
> Add the new compatible string, along with the required input clock
> lists. This conditionally describes the input clock list, to make for
> an easier patch adding the other CCUs.
> 
> Also add the DT binding headers, listing all the clocks with their ID
> numbers.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../clock/allwinner,sun55i-a523-ccu.yaml      |  77 +++++++
>  include/dt-bindings/clock/sun55i-a523-ccu.h   | 189 ++++++++++++++++++
>  include/dt-bindings/reset/sun55i-a523-ccu.h   |  88 ++++++++
>  3 files changed, 354 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
>  create mode 100644 include/dt-bindings/clock/sun55i-a523-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun55i-a523-ccu.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> new file mode 100644
> index 0000000000000..2eacaeaeabac7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/allwinner,sun55i-a523-ccu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A523 Clock Control Unit
> +
> +maintainers:
> +  - Andre Przywara <andre.przywara@arm.com>
> +
> +properties:
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  compatible:
> +    enum:
> +      - allwinner,sun55i-a523-ccu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 4
> +    maxItems: 4
> +
> +  clock-names:
> +    minItems: 4
> +    maxItems: 4
> +
> +required:
> +  - "#clock-cells"
> +  - "#reset-cells"
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +if:

Put this under an allOf and use another 'if' instead of the 'else' 
clause in the 2nd patch.

> +  properties:
> +    compatible:
> +      enum:
> +        - allwinner,sun55i-a523-ccu
> +
> +then:
> +  properties:
> +    clocks:
> +      items:
> +        - description: High Frequency Oscillator (usually at 24MHz)
> +        - description: Low Frequency Oscillator (usually at 32kHz)
> +        - description: Internal Oscillator
> +        - description: Low Frequency Oscillator fanout
> +
> +    clock-names:
> +      items:
> +        - const: hosc
> +        - const: losc
> +        - const: iosc
> +        - const: losc-fanout
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    ccu: clock@2001000 {

Drop ccu and it's 'clock-controller' not 'clock'.

> +        compatible = "allwinner,sun55i-a523-ccu";
> +        reg = <0x2001000 0x1000>;
> +        clocks = <&osc24M>, <&osc32k>, <&iosc>, <&r_ccu 2>;
> +        clock-names = "hosc", "losc", "iosc", "losc-fanout";
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +    };
> +
> +...

