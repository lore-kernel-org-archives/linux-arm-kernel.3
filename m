Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2106C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 22:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z70q0FXzZtoWgRFvpJwCO1rHRDI4m+9/853qMQfksoU=; b=BrsTnQToWrcyPp4G0c9J8dA5X+
	z2aqt7Li9WP3cnOQ+jfwhW0Rcx/Cc2xAWZrY7MgaDeZB5LJShQp5Y+peIvpBK+cFYLXEa+V+uI8bO
	JnIYNbabVMz0h9jr7xR5wbpambF/mHLux2FrK2ppsOeIeOAW7swPvX7aVSuM9/8lHWo/EKK/jdYxx
	rH4RmSMscKriLMA+1WXPSVwjqvJ/b/gv7+e4haqBpTpDNqiLuWBUh3ri4Xi/G8lPRCmxDNxzxE6Ph
	4k5u4BNJ4tEgfZRT3Dv7VCOOPzZW3oGYf2th38osMRtdr2gTrPmUvlch7wPX+q0EFPLprWJvlRd/+
	mG4cMUyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDWAD-000000053uR-2x0G;
	Fri, 09 May 2025 22:25:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDW89-000000053pK-134R;
	Fri, 09 May 2025 22:23:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 85443A4D4CD;
	Fri,  9 May 2025 22:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8024C4CEE4;
	Fri,  9 May 2025 22:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746829424;
	bh=gkF1iBmfa995sCmBCk6c8+T9mHJSG8t8B52ptEzcenk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RfbLc/W7nKx3W2LvZGCaQB6YYlS1E4CYO26pTc4H/SxQyJMmEgAzLBVu8/uJu4Eof
	 XjlFXdPu6LIuGrDhPTdjAVHseeYh0CTNg7/FA548wEmz6jnIelPfd2LE3GKe24OjPe
	 iyqFxz6/kj71MouugcJn5tcXScw6ftYrYZz9lDHyZcoXrxFpZq+cY65ceXU3z6P3zV
	 cycXS/HhbC5GditcgtcYBhy/ziiADbP6B7KlhN9YToWK68+uaiyDn/C/YWjzoXXBNK
	 srIq2MhmR/jWed+160wyl6NwJFyG9KFh5FTG8wDe4LibRh+SMV5P+kYq1LKo2cnDZi
	 eFshsbC8wUZCw==
Date: Fri, 9 May 2025 17:23:42 -0500
From: Rob Herring <robh@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 brcm,bcm2835-armctrl-ic to DT schema
Message-ID: <20250509222342.GA85203-robh@kernel.org>
References: <20250505144618.1287539-1-robh@kernel.org>
 <ee082ba2-d452-43a1-bb94-3c04c407ea31@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee082ba2-d452-43a1-bb94-3c04c407ea31@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_152345_422307_6B75E8C6 
X-CRM114-Status: GOOD (  31.73  )
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

