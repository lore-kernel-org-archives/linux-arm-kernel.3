Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B9ACF65D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2ToM7E+Qj1Z9k1fXgIslDJKNq8unuvWFbzBA+Z/HJI=; b=EQrYVcxfG35XcZ3+zpJkZ2CXQe
	1YbZiByjB1BjSa7whe8W6iMp1+cZ6u34iyeYdmVER2hN2L5eX07TdMKJuN4CdH4Z9DPrmQYjI+QNR
	1+hKgoqfaUEPW13dgmyXc9S4/0AHoFzL7iRL0/ZHgI8KJq3U0HbVhU3BDnt3LNURSzRsDoWAvkAgY
	2ZqEkrjbTJzBqHNBq4JRjpQKd9F76eUMpOHn7N59PJjnjo+OAsNEKpgsifwVfCgO+Hl8DCjP37ZfM
	TTUXsCkSVUOY0AyheS6xrzNw2Y9MgCtAPq1jxkfrc5YZRmpywSy2CBqoPf0PULcOSsf7N29PfUpQX
	J391H1gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJrX-0000000CI6E-0Hg6;
	Mon, 26 Jan 2026 10:30:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJrT-0000000CI4g-3Q4Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:30:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2B9174E4228D;
	Mon, 26 Jan 2026 10:30:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF73960717;
	Mon, 26 Jan 2026 10:30:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B133119A80E2;
	Mon, 26 Jan 2026 11:30:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769423417; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+2ToM7E+Qj1Z9k1fXgIslDJKNq8unuvWFbzBA+Z/HJI=;
	b=hfKjwU7ZeE/+65JduiU/x648c2XpeMNC0ahM0hJzkjC0bNquwvEcATHujQySNP51uzq5VB
	APmi/Du46xcSKhd2K/z6eRwdUyqeiI9XeRQpGgvNAKOWIfHgwd30vNmfPMlqzvmdgfDAj6
	LcGPjrLgiKbTMufH+q7eofBSRGXhYoK+g47ZMJF9b3+MIffL350BwLaYRCOPEMbLGU7D0i
	kXkhFjGTwE8Y5KLmnWEgqteCzIz8tfiiN9NPH9eBJh7NeEDhDItr8BVs3aPpbp5KUCJegV
	vVc61OSSxpM59fuA66r+vsTmM15w+0QZvAwluzHPjQWm7KLzlLOpWXxiUJwI9A==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Elad Nachman <enachman@marvell.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, andrew@lunn.ch,
 sebastian.hesselbarth@gmail.com, pali@kernel.org, mrkiko.rs@gmail.com,
 chris.packham@alliedtelesis.co.nz, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: enachman@marvell.com
Subject: Re: [PATCH v2 0/3] arm64: dts: a7k: add COM Express boards
In-Reply-To: <20260125152347.2518538-1-enachman@marvell.com>
References: <20260125152347.2518538-1-enachman@marvell.com>
Date: Mon, 26 Jan 2026 11:30:07 +0100
Message-ID: <87sebsk6og.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_023023_983775_DE5AB7D9 
X-CRM114-Status: GOOD (  18.99  )
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

Hello Elad,

> From: Elad Nachman <enachman@marvell.com>
>
> Add support for Armada 7020 Express Type 7 CPU module board by Marvell.
> Add device tree bindings for this board.
> Define this COM Express CPU module as dtsi and provide a dtsi file for
> the carrier board (Marvell DB-98CX85x0 COM Express type 7 carrier board).
>
> Since memory is soldered on CPU module, memory node is on CPU module
> dtsi file.
>
> This Carrier board only utilizes the PCIe link, hence no special device
> or driver support is provided by this dtsi file.
> Devise a dts file for the combined com express carrier and CPU module.
>
> The Aramda 7020 CPU COM Express board offers the following features:
>
> 1.  Armada 7020 CPU, with dual ARM A72 cores
> 2.  DDR4 memory, 8GB, on board soldered
> 3.  1Gbit Out of Band Ethernet via RGMII to PHY and RJ45 connector,
>     all are present on A7K CPU module (none on the carrier)
> 4.  Optional 10G KR Ethernet going via the COM Express type 7 connector
> 5.  On-board 8 Gbit, 8-bit bus width NAND flash
> 6.  On-board 512 Mbit SPI flash
> 7.  PCIe Root Complex, 4 lanes PCIe gen3 connectivity, going via the
>     COM Express type 7 connector
> 8.  m.2 SATA connector
> 9.  Micro-SD card connector
> 10. USB 2.0 via COM Express type 7 connector
> 11. Two i2c interfaces - one to the CPU module, and one to the
>     carrier board via the COM Express type 7 connector
> 12. UART (mini USB connector by virtue of FT2232D UART to USB
>     converter, connected to the Armada 7020 UART0)
>
> v2:
>   1) update 10gbase-kr to 10gbase-r in dtsi
>

I=E2=80=99ve already merged your previous version with this fix and even
included it in the PR for the next release.

However, I noticed a comment from Andrew. Could you provide a fix for
it, and I=E2=80=99ll try to include it i

Thanks,

Gregory


> Elad Nachman (3):
>   dt-bindings: arm64: add Marvell 7k COMe boards
>   arm64: dts: a7k: add COM Express boards
>   MAINTAINERS: Add Falcon DB
>
>  .../bindings/arm/marvell/armada-7k-8k.yaml    |  11 ++
>  MAINTAINERS                                   |   1 +
>  arch/arm64/boot/dts/marvell/Makefile          |   1 +
>  .../dts/marvell/armada-7020-comexpress.dtsi   | 161 ++++++++++++++++++
>  arch/arm64/boot/dts/marvell/armada-70x0.dtsi  |   7 +
>  .../boot/dts/marvell/armada-ap806-dual.dtsi   |   4 +-
>  .../dts/marvell/db-falcon-carrier-a7k.dts     |  27 +++
>  .../boot/dts/marvell/db-falcon-carrier.dtsi   |  22 +++
>  8 files changed, 232 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/marvell/armada-7020-comexpress.dt=
si
>  create mode 100644 arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dts
>  create mode 100644 arch/arm64/boot/dts/marvell/db-falcon-carrier.dtsi
>
> --=20
> 2.25.1
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

