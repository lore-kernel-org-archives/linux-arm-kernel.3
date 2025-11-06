Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755D9CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=od7Lqh0ho4ogjz8Pbh+DhQWDrwuddtwph5S6ttSJvJ4=; b=ug+OcqWr+EfreWLFm3pzIrVZC2
	M6RPqdKw2DsA0+4nByf4C4K/ERpFsp1wmKD37QUARm83Ne1q22YwwxMbb5dPF2PmpU11/iYV28HJE
	cFDqI+gY8fYY1U7PFspugWK6/NSTxsGktF73/9HAhVNcw5u3x+9VqyHH2P4vcVeXi7PsVx888N3Id
	6HTEavG+mMJP7fl1tjgJEdv4vBz1SCqEyHudsFcl+Eqm3DWI231wPxLVoElOhkKPkBBcrczjTgEyH
	6ichWZhlC74/jMDcXvmk4cyUCqjOk0regD+5w68rypvMldziMRPfxgUXpj46kzdJk7xjRxEKIfMhC
	7ETFmpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGx5x-0000000FJFW-2JBP;
	Thu, 06 Nov 2025 10:19:57 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGx5t-0000000FJDo-2Tc7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:19:56 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id DA6D520617;
	Thu,  6 Nov 2025 11:19:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1762424389;
	bh=od7Lqh0ho4ogjz8Pbh+DhQWDrwuddtwph5S6ttSJvJ4=; h=From:To:Subject;
	b=ZkArOHjMhaYcnQJgMbqRGeRC00woC2pZDnIV3vcYm7+tlJN+NWZd4DI/sqSH3yjOa
	 IlkD8B6Vec/SvXyhRl1sDLXyaJ9ZuTEqrssr3I+fFBAFc90sqcMPUZDUY6/PjKpHPA
	 XcpE5/ydDd/5TZSfcR9TS7MgtncIM9OFV/xWW4jZsvpSmdKP9Vqc37rPzTf86tVP93
	 J06ADqq9TCzKT/dlm1amRaAe3cRKUPt+ZzjPHGpADD+IR5YVPOizzUXOqo04pwnxwP
	 jYKdp38WoT+o/iEu8jmNXhBZ6t/Wi0I+UeR+FYrG/7li0FFLlIMJlkXx/jNIjnD81w
	 KfM16Lu2ze3+g==
Date: Thu, 6 Nov 2025 11:19:45 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrew Davis <afd@ti.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: ti: Add Aquila AM69 Support
Message-ID: <20251106101932.GA5975@francesco-nb>
References: <20251104144915.60445-1-francesco@dolcini.it>
 <20251104145240.61219-1-francesco@dolcini.it>
 <20251104145240.61219-2-francesco@dolcini.it>
 <d77bf3dd-4501-4f17-a776-3353f96f4fb1@ti.com>
 <20251105115335.GA14157@francesco-nb>
 <7024f4b3-00a0-4618-8bf9-53e305fcc982@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7024f4b3-00a0-4618-8bf9-53e305fcc982@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_021954_683133_343DB2A8 
X-CRM114-Status: GOOD (  47.80  )
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

Hello Andrew,

