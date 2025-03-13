Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305B5C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5nHQ9PKfnj36p+ZvAWbyIrfg//8jz4H6FeW5ArFqfI=; b=fmMyoXw3ILWBplgmN8S1T5KOK3
	IbFk4yf9qH5AqooZWObvXsrjW2+BJW0Yv3e4p/mdcR+7qXxWJjR1Sn7Tw7rYT4yOuqalvdZt05Xoc
	/WdKmyr+Ey525B3xYh9F/PwAOmZ0qJsaZDBQPU3YfM5qRknvUhjYwdrN9rczyQYDKTr7syGN5Qw5T
	RhBOPjrLlg62adWocI8ZjCjsMoUmN/4sUgToeTvjuaE1POl9GdhC0Y4Pg0ts6rHMmPPqLmfiRsuNT
	BTMZ2hLm63aFyO9MCKA7fwizvxTFurQM/cHE2bnnJZw9zKQ3S/WHRAEbA8WIh+gSQUkPu44yMDwH6
	nfmdCIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiDQ-0000000BJkj-3Gkf;
	Thu, 13 Mar 2025 13:03:12 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiBj-0000000BJVN-23fF;
	Thu, 13 Mar 2025 13:01:29 +0000
Received: from localhost.localdomain (unknown [119.122.215.89])
	by smtp.qiye.163.com (Hmail) with ESMTP id e2d5d956;
	Thu, 13 Mar 2025 21:01:22 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Add pwm nodes for RK3528
Date: Thu, 13 Mar 2025 21:01:18 +0800
Message-Id: <20250313130118.2772992-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <22d849c3-8a0d-4704-b69c-8019c7f70ca7@kwiboo.se>
References: <22d849c3-8a0d-4704-b69c-8019c7f70ca7@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSU9PVk8ZTUtCSE5KGh5DTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVDQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSk
	JLS1kG
X-HM-Tid: 0a958f985e7603a2kunme2d5d956
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PT46Mzo6MzJWCBc*SBFKCz4W
	HyFPCjdVSlVKTE9KQ0xLQ0NISkxKVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUNCWVdZCAFZQUlIS0M3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_060127_702160_6B4D07E4 
X-CRM114-Status: GOOD (  10.38  )
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

> Interesting, good that it works with the updated U-Boot. Main change
> compared to v1 is that it now use clock/reset id and DT closer to what
> has been merged in mainline Linux. It also has DT params to help
> initialize the two pwm regulators used by these boards.
>
> I will try with the old v1 U-Boot series and see if I can replicated
> your issue.

It is easy to reproduce this issue.
Make the following changes in the new series of u-boot:

```
--- a/configs/radxa-e20c-rk3528_defconfig
+++ b/configs/radxa-e20c-rk3528_defconfig
@@ -47,9 +47,7 @@ CONFIG_DM_MDIO=y
 CONFIG_DWC_ETH_QOS=y
 CONFIG_DWC_ETH_QOS_ROCKCHIP=y
 CONFIG_PHY_ROCKCHIP_INNO_USB2=y
-CONFIG_REGULATOR_PWM=y
 CONFIG_DM_REGULATOR_GPIO=y
-CONFIG_PWM_ROCKCHIP=y
 CONFIG_BAUDRATE=1500000
 CONFIG_DEBUG_UART_SHIFT=2
 CONFIG_SYS_NS16550_MEM32=y
```

Or change dts:
```
--- a/arch/arm/dts/rk3528-radxa-e20c-u-boot.dtsi
+++ b/arch/arm/dts/rk3528-radxa-e20c-u-boot.dtsi
@@ -8,9 +8,9 @@
 };
 
 &vdd_arm {
-	regulator-init-microvolt = <953000>;
+	status = "disabled";
 };
 
 &vdd_logic {
-	regulator-init-microvolt = <900000>;
+	status = "disabled";
 };
```

Then the kernel will hang when loading the gpio driver:

[    0.162618] gpio gpiochip2: Static allocation of GPIO bae is deprecated, use dynamic allocation.
[    0.163558] rockchip-gpio ffb00000.gpio: probed /soc/pinctrl/gpio@ffb00000
[    0.164322] gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.165231] rockchip-gpio ffb10000.gpio: probed /soc/pinctrl/gpio@ffb10000
[    0.165977] gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.166886] rockhip-gpio ffb20000.gpio: probed /soc/pinctrl/gpio@ffb20000
[    0.170342] Internal error: Oos - Undefined instruction: 0000000002000000 [#1] SMP

Changing the debug level:
[    0.175260] rockchip-pinctrl soc:pinctrl: setting mux of GPIO4-14 to 0
[    0.175356] rockchip-pinctrl soc:pinctrl: setting mux of GPIO4-20 to 1
[    0.175968] rockchip-pinctrl soc:pinctrl: setting mux of GPIO4-14 to 0
[    0.176849] rockchip-pinctrl soc:pinctrl: setting mux of GPIO4-21 to 1
[    0.178453] rockchip-pinctrl soc:pinctrl: setting mux of GPIO4-13 to 0
(hang)

Thanks,
Chukun

--
2.25.1


