Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15598C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGpfJbI9vuGBptLAuWMi7YNijWNKlTLHUNcrQEUm8mM=; b=P8iWOsopUFklBKMeiEfkeo8Flw
	wFFrDOdz7i30oyokThndV5p+b62lcXma+K3xsmTruxhSh6LCXADJKv0WJrCAEhcb091N6WqUdaxw4
	UM04AmfFSyw78NLeg4eP3wynctTAQ9ff6Ds4nmH8fU5gbV46D6uVNtpp2wCkp9OIiuHPS/eKFEIj+
	5jkK519SiDYSF+1rkEFX0K4eE+/vzLg/Ft1/E6oGAa9zpqRWed37/yaoUNWL+8CefUhrP3M6IiZj2
	TLGY2flWetMAoxj7axFBVYUYRKTAp7/56d9qIW3RKRMNK1JGsSIZN3+8+xP6UCR/QV1GUVVmD6Yws
	ztVQK6CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZwG-0000000823l-3fyn;
	Tue, 17 Jun 2025 17:17:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZju-00000007wwF-1cmX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 17:04:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 96F5BA51801;
	Tue, 17 Jun 2025 17:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98668C4CEE7;
	Tue, 17 Jun 2025 17:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750179889;
	bh=AZZ54kpbaOyDLy+/ubXOlw8lKqafcE1tTXmUjCQGWkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MlC18b1vd0B4fVN9w5YHP3iWoS2zcaCPsljwmcoX3+nufojAu9ux9GD648NXkZ6Xu
	 ykGAkZdR8/9deA/XSWZvkRsvZMHP9KSlCRFc7zhzxvC1bxom2VpbDB6SDUPtoY96rP
	 reXO92NmQ1FCVKBDLdrlkPvGpNS9uvnANRnhC1oTjEULrVggTIxfBYqH2vfhL5uQ8e
	 pzVR8TAqhfQYn1E6XZUb90/p15T5/SHj5DbMyDKjzRmLcX1sKORaVX5dd6DEcFuPJ6
	 NF+3Kg1GhbDypYEuZpfgp/w9NoMbx8TQsMLeVMQneJK/QxM9q7T0G0FIqimZUm6Wx4
	 LQSZLYLEBI/nw==
Date: Tue, 17 Jun 2025 22:34:38 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, 
	manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	p.zabel@pengutronix.de, linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, john.madieu.xa@bp.renesas.com, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add
 documentation for the PCIe IP on Renesas RZ/G3S
Message-ID: <cmh64utcezpq6thnfrfm7z4dxm63fxzkidirtyjj53cbuzu5ef@v73majd6kepz>
References: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
 <20250530111917.1495023-4-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530111917.1495023-4-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_100450_570272_236E9F42 
X-CRM114-Status: GOOD (  23.55  )
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

On Fri, May 30, 2025 at 02:19:12PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
> Base Specification 4.0. It is designed for root complex applications and
> features a single-lane (x1) implementation. Add documentation for it.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v2:
> - update the interrupt names by dropping "int" and "rc" string; due
>   to this the patch description was adjusted
> - added "interrupt-controller" and made it mandatory
> - s/clkl1pm/pm/g
> - dropped the legacy-interrupt-controller node; with this the gic
>   interrupt controller node was dropped as well as it is not needed
>   anymore
> - updated interrupt-map in example and added interrupt-controller
> - added clock-names as required property as the pm clock is not
>   handled though PM domains; this will allow the driver to have
>   the option to request the pm clock by its name when implementation
>   will be adjusted to used the pm clock
> - adjusted the size of dma-ranges to reflect the usage on
>   SMARC module board
> - moved "renesas,sysc" at the end of the node in example to align
>   with dts coding style
> 
>  .../pci/renesas,r9a08g045s33-pcie.yaml        | 202 ++++++++++++++++++
>  1 file changed, 202 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
> new file mode 100644
> index 000000000000..8ba30c084d1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
> @@ -0,0 +1,202 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/renesas,r9a08g045s33-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

[...]

> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        pcie@11e40000 {
> +            compatible = "renesas,r9a08g045s33-pcie";
> +            reg = <0 0x11e40000 0 0x10000>;
> +            ranges = <0x03000000 0 0x30000000 0 0x30000000 0 0x8000000>;

This 'ranges' property looks bogus. The bitfield specifies that the memory is
64 bit non-prefetchable, which can't be true.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

