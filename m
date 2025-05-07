Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B257C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 09:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmva2hbhvC5kHdTsovChRhyzDOJAj/hblGVnGQyC4VQ=; b=tcXU9knt8CBMk2U5nhSkseGZH0
	Tex7nVfs4s98z0zEPQR1nifiUrib4yU9lc1VbwUARbgIxe8JrETiBwTnuHutxabPfPrmzD4LDT5OL
	F/oTcjPaXCVgmLfGx02jWZO2fdOXBGUc+k6Deh2HAXa+PhDf97Z9swohOMfuJi+HR5rFc6V5pettj
	oZk2LIDXH9OgjxBPYzeRgbMBsicPFM2H24NwL4IMOhHykO8hw618kHqnLMeFihRYnNLVDXImXW84g
	1JO3ro9TiOP/kxLoJKG6ai6jubAAH4kqZqB12Pg1S+5O/xzkULjx11rIBgoVJyha/mxuoQhSz/OnD
	xBmklofA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCb59-0000000Exfx-1ioq;
	Wed, 07 May 2025 09:28:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCaFi-0000000Em7a-3Ivc
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 07 May 2025 08:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bmva2hbhvC5kHdTsovChRhyzDOJAj/hblGVnGQyC4VQ=; b=NiACPLxzIae1o8vG9fPB4NyXmE
	QEEubmQPFkaML2jM/rjfk1Ncq9otBcYKbMv2MsjlbEMYZK80TLnCYbMuVaB8nqSquV3HIvtuo3Z1p
	pU2PjVcWmC61GIDLOuBsGi6pcDAiRSAuWXVY4gk6B27dB/K+b1uCvGAP8ZrPAT1pb14qf+3Wx+uRi
	AEV7nkJD0ozbW261hANaYHeJW/RXPVUTiiabQyRwt+ZoZ3WIsyGYINAhsJl5Uge4eM4f86flKg5dI
	Weq0HQrE03Qt5rxneCS9STHnBFoclI+y/ZwIUXfA6ZTraWCJVyVgbtP/6qGANLCZjGQoGaRdX24OY
	APJnOtmA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCaFU-0000000FoOn-10Sr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 08:35:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2284844FC1;
	Wed,  7 May 2025 08:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14244C4CEEB;
	Wed,  7 May 2025 08:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746606923;
	bh=ezSMwP78jgvQr4kd01B2ANtpKsRsHw0sxOHPCFX5u8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=he+WdVR0pGxJJ346lHYmUZEFHWPogbIs2RqMo1sHw7j7DmO4t8Dcbi6UAxxA4HQl2
	 wztsDP5NUNYyn/JCQIG6SEEWQZyBSsnP8Re7FnQ9oujO64AbYa0Q0XLpNNu20/miFM
	 7uhid14WFQ0yHEpT34p1VEc1+mT33t9I1HFrKsNvzyUIuyjwqRUaCRp98tiUklEUpw
	 julw9+PHGk1XITvJ8Fnan0v2CktlfhqRkvTsGjgUFLEH4QTF3DSHymTGvDXiEZWjkK
	 wkQ9Laz/ZGh9ppFTUqXOEXBwQCfeRDHZmqpiAGZ9AseLKUffj4EeLjvf8dBtdfnkSO
	 oKOF1JFRvh8FQ==
Date: Wed, 7 May 2025 10:35:16 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 01/25] dt-bindings: interrupt-controller: Add Arm GICv5
Message-ID: <aBsbRLmjylZrzv9h@lpieralisi>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-1-6edd5a92fd09@kernel.org>
 <CAL_JsqK1mTrj4tG_D3sjXdE_jbpHG_o79ReDpZNCH44wXiBj2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqK1mTrj4tG_D3sjXdE_jbpHG_o79ReDpZNCH44wXiBj2g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_093528_817707_5806C92C 
X-CRM114-Status: GOOD (  36.89  )
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

