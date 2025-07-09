Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E29C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 09:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+gtiQXFLHiEKPxSC/wmXMNvnvOmfJQndfDGXDPUafM=; b=dycG/oC1k32ydxXzpzsOizuqfa
	mmSRoAgBfnSx9q5vPXhz6u4HRzEOEy3GGrwg55fwkMHCU8o7JU+ODwxSx8JarHkJQuDtuvPVqWHLO
	sdzKMQ0Ut+xVGRZW+MV51XdGsKi+NxDTdMi6kjziRJPH8GrpANWYfShNsUD4wpSI7OQWmDj0wLH3k
	9BWWSmnFXHxlX5lttiiiYnsszBQXKGQhGEiZ1JLWUDAIQCHntVoJzK5q0EHBsVwEKVvnGiG3v8SLc
	UlCaXInO1qczzkW6Jp8XDmTUn14RZctZn1o/rhe6RY4ZapSClr5uT+xiaDsUPc+3e4yaWvW0cuj2s
	3hNuqd5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZR4d-000000088Ii-419Z;
	Wed, 09 Jul 2025 09:26:43 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOn5-00000007kIH-2GTZ;
	Wed, 09 Jul 2025 07:00:29 +0000
Received: from localhost.localdomain (unknown [119.122.214.98])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1b68dd445;
	Wed, 9 Jul 2025 15:00:08 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	ziyao@disroot.org
Subject: Re: [PATCH 4/6] arm64: dts: rockchip: Add ArmSoM Sige1
Date: Wed,  9 Jul 2025 15:00:03 +0800
Message-Id: <20250709070003.53484-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250708224921.2254116-5-jonas@kwiboo.se>
References: <20250708224921.2254116-5-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSkpKVkwaSk1MQ0IeGE9LTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VCQ1lXWRYaDxIVHRRZQVlLVUtVS1VLWQY+
X-HM-Tid: 0a97edfc0df903a2kunm4d206f074e8f19
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OBw6CCo5DDE3CS8cFwIDMS4*
	FyIaFA9VSlVKTE5JS09PT0pITEJCVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpPVUJDWVdZCAFZQUlDTEg3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_000027_806620_F75DCB2E 
X-CRM114-Status: UNSURE (   8.46  )
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

Hi,

> +	vcc5v0_usb1_host: regulator-5v0-vcc-usb1-host {
> +		compatible = "regulator-fixed";
> ...
> +		regulator-always-on;
> +		regulator-boot-on;
> ...
> +	vcc5v0_usb2_host: regulator-5v0-vcc-usb2-host {
> +		regulator-always-on;
> +		regulator-boot-on;
> ...

I think these two regulators do not need boot-on?

> +	rfkill {
> +		compatible = "rfkill-gpio";
> +		label = "rfkill-wlan";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wifi_reg_on_h>;
> +		radio-type = "wlan";
> +		shutdown-gpios = <&gpio1 RK_PA6 GPIO_ACTIVE_HIGH>;
> +	};

Why not use mmc-pwrseq instead of rfkill?

> +	rfkill-bt {
> +		compatible = "rfkill-gpio";
> +		label = "rfkill-bt";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bt_reg_on_h>;
> +		radio-type = "bluetooth";
> +		shutdown-gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
> +	};

Why not use shutdown-gpios of bcm43438-bt?

> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0m0_xfer>;
> +	status = "okay";
> +
> +	hym8563: rtc@51 {
> +		compatible = "haoyu,hym8563";
> +		reg = <0x51>;
> +		#clock-cells = <0>;
> +		clock-output-names = "hym8563";

CLKOUT pin is not connected.

> +&sdio0 {
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	disable-wp;
> +	keep-power-in-suspend;
> +	no-mmc;
> +	no-sd;
> +	non-removable;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdio0_bus4>, <&sdio0_clk>, <&sdio0_cmd>, <&clkm1_32k_out>;

I recommend using clkm1_32k_out at the sdio-pwrseq node.

> +	sd-uhs-sdr104;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&vcc_1v8>;
> +	status = "okay";

Maybe `brcm,bcm4329-fmac` nodes can be added here?

> +&uart2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart2m1_xfer>, <&uart2m1_ctsn>, <&uart2m1_rtsn>;
> +	uart-has-rtscts;
> +	status = "okay";

You can add `brcm,bcm43438-bt` nodes here:

	bluetooth {
		compatible = "brcm,bcm43438-bt";
		device-wakeup-gpios = <&gpio3 RK_PC3 GPIO_ACTIVE_HIGH>;
		host-wakeup-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
		shutdown-gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
		...
	};

Thanks,
Chukun

--
2.25.1