On Mon, May 05, 2025 at 06:03:29PM +0200, Stefan Wahren wrote:
> Hi Rob,
> 
> Am 05.05.25 um 16:46 schrieb Rob Herring (Arm):
> > Convert the Broadcom BCM2835 ARMCTRL interrupt controller binding to
> > schema format. It's a straight-forward conversion of the typical
> > interrupt controller.
> i send a similiar patch on May 2nd:
> https://lore.kernel.org/linux-devicetree/20250502105213.39864-1-wahrenst@gmx.net/
> 
> I would prefer your version, but ...
> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >   .../brcm,bcm2835-armctrl-ic.txt               | 131 --------------
> >   .../brcm,bcm2835-armctrl-ic.yaml              | 161 ++++++++++++++++++
> >   2 files changed, 161 insertions(+), 131 deletions(-)
> >   delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
> >   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
> > deleted file mode 100644
> > index bdd173056f72..000000000000
> > --- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
> > +++ /dev/null
> > @@ -1,131 +0,0 @@
> > -BCM2835 Top-Level ("ARMCTRL") Interrupt Controller
> > -
> > -The BCM2835 contains a custom top-level interrupt controller, which supports
> > -72 interrupt sources using a 2-level register scheme. The interrupt
> > -controller, or the HW block containing it, is referred to occasionally
> > -as "armctrl" in the SoC documentation, hence naming of this binding.
> > -
> > -The BCM2836 contains the same interrupt controller with the same
> > -interrupts, but the per-CPU interrupt controller is the root, and an
> > -interrupt there indicates that the ARMCTRL has an interrupt to handle.
> > -
> > -Required properties:
> > -
> > -- compatible : should be "brcm,bcm2835-armctrl-ic" or
> > -                 "brcm,bcm2836-armctrl-ic"
> > -- reg : Specifies base physical address and size of the registers.
> > -- interrupt-controller : Identifies the node as an interrupt controller
> > -- #interrupt-cells : Specifies the number of cells needed to encode an
> > -  interrupt source. The value shall be 2.
> > -
> > -  The 1st cell is the interrupt bank; 0 for interrupts in the "IRQ basic
> > -  pending" register, or 1/2 respectively for interrupts in the "IRQ pending
> > -  1/2" register.
> > -
> > -  The 2nd cell contains the interrupt number within the bank. Valid values
> > -  are 0..7 for bank 0, and 0..31 for bank 1.
> > -
> > -Additional required properties for brcm,bcm2836-armctrl-ic:
> > -- interrupts : Specifies the interrupt on the parent for this interrupt
> > -  controller to handle.
> > -
> > -The interrupt sources are as follows:
> > -
> > -Bank 0:
> > -0: ARM_TIMER
> > -1: ARM_MAILBOX
> > -2: ARM_DOORBELL_0
> > -3: ARM_DOORBELL_1
> > -4: VPU0_HALTED
> > -5: VPU1_HALTED
> > -6: ILLEGAL_TYPE0
> > -7: ILLEGAL_TYPE1
> > -
> > -Bank 1:
> > -0: TIMER0
> > -1: TIMER1
> > -2: TIMER2
> > -3: TIMER3
> > -4: CODEC0
> > -5: CODEC1
> > -6: CODEC2
> > -7: VC_JPEG
> > -8: ISP
> > -9: VC_USB
> > -10: VC_3D
> > -11: TRANSPOSER
> > -12: MULTICORESYNC0
> > -13: MULTICORESYNC1
> > -14: MULTICORESYNC2
> > -15: MULTICORESYNC3
> > -16: DMA0
> > -17: DMA1
> > -18: VC_DMA2
> > -19: VC_DMA3
> > -20: DMA4
> > -21: DMA5
> > -22: DMA6
> > -23: DMA7
> > -24: DMA8
> > -25: DMA9
> > -26: DMA10
> > -27: DMA11-14 - shared interrupt for DMA 11 to 14
> > -28: DMAALL - triggers on all dma interrupts (including channel 15)
> > -29: AUX
> > -30: ARM
> > -31: VPUDMA
> > -
> > -Bank 2:
> > -0: HOSTPORT
> > -1: VIDEOSCALER
> > -2: CCP2TX
> > -3: SDC
> > -4: DSI0
> > -5: AVE
> > -6: CAM0
> > -7: CAM1
> > -8: HDMI0
> > -9: HDMI1
> > -10: PIXELVALVE1
> > -11: I2CSPISLV
> > -12: DSI1
> > -13: PWA0
> > -14: PWA1
> > -15: CPR
> > -16: SMI
> > -17: GPIO0
> > -18: GPIO1
> > -19: GPIO2
> > -20: GPIO3
> > -21: VC_I2C
> > -22: VC_SPI
> > -23: VC_I2SPCM
> > -24: VC_SDIO
> > -25: VC_UART
> > -26: SLIMBUS
> > -27: VEC
> > -28: CPG
> > -29: RNG
> > -30: VC_ARASANSDIO
> > -31: AVSPMON
> > -
> > -Example:
> > -
> > -/* BCM2835, first level */
> > -intc: interrupt-controller {
> > -	compatible = "brcm,bcm2835-armctrl-ic";
> > -	reg = <0x7e00b200 0x200>;
> > -	interrupt-controller;
> > -	#interrupt-cells = <2>;
> > -};
> > -
> > -/* BCM2836, second level */
> > -intc: interrupt-controller {
> > -	compatible = "brcm,bcm2836-armctrl-ic";
> > -	reg = <0x7e00b200 0x200>;
> > -	interrupt-controller;
> > -	#interrupt-cells = <2>;
> > -
> > -	interrupt-parent = <&local_intc>;
> > -	interrupts = <8>;
> > -};
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.yaml b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.yaml
> > new file mode 100644
> > index 000000000000..4edc4c3ff6bd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.yaml
> > @@ -0,0 +1,161 @@
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2835-armctrl-ic.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: BCM2835 ARMCTRL Interrupt Controller
> > +
> > +maintainers:
> > +  - Florian Fainelli <florian.fainelli@broadcom.com>
> I would suggest to add
> 
> - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>

