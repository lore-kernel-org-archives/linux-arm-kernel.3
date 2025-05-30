Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A5EC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 03:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BOVhTDyUrOPy9fLi/ryb2WMJyRVWZv4f/+KuhN3LflU=; b=UAnB+QTPr0k+IX4r+AMySl6n57
	bQ9gdRtf4AV5mffeeovzWHA3Mo0GUznjugu6i2HbHLzH9OdKkwamxEFpg8s+NA5HRuswihrFn5Jy4
	0QHMr6FdVaEr2lxQhTVuYR+m8mTUqtdGS47WmalQIChfYC7hlaLYHF5Q6G3tZfDXquwcFXw1tQ58f
	N48lX5RoEjD6EtIxfhHaMrQGrd6NhganW+9IVAxVse+BpRUMcvByi8B1/q951xEQnNyg47yXeluSO
	GTjK5TRtWaNQpQfziT/ETAgwQNak3LMr4bG58n0k2LK4MuHblc5h2JYzdjVw5ZtBh10g0VawLBJyc
	/pgPWv5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqEr-0000000H166-0LTe;
	Fri, 30 May 2025 03:16:57 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqAc-0000000H0fz-21NN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 03:12:36 +0000
X-QQ-mid: zesmtpgz3t1748574651t1f688200
X-QQ-Originating-IP: 5OdztFYpI2CQ6CtR9zM4QisGTIm1CN/fzpZK7SrLLX8=
Received: from chainsx-ubuntu-server.lan ( [182.245.65.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 May 2025 11:10:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5599866305784924053
EX-QQ-RecipientCnt: 16
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: i@chainsx.cn,
	heiko@sntech.de,
	andrew@lunn.ch,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	jonas@kwiboo.se,
	sfr@canb.auug.org.au,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v5 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Fri, 30 May 2025 11:10:44 +0800
Message-Id: <20250530031046.166202-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MK4p1jIvrjRDrkStlPN3r30eBS7MQqhtfvaa8nByP+P9DhCC9AEYKr9i
	IgXEMgW2Oit/fEIH5xCoQOSsM8hr00/ZE2m2fwRPXo+TGgKeQ1UeYLrPT4UUdbyrdGMQ2yI
	huPbot7UeS0wNzPI8UH/rA07KhJx94A9evZPjpkMH30PV+/5SjStTNVcO15zCKiWKdQihu3
	5TARY8sUtmg8xKqCiT0VHdRFongIOPAQrByrdzi+JmmD6V6ubJAOcTNHICXXrQJQmmoGEGS
	mQatEyCb/fPQMztFB6pMAU8gVvvtlwC7YwEEUeSgPcJ3d+63zt218iuI5z+OZNuhIB+oSxZ
	oCRtL/+6J6ZuEiuhKKuKJcn+8KROoX3FOU+8lwDSQzMiJeb2rAYxktrRy1QSJM7UQi4XPWJ
	kGRgQlWf0iC8Gm1oQ1BTCznc2mPVQEDIEJC+Lly+Xas/4fDkegUkmcrLtqWzLRjRXO3tQpw
	mw3s3t8OjFa51QGHAVoExaeaNFq000O3XHU/wPgv6ZIE81vOlCg/l8/yk9CFDruh20gnMtz
	7Lcx3Fle6PowxqMG2Ok3n/Gvh6tDp6jpcHPDSmLIk8FLeBvqpJn4y/BpxuJWrSn8gJ0GUZB
	KaaDZmaIlbq+DdHWN8ZokBvk+ifp7WO5qwPOnDjZI60ezPAfhwxO3GDkf+9ZKWJb2baXpZl
	KjjRK6KDBorecDyUYURnHMEPgk72BlNEr/8uZxPkNmfr6Ds6pk3cF3hVBoUe830WBXSCKcW
	24iz64I8RRi7qNYO+2EhSiOF158gi0yMHMCb4zuTzFBVSEFzJapdMVbJv+ljrFSrXBfxzq6
	qNl3GGKceCd1jeRRzvzY6HrNAE9Vu1ocTM5tguy6rk/0zDZ3ELHf7pL8zBIEKR5dmu/ikki
	E5VChQT13h0KFkCxi+D/pZMcarkPQv2E6Rftx8UZd+5N9D4EeQSmhaq3hSzAOfWouOyyBsC
	2VzaX5OCmkzgufIN40yTpTi3yMU1DwmF+Ow1+8jDAmUL36r1ciGnALv8TrwBIApgULjec89
	8MTJ09Fw==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_201235_319199_6C92DC18 
X-CRM114-Status: GOOD (  13.04  )
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

This series add support for Firefly Station-M3/ROC-RK3588S-PC.

Info of device can be found at:
https://wiki.t-firefly.com/en/Station-M3/index.html

Changes in v5:
- Make led-1 off by default (Chukun Pan, v4)
- Add color settings for led (Chukun Pan, v4)
- Remove vcc5v0_usbdcin
- Put enable/gpio before regulator (Chukun Pan, v4)
- Remove always-on and boot-on from vcc5v0_host (Chukun Pan, v4)
- Update the name of vbus_typec (Chukun Pan, v4)
- Remove always-on and boot-on from vbus5v0_typec (Chukun Pan, v4)
- Put pinctrl-names before pinctrl-0 (Chukun Pan, v4)
- Remove usb_con node
- Remove extra blank lines (Chukun Pan, v4)
- Add phy-supply for u2phy3_host (Chukun Pan, v4)

Changes in v4:
- Update the name of the regulator
- Remove the i2s5_8ch node

Changes in v3:
- Update the name of leds
- Add more cpu nodes
- Update mdio compatible
- Fix the order in the node
- Add the default serial port(uart2)
- Patch 1: Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Changes in v2:
- Fix rgmii delays

Changes in v1:
- Add support for Firefly ROC-RK3588S-PC

Hsun Lai (2):
  dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
  arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 838 ++++++++++++++++++
 3 files changed, 844 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts

-- 
2.34.1


