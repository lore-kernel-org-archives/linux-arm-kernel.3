Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464E3CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 11:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnqvGc+4oxvsAo4vpsfB5qJ9LgPGlvqTeEXhNVA3Qic=; b=TEDkeow8YdNl8DX5cAFC/0WB3g
	Z1teaPex9NqVkD3uTvC/WtkUsH/jcnaPo5TlUwJno0Nj/84UcG2itIu6Nw3yUnzOupqspA+eJ7NAK
	MQZAO1luZGiz2ow9nFbzXciFnjl463cpJZI3jtW19k2gpl8ln3+FsjsiKHFmHTbqPpScAKo3Ck2OQ
	jrXUnZpdmLJEwDegAZ4MDJzk5oogE2xUTeBZ7u88CV5aYSYoCto+TTrhpK7mgE+VZm61vle64aTmf
	3UKnv7EHXfMIwINwnhFe6/wM8XfcNthpAnca232T0kJDMUnHfN08Y0elvBz1ONmsV0ifYGPDRdSlP
	hA0z+1uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGc5E-0000000DZAc-1pg1;
	Wed, 05 Nov 2025 11:53:48 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGc5A-0000000DZA6-1zVg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 11:53:47 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 8ACB81F842;
	Wed,  5 Nov 2025 12:53:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1762343620;
	bh=vnqvGc+4oxvsAo4vpsfB5qJ9LgPGlvqTeEXhNVA3Qic=; h=From:To:Subject;
	b=E7zAGcEWWCWYZk10rtdcs0QgeKlZ2aO22Kii8vds9mlhOFV0kKDM/NCGRDplPWG/p
	 Kfylurev+v1DjGgkKD7OvHMnIaZgsTE3IoBBjXfEOwHmhAxDWikX2T861e3O73Hlyy
	 4jxs4+ZhdFZjUEhYpTzVIHZKHBN+pBugSksiVxxWhVp3Pe2uXCu8/UmfrdikRrbAYL
	 Ajn0vNcipQyRmrM2xCMP/6R8PZWrU8+pOGpaD9570/y6KN/XHiJeMDkEaGAhl9zeqG
	 nCjQJF+PEjFWlcQ/ci5jmRhlDEQZ2AmcV0iZVt016d9cZov1vBcfkhG/wAX+1x0SJk
	 PvR//ri0412PA==
Date: Wed, 5 Nov 2025 12:53:35 +0100
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
Message-ID: <20251105115335.GA14157@francesco-nb>
References: <20251104144915.60445-1-francesco@dolcini.it>
 <20251104145240.61219-1-francesco@dolcini.it>
 <20251104145240.61219-2-francesco@dolcini.it>
 <d77bf3dd-4501-4f17-a776-3353f96f4fb1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d77bf3dd-4501-4f17-a776-3353f96f4fb1@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_035345_616553_A680E084 
X-CRM114-Status: GOOD (  25.15  )
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
thanks for the review

On Tue, Nov 04, 2025 at 11:41:54AM -0600, Andrew Davis wrote:
> On 11/4/25 8:52 AM, Francesco Dolcini wrote:
> > From: Parth Pancholi <parth.pancholi@toradex.com>
> > 
> > Add support for the Toradex Aquila AM69 and its Development Carrier
> > Board.
> > 
> > The Aquila AM69 SoM is based on the TI AM69 SoC from the Jacinto 7
> > family and is designed for high-end embedded computing, featuring up to
> > 32GB of LPDDR4 and 256GB eMMC storage, extensive multimedia support (3x
> > Quad CSI, 2x Quad DSI, DisplayPort, 5x Audio I2S/TDM), six Ethernet
> > interfaces (1x 1G, 4x 2.5G SGMII, 1x 10G), USB 3.2 Host/DRD support, and
> > a Wi-Fi 7/BT 5.3 module, alongside an RX8130 RTC, I2C EEPROM and
> > Temperature Sensor, and optional TPM 2.0 module.
> > 
> > Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/ti-am69
> > Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
> > Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
> > Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > Co-developed-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > Co-developed-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> > Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> > Co-developed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >   arch/arm64/boot/dts/ti/Makefile               |    1 +
> >   arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts |  576 ++++++
> >   arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi    | 1840 +++++++++++++++++
> >   3 files changed, 2417 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
> >   create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> > index 361248dcfff4..6ce652fe98fa 100644
> > --- a/arch/arm64/boot/dts/ti/Makefile
> > +++ b/arch/arm64/boot/dts/ti/Makefile
> > @@ -153,6 +153,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
> >   dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
> >   # Boards with J784s4 SoC
> > +dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
> >   dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
> >   dtb-$(CONFIG_ARCH_K3) += k3-am69-sk-pcie0-ep.dtbo
> >   dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
> > diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts b/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
> > new file mode 100644
> > index 000000000000..c7ce804eac70
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
> > @@ -0,0 +1,576 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> > +/*
> > + * Copyright (C) 2025 Toradex
> > + *
> > + * https://www.toradex.com/computer-on-modules/aquila-arm-family/ti-am69
> > + * https://www.toradex.com/products/carrier-board/aquila-development-board-kit
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/pwm/pwm.h>
> > +#include "k3-am69-aquila.dtsi"
> > +
> 
> [...]
> 
> > +/* Aquila SPI_2 */
> > +&main_spi0 {
> > +	status = "okay";
> > +};
> > +
> > +/* Aquila SPI_1 */
> > +&main_spi2 {
> > +	status = "okay";
> 
> Why enable this with nothing connected to it?

It's a development carrier board, the SPI pins go to a pins header,
accessible to the user, where anything can be hooked up for
prototyping/testing.

One use case would be to just bind this in userspace to spidev for some
prototyping/testing. 


> [...]
> 
> > +/* Aquila SPI_1 */
> > +&main_spi2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_main_spi2>, <&pinctrl_main_spi2_cs0>;
> > +	status = "disabled";
> 
> This is already disabled by default in the SoC dtsi file.

Yes, known. Is this an issue? 

This node must be disabled, no matter what is present in any included
dtsi file, it's a deliberate decision.

This dtsi file describes a SoM, the used pins/functions are defined on
the pinout, but this node cannot be enabled unless the SoM is mated with
a carrier board that is exposing it.

Francesco


