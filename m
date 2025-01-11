Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A41E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 09:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/njuTljo0q1mW5/TFGaaSwptJntYA+kpmZhHkb3c3U=; b=vJiT1N7MgqOlZMLeft8I2l5rTd
	MSd/QQf8nOK6RvdEUN17UPC6Aub8hbp5nm1itmlRxLhQlCgikUl+h0Z/KpB28d/9d+ToTPyU84isW
	Xu1BYRRN4VP8D8slQLd8XGAOB867St45VVmKK6TzE84CCXDfgzU0V+w4BHCRdU+cNsan62spudO17
	c+avtAdje8rT4OegSP8EECar44eMITfVQGt6jOhgBGS6lJFxMGrR3CLmC0HZrZOc/dQ2UUaTbeh1n
	iImXHxf0DiYkDKoO9QhTPPDLW7dDxylLekcuU5LIfv7vqJQM1s+1k5DBRRWXTVkAJeT4XnPNxfsHN
	YEC50keA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWXlq-00000000VsK-0RpF;
	Sat, 11 Jan 2025 09:27:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWXkb-00000000Vdy-1NyS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 09:25:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA7B95C5361;
	Sat, 11 Jan 2025 09:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFF1C4CEDD;
	Sat, 11 Jan 2025 09:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736587548;
	bh=Z83WXJZoT28SBDIuoOe79g+ADfiCinqPsdEf+EaBKnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jsKT0sWer0S+oyjZTnsrYwJwGgp70I+ShlBu3pf7DVCCEaSKzGqLLZNz7ThLBitUv
	 vLxgsh6E9TKKC+UeBCwL4y398nARXKbk7VHtD5SMUXdL8DKlZDlzsicjR9c87CMaGj
	 1tKKgli2nbvcSskJveAG9eP3qqtt8kPYSBIL5UHH5N8kuQuXfzRn68/ujbT58klMxo
	 ZPWjL/bfwtcWKu69sEa7I7ClWvg/tnvjsVPCwo5dCDuSJKdDdUpx87K1GF64uDG6ki
	 sy1cLecLOOrG7zKU27CgYA3bvBbkl0H17wLc/awhiJCg2mPGX5X9R/VrGxVSwAEwk/
	 HXBw/CP8a03CA==
Date: Sat, 11 Jan 2025 10:25:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: convert stm32 rcc bindings to
 json-schema
Message-ID: <bfxyod5l2s6g3j47be7mjh6i7wgjapka2q5b6f2mleipiai6gm@hfvclvkzrtyd>
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
 <20250109211908.1553072-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109211908.1553072-2-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_012549_417250_CBC11DC6 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jan 09, 2025 at 10:18:28PM +0100, Dario Binacchi wrote:
> +maintainers:
> +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +
> +description: |
> +  The RCC IP is both a reset and a clock controller.
> +  The reset phandle argument is the bit number within the RCC registers bank,
> +  starting from RCC base address.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: st,stm32f42xx-rcc
> +          - const: st,stm32-rcc
> +      - items:
> +          - enum:
> +              - st,stm32f469-rcc
> +          - const: st,stm32f42xx-rcc
> +          - const: st,stm32-rcc
> +      - items:
> +          - const: st,stm32f746-rcc

Why this isn't just part of enum with first group/list? Different
groups/lists are for different fallbacks and I am pretty sure fallback
is the same.

> +          - const: st,stm32-rcc
> +      - items:
> +          - enum:
> +              - st,stm32f769-rcc
> +          - const: st,stm32f746-rcc
> +          - const: st,stm32-rcc
> +      - items:
> +          - const: st,stm32h743-rcc

Same here.

Rest looks good, so with combining entries above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


