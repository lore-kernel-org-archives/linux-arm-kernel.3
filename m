Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CAFCD3423
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 07:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjRctkyMxW1glcneyXt+Xe1thAJYruyzIOc34aGnFec=; b=V+bn+7hcTpkeF+3GP+VW68aeQj
	Ep+lDFESwW0FQQgaUav8hs2e+V8A6pyvC+fuLHrWebiuxhkU66Jt1+m/ovNzoo4y/SXWsoOpqSS1+
	QuureleB3B24nBI+/SOUtp0Gb/eIySZE2zSRp1LcUd4Cw2++1zPz1v68p4x7+4jp/K3QQi0zsHg6a
	P+nnJfRDRzwF3B0eDn7wrlI1EqREGK/Ov6aDGXqTHpcMRRi8Dg+CIUiz3hszsRuUPBoTC6RFSf1A7
	J8C52YZaqjrZYWpwptwp05q9xQM0kqGFtwbck4+vWVgXWnlDDLfv4dv+S0fJZczJQ0Jhsf1AoDE3y
	x7TxiBBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnxS-0000000CdNM-2pKT;
	Mon, 04 May 2026 07:43:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnxQ-0000000CdM3-0qnT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 07:43:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 702AE40638;
	Mon,  4 May 2026 07:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE1EC2BCB8;
	Mon,  4 May 2026 07:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777880591;
	bh=bh3ovJn8JLAnMA6CkcWRCD4kPhHdbml/zu3lMDSb1RI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IKOgHeZ6BLbhYsIpmwAGs+SKNBdrrgcP5q1TudtvunigHspULJx2czDG7Kgk9/xrh
	 zVqiGLWk1CEdJuCvT1DJ9j+VHOv7ENLBgPtstZaqKQUeUscvTqAry7kyGq3O3NRz7/
	 B+3cX8hcdsMVtkryCxnc502zF8p52eoLydJIXnYUC6eBXOMctrw0LOa++TWbnbh9xg
	 QTjCCeAsgJEPZKx+r9PGsWPw9UbGOvTPH71s7dGvlvXHRlvaAqxaEzbMOF1r71QT/n
	 onle774duGjhWcg6V6r7kzaNNcaSLR5pnxqca0UZkwv2cSAXsF6w9SddZJmGZyPTiD
	 km5GQzqwRgvKQ==
Date: Mon, 4 May 2026 09:43:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] dt-bindings: mmc: st,sdhci: convert to DT schema
Message-ID: <20260504-rational-gleaming-clam-aeaaff@quoll>
References: <20260503-st-mmc-v2-0-11ae3216d2ce@gmail.com>
 <20260503-st-mmc-v2-2-11ae3216d2ce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260503-st-mmc-v2-2-11ae3216d2ce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_004312_258228_877B9E74 
X-CRM114-Status: GOOD (  13.65  )
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

On Sun, May 03, 2026 at 08:35:30AM +0000, Charan Pedumuru wrote:
> +$id: http://devicetree.org/schemas/mmc/st,sdhci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics SDHCI-ST MMC/SD Controller
> +
> +description:
> +  The STMicroelectronics SDHCI-ST MMC/SD host controller, which is
> +  compliant with the SD Host Controller Interface (SDHCI) specification and
> +  is used to interface with MMC, SD and SDIO cards. The ST SDHCI controller
> +  extends the standard SDHCI capabilities with platform-specific
> +  configurations such as additional register regions,clock inputs, and delay
> +  control mechanisms required for signal timing adjustments which are
> +  necessary to support high-speed modes and ensure reliable data transfer
> +  across different ST SoCs.
> +
> +allOf:
> +  - $ref: mmc-controller.yaml#
> +
> +maintainers:
> +  - Peter Griffin <peter.griffin@linaro.org>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: st,sdhci
> +      - items:
> +          - const: st,sdhci-stih407
> +          - const: st,sdhci
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: Base address and size of the MMC controller registers

s/Base address and size of the//

> +      - description: Base address and size of the MMC delay/auxiliary registers

Here the same

> +
> +  reg-names:
> +    oneOf:
> +      - items:
> +          - const: mmc

Drop three lines above

> +      - items:

So this is just items like you have in "reg" part. Same syntax.

> +          - const: mmc
> +          - const: top-mmc-delay
> +
> +  clocks:

Here and:

> +    items:
> +      - description: Clock for the MMC controller
> +      - description: Interconnect (ICN) clock
> +
> +  clock-names:

here: Old binding icn is optional. You need to explain in the commit msg
all the changes done during conversion.

> +    items:
> +      - const: mmc
> +      - const: icn
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    const: mmcirq
> +
> +  resets:
> +    maxItems: 1

Best regards,
Krzysztof


