Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3815AE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 17:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xy3/Aj5G5XKlSOGuvuIp4d0+mFT8WB0dvmaCLkjMxr4=; b=3PuLa9lrUtvshBQWQACzw0F/Cw
	g/O4jwnDKLWMNhUN8bAvAiuwQjLqk/LYn/Xf26Wy6ai+mMbjKBdFmWIi3Y7JdFmgS8l+TkewkEAoc
	g0fspo2MHh2hayviF2tzCBe7wVjCvM2vUsKlgNaXAfTRl3qzSe+eiWoU+2/BiBaAg193+yRuiMwg1
	GrIiZBIR3PcOfzBX0YVXSeqazGKh2Q/DZpS24ltYwDfnDVSePjnbCMDP41BJJXFhejwlfOsq/Ikmn
	mbM2IEVJhJg4RCP4+57FteVx36Szssc+vVu7RKqZ9tI/I1u0M4tq9Yw+Kjd57jEa+6GiAaGQvr9OA
	kjPq1bkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPmaF-0000000AV4o-41a6;
	Mon, 23 Dec 2024 17:51:11 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlPL-0000000APXB-2GsN;
	Mon, 23 Dec 2024 16:35:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C00F3C0002;
	Mon, 23 Dec 2024 16:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734971746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xy3/Aj5G5XKlSOGuvuIp4d0+mFT8WB0dvmaCLkjMxr4=;
	b=NuT6L0tkVKLCJ8BKcPhxuTOoiTzvuwVakfuU3d7T8Z/oDRQ3IUOeB9NWuiutvisPHuhz5U
	jbOoDLGuBn3S8cn5dqIdsOxmOp6PB3oFHnc18NVgUqcG1UUfup0ns4ElSrB9xrTSZJJAWz
	VFv5O+NOk7d0dMBkTIdl9tZkqJKckcUwEFKv9yvUzjuhE7IvN+Ze8pBWTKs2tsU37Ltm6u
	8QY666Wj4lRhVaND0oGDS6gdsu0EEC4VP8Fka/jPFGcstGIeAizpVi8cUVwLXM/HYtbkot
	BxZ67xvtd0KDslthfFHjtOqHk1YLKR2L/N/Neh9nwAzsrpRCHoa2XYg+CqDecw==
Message-ID: <9b7161a7-2682-4824-8af0-39477b0938d8@bootlin.com>
Date: Mon, 23 Dec 2024 17:35:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/10] Add PCIe support for bcm2712
To: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>
References: <20241025124515.14066-1-svarbanov@suse.de>
Content-Language: en-US
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
In-Reply-To: <20241025124515.14066-1-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: olivier.benjamin@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_083551_891674_A3C97CD2 
X-CRM114-Status: GOOD (  20.83  )
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

On 10/25/24 14:45, Stanimir Varbanov wrote:
> Here is v4 of the series which aims to add support for PCIe on bcm2712 SoC
> used by RPi5. Previous v3 can be found at [1].
> 
Hello Stanimir,

Thank you for you work on this!

> v3 -> v4 changes include:
>   - Addressed comments on the interrupt-controller driver (Thomas)
>   - Moved "Reuse config structure" patch earlier in the series (Bjorn)
>   - Merged "Avoid turn off of bridge reset" into "Add bcm2712 support" (Bjorn)
>   - Fixed DTB warnings on broadcom/bcm2712-rpi-5-b.dtb
> 
> For more detailed info check patches.
> 
I would simply like to report that I have (rather succintly) tested this 
series.
I have built a 6.13.0-rc4-v8 vanilla kernel and deployed it to a 
Raspberry Pi 5 equipped with a "Raspberry Pi SSD" NVMe Drive on an M.2 
Hat+ connected to the main board using PCIe.
This of course did not work, and I could not see my drive.
I then applied this series on top, rebuilt and deployed the kernel, and 
I could see the /dev/nvme0 device and mount the ext4 fs on the 1st 
partition.

> Comments are welcome!
> ~Stan
	
If you find it helpful, feel free to collect my Tested-By tag.

I'll be happy to do the same for future versions of the series and can 
do some additional testing if you want an extra pair of eyes.

Olivier
> 
> [1] https://patchwork.kernel.org/project/linux-pci/list/?series=898891
> 
> Stanimir Varbanov (10):
>    dt-bindings: interrupt-controller: Add bcm2712 MSI-X DT bindings
>    dt-bindings: PCI: brcmstb: Update bindings for PCIe on bcm2712
>    irqchip: Add Broadcom bcm2712 MSI-X interrupt controller
>    PCI: brcmstb: Reuse config structure
>    PCI: brcmstb: Expand inbound window size up to 64GB
>    PCI: brcmstb: Enable external MSI-X if available
>    PCI: brcmstb: Add bcm2712 support
>    PCI: brcmstb: Adjust PHY PLL setup to use a 54MHz input refclk
>    arm64: dts: broadcom: bcm2712: Add PCIe DT nodes
>    arm64: dts: broadcom: bcm2712-rpi-5-b: Enable PCIe DT nodes
> 
>   .../brcm,bcm2712-msix.yaml                    |  60 ++++
>   .../bindings/pci/brcm,stb-pcie.yaml           |  21 ++
>   .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |   8 +
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 162 +++++++++
>   drivers/irqchip/Kconfig                       |  16 +
>   drivers/irqchip/Makefile                      |   1 +
>   drivers/irqchip/irq-bcm2712-mip.c             | 310 ++++++++++++++++++
>   drivers/pci/controller/pcie-brcmstb.c         | 204 +++++++++---
>   8 files changed, 735 insertions(+), 47 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2712-msix.yaml
>   create mode 100644 drivers/irqchip/irq-bcm2712-mip.c
> 

-- 
Olivier Benjamin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


