Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96CEC02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 00:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uXQUmf+sUnAZX17QEqWUsAvmffSZN44xH/IxQSgjoig=; b=GbkNnxnMnShbyxWSQucEtEZrE6
	eOnx5x+ezAKcvsejP0YWK0UBoH24vGKF2GcI6WaK4G5lmobP51D7Wp1RVrnlVpYNS2U9nfPOn/SNP
	DBat95YDxknP13bKFbzEW16JTgPmjp8bztz8UbW5x4NucS/+1LdXgT0CMwyV5wlkzu/K/SuyDGlY3
	Qfaps/5vCCpO2t071R2TqkPXcA4WYzUB/U2F6ieIYfSdoQ6V2Hwu9ca9UG463P8iRDiCc1WKCt0Wk
	IhPxd7Xac7T4RqyGxLCEIZGV9w2P0k//Q80fb67oEzM990gDG5k5bS6Ea1YJo38URqypzfLupIKLh
	UGIUA4vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXUcZ-00000007209-1GIe;
	Tue, 14 Jan 2025 00:17:27 +0000
Received: from [129.204.178.38] (helo=classfun.cn)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXUa7-000000071YC-2FnK;
	Tue, 14 Jan 2025 00:14:57 +0000
Received: from bigfoot-server-storage.classfun.cn (unknown [124.72.162.122])
	(Authenticated sender: bigfoot)
	by classfun.cn (Postfix) with ESMTPSA id 29EE978841;
	Tue, 14 Jan 2025 08:14:45 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.11.0 classfun.cn 29EE978841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=classfun.cn;
	s=default; t=1736813687;
	bh=uXQUmf+sUnAZX17QEqWUsAvmffSZN44xH/IxQSgjoig=;
	h=From:To:Cc:Subject:Date:From;
	b=qakSak/b1OejsADI6HfazO/Cm+reAR/lopzCErBFyXv20Ks1JTEgRZ0awRokF6NEk
	 9/lZrl26bRS5ujcR+e7D0ZdYKX2nn60Bi20UzuzxX5pRnZKVdZmmcx1PBihdxGpU6L
	 vnatJjoo/DBWAWAnX7g67LsC7w1i6kg4i5uOy9oE=
From: Junhao Xie <bigfoot@classfun.cn>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Junhao Xie <bigfoot@classfun.cn>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Dragan Simic <dsimic@manjaro.org>,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/3] Add support for Ariaboard Photonicat RK3568
Date: Tue, 14 Jan 2025 08:14:08 +0800
Message-ID: <20250114001411.1848529-1-bigfoot@classfun.cn>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_161455_977857_90F6F4A4 
X-CRM114-Status: GOOD (  11.03  )
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

Add dts for Ariaboard Photonicat RK3568.

This series bring support for:
* Debug UART
* SDIO QCA9377 WiFi and Bluetooth
* M.2 E-Key PCIe WiFi and Bluetooth
* M.2 B-Key USB Modem WWAN
* Ethernet WAN Port
* MicroSD Card slot
* eMMC
* HDMI Output
* Mali GPU
* USB Type-A

Changed from v1:
- remove some general nodes (firmware, ramoops, reboot-mode)
- gmac1 change to phy-mode rgmii-id
- corrected some regulator to be closer to schematics
- rename rk3568-ariaboard-photonicat.dts to rk3568-photonicat.dts
https://lore.kernel.org/lkml/20240904111456.87089-1-bigfoot@classfun.cn/

Changed from v2:
- remove unused headers
- corrected some regulator to be closer to schematics
- remove usb_host1_ohci, usb_host1_ehci, usb2phy1_host that have no connection
https://lore.kernel.org/lkml/20240906045706.1004813-1-bigfoot@classfun.cn/

Changed from v3:
- corrected some regulator to be closer to schematics
- changed to using clk32k_out1 in xin32k
https://lore.kernel.org/lkml/20240911122809.1789778-2-bigfoot@classfun.cn/

Changed from v4:
- corrected some regulator to be closer to schematics
- corrected some label to match node name
- use resets props in phy node instead deprecated snps,reset-gpio
https://lore.kernel.org/lkml/20240914145549.879936-1-bigfoot@classfun.cn/

Changed from v5:
- resort regulator nodes
- remove dr_mode from usb_host1_xhci
https://lore.kernel.org/lkml/20241108031847.700606-1-bigfoot@classfun.cn/

Changed from v6:
- fix property gpios to gpio in vcc3v3_pi6c
- rename rgmii_phy1 to rgmii_phy
- change address from 0x0 to 0x3 in rgmii_phy
- add link to downstream board dts
https://lore.kernel.org/lkml/20250112073344.1976411-1-bigfoot@classfun.cn/

Junhao Xie (3):
  dt-bindings: vendor-prefixes: Add prefix for Ariaboard
  dt-bindings: arm: rockchip: Add Ariaboard Photonicat RK3568
  arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 591 ++++++++++++++++++
 4 files changed, 599 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts

-- 
2.47.1


