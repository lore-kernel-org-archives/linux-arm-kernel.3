Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66FDCDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMLg+Sr/y5FDapu46bskmirKujQ32N1+2dZN0r1E5GY=; b=T/L3Opzrt34wLBCyLoHIvAbclP
	2uQ9QAWFjP+OLhUUqcUSTcTsw1NBUZheAbouX15m+Bcf0oftvOho3vibhWPwHJ5kGRhgMhfJ6COdF
	9L0rApl58RNQG6cOKQ3+S0q5Tl7tRhOAPRTlqYPN42nkEsvta+yUXGyWHaDblv0zrq0Pn3viWdhl6
	uhsJD8dSkGyZto1IdLJB6q8wQsDER9lGuvxX0wu1BRuC29yYCi18DzYZywgUQMSrKxHpM9OZOcD4J
	bNQojtT/nd1yKeGlXNClwQ6hAFcSvOESgJ3GgzEua2oCN7Xyw0M6+rYA8HX1FCqDaoK2kbbkzb4Dy
	38oWWHLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbadc-00000004iqd-2WfP;
	Mon, 22 Jun 2026 09:08:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbadb-00000004iqD-2ONs;
	Mon, 22 Jun 2026 09:08:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D9AA260051;
	Mon, 22 Jun 2026 09:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B0F1F000E9;
	Mon, 22 Jun 2026 09:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782119294;
	bh=oMLg+Sr/y5FDapu46bskmirKujQ32N1+2dZN0r1E5GY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G1B1K+pL0YgcSkF9lt16MUlpIGOSpE0OQoc0ejByA1kBy6EcYPpmvpPFyxXW3QQGd
	 XTS9JJ7Ilhxkl/7oE1Eqwjfm44/Lttayqjg1LGCnT0BDoXkzx5S6aqO397J7jwBfO4
	 GqtnM/kB5xJlj8Uft0y12T+3mj5j5lzy6gWaxb4noi6kk0yU4KYyLD5UBXfS1eC0dd
	 xXDtlemnG1rfWAtd5v0Bok/1PkbZua4Qwb428rve79Xe5kWLE3GKufXsY3iXa2hNuK
	 s/ugVOYZXOhO48oiuNPRFwm0dq9UIW2sKyeIihaeX5KpAap5diinMI3aL4VvntcfgD
	 5v0XqsW51cxxg==
Date: Mon, 22 Jun 2026 11:08:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: ricardo@pardini.net, nic_swsd@realtek.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: net: add Realtek RTL8125 PCIe
 Ethernet
Message-ID: <20260622-sympathetic-inscrutable-macaque-f3bffc@quoll>
References: <20260617-rk3588-dts-rtl-eth-describe-dt-alias-v4-0-2bd38922d129@pardini.net>
 <20260617-rk3588-dts-rtl-eth-describe-dt-alias-v4-1-2bd38922d129@pardini.net>
 <876a38f8-75ea-4b32-bb65-216cb3adb436@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <876a38f8-75ea-4b32-bb65-216cb3adb436@gmail.com>
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

On Wed, Jun 17, 2026 at 06:43:42PM +0200, Heiner Kallweit wrote:
> On 17.06.2026 14:58, Ricardo Pardini via B4 Relay wrote:
> > From: Ricardo Pardini <ricardo@pardini.net>
> > 
> > Add a binding for fixed/soldered Realtek RTL8125 PCIe Ethernet
> > controller.
> > 
> > The "pciVVVV,DDDD" compatibles are the Open Firmware PCI Bus Binding
> > spelling, auto-derived from PCI-SIG vendor/device IDs, but they still
> > need a binding when used in a board DT - analogous to "usbVVVV,PPPP"

Ricardo,

No, they do not need. They are already documented, they already have a
binding, see: dtschema/schemas/pci/pci-device.yaml


> > compatibles documented in their own bindings (e.g. microchip,lan95xx)
> > so board DTs attaching properties (fixed MAC, nvmem cell, ...) to
> > these PCI function nodes can be validated.
> > 
> > Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
> > ---
> >  .../devicetree/bindings/net/realtek,rtl8125.yaml   | 43 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  1 +
> >  2 files changed, 44 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/realtek,rtl8125.yaml b/Documentation/devicetree/bindings/net/realtek,rtl8125.yaml
> > new file mode 100644
> > index 0000000000000..eee13fbc1e6a6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/realtek,rtl8125.yaml
> > @@ -0,0 +1,43 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/realtek,rtl8125.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Realtek RTL8125 2.5 Gigabit PCIe Ethernet Controller
> > +
> > +maintainers:
> > +  - Heiner Kallweit <hkallweit1@gmail.com>
> > +
> > +description:
> > +  The Realtek RTL8125 is a 2.5GBASE-T Ethernet controller with a PCIe host
> > +  interface.
> > +
> > +allOf:
> > +  - $ref: ethernet-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: pci10ec,8125
> 
> IIRC we came to the conclusion that the compatible string isn't used in the
> relevant code path. Then why add it here? Is there an alignment on this?

Heiner, it is used - in the DTS.

> If it should be added here, then an explaining comment would be helpful.

Commit msg should explain that.  The compatible is used, so it
must be documented and in fact already is, so you need to specify them
ONLY if device nodes have some other properties, like being an ethernet
controller.

I assume that this is the case here, although that should be mentioned
in the commit msg.

Best regards,
Krzysztof


