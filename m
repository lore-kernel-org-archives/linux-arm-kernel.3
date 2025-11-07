Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AF3CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 11:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYw5ZaNL6ekj6d6/KtaUzYXf/5YoLaLgMbdPch2/pkE=; b=uW40PF9AGJUPZaG5Suj0VEwwTs
	/LUWDo6PdmF9GxErEVVtXG8DQXG2FIpu6gBUqXvajaO3NIOwFtnbcOyG9I/1Wx4JA94ENsuZVbY9E
	WF3GRJ5NHEmEEMoiE6hisBH0m6j/SIM8piN/l9vrE8Exo8UJdBzWaemyxD0RC3GUq/TurZbYPLGQ9
	uG3whhP7Kz8ApM+B+iACIbU+OxXabyUuYCqyHiCGmgEtGCQZWzmRisp3coqIkizpz+hkMkdbEjDtC
	D6fT/TChOHCveWbFF4c/LxfdeL9lM90HLJtb7XORfy3GCj+ybl2vn5CMQphsXAM6Z/2QmXPFXHz+3
	m0hGSdsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKD1-0000000H9nG-0lAF;
	Fri, 07 Nov 2025 11:00:47 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKCq-0000000H9iG-1WcG;
	Fri, 07 Nov 2025 11:00:44 +0000
Received: from amadeus-Vostro-3710.lan (unknown [58.61.140.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 28c95884c;
	Fri, 7 Nov 2025 19:00:25 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: coiaprant@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: Add devicetree for the 9Tripod X3568 v4
Date: Fri,  7 Nov 2025 19:00:20 +0800
Message-Id: <20251107110020.226562-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251103171702.1518730-4-coiaprant@gmail.com>
References: <20251103171702.1518730-4-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a5df9865003a2kunm70c19c3b637495
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQ0xOVk9CHhkZTUpDSxgfS1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0tVSkhPWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_030036_599992_78BA842D 
X-CRM114-Status: GOOD (  11.82  )
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

Hi,

> +++ b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4-camera-demo.dtso
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +
> +// This is a sample reference, due to lack of hardware can not be tested, at your own risk

> +++ b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4-video-demo.dtso
> @@ -0,0 +1,154 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +
> +// This is a sample reference, due to lack of hardware can not be tested, at your own risk

Why are these demo DT Overlays needed? Are these optional accessories?
These untested DT Overlays should be removed.

> +	vcc3v3_pcie: regulator-vcc3v3-pcie {
> +		compatible = "regulator-gpio";

This should use regulator-fixed.

> +		regulator-name = "vcc3v3_pcie";
> +		regulator-min-microvolt = <100000>;
> +		regulator-max-microvolt = <3300000>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vcc3v3_pcie_en_pin>;

Is this the name from the schematic?

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac0_miim
> +			&gmac0_tx_bus2
> +			&gmac0_rx_bus2
> +			&gmac0_rgmii_clk
> +			&gmac0_rgmii_bus
> +			&gmac0_clkinout>;

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac1m1_miim
> +			&gmac1m1_tx_bus2
> +			&gmac1m1_rx_bus2
> +			&gmac1m1_rgmii_clk
> +			&gmac1m1_rgmii_bus
> +			&gmac1m1_clkinout>;

Align Indentation.

> +		codec {
> +			rockchip,mic-in-differential;
> +		};

Is it confirmed to be differential signaling?

> +	pmic {
> +		pmic_int: pmic_int {
> +			rockchip,pins =
> +				<0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;

No line break is needed here.

> +/* Required remotectl for IR receiver */
> +&pwm7 {
> +	status = "disabled";
> +};

This should be replaced with gpio-ir-receiver.

> +&sdmmc2 {
> +	bus-width = <4>;
> +	disable-wp;

The disable-wp property does not apply to SDIO cards.

> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;

Just declare the highest supported speed.

