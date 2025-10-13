Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8D4CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 07:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8uO9cHD9K32HH1zbneBlNOvNUnKFTpVY2BsGfvHTqI=; b=LF/R0w8S0mEESRPYMd0bdJvKo0
	uiX4RnmprYjvFEvDOSd1frnpvTcJW8w74u3fGxruNotYYCAFhQP8D1Yeig9bnFaW2T/v6h1XB16vh
	aRy0ghcIlJZgUGPfuYYCWxCdBSlwvzyarkdKSuozp55JKjF280YOH5YyEkRr+TnqxIRfR4kzryGiS
	hqZObW3tevuBQ3vRYlq8sqwDIuY/xxGR+iULKzCBd+AaGXS8cZXaLlg7w+MGvFkY7AmCXJ8RlbJtD
	F1kBXf7ne1aaTEvWC0GxvyV0NUkcBNf6SI9fJGmDPF/+DESrTXqZ50mRKXOC2Ppm+1RNlvSUd8bd9
	RJVFgrGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8CYd-0000000CRvN-25ms;
	Mon, 13 Oct 2025 07:01:23 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8CYZ-0000000CRpx-1yn0;
	Mon, 13 Oct 2025 07:01:22 +0000
Received: from localhost.localdomain (unknown [116.25.94.88])
	by smtp.qiye.163.com (Hmail) with ESMTP id 25b01d132;
	Mon, 13 Oct 2025 15:01:11 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jjm2473@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: add LinkEase EasePi R1
Date: Mon, 13 Oct 2025 15:00:36 +0800
Message-Id: <20251013070036.66901-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251009084416.45542-4-jjm2473@gmail.com>
References: <20251009084416.45542-4-jjm2473@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99dc5f845b03a2kunm65153ab079944d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGE5IVhpJSkJNS0JITE4dH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VQ0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0tVSktLVUtZBg
	++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_000119_708093_54977154 
X-CRM114-Status: UNSURE (   8.16  )
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

> +	regulator-vdd0v95-25glan {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pwr_25g_pin>;
> +		enable-active-high;
> +		gpio = <&gpio3 RK_PB1 GPIO_ACTIVE_HIGH>;
> +		regulator-name = "vdd0v95_25glan";
> +		regulator-min-microvolt = <950000>;
> +		regulator-max-microvolt = <950000>;
> +		regulator-boot-on;
> +		regulator-always-on;

The property order should be consistent with other nodes.

> +		vin-supply = <&vcc3v3_sys>;
> +	};
> +
> +	vcc3v3_nvme: regulator-vcc3v3-nvme {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_nvme";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		enable-active-high;
> +		gpio = <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&dc_12v>;

Same here, keep alphabetical order.

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vcc3v3_nvme_en>;
> +	};

> +		status_led: led-status {
> +			gpios = <&gpio2 RK_PD7 GPIO_ACTIVE_HIGH>;
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_STATUS;
> +			label = "green:status";

The "label" property is deprecated.

> +&pcie2x1 {
> +	reset-gpios = <&gpio3 RK_PA4 GPIO_ACTIVE_HIGH>;

vpcie3v3-supply is missing.

> +	status = "okay";
> +};

> +&pcie3x1 {
> +	num-lanes = <1>;
> +	reset-gpios = <&gpio3 RK_PA3 GPIO_ACTIVE_HIGH>;

vpcie3v3-supply is missing.

> +	status = "okay";
> +};

> +&sdmmc0 {
> +	max-frequency = <150000000>;

max-frequency has been defined in rk356x-base.dtsi

> +	no-sdio;
> +	no-mmc;

no-mmc and cap-mmc-highspeed are mutually exclusive.

> +	bus-width = <4>;
> +	cap-mmc-highspeed;

> +/* Micro SD card slot is not populated */
> +/* Wifi module is not populated */

Why would you define them if they aren't on the board?

> +&sdmmc2 {
> +	max-frequency = <150000000>;

max-frequency has been defined in rk356x-base.dtsi

> +	bus-width = <4>;
> +	disable-wp;

disable-wp does not work with sdio

> +&usb2phy0_otg {

phy-supply is missing.

> +	status = "okay";
> +};

