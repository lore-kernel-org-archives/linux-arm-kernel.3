Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5058BCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltyj1FS4gis+7LWdtGx1ofBO64mHrGOTJDhLLZcoo1Q=; b=saOzHLbeM3z0pW3QBZlSCha2x5
	mgwssACiaTnCNXkszXyVqhwCUwxCoy6hzzTFqz+8mHwZGdO/oksKPHHzxmBWPS9qaWm+YUXeZjxBI
	DxjngjINjfIv/flpuawTvJP7eA1+5ZRpG6NxgmIfk++dCVK9RytlP1TVX1v8rlwkJL85TJHEPcZlc
	GHsUqVBat2FXL0MfuKgesMaQq4iy4nyj81AjP2Rz2isZrUsA6YGbNT06+0SvrkeWy5SojjC2GxqQi
	pUGrXaNBm1R93naLvY+xIK3HsqFL7qDWQbEoYe93cLUgAQTIehvDnbCizEJUBsA/FCvM2qLSHG9X8
	D39ghYQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAokO-0000000DJp1-0xxA;
	Mon, 20 Oct 2025 12:12:20 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAokL-0000000DJmK-13aM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ltyj1FS4gis+7LWdtGx1ofBO64mHrGOTJDhLLZcoo1Q=;
	b=RsZoBfFSULMxuDGRzNdZ6yeAHhKdHnDbRwmQ720VL1Q3YexqnLILbCbWeQ5fw2
	DcwQfwwPOgPGAKXk0qK08aCrEBDlYK8cQgLd/2Oizde2Eqx08MMSjY8yPMF5BApb
	WmXpKm1i+c3YGrhWd5SxIVg/lJs1254wbQ88c25dvDAJw=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD316EQJ_Zo4qRTAA--.26839S3;
	Mon, 20 Oct 2025 20:12:02 +0800 (CST)
Date: Mon, 20 Oct 2025 20:11:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Yannic Moog <y.moog@phytec.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de,
	Teresa Remmet <t.remmet@phytec.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 0/4] Add display overlays for imx8mp-phyboard-pollux
Message-ID: <aPYnD25ljde33_tq@dragon>
References: <20251013-imx8mp-pollux-display-overlays-v5-0-fb1df187e5a5@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-imx8mp-pollux-display-overlays-v5-0-fb1df187e5a5@phytec.de>
X-CM-TRANSID: Mc8vCgD316EQJ_Zo4qRTAA--.26839S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxtr15trW3JFy8Gr4fZFyUGFg_yoWxtryxpr
	y3CryUur4S9r1xArnxXwsagrWqyws8Aan5uw13C34kKr43uFyDA3W7Grna9rWUZF4xtw4f
	XF48Ary7Wr1UXF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07joeHDUUUUU=
X-Originating-IP: [121.224.201.6]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBKlC2j2JxIThgAA32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_051217_693224_3E167260 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

On Mon, Oct 13, 2025 at 08:25:05AM +0200, Yannic Moog wrote:
> Yannic Moog (4):
>       arm64: dts: im8mp-phy{board,core}: update license
>       arm64: dts: imx8mp pollux: add display overlays
>       arm64: dts: imx8mp pollux: add expansion board overlay
>       arm64: dts: imx8mp pollux: add displays for expansion board
> 
>  arch/arm64/boot/dts/freescale/Makefile             |  15 ++
>  .../imx8mp-phyboard-pollux-etml1010g3dra.dtso      |  44 +++++
>  ...mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtso |  45 +++++
>  ...8mp-phyboard-pollux-peb-av-10-ph128800t006.dtso |  45 +++++
>  .../imx8mp-phyboard-pollux-peb-av-10.dtsi          | 196 +++++++++++++++++++++
>  .../imx8mp-phyboard-pollux-peb-av-10.dtso          |   9 +
>  .../imx8mp-phyboard-pollux-ph128800t006.dtso       |  45 +++++
>  .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |  52 ++----
>  .../boot/dts/freescale/imx8mp-phycore-som.dtsi     |   3 +-
>  9 files changed, 411 insertions(+), 43 deletions(-)

Can we do something to avoid the warnings?

../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:102.3-16: Warning (reg_format): /fragment@1/__overlay__/codec@18:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:117.3-16: Warning (reg_format): /fragment@1/__overlay__/eeprom@57:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:100.18-113.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/codec@18: Relying on default #address-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:100.18-113.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/codec@18: Relying on default #size-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:115.12-120.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/eeprom@57: Relying on default #address-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:115.12-120.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/eeprom@57: Relying on default #size-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:102.3-16: Warning (reg_format): /fragment@1/__overlay__/codec@18:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:117.3-16: Warning (reg_format): /fragment@1/__overlay__/eeprom@57:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:100.18-113.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/codec@18: Relying on default #address-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:100.18-113.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/codec@18: Relying on default #size-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:115.12-120.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/eeprom@57: Relying on default #address-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:115.12-120.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/eeprom@57: Relying on default #size-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:102.3-16: Warning (reg_format): /fragment@1/__overlay__/codec@18:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:117.3-16: Warning (reg_format): /fragment@1/__overlay__/eeprom@57:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:100.18-113.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/codec@18: Relying on default #address-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:100.18-113.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/codec@18: Relying on default #size-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:115.12-120.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/eeprom@57: Relying on default #address-cells value
../arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi:115.12-120.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/eeprom@57: Relying on default #size-cells value

Shawn


