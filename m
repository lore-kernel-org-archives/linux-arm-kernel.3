Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D07C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 13:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Th6q3/hCC62H76sHCeRMO5GYYYzf4lwVOSuhk0Blf6E=; b=UgLCxUvcRZBG6fJUsZZeh15xT6
	IWZKszuQkjdwLofRklcqzlV5aJpQhsTQn41l2JSPnZC49KTg2j393AB4Ly8Pce6OvRSz39qULv38O
	t929XAeAPpOwEN1FcwwgYF6i8+ZaIlO0ljXo6YEsGsFBnUgtd2+uyZEB2KmDx2xff1MIjl5TYOLSj
	kTnjMGUTXrcUOV7EBQ8GkjXCNzgGJP1J/GiOAsFDCN1/vbT+SRna/SbcE0FOF8mQDb2zAY+jg5Jze
	lya4W71YRWM0fJrI/A5fcWdfKLuFclK0PfytSK25sqY4HkHpot3RASGYTpTElm/jMKGP71CzbXd/2
	35BhMnWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRxd-0000000B4jp-28K9;
	Tue, 03 Jun 2025 13:45:49 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRqa-0000000B3sL-2mpF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:38:34 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uMRqF-0005gf-9F; Tue, 03 Jun 2025 15:38:11 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uMRqE-001d8a-1d;
	Tue, 03 Jun 2025 15:38:10 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uMRqE-008dA2-1A;
	Tue, 03 Jun 2025 15:38:10 +0200
Date: Tue, 3 Jun 2025 15:38:10 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <aD76wjgGqDSzinT5@pengutronix.de>
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
 <20250507-am62lx-v5-2-4b57ea878e62@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-am62lx-v5-2-4b57ea878e62@ti.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_063832_703145_EBE7EFD8 
X-CRM114-Status: GOOD (  14.56  )
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

Hi Bryan,

On Wed, May 07, 2025 at 10:09:20PM -0500, Bryan Brattlof wrote:
 +
> +	usbss0: dwc3-usb@f900000 {
> +		compatible = "ti,am62-usb";
> +		reg = <0x00 0x0f900000 0x00 0x800>,
> +		      <0x00 0x0f908000 0x00 0x400>;
> +		clocks = <&scmi_clk 329>;
> +		clock-names = "ref";
> +		power-domains = <&scmi_pds 95>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		ti,syscon-phy-pll-refclk = <&wkup_conf 0x45000>;

This doesn't fit together. The register referenced here...

> +		status = "disabled";
> +
> +		usb0: usb@31000000 {
> +			compatible = "snps,dwc3";
> +			reg = <0x00 0x31000000 0x00 0x50000>;
> +			interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>, /* irq.0 */
> +				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>; /* irq.0 */
> +			interrupt-names = "host", "peripheral";
> +			maximum-speed = "high-speed";
> +			dr_mode = "otg";
> +			snps,usb2-gadget-lpm-disable;
> +			snps,usb2-lpm-disable;
> +			bootph-all;
> +		};
> +	};
> +
> +	wkup_conf: syscon@43000000 {
> +		compatible = "syscon", "simple-mfd";
> +		reg = <0x00 0x43000000 0x00 0x20000>;

...is outside the register range specified here. Consequently the DWC3
driver doesn't probe. Increasing the register range here fixes this.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

