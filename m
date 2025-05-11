Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BF9C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 10:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9vjX0NpeXboEs6UC4bGi/50cueuXRIEpPRh5+1mL/c=; b=nzCVLY4RcCHlxMxQadbyZEwpgg
	DJ7DvAnHgqnZacmzCXRI9PnsmAQZgsiaSTFYA3uEvHhG+a7Imab1gAZYT06cnVmY7LphxPtI1wPuh
	8SJ54Y/FJ3hbzU9EI9nuKBbyiMgAbhNamNDXZ+7gNdI+S0Sbafe0yjGfNJXjTtjAQ1yDZeh3JPmp/
	RNQXscHAu4pOi6ZrNZNluS9BaQV8oKTqvEW52MsIs18ZaflhN0aB1n0i2Yml7d0oiax9O5uhshCkF
	cUf8czGIJ7oYciHs1See38UpKbWCCKOAFFJBHO72r8ZEaFPAtWCd6lGhsb3DhoYsonI0hCvvhBky5
	5tsRuGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE3Y0-000000073xG-2Utg;
	Sun, 11 May 2025 10:04:40 +0000
Received: from mail-m83149.xmail.ntesmail.com ([156.224.83.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE3UA-000000073b0-3kUT;
	Sun, 11 May 2025 10:00:45 +0000
Received: from localhost.localdomain (unknown [119.122.215.106])
	by smtp.qiye.163.com (Hmail) with ESMTP id 14a0dc43a;
	Sun, 11 May 2025 18:00:27 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: ziyao@disroot.org
Cc: andyshrk@163.com,
	conor+dt@kernel.org,
	damon.ding@rock-chips.com,
	devicetree@vger.kernel.org,
	didi.debian@cknow.org,
	dsimic@manjaro.org,
	heiko@sntech.de,
	jbx6244@gmail.com,
	jing@jing.rocks,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	sebastian.reichel@collabora.com,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v7 4/5] arm64: dts: rockchip: add core dtsi for RK3562 SoC
Date: Sun, 11 May 2025 18:00:22 +0800
Message-Id: <20250511100022.31465-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310140916.14384-2-ziyao@disroot.org>
References: <20250310140916.14384-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSBhDVklDGU5PH0xMSUweSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVKS01ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0pVSktLVU
	tZBg++
X-HM-Tid: 0a96bec9f05303a2kunm14a0dc43a
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PjI6UQw*DjJON0oCUTUxEzJN
	FE0aFApVSlVKTE9NQk5MTUlDTUtDVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUpLTVlXWQgBWUFPT0hMNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_030043_213691_23C77226 
X-CRM114-Status: GOOD (  14.44  )
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

> <snip>
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
> @@ -0,0 +1,1187 @@
> <snip>
> +#include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/power/rockchip,rk3562-power.h>
> +#include <dt-bindings/pinctrl/rockchip.h>

Does this need to be sorted alphabetically?

> <snip>
> +		idle-states {
> +			entry-method = "psci";

It would be better to leave a blank line here.

> +			CPU_SLEEP: cpu-sleep {

> <snip>
> +		pwm0: pwm@ff230000 {
> +			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> +			reg = <0x0 0xff230000 0x0 0x10>;
> +			#pwm-cells = <3>;
> +			pinctrl-names = "active";

It should be `pinctrl-names = "default";` for pwm, see also [1]

> +			pinctrl-0 = <&pwm0m0_pins>;
> +			clocks = <&cru CLK_PMU1_PWM0>, <&cru PCLK_PMU1_PWM0>;
> +			clock-names = "pwm", "pclk";
> +			status = "disabled";
> +		};

The pinctrl should be placed below the clock.

> <snip>
> +			power: power-controller {
> +				compatible = "rockchip,rk3562-power-controller";
> +				#power-domain-cells = <1>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "okay";
> +

`status = "okay"` is not needed here.
Also remove extra blank lines.

> +
> +				power-domain@RK3562_PD_GPU {
> <snip>
> +				power-domain@RK3562_PD_VI {
> +					reg = <RK3562_PD_VI>;
> +					#power-domain-cells = <1>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					pm_qos = <&qos_isp>,
> +						 <&qos_vicap>;
> +
> +					power-domain@RK3562_PD_VEPU {
> +						reg = <RK3562_PD_VEPU>;
> +						pm_qos = <&qos_vepu>;
> +					#power-domain-cells = <0>;

This line is missing a tab, resulting in an indentation error.

> +					};
> +				};
> <snip>

> +		pcie2x1: pcie@ff500000 {
> +			compatible = "rockchip,rk3562-pcie", "rockchip,rk3568-pcie";
> +			#address-cells = <3>;
> +			#size-cells = <2>;

#address-cells/#size-cells should be placed above `status = "disabled";`
I think other nodes also need to change this. (Some for #pwm-cells)

> +			interrupt-names = "sys", "pmc", "msg", "legacy", "err", "msi";

I noticed that the bsp 5.10 kernel said that pcie only has 8 MSI vectors,
[2][3] but in the bsp 6.1 kernel it changed to 32 MSI vectors [4].

The rockchip documentation also says there are only 8 MSI vectors:

[5] Page37 8.8 "RK3528/RK3562/RK3576可分配的MSI或者MSI-X总数是8个"
Translate into English: "The total number of MSI or MSI-X that
can be allocated by RK3528/RK3562/RK3576 is 8"

We noticed this when supporting rk3528, so which one is correct?

> +			phys = <&combphy_pu PHY_TYPE_PCIE>;

s/combphy_pu/combphy

> <snip>
+		combphy_pu: phy@ff750000 {

Please change it to `combphy` like rk3568.

Heiko I know you just merged this, it's a bit offensive but I think
it would be better to drop these patches and fix them further.
Or kever would you like to send a fix patch? Although most of
them are typo issues, it will take a few patches to fix it.

[1] https://lore.kernel.org/lkml/20250310140916.14384-2-ziyao@disroot.org/
[2] https://github.com/rockchip-linux/kernel/commit/4f0c9ccc79c373aa97084b3b1ab0651ca4248227
[3] https://github.com/rockchip-linux/kernel/commit/afb85c759cfadc4051c42a9703860071a9877f2e
[4] https://github.com/coolpi-george/coolpi-kernel/commit/522b94122ec797760dcd466851250cbdfafff50f
[5] https://github.com/ArmSoM/rk3506-rkr4.2-sdk/blob/main/docs/cn/Common/PCIe/Rockchip_Developer_Guide_PCIe_CN.pdf

Thanks,
Chukun

--
2.25.1


