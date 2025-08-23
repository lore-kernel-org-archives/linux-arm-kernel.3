Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2983CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 12:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=on2OC+T1CdiAvJg9vZDrGg/lj5RdAlVRPcvMF8cGJsI=; b=WwN4UZCoRYqJauWbBDvwQ2VixH
	qFcGcQOJUHQTPcIB4CVglRkne7UwtQKnWsXXNtI0loqxghWVeb118B8HlzGuMd6L1kAuvnd+Nitk0
	RCIFaFCnJtvX6rA4LC3x8lcvGP6ebG54QoS4BMJkwSF/kXZZgXy1I+qEpUdBS3A6TxWrTKD8QlEbe
	XPTwNxHfZF0t6hWpXxssHps177LK9iyXq4IjbtCstuq7M3IWcvMfJl/eXsuAVV89Z+MX+UVpULCPR
	zTua+xuMcA+spTFeWmfYiAC0fyXNnqIB0aIN87zUIBbLRgE2+NTJmsA0Ib8grfCquTUkVW18Szao8
	wNSrEqIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upmz0-00000004jmF-1jNa;
	Sat, 23 Aug 2025 12:04:30 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplpC-00000004fl8-3gWV;
	Sat, 23 Aug 2025 10:50:21 +0000
Received: from localhost.localdomain (unknown [119.122.212.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 205a25682;
	Sat, 23 Aug 2025 18:50:08 +0800 (GMT+08:00)
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
Subject: Re: [PATCH v1 2/2] arm64: dts: rockchip: add DTs for 100ASK DShanPi A1
Date: Sat, 23 Aug 2025 18:50:01 +0800
Message-Id: <20250823105001.970560-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250821110942.172150-3-i@chainsx.cn>
References: <20250821110942.172150-3-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98d68cccdf03a2kunm9dc74748625589
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ0tLVkNDHUxDSRkZSRpPTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSVVCWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_035019_128398_F284A9BC 
X-CRM114-Status: UNSURE (   7.55  )
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

> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/pwm/pwm.h>

It seems that pwm is not used?

> +	vcc_12v0_dcin: regulator-vcc-12v0-dcin {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_12v0_dcin";
> +		regulator-always-on;
> +		regulator-boot-on;

> +	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_1v1_nldo_s3";
> +		regulator-boot-on;
> +		regulator-always-on;

The order of properties should be consistent, e.g.
```
		regulator-name = ...;
		regulator-always-on;
		regulator-boot-on;
```

> +	vcc3v3_pcie: regulator-vcc3v3-pcie {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio1 RK_PB7 GPIO_ACTIVE_HIGH>;

`gpios = ...`

> +&combphy1_psu {
> +	status = "okay";
> +};
> +
> +&combphy0_ps {
> +	status = "okay";
> +};

combphy0 should be above combphy1

> +&gmac0 {
> +	phy-mode = "rgmii-id";
> +	clock_in_out = "output";

clock_in_out should be above phy-mode

> +&gmac1 {
> +	phy-mode = "rgmii-id";
> +	clock_in_out = "output";

Same here.

> ...
> +&i2c1 {
> +	status = "okay";
> +
> +	pmic@23 {
> ...
> +		gpio-controller;
> +		#gpio-cells = <2>;

gpio-xxx should be above interrupt

> +		regulators {
> +			vdd_cpu_big_s0: dcdc-reg1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <550000>;
> +				regulator-max-microvolt = <950000>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-name = "vdd_cpu_big_s0";
> +				regulator-enable-ramp-delay = <400>;

It would be better to add a blank line here.

> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> ...

> +&i2c4 {
> ...
> +		#sound-dai-cells = <0>;

This should be put last.

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sai1m0_mclk>;
> +	};
> +};
> ...

> +&pinctrl {
> +	gmac {
> +		gmac0_rst: gmac0-rst {
> +			rockchip,pins = <0 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};

It would be better to add a blank line here.

> +		gmac1_rst: gmac1-rst {
> +			rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> ...

> +&sdmmc {
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	max-frequency = <200000000>;
> +	no-sdio;
> +	no-mmc;

cap-mmc-highspeed and no-mmc are mutually exclusive.
And the sdmmc controller supports sdio devices.

> +&u2phy0_otg {
> +	status = "okay";

Maybe lack of phy-supply?
And the usb node is not enabled?

--
2.25.1