On Tue, May 06, 2025 at 02:08:00PM -0500, Rob Herring wrote:
> On Tue, May 6, 2025 at 7:24 AM Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> >
> > The GICv5 interrupt controller architecture is composed of:
> >
> > - one or more Interrupt Routing Service (IRS)
> > - zero or more Interrupt Translation Service (ITS)
> > - zero or more Interrupt Wire Bridge (IWB)
> >
> > Describe a GICv5 implementation by specifying a top level node
> > corresponding to the GICv5 system component.
> >
> > IRS nodes are added as GICv5 system component children.
> >
> > An ITS is associated with an IRS so ITS nodes are described
> > as IRS children - use the hierarchy explicitly in the device
> > tree to define the association.
> >
> > IWB nodes are described as a separate schema.
> >
> > An IWB is connected to a single ITS, the connection is made explicit
> > through the msi-parent property and therefore is not required to be
> > explicit through a parent-child relationship in the device tree.
> >
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > ---
> >  .../interrupt-controller/arm,gic-v5-iwb.yaml       |  76 ++++++++
> >  .../bindings/interrupt-controller/arm,gic-v5.yaml  | 196 +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 +
> >  3 files changed, 279 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..b3eb89567b3457e91b93588d7db1cef69b6b9813
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml
> > @@ -0,0 +1,76 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v5-iwb.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ARM Generic Interrupt Controller, version 5 Interrupt Wire Bridge (IWB)
> > +
> > +maintainers:
> > +  - Lorenzo Pieralisi <lpieralisi@kernel.org>
> > +  - Marc Zyngier <maz@kernel.org>
> > +
> > +description: |
> > +  The GICv5 architecture defines the guidelines to implement GICv5
> > +  compliant interrupt controllers for AArch64 systems.
> > +
> > +  The GICv5 specification can be found at
> > +  https://developer.arm.com/documentation/aes0070
> > +
> > +  GICv5 has zero or more Interrupt Wire Bridges (IWB) that are responsible
> > +  for translating wire signals into interrupt messages to the GICv5 ITS.
> > +
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: arm,gic-v5-iwb
> > +
> > +  interrupt-controller: true
> 
> Move next to #interrupt-cells

