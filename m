Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A641FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 12:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPHATgdcy7rua07VS7zPGIYW7xT65QR8b1jZ2C98Mm4=; b=FwUq/n/0S8lEkc7bjzPXXMO9EJ
	SvKp1Ybg+YPfQvd1Dsaz9ReXDcBWBpqzLxPREvJ6HpMalQUPwQ7NWPDP8S0CNF1YSKc5mckQ5J19+
	jOxhf4DeHu7XDQATxhhkYA1EN17h6/CIOqeTTBODV5GxtbFfNPRzzhQuvnKWrtL6mAElOyIGtyQyE
	mh8VNpb1kXU4ohs4YcWIAYwtkTVKO6eiMFxe8yFDZ/g0BAgwA4NqFW5liUiPooNql1cs8jGdGVoTz
	K0bm9v8wbbUpAFhwCmwVGkAOTzHWCBsFtYh4DKbF/opIj+66vxYcdn3w6DOCFJUdP1aVZ7KqD9X04
	OXsvd0GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWw6-0000000DQAQ-3CjP;
	Tue, 17 Dec 2024 12:44:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWv0-0000000DPym-40vC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 12:43:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B3235C6099;
	Tue, 17 Dec 2024 12:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C050FC4CED3;
	Tue, 17 Dec 2024 12:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734439398;
	bh=YJD5j6axAfcKPnmYpT9mtMCTx0yWBgcnrv0V5xHFMqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=na08JaC7s/BwOgzsBqRm2F22zocI122O+xG8ZxTDuDT5FKgrTByKNw2z4fzDbXrm8
	 tkoUxAYA1yuHxYivexqtwP/hMF9OH5ujj0OWej9qqjSR1X1D9Uie+IrHdJR51cpSUv
	 tUAslkLgIcfr5ePMA5VrihVuhFWrSPWM1V/oeqYfC9jgMRoUsI/5iRWKm3uYu9a6No
	 sDOj6f2uy2FczZDWYeRZGZabMHmcnO2XgKnjnWbN1CJ1QRwhlyXaej6o5Adw/9nUR4
	 chvLT0TJvRxdZevDujgGvLhrT9aJ6ThmuF5Xj9uVGnLPw4TPWbxWoTD9jmRbDkBm+M
	 sWTVhz0HQlonw==
Date: Tue, 17 Dec 2024 06:43:16 -0600
From: Rob Herring <robh@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [PATCH v2] dt-bindings: mmc: atmel,hsmci: Convert to json schema
Message-ID: <20241217124316.GA1136537-robh@kernel.org>
References: <20241209-hsmci-v2-1-b5a6d7c59b67@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209-hsmci-v2-1-b5a6d7c59b67@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_044319_080714_9187D4DD 
X-CRM114-Status: GOOD (  17.24  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Aubin Constans <aubin.constans@microchip.com>, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Dec 09, 2024 at 10:02:30AM +0530, Dharma Balasubiramani wrote:
> Convert atmel,hsmci documentation to yaml format. The new file will inherit
> from mmc-controller.yaml.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> Changes in v2:
> - Drop the duplicate properties in the slot node.
> - Link to v1: https://lore.kernel.org/r/20241205-hsmci-v1-1-5a25e622dfed@microchip.com
> ---
>  .../devicetree/bindings/mmc/atmel,hsmci.yaml       | 110 +++++++++++++++++++++
>  .../devicetree/bindings/mmc/atmel-hsmci.txt        |  73 --------------
>  2 files changed, 110 insertions(+), 73 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/atmel,hsmci.yaml b/Documentation/devicetree/bindings/mmc/atmel,hsmci.yaml
> new file mode 100644
> index 000000000000..26686ada6288
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/atmel,hsmci.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/atmel,hsmci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel High-Speed MultiMedia Card Interface (HSMCI)
> +
> +description:
> +  The Atmel HSMCI controller provides an interface for MMC, SD, and SDIO memory
> +  cards.
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> +  - Aubin Constans <aubin.constans@microchip.com>
> +
> +allOf:
> +  - $ref: mmc-controller.yaml
> +
> +properties:
> +  compatible:
> +    const: atmel,hsmci
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    const: rxtx
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: mci_clk
> +
> +  "#address-cells":
> +    const: 1
> +    description: Used for slot IDs.
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^slot@[0-9]+$":
> +    type: object
> +    description: A slot node representing an MMC, SD, or SDIO slot.

There's a schema for slots now queued for 6.14[1]. You should use that. 
One issue is 'compatible' is required. Either that would have to be 
dropped as required or you could just add it in your .dts files.

Rob

