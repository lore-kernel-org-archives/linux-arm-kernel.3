Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCB4CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 16:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lf4iT9oMbz/BDCBFbn+nX3JHmN5QRl9co3x5oLa7ASg=; b=j70XsCrd3/z3u4xw07E0pj+ERg
	X55qBkDDLzP1WTukuknP1q9KFnje5uzrT1L4VXqv1iicuScdAT+d8aHg4cJbEZCwCwjgi+GL67rMS
	6KNlpdiiktPNtmJ5+E4fKhBdjMYmzM9GtD3t6AymvBjiHoshigLVOfC1+2YVWZYY8cntJZCMNMKYs
	CX4OQhocKcQ/naosd8vLkCDC9+NIsNTnU05Y8S4QNwUSE6raY/uLxFKNakQm4m4TcJNQAXPnWgBQb
	BskUMdqazQ2pT4838SubEjlryWa9T4SmJbYeD+FyQHDiktVaU1BlEQXj/Jr/hmJxsil+mskkBvbTx
	0N1nqSaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJ8Y-0000000GCDs-18Ma;
	Wed, 27 Aug 2025 16:36:38 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHAH-0000000FlYa-2uip;
	Wed, 27 Aug 2025 14:30:20 +0000
Received: from localhost.localdomain (unknown [119.122.212.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 20cf0b9eb;
	Wed, 27 Aug 2025 22:30:12 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: i@chainsx.cn
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: add DTs for 100ASK DShanPi A1
Date: Wed, 27 Aug 2025 22:30:06 +0800
Message-Id: <20250827143006.1001952-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250826030818.3485927-3-i@chainsx.cn>
References: <20250826030818.3485927-3-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98ebefb66a03a2kunm352c1d009efdf
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDS05OVkhKGhkZSUtOSkNKSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSVVCWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_073017_955350_861DCF7C 
X-CRM114-Status: UNSURE (   7.09  )
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

> +	vcc_12v0_dcin: regulator-vcc-12v0-dcin {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_12v0_dcin";

From the schematic [1], it should be called vcc_in?

> +	vcc3v3_pcie: regulator-vcc3v3-pcie {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio1 RK_PB7 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pcie_pwren_h>;

Schematic: "PCIE0_PERSTn"
It seems that it should be the reset gpio of pcie
instead of the enable of regulator.

> +		regulator-name = "vcc3v3_pcie";
> +		vin-supply = <&vcc_12v0_dcin>;

From the schematic, it should be called vcc3v3_m2?
VCC5V0_SYS -> VCC3V3_M2

> +	vcc_5v0_sys: regulator-vcc-5v0-sys {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_5v0_sys";

Schematic: "VCC5V0_SYS_S5" / "VCC5V0_SYS"

> +	vcc_5v0_typec0: regulator-vcc-5v0-typec0 {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb_otg0_pwren>;

Schematic: "TYPEC5V_PWREN_H"

> +		regulator-name = "vcc_5v0_typec0";
> +		vin-supply = <&vcc_5v0_device>;

Schematic: "VBUS5V0_TYPEC"
VCC5V0_SYS -> VBUS5V0_TYPEC

> +	vcc_5v0_usbhost: regulator-vcc-5v0-usbhost {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio0 RK_PC7 GPIO_ACTIVE_HIGH>;

Does this regulator really exist?
GPIO0_C7_d -> ETH1_INTn

The power supply of USB3 host comes from
USB1_P1_PWR/USB1_P2_PWR - VCC5V0_SYS

> +	vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_3v3_ufs_s0";
> +		regulator-boot-on;
> +		regulator-always-on;

The order of properties should be consistent:
```
		regulator-always-on;
		regulator-boot-on;
```

> +&i2c2 {
> +	status = "okay";
> +
> +	hym8563: rtc@51 {
> +		compatible = "haoyu,hym8563";
> +		reg = <0x51>;
> +		clock-output-names = "hym8563";
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PA0 IRQ_TYPE_LEVEL_LOW>;

GPIO0_A0 is connected to the button in the schematic [1]

[1] https://dl.100ask.net/Hardware/MPU/RK3576-DshanPi-A1/DshanPi-A1-RK3576-SCH_V1.0.pdf

--
2.25.1



