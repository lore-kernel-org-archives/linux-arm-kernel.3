Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A818C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 12:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57/W8rpytXIXtlyC+rj4s2Td3jNxabJVm9LQMdAnlpA=; b=kF4D5QDNL1aBfjjFXTtbrgWKJZ
	3fQ1iTiMi1K/GqXX06zmnisOP8VqcfqqVcw1WnGOXc9p5w9piRpe+WJWQ2FTYrZ1b9E+6Ha3V5Vxr
	iz9oFhj9L4fQQ6y6bVJm9VC1VuDlcem1syBUaPFe9Nm81Jc2ARUozDCYod9dhqlmdRZZsa92k3e2v
	ncF1ACEEOXjzxBdQwD0qijG5HkMMwnNpreLhkg/mcQFn1mu5ZZtIHcmBS2pcsnbhu7hdbAJeX2Xpu
	3vKOVDu+C5Xj9X5Evc7cka4S41lFhBeyCS5lYLJAQZrYi/++XOTzR6Mu6oY/kRkMtmzoXkc7FQYc9
	itNp0ISA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE5Nz-00000007BfW-3Ce2;
	Sun, 11 May 2025 12:02:27 +0000
Received: from mail-m83153.xmail.ntesmail.com ([156.224.83.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE5Lx-00000007BXM-3R1a;
	Sun, 11 May 2025 12:00:24 +0000
Received: from localhost.localdomain (unknown [119.122.215.106])
	by smtp.qiye.163.com (Hmail) with ESMTP id 14a1b6e3c;
	Sun, 11 May 2025 20:00:13 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: heiko@sntech.de
Cc: amadeus@jmu.edu.cn,
	andyshrk@163.com,
	conor+dt@kernel.org,
	damon.ding@rock-chips.com,
	devicetree@vger.kernel.org,
	didi.debian@cknow.org,
	dsimic@manjaro.org,
	jbx6244@gmail.com,
	jing@jing.rocks,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	sebastian.reichel@collabora.com,
	ziyao@disroot.org
Subject: Re: [PATCH v7 4/5] arm64: dts: rockchip: add core dtsi for RK3562 SoC
Date: Sun, 11 May 2025 20:00:09 +0800
Message-Id: <20250511120009.37031-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <13758471.dW097sEU6C@diego>
References: <13758471.dW097sEU6C@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0hKVkweGh4eQx5PHx0ZGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVKS01ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSEJVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a96bf3797cf03a2kunm14a1b6e3c
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ODo6TDo4AzJDI0pCLDIwOUwO
	KAlPCU1VSlVKTE9NQk1PQ0pPQ0tDVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUpLTVlXWQgBWUFNT09PNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_050022_141595_0E8056B3 
X-CRM114-Status: GOOD (  11.75  )
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

Sorry I just posted to the wrong thread.

> First of all, thanks for noticing all the bits and pieces to improve.
> I di think I have now fixed up all the "regular" pieces you mentioned
> and amended the commit accordingly:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=1d2f65fa98ddcafdfd1ebcdb87105141861b584a

Thanks a lot for the quick fix! It seems there is still a little problem:

> <snip>
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
> <snip>
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <825000 825000 1000000>;
+		};
+		opp-400000000 {
+		opp-hz = /bits/ 64 <400000000>;

This line is missing a tab.

+			opp-microvolt = <825000 825000 1000000>;
+		};
> <snip>
+		spi0: spi@ff220000 {
+			compatible = "rockchip,rk3562-spi", "rockchip,rk3066-spi";
+			reg = <0x0 0xff220000 0x0 0x1000>;
+			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;

Also needed here.

> <snip>
> +		pwm3: pwm@ff230030 {
> +			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> +			reg = <0x0 0xff230030 0x0 0x10>;
> +			#pwm-cells = <3>;

Missed here.

> <snip>
> +				power-domain@12 {
> +					reg = <12>;
> +					#power-domain-cells = <1>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> ...
> +				power-domain@13 {
> +					reg = <13>;
> +					#power-domain-cells = <1>;

Does #power/#address/#size need to be put under pm_qos?

> <snip>
> +		spi1: spi@ff640000 {
> +			compatible = "rockchip,rk3066-spi";
> +			reg = <0x0 0xff640000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> ...
> +		spi2: spi@ff650000 {
> +			compatible = "rockchip,rk3066-spi";
> +			reg = <0x0 0xff650000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;

Same here.

> <snip>
> +		pwm4: pwm@ff700000 {
> +			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> +			reg = <0x0 0xff700000 0x0 0x10>;
> +			#pwm-cells = <3>;
> +			pinctrl-names = "active";
> ...
> +		pwm5: pwm@ff700010 {
> +			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> +			reg = <0x0 0xff700010 0x0 0x10>;
> +			#pwm-cells = <3>;
> +			pinctrl-names = "active";
> ...
> +		pwm6: pwm@ff700020 {
> +			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> +			reg = <0x0 0xff700020 0x0 0x10>;
> +			#pwm-cells = <3>;
> +			pinctrl-names = "active";
> ...
> +		pwm7: pwm@ff700030 {
> +			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> +			reg = <0x0 0xff700030 0x0 0x10>;
> +			#pwm-cells = <3>;
> +			pinctrl-names = "active";
> ...
> +		pwm8: pwm@ff710000 {
> +			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> +			reg = <0x0 0xff710000 0x0 0x10>;
> +			#pwm-cells = <3>;
> +			pinctrl-names = "active";
> ...
> +		pwm9: pwm@ff710010 {
> +			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> +			reg = <0x0 0xff710010 0x0 0x10>;
> +			#pwm-cells = <3>;
> +			pinctrl-names = "active";
> ...
> +		pwm10: pwm@ff710020 {
> +			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> +			reg = <0x0 0xff710020 0x0 0x10>;
> +			#pwm-cells = <3>;
> +			pinctrl-names = "active";
> ...
> +		pwm11: pwm@ff710030 {
> +			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> +			reg = <0x0 0xff710030 0x0 0x10>;
> +			#pwm-cells = <3>;
> +			pinctrl-names = "active";
> ...
> +		pwm12: pwm@ff720000 {
> +			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> +			reg = <0x0 0xff720000 0x0 0x10>;
> +			#pwm-cells = <3>;
> +			pinctrl-names = "active";
> ...
> +		pwm13: pwm@ff720010 {
> +			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> +			reg = <0x0 0xff720010 0x0 0x10>;
> +			#pwm-cells = <3>;
> +			pinctrl-names = "active";
> ...
> +		pwm14: pwm@ff720020 {
> +			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> +			reg = <0x0 0xff720020 0x0 0x10>;
> +			#pwm-cells = <3>;
> +			pinctrl-names = "active";
> ...
> +		pwm15: pwm@ff720030 {
> +			compatible = "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> +			reg = <0x0 0xff720030 0x0 0x10>;
> +			#pwm-cells = <3>;
> +			pinctrl-names = "active";

pinctrl and #pwm-cells forgot to change.

> <snip>
> +		sdmmc0: mmc@ff880000 {
> +			compatible = "rockchip,rk3562-dw-mshc",
> +				     "rockchip,rk3288-dw-mshc";
> +			reg = <0x0 0xff880000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +			max-frequency = <200000000>;
> ...
> +		sdmmc1: mmc@ff890000 {
> +			compatible = "rockchip,rk3562-dw-mshc",
> +				     "rockchip,rk3288-dw-mshc";
> +			reg = <0x0 0xff890000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> +			max-frequency = <200000000>;

max-frequency should be placed below clock

> <snip>
> +		saradc0: adc@ff730000 {
> +			compatible = "rockchip,rk3562-saradc";
> +			reg = <0x0 0xff730000 0x0 0x100>;
> +			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +			#io-channel-cells = <1>;
> ...
> +		saradc1: adc@ffaa0000 {
> +			compatible = "rockchip,rk3562-saradc";
> +			reg = <0x0 0xffaa0000 0x0 0x100>;
> +			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
> +			#io-channel-cells = <1>;

`#io-channel-cells` should be put above `status = "disabled";`

Thanks,
Chukun

--
2.25.1


