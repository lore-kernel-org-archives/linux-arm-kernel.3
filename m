Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1D4C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 16:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=rQvDDRgRDbVkKEMYZ9D5CpWaVVry4GycWLkVILUUexw=; b=rtLj13UG81cC9w
	6JHnhvCKjRUMbmeFOlv6UMoPeVdk9adbYKGFMHCI9xvHwPl9X2Pir9H7nkuh4Y/0cuNFchJURClAQ
	H5LxG+xqP/Z54+UbtUVYJuQxLms5n2Z8GEPaiNGN75pHYviXD8KSKub3kCAFLagBDmIx74SLeWNmH
	FLMyGqleNAYZhPM3plKN5rSLT/otLe0clETmMKCrnOvWaExUPNBBgemyojr9m4N7jO2ycMG3sNcTF
	d4nEF4ACz6t79Tn+e7AoipteFHKNOia+En/y0j2yKwQTMcqE1D6eRsj2OpMBb9Lo7XttEKueJydQC
	DOFpERMJkSqKxf0s6JDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPug-00000003JQc-3pUN;
	Fri, 08 Aug 2025 16:25:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPs8-00000003JGF-0FCa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 16:23:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D99B43C34;
	Fri,  8 Aug 2025 16:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D68CC4CEED;
	Fri,  8 Aug 2025 16:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754670191;
	bh=iBBShj+kZsRTtO2PKybZxG3EHNwRqduCpGMyk73b6/w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=XF90Y6YBtOHMrMWFtvVMPMjrlIPH9OCiu6I9jwKmgiryJUklB6n5n8haO86ChYETg
	 RVFT/dCEyS81iOEmaT1bbvHuoVoAQwPvB6ZTq01EjUqsS+bo6NJqW9UIXKZzSBLFRj
	 ox6jVPQXTDNBSIvLu5DwlghT6Cny8OM2oRx6d1tupOrQzu2tk7yIKFaKSj0Kg9UKMR
	 A8aT9qSq4O6MOJ/v/AQtxiJCxeeJMi9Dat4G6XW6okDfrDzz5hFtMSeU+rDhRYvV8u
	 HnzdeOa7Z6uLpU17/SsIGmVwrGXc+bqcxXLlW32JGqqAI9Nf7OeQtJF8Pi9p5cVAFG
	 JWtWOvr5V8lzQ==
Date: Fri, 8 Aug 2025 11:23:09 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	catalin.marinas@arm.com, will@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de, lizhi.hou@amd.com,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v3 4/9] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add
 documentation for the PCIe IP on Renesas RZ/G3S
Message-ID: <20250808162309.GA91528@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71d109a1-211a-45ee-8525-03f1859b789a@tuxon.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_092312_140162_F39FDBAA 
X-CRM114-Status: GOOD (  32.40  )
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

On Fri, Aug 08, 2025 at 02:25:42PM +0300, Claudiu Beznea wrote:
> On 08.07.2025 19:34, Bjorn Helgaas wrote:
> > On Fri, Jul 04, 2025 at 07:14:04PM +0300, Claudiu wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
> >> Base Specification 4.0. It is designed for root complex applications and
> >> features a single-lane (x1) implementation. Add documentation for it.
> > 
> >> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml

> >> +        pcie@11e40000 {
> >> +            compatible = "renesas,r9a08g045s33-pcie";
> >> +            reg = <0 0x11e40000 0 0x10000>;
> >> +            ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>;
> >> +            dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0 0x38000000>;
> >> +            bus-range = <0x0 0xff>;
> ...

> >> +            device_type = "pci";
> >> +            num-lanes = <1>;
> >> +            #address-cells = <3>;
> >> +            #size-cells = <2>;
> >> +            power-domains = <&cpg>;
> >> +            vendor-id = <0x1912>;
> >> +            device-id = <0x0033>;
> > 
> > Some of this is specific to a Root Port, not to the Root Complex
> > as a whole.  E.g., device-type = "pci", num-lanes, vendor-id,
> > device-id, are Root Port properties.  Some of the resets, clocks,
> > and interrupts might be as well.
> > 
> > I really want to separate those out because even though this
> > particular version of this PCIe controller only supports a single
> > Root Port, there are other controllers (and possibly future
> > iterations of this controller) that support multiple Root Ports,
> > and it makes maintenance easier if the DT bindings and the driver
> > structures are similar.
> 
> I'll ask the Renesas HW team about the resets and clocks as the HW
> manual don't offer any information about this.
> 
> If they will confirm some of the clocks and/or resets could be
> controlled as part of a port then patch 3/9 "PCI: of_property:
> Restore the arguments of the next level parent" in this series will
> not be needed anymore. Would you prefer me to abandon it or post it
> as individual patch, if any?

[PATCH v3 3/9] ("PCI: of_property: Restore the arguments of the next
level parent") isn't specific to Renesas RZ/G3S and it doesn't look
like it has anything to do with clocks or resets.  I don't understand
the patch well enough to know whether you should keep it, but it does
look like you should post it separate from the RZ/G3S driver.

When the devicetree contains required information specific to Root
Ports, I would prefer that to be in a separate "pcie@x,y" stanza, even
if there are clocks or resets that apply to all Root Ports.

"num-lanes" is obviously specific to an individual Root Port because
a Root Complex doesn't have lanes at all.  But in the case of RZ/G3S,
I'm not sure "num-lanes" is required in the devicetree; I don't see it
being used in the driver.  If it's not needed, I would just omit it.

It looks like the driver *does* need "vendor-id" and "device-id"
though, and those also are specific to a Root Port because a Root
Complex is not a PCI device and doesn't have its own Vendor or Device
ID.  So I would like them to be in a per-Root Port stanza.  If there
are resets or clocks that affect a Root Port but not the Root Complex
as a whole, they should also be in the Root Port stanza.

Bjorn

