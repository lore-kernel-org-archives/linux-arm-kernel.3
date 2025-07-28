Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AD2C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 14:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=za+jX0gj+wTzRuMfWxcE74Z08bGQuLwWAuk+/htWrYU=; b=N4oBlWdIRDHDFlrT0wK/Yuc7wC
	Pnpbffp59QCPjT94wvGUJ0SFV9eZjHhDvFZzYr+5dLa2N6IaD91WEzt/gOTFr/Bi3TB0g7ClsSPhs
	oV+tSQDNSKANs0HrsTE+UmATMPMMVp9VVgrSsk33tgK0fhUShkY+2j6v2iy8N1N4OdIrzuzGs4T5Z
	1x2iqm5+bABtFaJhZ0602vEOIdiqenooC7Ddq4tFm6TYjuf1vueJarML7zwGdmtY/3AZc1TRr+q8a
	vUpPIF/b8bVSbJNO+anULknFFxH0vvs7fdnEqz2PptDvsEc8UIii83b+hr3NX56WvNgtuok4ryAif
	sRdlB/8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOwg-0000000Eh3Z-2axG;
	Mon, 28 Jul 2025 14:35:18 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOs2-0000000EgPo-1s4P;
	Mon, 28 Jul 2025 14:30:32 +0000
Received: from localhost.localdomain (unknown [119.122.213.139])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d7f3d120;
	Mon, 28 Jul 2025 22:30:25 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: alsi@bang-olufsen.dk,
	amadeus@jmu.edu.cn,
	andrew@lunn.ch,
	conor+dt@kernel.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	edumazet@google.com,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	netdev@vger.kernel.org,
	olteanv@gmail.com,
	pabeni@redhat.com,
	robh@kernel.org,
	ziyao@disroot.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add RTL8367RB-VB switch to Radxa E24C
Date: Mon, 28 Jul 2025 22:30:20 +0800
Message-Id: <20250728143020.1007374-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250727180305.381483-4-jonas@kwiboo.se>
References: <20250727180305.381483-4-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a985171201503a2kunm2adcc85416a3a7
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGk0aVh5JSBhDHR1MSE9LT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVKSEJZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0tVSktLVU
	tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_073030_658084_1F85F8ED 
X-CRM114-Status: GOOD (  12.50  )
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

> Initial testing with iperf3 showed ~930-940 Mbits/sec in one direction
> and only around ~1-2 Mbits/sec in the other direction.

> Any mix of MAC (rx/tx delay) and switch (rx/tx internal delay) did not
> seem to resolve this speed issue, however dropping snps,tso seems to fix
> that issue.

Have you tried setting phy-mode to rgmii? (just for testing)
Usually this problem is caused by incorrect rx/tx delay.

> +	ethernet-switch@1d {
> +		compatible = "realtek,rtl8365mb";
> +		reg = <0x1d>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&rtl8367rb_eint>;

Shouldn't this pinctrl be written in interrupts?

> +			ethernet-port@6 {
> +				reg = <6>;
> +				ethernet = <&gmac1>;
> +				label = "cpu";

No need for label = "cpu":
https://github.com/torvalds/linux/commit/567f38317054e66647fd59cfa4e261219a2a21db

> This series relaxes the realtek dsa drivers requirement of having a mdio
> child OF node to probe and instead have it register a user_mii_bus to
> make it function when a mdio child OF node is missing.

This is weird, the switch is connected to the gmac via mdio.
Can you try the following and see if it works? I tried it on
a rk3568 + rtl8367s board and it worked:

```
&mdio1 {
	switch@29 {
		compatible = "realtek,rtl8365mb";
		reg = <29>;
		reset-gpios = ...

		switch_intc: interrupt-controller {
			interrupt-parent = ...
			interrupts = ...
			interrupt-controller;
			#address-cells = <0>;
			#interrupt-cells = <1>;
		};

		mdio {
			#address-cells = <1>;
			#size-cells = <0>;

			phy0: ethernet-phy@0 {
				reg = <0>;
				interrupt-parent = <&switch_intc>;
				interrupts = <0>;
			};

			phy1: ethernet-phy@1 {
				reg = <1>;
				interrupt-parent = <&switch_intc>;
				interrupts = <1>;
			};

			phy2: ethernet-phy@2 {
				reg = <2>;
				interrupt-parent = <&switch_intc>;
				interrupts = <2>;
			};

			phy3: ethernet-phy@3 {
				reg = <3>;
				interrupt-parent = <&switch_intc>;
				interrupts = <3>;
			};
		};

		ports {
			#address-cells = <1>;
			#size-cells = <0>;

			port@0 {
				reg = <0>;
				label = "wan";
				phy-handle = <&phy0>;
			};

			port@1 {
				reg = <1>;
				label = "lan1";
				phy-handle = <&phy1>;
			};

			port@2 {
				reg = <2>;
				label = "lan2";
				phy-handle = <&phy2>;
			};

			port@3 {
				reg = <3>;
				label = "lan3";
				phy-handle = <&phy3>;
			};

			port@x {
				reg = <x>;
				ethernet = <&gmac1>;
				phy-mode = "rgmii";

				fixed-link {
					speed = <1000>;
					full-duplex;
				};
			};
		};
	};
};
```

Thanks,
Chukun

--
2.25.1



