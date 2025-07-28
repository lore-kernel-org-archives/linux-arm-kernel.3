Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58840C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 12:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISyGS+oLfAmL79ACAp3S1V910jC5vzAO7hxf3u65L04=; b=YqGbfE2/5S4SGmLeXF1cN/scAI
	XdXH+setpH0MkvqBBdE32O1I66Qsk/m00PgU4dlFsChiXEUFyEfxr730qUtU+pXhQebojy0fbyeC/
	tlTNc1wZZS8HK1/ZyaS5sexdD71NPDm6S+gDyG4vH46MmB/eEY3uLg+MRx3fVEPopjpSJ2BAoxcHn
	/PwTF9FuDXhCqwYr9qAh9RdsJ8hIZ16om58PEYZroWQ1rRty4TQPRATDvfmzoaRK4QWhmIruap2Ig
	hdcxG31chcCm5Jkh1EvQerv9oIrYDnSNgrvldpyQE8wBjRZA9mcNP6eJzmcQHxP6Bvl19NUSzF2Td
	qTUf7XpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugNLe-0000000ET5M-2YvP;
	Mon, 28 Jul 2025 12:52:58 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugNJC-0000000ESqx-1WPb;
	Mon, 28 Jul 2025 12:50:28 +0000
Received: from localhost.localdomain (unknown [119.122.213.139])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d7dd7885;
	Mon, 28 Jul 2025 20:50:20 +0800 (GMT+08:00)
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
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add Radxa E24C
Date: Mon, 28 Jul 2025 20:50:15 +0800
Message-Id: <20250728125015.988357-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250727144409.327740-4-jonas@kwiboo.se>
References: <20250727144409.327740-4-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a985115803303a2kunm2afc03fb162f34
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTU8dVkxMSxhKTR9MTRpDGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVKSEJZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_055026_574274_AA0F8754 
X-CRM114-Status: UNSURE (   7.22  )
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

> +	avddl_1v1: avddh_3v3: avdd_rtl8367rb: regulator-avdd-rtl8367rb {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio1 RK_PC3 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_8367_en>;
> +		regulator-name = "avdd_rtl8367rb";

I don't see the avdd_rtl8367rb regulator in the schematics. It looks like
DVDDIO (RTL8367RB power) is connected to AVDDH_3V3 via a magnetic bead.

> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-mode = "rgmii-id";
> +	phy-supply = <&avdd_rtl8367rb>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&rgmii_miim>, <&rgmii_tx_bus2>, <&rgmii_rx_bus2>,
> +		    <&rgmii_rgmii_clk>, <&rgmii_rgmii_bus>, <&gmac1_rstn_l>;

Should the pinctrl of gmac1_rstn_l be written together with the
reset-gpios of the rtl8367rb switch?

```
reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
pinctrl-0 = <&gmac1_rstn_l>;
```

> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0m0_xfer>;
> +	status = "okay";
> +
> +	rk805: pmic@18 {
> +		compatible = "rockchip,rk805";
> +		reg = <0x18>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <RK_PB2 IRQ_TYPE_LEVEL_LOW>;
> +		#clock-cells = <1>;
> +		clock-output-names = "rk805-clkout1", "rk805-clkout2";

The clkout pin is not connected, but the dt-bindings require it.
Maybe clock-output-names could be made optional?

+&mdio1 {
+	reset-delay-us = <25000>;
+	reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
+	reset-post-delay-us = <100000>;
+};

I don't think this is correct, reset-gpios should be written on the
rtl8365mb switch node. The switch driver has defined the reset time.

```
&mdio1 {
	switch@29 {
		compatible = "realtek,rtl8365mb";
		reg = <29>;
		reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
```

Thanks,
Chukun

--
2.25.1