On Wed, Nov 05, 2025 at 02:01:35PM -0600, Andrew Davis wrote:
> On 11/5/25 5:53 AM, Francesco Dolcini wrote:
> > On Tue, Nov 04, 2025 at 11:41:54AM -0600, Andrew Davis wrote:
> > > On 11/4/25 8:52 AM, Francesco Dolcini wrote:
> > > > From: Parth Pancholi <parth.pancholi@toradex.com>
> > > > 
> > > > Add support for the Toradex Aquila AM69 and its Development Carrier
> > > > Board.
> > > > 
> > > > The Aquila AM69 SoM is based on the TI AM69 SoC from the Jacinto 7
> > > > family and is designed for high-end embedded computing, featuring up to
> > > > 32GB of LPDDR4 and 256GB eMMC storage, extensive multimedia support (3x
> > > > Quad CSI, 2x Quad DSI, DisplayPort, 5x Audio I2S/TDM), six Ethernet
> > > > interfaces (1x 1G, 4x 2.5G SGMII, 1x 10G), USB 3.2 Host/DRD support, and
> > > > a Wi-Fi 7/BT 5.3 module, alongside an RX8130 RTC, I2C EEPROM and
> > > > Temperature Sensor, and optional TPM 2.0 module.
> > > > 
> > > > Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/ti-am69
> > > > Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
> > > > Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
> > > > Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > > > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > > > Co-developed-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > Co-developed-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> > > > Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> > > > Co-developed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > ---
> > > >    arch/arm64/boot/dts/ti/Makefile               |    1 +
> > > >    arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts |  576 ++++++
> > > >    arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi    | 1840 +++++++++++++++++
> > > >    3 files changed, 2417 insertions(+)
> > > >    create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
> > > >    create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> > > > index 361248dcfff4..6ce652fe98fa 100644
> > > > --- a/arch/arm64/boot/dts/ti/Makefile
> > > > +++ b/arch/arm64/boot/dts/ti/Makefile
> > > > @@ -153,6 +153,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
> > > >    dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
> > > >    # Boards with J784s4 SoC
> > > > +dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
> > > >    dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
> > > >    dtb-$(CONFIG_ARCH_K3) += k3-am69-sk-pcie0-ep.dtbo
> > > >    dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
> > > > diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts b/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
> > > > new file mode 100644
> > > > index 000000000000..c7ce804eac70
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
> > > > @@ -0,0 +1,576 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> > > > +/*
> > > > + * Copyright (C) 2025 Toradex
> > > > + *
> > > > + * https://www.toradex.com/computer-on-modules/aquila-arm-family/ti-am69
> > > > + * https://www.toradex.com/products/carrier-board/aquila-development-board-kit
> > > > + */
> > > > +
> > > > +/dts-v1/;
> > > > +
> > > > +#include <dt-bindings/pwm/pwm.h>
> > > > +#include "k3-am69-aquila.dtsi"
> > > > +
> > > 
> > > [...]
> > > 
> > > > +/* Aquila SPI_2 */
> > > > +&main_spi0 {
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +/* Aquila SPI_1 */
> > > > +&main_spi2 {
> > > > +	status = "okay";
> > > 
> > > Why enable this with nothing connected to it?
> > 
> > It's a development carrier board, the SPI pins go to a pins header,
> > accessible to the user, where anything can be hooked up for
> > prototyping/testing.
> > 
> 
> Sure, and when a device is attached to that pin header it will need
> described in DT with a node for that attached device and in that
> node/overlay is where you enable the nodes you make use of.
> 
> > One use case would be to just bind this in userspace to spidev for some
> > prototyping/testing.
> > 
> 
> But you are not adding a spidev node here, you are attaching nothing
> but enabling the node anyway.

The idea would be that you can bind the spidev driver from userspace,
without having to change anything in the DT. For this to be possible the
SPI node must be enabled.

My understanding is that this should be possible, and it's the suggested
way to debug/prototype anything with spidev. If my understanding is not
correct, I agree with you and there is no point in enabling this node.


> > > [...]
> > > 
> > > > +/* Aquila SPI_1 */
> > > > +&main_spi2 {
> > > > +	pinctrl-names = "default";
> > > > +	pinctrl-0 = <&pinctrl_main_spi2>, <&pinctrl_main_spi2_cs0>;
> > > > +	status = "disabled";
> > > 
> > > This is already disabled by default in the SoC dtsi file.
> > 
> > Yes, known. Is this an issue?
> > 
> > This node must be disabled, no matter what is present in any included
> > dtsi file, it's a deliberate decision.
> > 
> > This dtsi file describes a SoM, the used pins/functions are defined on
> > the pinout, but this node cannot be enabled unless the SoM is mated with
> > a carrier board that is exposing it.
> 
> Same as my point above, you shouldn't enable nodes that are not used
> or have anything attached. The SoM only has some edge connectors so
> it should not be enabled at the SoM level, that we seem to agree, but
> the carrier board doesn't connect those lines to anything either. They
> just run to a pin header with nothing attached, how is that header
> any different than the pins on the edge of the SoM?

You are commenting something unrelated here, or I am not understanding
you.

You commented that the status = "disabled" is redundant. We both agree
that this node needs to be disabled in the SoM dtsi, and it is already
like that.

I would prefer to keep the redundant "disabled", because I see value on
not having to rely on what is done on any included dtsi, where the
original node is defined. I see this as a common pattern in multiple
dts/dtsi file and is what I would prefer to have (and I do not see any
kind of maintenance  overhead on having it nor this being in conflict
with dts-coding-style.rst).

Vignesh, Nishanth, what is your expectation on this redundant
`status = "disabled"` property?
	
Francesco



> Anyway, the right spot to enable would be when you bind a device to
> the SPI, which it seems you do in overlays[0], so that would be were
> you set status = "okay" and all the pinmux info for that SPI device
> and carrier board combination.
> 
> [0] https://developer.toradex.com/torizon/os-customization/use-cases/device-tree-overlays-on-torizon/#spidev

