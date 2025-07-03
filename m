Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E4FC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 13:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcLAefjaWtvpnqF0nY+5rDVjK2M4YbMIahxbaluJ0W8=; b=XYpuHo/cNtZHj31XKszVC5yi0y
	uqbwFHjvPskfjbSbegWy3RKsT0fjKS/VfjOzLxggJu65xWRRkTp2ah5E8f1YFvMue5QcUZghBWWFo
	Ck9biADVtD+5dkPoe78sHI/FL5bNrJnLNJwOEUi5THBSRQcSxZJ6EhTejtzIg/0VLweOCU0HDQ0Py
	AFV3hXWMnx7EOIsN5EThr1oTBQH7Flr3sb0qiNwomiVraj90fvk8RMamFt0xBt14BsHrv+e3bHWxJ
	q/376/pVhxPfAUI8k+A//oWHzWJTgV2k2opuJhY11AaoE83vKevAMgsXZYJgj1mz1+v5OKWph+nCj
	c5XktoQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKRu-0000000BZH9-2agD;
	Thu, 03 Jul 2025 13:58:02 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIvG-0000000BIqv-1s7F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 12:20:16 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 563CK8BV3536857;
	Thu, 3 Jul 2025 07:20:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751545208;
	bh=mcLAefjaWtvpnqF0nY+5rDVjK2M4YbMIahxbaluJ0W8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LmyAz2btjx138BSDQqjratgAIng2wo3oScXwB1tJVLpNhdi9hpYH8um0kQ9ds86a0
	 T8O0z+IhCVCeLDV81FE4NE8CgSe73tmG5AedFSznNGsV+yJHqiqg4gOPuLp/EDR4HM
	 jB8EtMNfBsSD5q9FmN7ao7iAi+cpMUCyJW/dz03A=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 563CK8VC720996
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 3 Jul 2025 07:20:08 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 3
 Jul 2025 07:20:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 3 Jul 2025 07:20:08 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 563CK8ud815106;
	Thu, 3 Jul 2025 07:20:08 -0500
Date: Thu, 3 Jul 2025 07:20:08 -0500
From: Bryan Brattlof <bb@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <devarsht@ti.com>, <s-vadapalli@ti.com>,
        <andrew@lunn.ch>
Subject: Re: [PATCH v5 4/4] arm64: dts: ti: Add support for AM62D2-EVM
Message-ID: <20250703122008.ygz5udttjdo3l2g4@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250627115753.2246881-1-p-bhagat@ti.com>
 <20250627115753.2246881-5-p-bhagat@ti.com>
 <20250701162504.dck3763ik6kpo7ec@bryanbrattlof.com>
 <f7b0c7f0-9af1-4105-a143-103c49fe2320@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <f7b0c7f0-9af1-4105-a143-103c49fe2320@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_052014_744323_01B8EB6F 
X-CRM114-Status: GOOD (  45.98  )
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

