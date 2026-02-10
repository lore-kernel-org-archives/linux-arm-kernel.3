Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A028CEA3F16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 07:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwAx0u0cTv2WK6km8vXCOkVQpIvwsTQOuuMXsTRALwE=; b=J2UDXsmnP8ODQAenxjqKVSrGbx
	sQHJ6cV/GxuRoATVnuMHpmdmK7MVzaCry0qV/k9eOAP635247e7c7Noy3cEuGkxMk1D5HaKAIKtZi
	TBmdq36zGidfekR1lcJNnFYj6yqUuezmOBXTaUq2eM2//2N+97MJcgSkzpO1/Gk9hxo67HSuRA8qj
	mujKtL3I4Zw9iuGTn0Yw3fISIT1vrCpgELaXWBjzl+UWDsM3/GxDft2RrXN6vdr9XwTcOfTSPKgxc
	qoD+k2bjsHcVND3as47fy46fSXKRv2+c3oikLAllw1HrhY1ilTt+r8ABEtOP27tEZoAaRA7Af9im6
	Q4S+lYrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpicq-0000000GepR-2CvX;
	Tue, 10 Feb 2026 07:57:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpicn-0000000Gep3-3Kxi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 07:57:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9C2140360;
	Tue, 10 Feb 2026 07:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C26AC116C6;
	Tue, 10 Feb 2026 07:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770710252;
	bh=3xPmINn1ZMlfn3sOVXZASDkUg8ApCtliQ4NNcv91JbA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QCr4TlC9PPXrSd6FascMSq5PAq4+X0Mq/cnRMN54vszBHmhZllTd66sIR6XX0fAOB
	 VIBFa5+yl5xqHESujHLOQi5M1CeRSjQnI1U0wCvpg12nwgiQhvb0SWLkSdtPXFp7Lh
	 NwRLnXBwCiH7k1BB9A5mFWtPoIKLdbRZdZYvZYKOG+LhE4IlFXVsiXZHOhLTAWK2AF
	 CIVi6RWe0bfPjrooWf19/pqmOzyIlil+ihK4hbwobhk7W4EwROsW7DHbV13/u7PB6m
	 1WvtJf0z45lZRQXQkjU7ED31FTRB2T/3MEXCW6MzAwiE+78B1lgiRQut6jrBdlFf6d
	 B1LrWC8j2sVCw==
Message-ID: <ee9759a6-1779-4891-8716-24c36134198a@kernel.org>
Date: Tue, 10 Feb 2026 08:57:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: soc: st: document the RISAB firewall
 peripheral
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
 <20260209-stm32_risab-v1-1-ef0b2b6a7e0a@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260209-stm32_risab-v1-1-ef0b2b6a7e0a@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_235733_885085_AA61E591 
X-CRM114-Status: GOOD (  23.02  )
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

On 09/02/2026 15:59, Gatien Chevallier wrote:
> Add documentation on the RISAB peripheral that is a memory firewall on

What is RISAB? It's in capitals, so some sort of acronym?

> the stm32mp2x platforms.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  .../bindings/soc/st/st,stm32mp25-risab.yaml        | 74 ++++++++++++++++++++++

soc is not a dumping ground. Find suitable subsystem for it.


>  MAINTAINERS                                        |  5 ++
>  2 files changed, 79 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/st/st,stm32mp25-risab.yaml b/Documentation/devicetree/bindings/soc/st/st,stm32mp25-risab.yaml
> new file mode 100644
> index 000000000000..d05a683c594d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/st/st,stm32mp25-risab.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/st/st,stm32mp25-risab.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Resource isolation peripheral unit for address space protection
> +       (block-based)

So maybe here would be RISAB explanation... Use proper capital lettes in
the title (e.g. AP or Chicago style, I don't think we do any preference
or consistency, especially that most of us including myself don't even
know the difference).

> +
> +maintainers:
> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
> +
> +description:
> +  The RIF (resource isolation framework) is a comprehensive set of hardware
> +  blocks designed to enforce and manage isolation of STM32 hardware resources,
> +  like memory and peripherals. The RISAB peripheral is part of the RIF and is
> +  used to protect internal RAMs by applying access rights per RISAB fixed-size
> +  page. Through RISAB registers, a trusted domain, or the domain to whom the
> +  page configuration has been delegated, assigns memory pages to one or more
> +  security domains (secure, privilege, compartment).
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp25-risab
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: RISAB bus clock
> +
> +  memory-region:
> +    minItems: 1
> +    maxItems: 32
> +    description:
> +      Phandle to nodes describing memory regions to be configured in the RISAB
> +      by the trusted domain of at least a RISAB page size.
> +      These regions cannot overlap. A zone must be within st,mem-map range and
> +      can be represented by one or more pages.
> +
> +  st,mem-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: Memory address range covered by the RISAB.
> +    items:
> +      - description: Memory range base address
> +      - description: Memory range size

Why do you need this property if you have memory-region already? This
also should be part of <reg>, although this mixing with memory-region is
anyway confusing.

> +
> +  st,srwiad:
> +    description:
> +      When set, the trusted domain configures the RISAB to allow secure
> +      read/write data accesses to non-secure blocks and pages. Secure execute
> +      remains illegal.
> +    type: boolean

Shouldn't this be a property of given block from memory-regions, not
entire RISAB?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - st,mem-map
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +
> +    risab1: risab@420f0000 {

Drop unused label.

> +        compatible = "st,stm32mp25-risab";
> +        reg = <0x420f0000 0x1000>;
> +        clocks = <&rcc CK_ICN_LS_MCU>;
> +        st,mem-map = <0xa000000 0x20000>;
> +        st,srwiad;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e08767323763..b9a1276e94a9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25092,6 +25092,11 @@ F:	Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst
>  F:	Documentation/devicetree/bindings/dma/stm32/
>  F:	drivers/dma/stm32/
>  
> +STM32 SoC FIREWALL DRIVERS

s/SoC/SOC/


Best regards,
Krzysztof