I will move it below #interrupt-cells (ie alphabetical order ignoring
'#'), is that OK (it is a bit counterintuitive, that's why I am asking) ?

Same goes for msi-controller after #msi-cells.

> > +
> > +  "#address-cells":
> > +    const: 0
> > +
> > +  "#interrupt-cells":
> > +    description: |
> > +      The 1st cell corresponds to the IWB wire.
> > +
> > +      The 2nd cell is the flags, encoded as follows:
> > +      bits[3:0] trigger type and level flags.
> > +
> > +      1 = low-to-high edge triggered
> > +      2 = high-to-low edge triggered
> > +      4 = active high level-sensitive
> > +      8 = active low level-sensitive
> > +
> > +    const: 2
> > +
> > +  reg:
> 
> Generally, the order is compatible, reg, common properties, vendor
> properties, child nodes. Related properties grouped together and
> alphabetical order (ignoring '#') within common and vendor properties.

Updated, noted.

> > +    items:
> > +      - description: IWB control frame
> > +
> > +  msi-parent:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - msi-parent
> 
> interrupt-controller and #interrupt-cells should be required

Done.

> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    interrupt-controller@2f000000 {
> > +      compatible = "arm,gic-v5-iwb";
> > +      #address-cells = <0>;
> > +
> > +      interrupt-controller;
> > +      #interrupt-cells = <2>;
> > +
> > +      reg = <0x2f000000 0x10000>;
> 
> Use the same order as the schema.

Done.

> 
> > +
> > +      msi-parent = <&its0 64>;
> > +    };
> > +...
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..1ba0a2088e6d15bacae22c9fc9eebc4ce5c51b0b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
> > @@ -0,0 +1,196 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v5.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ARM Generic Interrupt Controller, version 5
> > +
> > +maintainers:
> > +  - Lorenzo Pieralisi <lpieralisi@kernel.org>
> > +  - Marc Zyngier <maz@kernel.org>
> > +
> > +description: |
> > +  The GICv5 architecture defines the guidelines to implement GICv5
> > +  compliant interrupt controllers for AArch64 systems.
> > +
> > +  The GICv5 specification can be found at
> > +  https://developer.arm.com/documentation/aes0070
> > +
> > +  The GICv5 architecture is composed of multiple components:
> > +    - one or more IRS (Interrupt Routing Service)
> > +    - zero or more ITS (Interrupt Translation Service)
> > +
> > +  The architecture defines:
> > +    - PE-Private Peripheral Interrupts (PPI)
> > +    - Shared Peripheral Interrupts (SPI)
> > +    - Logical Peripheral Interrupts (LPI)
> > +
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: arm,gic-v5
> > +
> > +  interrupt-controller: true
> > +
> > +  "#address-cells":
> > +    enum: [ 1, 2 ]
> > +
> > +  "#size-cells":
> > +    enum: [ 1, 2 ]
> > +
> > +  ranges: true
> > +
> > +  "#interrupt-cells":
> > +    description: |
> > +      The 1st cell corresponds to the INTID.Type field in the INTID; 1 for PPI,
> > +      3 for SPI. LPI interrupts must not be described in the bindings since
> > +      they are allocated dynamically by the software component managing them.
> > +
> > +      The 2nd cell contains the interrupt INTID.ID field.
> > +
> > +      The 3rd cell is the flags, encoded as follows:
> > +      bits[3:0] trigger type and level flags.
> > +
> > +        1 = low-to-high edge triggered
> > +        2 = high-to-low edge triggered
> > +        4 = active high level-sensitive
> > +        8 = active low level-sensitive
> > +
> > +    const: 3
> > +
> > +  interrupts:
> > +    description:
> > +      The VGIC maintenance interrupt.
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> 
> If you always have an IRS which you say there is, then #address-cells,
> #size-cells, and ranges are required. And interrupt-controller and
> #interrupt-cells.

Right, done.

> > +
> > +patternProperties:
> > +  "^irs@[0-9a-f]+$":
> > +    type: object
> > +    description:
> > +      GICv5 has one or more Interrupt Routing Services (IRS) that are
> > +      responsible for handling IRQ state and routing.
> > +
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: arm,gic-v5-irs
> > +
> > +      "#address-cells":
> > +        enum: [ 1, 2 ]
> > +
> > +      "#size-cells":
> > +        enum: [ 1, 2 ]
> > +
> > +      ranges: true
> > +
> > +      dma-noncoherent:
> > +        description:
> > +          Present if the GIC IRS permits programming shareability and
> > +          cacheability attributes but is connected to a non-coherent
> > +          downstream interconnect.
> > +
> > +      reg:
> 
> Move after compatible

Done.

> > +        minItems: 1
> > +        items:
> > +          - description: IRS control frame
> > +          - description: IRS setlpi frame
> > +
> > +      cpus:
> > +        description:
> > +          CPUs managed by the IRS.
> > +
> > +      arm,iaffids:
> > +        $ref: /schemas/types.yaml#/definitions/uint16-array
> > +        description:
> > +          Interrupt AFFinity ID (IAFFID) associated with the CPU whose
> > +          CPU node phandle is at the same index in the cpus array.
> > +
> > +    patternProperties:
> > +      "^msi-controller@[0-9a-f]+$":
> > +        type: object
> > +        description:
> > +          GICv5 has zero or more Interrupt Translation Services (ITS) that are
> > +          used to route Message Signalled Interrupts (MSI) to the CPUs. Each
> > +          ITS is connected to an IRS.
> > +        additionalProperties: false
> > +
> > +        properties:
> > +          compatible:
> > +            const: arm,gic-v5-its
> > +
> > +          dma-noncoherent:
> > +            description:
> > +              Present if the GIC ITS permits programming shareability and
> > +              cacheability attributes but is connected to a non-coherent
> > +              downstream interconnect.
> > +
> > +          msi-controller: true
> > +
> > +          "#msi-cells":
> > +            description:
> > +              The single msi-cell is the DeviceID of the device which will
> > +              generate the MSI.
> > +            const: 1
> > +
> > +          reg:
> 
> Move after compatible.

Done.

> > +            items:
> > +              - description: ITS control frame
> > +              - description: ITS translate frame
> > +
> > +        required:
> > +          - compatible
> > +          - msi-controller
> > +          - "#msi-cells"
> > +          - reg
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +      - cpus
> > +      - arm,iaffids
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    interrupt-controller {
> > +      compatible = "arm,gic-v5";
> > +      #interrupt-cells = <3>;
> > +      #address-cells = <1>;
> > +      #size-cells = <1>;
> > +      ranges;
> > +
> > +      interrupt-controller;
> > +
> > +      interrupts = <1 25 4>;
> > +
> > +      irs@2f1a0000 {
> > +        compatible = "arm,gic-v5-irs";
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges;
> > +
> > +        reg = <0x2f1a0000 0x10000>;  // IRS_CONFIG_FRAME for NS
> > +
> > +        arm,iaffids = /bits/ 16 <0 1 2 3 4 5 6 7>;
> > +        cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>, <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> > +
> > +        msi-controller@2f120000 {
> > +          compatible = "arm,gic-v5-its";
> > +
> > +          msi-controller;
> > +          #msi-cells = <1>;
> > +
> > +          reg = <0x2f120000 0x10000    // ITS_CONFIG_FRAME for NS
> 
> Enclose each entry in <>'s.

Done.

Thanks a lot,
Lorenzo

> > +                 0x2f130000 0x10000>;  // ITS_TRANSLATE_FRAME
> > +        };
> > +      };
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 96b82704950184bd71623ff41fc4df31e4c7fe87..1902291c3cccc06d27c5f79123e67774cf9a0e43 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1901,6 +1901,13 @@ F:       drivers/irqchip/irq-gic*.[ch]
> >  F:     include/linux/irqchip/arm-gic*.h
> >  F:     include/linux/irqchip/arm-vgic-info.h
> >
> > +ARM GENERIC INTERRUPT CONTROLLER V5 DRIVERS
> > +M:     Lorenzo Pieralisi <lpieralisi@kernel.org>
> > +M:     Marc Zyngier <maz@kernel.org>
> > +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > +S:     Maintained
> > +F:     Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5*.yaml
> > +
> >  ARM HDLCD DRM DRIVER
> >  M:     Liviu Dudau <liviu.dudau@arm.com>
> >  S:     Supported
> >
> > --
> > 2.48.0
> >