On July  3, 2025 thus sayeth Paresh Bhagat:
> Hi Bryan,
> 
> 
> On 01/07/25 21:55, Bryan Brattlof wrote:
> > On June 27, 2025 thus sayeth Paresh Bhagat:
> > > AM62D-EVM evaluation module (EVM) is a low-cost expandable platform board
> > > designed for AM62D2 SoC from TI. It supports the following interfaces:
> > > 
> > > * 4 GB LPDDR4 RAM
> > > * x2 Gigabit Ethernet expansion connectors
> > > * x4 3.5mm TRS Audio Jack Line In
> > > * x4 3.5mm TRS Audio Jack Line Out
> > > * x2 Audio expansion connectors
> > > * x1 Type-A USB 2.0, x1 Type-C dual-role device (DRD) USB 2.0
> > > * x1 UHS-1 capable micro SD card slot
> > > * 32 GB eMMC Flash
> > > * 512 Mb OSPI NOR flash
> > > * x4 UARTs via USB 2.0-B
> > > * XDS110 for onboard JTAG debug using USB
> > > * Temperature sensors, user push buttons and LEDs
> > > 
> > > Although AM62D2 and AM62A7 differ in peripheral capabilities example
> > > multimedia, VPAC, and display subsystems, the core architecture remains
> > > same. To reduce duplication, AM62D support reuses the AM62A dtsi and the
> > > necessary overrides will be handled in SOC specific dtsi file and a
> > > board specific dts.
> > > 
> > > Add basic support for AM62D2-EVM.
> > > 
> > > Schematics Link - https://www.ti.com/lit/zip/sprcal5
> > > 
> > > Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > ---
> > >   arch/arm64/boot/dts/ti/Makefile          |   3 +
> > >   arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 599 +++++++++++++++++++++++
> > >   arch/arm64/boot/dts/ti/k3-am62d2.dtsi    |  25 +
> > >   3 files changed, 627 insertions(+)
> > >   create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
> > >   create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2.dtsi
> > > 
> > ...
> > 
> > > diff --git a/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
> > > b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
> > > new file mode 100644
> > > index 000000000000..70aeb40872a9
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
> > > @@ -0,0 +1,25 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> > > +/*
> > > + * Device Tree Source for AM62D2 SoC family in Quad core configuration
> > > + *
> > > + * TRM: https://www.ti.com/lit/pdf/sprujd4
> > > + *
> > > + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "k3-am62a7.dtsi"
> > If we want to reuse the AM62A chassis I think we should probably reused
> > the AM62AX_IOPAD() macro instead of creating a new one.
> 
> 
> AM62D does not necessarily have the same pin configuration compared to
> AM62A. While it is a macro which could be shareable across many boards, i
> think its preferable we maintain separate definitions to highlight the new
> SoCs. AM62D is a separate package, with some components reused from AM62a.

I guess I don't understand the need to create a new padconfig macro when 
we say, in device tree syntax, the AM62D and AM62A uses the same RTL 
chassis. The pinout will always change with packaging changes but this 
will not change the padconfig MMR layout.

All that said. It's just a name and honestly when you look at all these 
macros we haven't changed the padconfig layout for any K3 chip so it not 
a big deal to me. If it helps people when grepping around i'll relent ;)

> 
> 
> > 
> > > +
> > > +/ {
> > > +	model = "Texas Instruments K3 AM62D SoC";
> > > +	compatible = "ti,am62d2";
> > > +};
> > > +
> > > +&vpu {
> > > +	status = "disabled";
> > > +};
> > > +
> > > +&e5010 {
> > > +	status = "disabled";
> > > +};
> > So I could be a little out of date on the style guidelines here, but my
> > intuition is device trees, much like real trees, can only grow, so we
> > can't inherit the am62a.dtsi and remove things.
> > 
> > My understanding is we have to create a full am62d.dtsi with its
> > features that the am62a.dtsi can extend with the vpu{} and e5010{} nodes
> > 
> > ~Bryan
> 
> 
> Agree we should ideally keep the device trees extending. But in this case it
> will involve changes not only in am62a.dtsi but ideally it will change
> k3-am62a-main.dtsi and k3-am62a-mcu.dtsi as well. This moves us back to
> version 3 of this series
> https://lore.kernel.org/all/20250508091422.288876-1-p-bhagat@ti.com/ where i
> created *common*.dtsi files which looks a bit complex.
> 
> 
> The current method also ensures that customers can start their development
> of a new board with k3-am62d2.dtsi, while maintaining less complexity and is
> a easier to follow approach.

The issue I take with this approach is what does 'status = "disabled"' 
mean now. Historically (for TI SoCs at least) it indicated the node was 
incomplete and would need to be extended in the board.dts to function 
properly. But now we're trying to say for these two nodes the hardware 
doesn't exist on this SoC and bad things will happen if you enable them.

My recommendation is to try to flip this around. The am62a7.dtsi should 
inherit the am62d2.dtsi and add the vpu{} and e5010{} nodes. I agree we 
don't need to try to combine the two as we did in v3 just yet but we 
should try to keep the device trees growing as we inherit things.

~Bryan

> 
> 

