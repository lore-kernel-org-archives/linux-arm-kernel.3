Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2CCD262BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 03:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctNKz6GvD5lNelhXcStrNf6BJ2QP0yZh2qHptZE/lF0=; b=qwjDDQ4kaYXq/4r4KDR7aOb5hx
	vwL2OlgIOv+rkzXjYxsbtxTfxjzoLj9z/R/IXvqL4BusbMoWc2XmsWeQDZjsc6k78aYR6jwys+HjD
	nKvT+dN+JL0j3rYhvRoM0Pp9Ab7ZM7KnKEA+eszG/BjUFONEZIYaAnCk5Q6n1tLIr9HQqIybiojoi
	UW+bxGQmNXhMb5k/G1DQXvMhxhcs8MUj9Bj0RzWm6929qKXGfGAaD8DuvJrnIbmK/2G15vKBR2aiR
	FUZqNz7bE/7cxQxZDxLZeEXJ5tfoHyDRECv3d5WK3ShRsr9DHzU3WZ3jwd+uW0BCXW7InTWNmvOIa
	Txwabzrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viOie-00000004p5b-3Ybf;
	Wed, 21 Jan 2026 03:17:20 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viOiZ-00000004p08-3qcq;
	Wed, 21 Jan 2026 03:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768965385;
	bh=ctNKz6GvD5lNelhXcStrNf6BJ2QP0yZh2qHptZE/lF0=;
	h=From:To:Subject:Date:Message-Id;
	b=oRjIIg6qPg9Fdqzv6VYv8vQ0TxbgAvKL3CtOOaM1DlI9AOxHRqEuU7kXOB4lqtpYi
	 0QW6FOXw9ZazdbSThiZRm0JxZ4LuKqmwaM6P5Y/xtuNLDvii5I23jkqqqehJu5Ylbz
	 ClOwL1yXYMXeb9CQNpamT+q8MYdpBQ8+ZU4RLhIA=
X-QQ-mid: esmtpgz12t1768965384t76fb5e45
X-QQ-Originating-IP: B2IrWSjdGtlvJ617ZVrhL2KEc0TQ5HHEsEwPVrRu0Jw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 Jan 2026 11:16:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3622662477851760804
EX-QQ-RecipientCnt: 17
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alexey Charkov <alchark@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Stephen Chen <stephen@radxa.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: rockchip: Change gmac phy-mode to rgmii-id for ROCK 4D
Date: Wed, 21 Jan 2026 11:15:48 +0800
Message-Id: <20260121031548.402-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260121031548.402-1-kernel@airkyi.com>
References: <20260121031548.402-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MRPQukou9wBmAC369GM3LWIjvN2iIP2HHXBqDEGHoG8u0hfFk5006AeC
	/GeGgsKl+0tHk9FDmimGAA55vOOoQnrvlH+xmcOwLAU+Cqyrz/wOxLm44jHss6JDRRVia5E
	/akzS7h5sI6HXIRvHYiJXWe9bHLkrtyyuKX5lHxf65LnIvTOsJInV6FAiD7Cn2a0Gul/qT0
	E9p5LPSZGzGS/YOdBsyW9aBNICcQPRq5YaEuZ2IOgeK67F6XPWfEujr5VTvegrl3QIIhFWo
	pmLMo46x0pRyCEUnNCxCETBUTTnVNVCVP93J8apSjFrqa8ooqieEujsxKS+Myh5wjJhuDIC
	cRgDTDTKN7ww1fhgB4pCMGRBu8WiSbB1PpCwQOJS3mWArpdOy+dHbpN2AhiNuDDc/8/gOz5
	vBJYVrVTZCKTEc6Joa1o6gAkdIAEluGLkh7y8Jh2+ihwf2KrrFPPwimzFPnj2N1Y1bxXnaO
	zBHD5yMBZB+iDmul4IZYsykHrqPXctRXw1BbxeuaqmQ9Zrrk+jAHsSVUKrIBoqY7KjHbGB5
	TEUNxVpM6MTwUx6/fYLVGhXvlacky2g7AQDvjRRwaYzvlfqFUVpKfdyJPy4IolAMVGJJB9W
	8oBhQGAhOWwIjlyfuI74Pmh7Z8p+xt34IJbrsBY+f7+aGJKEIIZ/kze/1cQCQeDaJcd6vtZ
	7tvB2hg0brr+QdmES2QUr5MW7NnYonAVUJ769TuwK9P95xg8U2Z6cMY6NUFuPaHTDw75eJh
	w7n4SfbLw8j086YazgmK+2bZeq7nL+o00g27XbIN6T0n+6PsjR2S51DNyQOISoA8RTZjrY4
	bp0Bu/Z1+vtPnugQehpZOYflYumpiKYQaBrnJJ3OgQMmzLJOISQYyjWUvTCqEXXpyKq4uyo
	PXOCN7n04Tp6XPJjS8V/ianpI7KSqO/0aIubU58mOik6cNN8VjjA3aU3NbKThc/bHluNh2m
	JjCrg9C6SPULFsNcd1Qj4xWXZChPSLIioMzX++ixD8dwnEGCsxuFhxXWCg/NJ3GfgFXAyAW
	JdsXkAToQKWoIGHVYjPtt5n+Zs1o+YYFPg5VSMGQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_191716_389749_82F0DA61 
X-CRM114-Status: GOOD (  12.12  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

According to the description in the net documentation, PHY modes
"rgmii", "rgmii-rxid" and "rgmii-txid" modes require the clock signal
to be delayed on the PCB.

The Rockchip platform has long used the above mentioned PHY modes and
private delay prop to describe the internal IO delay settings of the
chip, which is inconsistent with what is described in the documentation.

Let's describe this part of the delay in the PHY and use the more
reasonable "rgmii-id" mode.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 3e9c294cab91..70018c34cf08 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -329,7 +329,7 @@ &cpu_l3 {
 &gmac0 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy0>;
-	phy-mode = "rgmii-rxid";
+	phy-mode = "rgmii-id";
 	pinctrl-names = "default";
 	pinctrl-0 = <&eth0m0_miim
 		     &eth0m0_tx_bus2
@@ -338,8 +338,6 @@ &eth0m0_rgmii_clk
 		     &eth0m0_rgmii_bus
 		     &ethm0_clk0_25m_out>;
 	status = "okay";
-	tx_delay = <0x20>;
-	rx_delay = <0x00>;
 };
 
 &gpu {
@@ -772,6 +770,7 @@ rgmii_phy0: ethernet-phy@1 {
 		reset-assert-us = <20000>;
 		reset-deassert-us = <100000>;
 		reset-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
+		tx-internal-delay-ps = <1950>;
 	};
 };
 
-- 
2.51.1