Ok, added.

> > +
> > +description: >
> > +  The BCM2835 contains a custom top-level interrupt controller, which supports
> > +  72 interrupt sources using a 2-level register scheme. The interrupt
> > +  controller, or the HW block containing it, is referred to occasionally as
> > +  "armctrl" in the SoC documentation, hence naming of this binding.
> > +
> > +  The BCM2836 contains the same interrupt controller with the same interrupts,
> > +  but the per-CPU interrupt controller is the root, and an interrupt there
> > +  indicates that the ARMCTRL has an interrupt to handle.
> > +
> > +  The interrupt sources are as follows:
> > +
> > +  Bank 0:
> > +    0: ARM_TIMER
> > +    1: ARM_MAILBOX
> > +    2: ARM_DOORBELL_0
> > +    3: ARM_DOORBELL_1
> > +    4: VPU0_HALTED
> > +    5: VPU1_HALTED
> > +    6: ILLEGAL_TYPE0
> > +    7: ILLEGAL_TYPE1
> > +
> > +  Bank 1:
> > +    0: TIMER0
> > +    1: TIMER1
> > +    2: TIMER2
> > +    3: TIMER3
> > +    4: CODEC0
> > +    5: CODEC1
> > +    6: CODEC2
> > +    7: VC_JPEG
> > +    8: ISP
> > +    9: VC_USB
> > +    10: VC_3D
> > +    11: TRANSPOSER
> > +    12: MULTICORESYNC0
> > +    13: MULTICORESYNC1
> > +    14: MULTICORESYNC2
> > +    15: MULTICORESYNC3
> > +    16: DMA0
> > +    17: DMA1
> > +    18: VC_DMA2
> > +    19: VC_DMA3
> > +    20: DMA4
> > +    21: DMA5
> > +    22: DMA6
> > +    23: DMA7
> > +    24: DMA8
> > +    25: DMA9
> > +    26: DMA10
> > +    27: DMA11-14 - shared interrupt for DMA 11 to 14
> > +    28: DMAALL - triggers on all dma interrupts (including channel 15)
> > +    29: AUX
> > +    30: ARM
> > +    31: VPUDMA
> > +
> > +  Bank 2:
> > +    0: HOSTPORT
> > +    1: VIDEOSCALER
> > +    2: CCP2TX
> > +    3: SDC
> > +    4: DSI0
> > +    5: AVE
> > +    6: CAM0
> > +    7: CAM1
> > +    8: HDMI0
> > +    9: HDMI1
> > +    10: PIXELVALVE1
> > +    11: I2CSPISLV
> > +    12: DSI1
> > +    13: PWA0
> > +    14: PWA1
> > +    15: CPR
> > +    16: SMI
> > +    17: GPIO0
> > +    18: GPIO1
> > +    19: GPIO2
> > +    20: GPIO3
> > +    21: VC_I2C
> > +    22: VC_SPI
> > +    23: VC_I2SPCM
> > +    24: VC_SDIO
> > +    25: VC_UART
> > +    26: SLIMBUS
> > +    27: VEC
> > +    28: CPG
> > +    29: RNG
> > +    30: VC_ARASANSDIO
> > +    31: AVSPMON
> > +
> Don't we need something like
> 
> allOf:
>   - $ref: /schemas/interrupt-controller.yaml#
> 
> ?

No. It's not needed because you have to define the constraints here 
anyways. Really, only schemas with child nodes or that have properties 
without further constraints need the reference. It doesn't hurt to have 
it either. It just gets applied twice.

This could change though. Early on when there were not many device 
schemas, it was useful to apply interrupt-controller.yaml on all nodes 
named 'interrupt-controller', but that need has diminished.

Rob

