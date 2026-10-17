Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8563CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 17:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzg59Xkf4Lmvc7NfaNymuTJFzLiLBxFJ5cCPJCvEM6Y=; b=ClwUgRQEJHaOlZoWLWn01Qh87P
	jLI1bKBQExZZHmuiNckxL37Iz6mTEDU9Qv4faSJgcWJmt+zCBPUxtE8W5YtXHJkq+lxZ+sUcBmRdI
	VQZAY0Q/nL9mvesd4EOPagWCNYtSwF7LedMNo5BbvQndwJxkZgEX3KbZn182cE1WrVG08pQsNkf2u
	j1iUuqvhq9rVApGXjlvteK5YwrfDISy94d18AvjdbhCNoRgcTTXlZM8A0ms4YXhIKG2Af8jXxiE7Y
	dsAkZ2wSip9AvWRhMjiUjzSEd5FZp+hUvxwxdpa3msZUSx0XTJI1Am/aUL91JLQL/1ybskjqyhlQ5
	aKs5QS3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8aG-0000000529y-3InX;
	Sat, 17 Oct 2026 17:52:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8aF-0000000529b-05i2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 17:52:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AA94060D89;
	Sat, 17 Oct 2026 17:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85D91F000C5;
	Sat, 17 Oct 2026 17:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792259556;
	bh=vzg59Xkf4Lmvc7NfaNymuTJFzLiLBxFJ5cCPJCvEM6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DVzoz7F8prxSjPPCcYFu0iIWqStKwNasZL6ZqLLBfCL9F8oUcg1oOBl53sOGb1aNP
	 xsxRDXuAL4RzQuZ91EAFXVad3o4XJ6EtDNVxHHuPFh3N/WTB01H/MiziVdLSN3XvGi
	 6Lac4k55lyLtZgR7vvxQVd8vVry5DrD8aoXy7YmmhbkpnNjGU0DqEehx0qWDO++u0g
	 wo/5XjD+HTioy83qafn94Ux67uoLLKxYsgL0D4AT2HtsTzAvEA1UzvgMY3uCgrf0oN
	 xzl2kNefILUzkLyacq2Bsu3lF5bf8EmGKMEXz5vouLPICRF3n9BnkmRwlSkPiaIdz4
	 IDaGk93oVcIiQ==
Date: Sat, 17 Oct 2026 19:52:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Simeon Marijon <simeon.marijon@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: stm32: allow TAMP nvram child
 node for syscon
Message-ID: <20261017-valiant-exotic-heron-c0b6e8@quoll>
References: <20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com>
 <20261016-upstream_nvram_reworked-v3-2-f65908490cf7@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016-upstream_nvram_reworked-v3-2-f65908490cf7@foss.st.com>
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

On Fri, Oct 16, 2026 at 05:26:04PM +0200, Patrice Chotard wrote:
> The STM32 TAMP node (compatible "st,stm32-tamp", "syscon", "simple-mfd")
> exposes its backup registers through an nvram child node described by
> nvmem/st,stm32-tamp-nvram.yaml. That requires the TAMP node to carry
> "#address-cells", "#size-cells", "ranges" and an "nvram@..." child.
> 
> st,stm32-syscon.yaml uses "additionalProperties: false" and only allowed
> reg/clocks/#clock-cells, so wiring the nvram provider into the DTSI made
> "make dtbs_check" fail on every STM32MP TAMP node:
> 
>   tamp@5c00a000 (st,stm32-tamp): '#address-cells', '#size-cells',
>   'nvram@5c00a100', 'ranges' do not match any of the regexes:
>   '^pinctrl-[0-9]+$'

There are no children of tamp@5c00a000 in
arch/arm/boot/dts/st/stm32mp151.dtsi. How is it possible to reproduce
this warning?

Are you using some other patches bugs as a reason of change in bindings?

> 
> Allow the addressing properties and the nvram child, gated on the
> st,stm32-tamp compatible so the other syscon variants stay strict.
> "#size-cells" may be 1 or 2: the STM32MP21 soc bus uses two size cells
> (an empty "ranges" requires the node to match its parent) while the
> other STM32MP SoCs use one.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  .../bindings/arm/stm32/st,stm32-syscon.yaml        | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index 95d2319afe23..1aeb54867db2 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -39,6 +39,23 @@ properties:
>    "#clock-cells":
>      const: 0
>  
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    enum: [1, 2]
> +
> +  ranges: true

You work on some weeks old tree.

> +
> +patternProperties:
> +  "^nvram@[0-9a-f]+$":
> +    type: object

additionalProperties true with ref or false with a compatible, just like
every other binding. See also display/msm for some examples.

> +    description:
> +      TAMP backup registers exposed as an NVMEM provider. See
> +      nvmem/st,stm32-tamp-nvram.yaml.
> +    required:
> +      - compatible

Best regards,
Krzysztof


