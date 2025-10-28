Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25C0CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 13:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=DzKeKz377bw+AjGXtS7hvPLMXs0p4OIhaxJNCl5JKj0=; b=vISsrz4ZxGC3IC
	Xyj/UraIriRmHj3tgJ2Ay/U/lW20ldsDS5JVJKKplKxQ+qlc4KD4PU+tNG24QzTZHFlJEkCXDkhT9
	v+OIsrC/YWmVDJdmpPpSJ6Ur0pN6IhREFSLAE9TBdmWGrVNhhlOJOjrevwY4qUerXZpj9n1vqNhnD
	c7zwlCnx7n5v36LHWupt6lJt5eUkrNfGelfpUoN5TPz0Qj71+LP6tb1ZdRX0669XMv+bx+cSbApmQ
	YlrYnJ5+a/YKItVisLekm5fwuSB2Q4buu9RTPpbRLL/eViKY7leLX0b+vnTdvM1jjm3VplO42zSAk
	AEkEQWNBThtJiz5asXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDk2C-0000000G1fd-33AZ;
	Tue, 28 Oct 2025 13:46:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDk2A-0000000G1fG-3aQp;
	Tue, 28 Oct 2025 13:46:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4F5660398;
	Tue, 28 Oct 2025 13:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4601DC116C6;
	Tue, 28 Oct 2025 13:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761659205;
	bh=gHTXG47ZT83HtioVGkOdOgeWLg99afniblJgeCrheGk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=HyngrGjLb54dCOStOExNIW8Y0NWfQzBXP7/lfZg2CrXY7+IMVLq42u0PG+z1cEhOL
	 M9rvJLEAEy7zeEAWnuV/unlMTMS3/MUsv0ix70sVbD2swTqZWjJ73oXB/FnRpo6ibM
	 5estbSa3g/FRLspY7MtCd9VANbOrV9/5esg2D/G+7NIUhmjdRsQO8xY/aVRcPYRGXb
	 X/UIMn6YkUr50ydC9753IDyWw8dnp67i7nUJy9ediQGszIl+HEj5mZ17iKfEPbiCQI
	 yV1LFP3RB+1kFvEmWfqvRVyp0cXJ70Zaz3/Whr5ecoe3Wqctp9aXbfY9yaLyAIIFK6
	 M+094b4nEUMzQ==
Date: Tue, 28 Oct 2025 08:46:44 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	vkoul@kernel.org, kishon@kernel.org, linus.walleij@linaro.org,
	p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 2/9] dt-bindings: PCI: Add ASPEED PCIe RC support
Message-ID: <20251028134644.GA1506590@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027095825.181161-3-jacky_chou@aspeedtech.com>
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

On Mon, Oct 27, 2025 at 05:58:18PM +0800, Jacky Chou wrote:
> ASPEED AST2600 provides one PCIe RC for Gen2 and AST2700 provides three
> PCIe RC for two Gen4 and one Gen2. All of these RCs have just one root
> port to connect to PCIe device. And also have Mem, I/O access, legacy
> interrupt and MSI.

> +description:
> +  The ASPEED PCIe Root Complex controller provides PCI Express Root Complex
> +  functionality for ASPEED SoCs, such as the AST2600 and AST2700.
> +  This controller enables connectivity to PCIe endpoint devices, supporting
> +  memory and I/O windows, MSI and legacy interrupts, and integration with
> +  the SoC's clock, reset, and pinctrl subsystems. On AST2600, the PCIe Root
> +  Port device number is always 8.

s/legacy/INTx/

> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-pcie
> +      - aspeed,ast2700-pcie
> +
> +  reg:
> +    maxItems: 1
> +
> +  ranges:
> +    minItems: 2
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +    description: IntX and MSI interrupt

s/IntX/INTx/

> +    pcie0: pcie@1e770000 {
> +      compatible = "aspeed,ast2600-pcie";
> +      device_type = "pci";
> +      reg = <0x1e770000 0x100>;
> +      #address-cells = <3>;
> +      #size-cells = <2>;
> +      interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> +      bus-range = <0x00 0xff>;
> +
> +      ranges = <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000
> +                0x02000000 0x0 0x60000000 0x60000000 0x0 0x20000000>;
> +
> +      resets = <&syscon ASPEED_RESET_H2X>;
> +      reset-names = "h2x";
> +      pinctrl-0 = <&pinctrl_pcierc1_default>;
> +      pinctrl-names = "default";
> +
> +      #interrupt-cells = <1>;
> +      msi-controller;
> +
> +      aspeed,ahbc = <&ahbc>;
> +
> +      interrupt-map-mask = <0 0 0 7>;
> +      interrupt-map = <0 0 0 1 &pcie_intc0 0>,
> +                      <0 0 0 2 &pcie_intc0 1>,
> +                      <0 0 0 3 &pcie_intc0 2>,
> +                      <0 0 0 4 &pcie_intc0 3>;
> +      legacy-interrupt-controller {
> +        interrupt-controller;
> +        #address-cells = <0>;
> +        #interrupt-cells = <1>;
> +      };

IIUC, Rob says there's no need for a separate interrupt-controller
stanza and it can be directly in the host bridge [1].

I think that does make interrupt-map a little more verbose because the
parent unit address will use the host bridge #address-cells (3)
instead of the interrupt controller #address-cells (0), e.g., this
from [2]:

  pcie@10e40000 {
      compatible = "renesas,r9a08g045-pcie";
      #address-cells = <3>;
      #interrupt-cells = <1>;
      interrupt-map = <0 0 0 1 &pcie 0 0 0 0>, /* INTA */
                      <0 0 0 2 &pcie 0 0 0 1>, /* INTB */
                      <0 0 0 3 &pcie 0 0 0 2>, /* INTC */
                      <0 0 0 4 &pcie 0 0 0 3>; /* INTD */

[1] https://lore.kernel.org/linux-pci/20250509204905.GA4080349-robh@kernel.org/
[2] https://lore.kernel.org/linux-pci/20251007133657.390523-2-claudiu.beznea.uj@bp.renesas.com/

