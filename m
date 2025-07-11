Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5EFC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 08:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ja3AGIelBZtt9EU5bHvPLrI5vaWTiFgyayWLfGvfD/0=; b=ZTE+NufBq073Qf8moVxaYQlZVg
	hrjBNqozUEUJego4A8Kr0GJ2hAhQ9fgd7eFHu8RWo7aP/vXlkhFO39lzpSFTW9v7ABIWGp4uXJDvc
	G+RugtSC8UsMiZORmxoemM9g+FpYmKKCfy5A/LYIHfmsMw78AhpI2xP5+IxvF7OAFtKyqjO8CNeel
	BHYQKywypYrwIDWdSYu/Rk5IE3zZBm73f2oqfy9N5GrAz7d0Vo1mmEaKPRyDx/+L+MxakB/o6tI9O
	C10sh4M/8T7u0HK42JjR3vB8SaqyNG99JUpfOVLYHpDOXGHQupLHZhGww4SeeGKhXUX/hMadITyIJ
	qlfwrZdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9O9-0000000ECgV-2rlQ;
	Fri, 11 Jul 2025 08:45:49 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8gD-0000000E3cO-1yWK;
	Fri, 11 Jul 2025 08:00:27 +0000
Received: from localhost.localdomain (unknown [119.122.214.98])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1baf2e80d;
	Fri, 11 Jul 2025 16:00:15 +0800 (GMT+08:00)
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
	ziyao@disroot.org
Subject: Re: [PATCH v2 4/6] arm64: dts: rockchip: Add ArmSoM Sige1
Date: Fri, 11 Jul 2025 16:00:09 +0800
Message-Id: <20250711080009.72677-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250710202958.3717181-5-jonas@kwiboo.se>
References: <20250710202958.3717181-5-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGEwdVktLHR1KSBpJTUxIGlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VCQ1lXWRYaDxIVHRRZQVlPS0hVSktJT09PS1VKS0tVS1
	kG
X-HM-Tid: 0a97f87fd03a03a2kunm1c8745eb5f1e92
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ni46Eyo*GDE*Lx8aEA0fHwso
	NjdPCQNVSlVKTE5JSUlLQ0pNQktLVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpPVUJDWVdZCAFZQUpMQkk3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_010025_675265_8A914E0A 
X-CRM114-Status: UNSURE (   6.77  )
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

> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&g_led>, <&r_led>;
> +
> +		led-green {

Should this label be named as led-0/led-1?

> +&sdio0 {
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	disable-wp;
> +	keep-power-in-suspend;
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +	no-mmc;
> +	no-sd;
> +	non-removable;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdio0_bus4>, <&sdio0_clk>, <&sdio0_cmd>;

This pinctrl is the same as that of rk3528.dtsi, we can remove it.

BTW there is a fan connector on the board (connected to pwm6m2),
so pwm6 should be enabled.

> +&uart2 {
> +	dma-names = "tx", "rx";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart2m1_xfer>, <&uart2m1_ctsn>, <&uart2m1_rtsn>;
> +	uart-has-rtscts;
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "brcm,bcm43438-bt";
> +		clocks = <&cru CLK_DEEPSLOW>;
> +		clock-names = "lpo";
> +		device-wakeup-gpios = <&gpio3 RK_PC3 GPIO_ACTIVE_HIGH>;

Is host-wakeup-gpios needed?

Thanks,
Chukun

--
2.25.1


