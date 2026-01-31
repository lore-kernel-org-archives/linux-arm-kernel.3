Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B300D79751
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 08:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E+EsTuEHR174ouDai6pNiVFrO9AkbuLjvnwAftkox8M=; b=xf7r2N28riBcypkreRkiHICVfF
	LHyeazZBv7JfIycq5cOIkNqDyFqSCEGG8zJC9zGrTQNGdo1sfVlcLtDiZlEjWDDs+zjCAs7+ypX7N
	znwKpQaS1SAjbcWKyTmiOlm7HzP8G+6MRBWHvBUOUkyDX6vWrLkwQ/eza9FDJbiVTDESU8kATwTEE
	YNRMI8CrfFlQ7DKLAWmvKnQp599pv72ubjEOuuijjvyasuw7LoK+sZ30SrY5c7dva8WoSXGaPclDQ
	/9mB0DYGwZj7VSQnDUaARbr8sB2N7wqPW+ie3iVUAJbW4326KRexfzK89tgfbKh6Rz8IqQM7BMQzY
	WT4y7bnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm68k-00000002PZV-2HJW;
	Sat, 31 Jan 2026 08:15:34 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm68i-00000002PXv-1MR9;
	Sat, 31 Jan 2026 08:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1769847301;
	bh=E+EsTuEHR174ouDai6pNiVFrO9AkbuLjvnwAftkox8M=;
	h=From:To:Subject:Date:Message-Id;
	b=nPCQ8KhyO2R7u/A8MZBV9XNgrHsHk35HVHY1qU/bKp07FJGdjr+QvD9Lw75f17/qQ
	 5eQ0ptOUbvl5Gc4mkneb1P/DDltgS0FGUg5+Cd1JBpcEs1gcRAGG743JA93PX207TZ
	 i/Hs2cudHZPhlrbNJ8wmwA2kY/r7vAFFLSCE/Ef0=
X-QQ-mid: zesmtpsz2t1769847293t4e1f5b86
X-QQ-Originating-IP: 0sgqZlXrDgZhvFh1jB4WEJqQhQYA8i7Qa4ClPeX9O+g=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 31 Jan 2026 16:14:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9155805342981546293
EX-QQ-RecipientCnt: 22
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Hsun Lai <i@chainsx.cn>,
	John Clark <inindev@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] arm64: dts: rockchip: Add rk3576 evb2 board
Date: Sat, 31 Jan 2026 16:14:36 +0800
Message-Id: <20260131081438.100-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OXI3+eQbSeaRuvBfanxfX0KjpDdGTDhCFZoh+vWVCigc/c5dbU0Y/qOq
	/L7ZJCQ5XSyFlfXRwkxx3XOI7mgHtcDLlQF3LlFqa6hM2JYounrxCjlMGbyWEIeeDvYgWNo
	Gzx3q/z32DRbhgOndROx5dK2O+SWirh2sdA1ao58uleoI29my4QqWh5IKHePewEMOIQR6Mg
	bv5tmYaIhXDuYsqcErzIa+27ktAlktrF5XmwwXsNoiKVKGzlQ70A3wSE14rEAJFsSJfd48E
	sXfUEMFY8fMgcalqUNdkIu/NI7GZYfftDuwfIR/dtEEQGxjOILXfN0RRNc001hnlsKRcF2L
	cwzyOWCOWLnxMsWGK8yyJ20nJwrZRqgNBfx9enbZqdpa3vwzHvkowgsHR+vqBkNpRz+zNgl
	GiaSpUfn3vpLE2ZqKY2wUlde1c9FnmleDnx4/YfyqjF/NvMN5ipWAxSKe8rSu8Ec76plM0V
	8G2OoNFxyYkNe4SZUQC6QFeENjLrvOdZmLH/ML5YxboBbutuR3X2uete7MtTBajZQkywE3j
	jWBUjlObmlOc96AfoTYa+scJymz3hiBH3fqwnV7JYFlK0Q2PrzYZF1phxV+edPUJJyM4Tr7
	kYpujyZnctmPkx9xQoMndzNZxXl7mlx+xegKCAWVeLLrJkH49jcXi3Y8b2xhpFHiU7gq4z0
	sB/8dRwnlcyrsPwVT6+32A8K8dHHniJt7Ff6PvFeZgFzTe/nPGGLXlrOz6AR0PWDF9U/DJ5
	tla2Kh8mRwjokI0nXSJ+IRq2M7xH731bCrmvt+GdK8Z+LB21PXoOebErFInKpULiBZrLoio
	FuNOYm1SDLlAcf0Rv1UfTb0OGSmcyZdYkRnKre39MD+d3bBRIiuun3pdmvk0OFqGg98a6mK
	DOPW4owNGWBEtpre+8vr6j6kFfP5psjBApAsaqlKOJKReizO89aTA3xPD5wiVeuprnYcw18
	aDF3k7Dz6L+RtBK8/PtecoqGyvM1LCl+6pFi+ftnCt7cNDr+CHA5SOwM3iIKboSaqwDcu7x
	uJBTv1VUglJvrg7CZU9zV+/uzggBiuap8xJLLxlznYgpkh+ZNZ
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_001532_750275_249E63B8 
X-CRM114-Status: GOOD (  12.23  )
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

Hi,

This series add support for rk3576 evb2 board.

General features for rk3576 evb2 board:
    - Rockchip RK3576
    - LPDDR4/4X
    - eMMC5.1
    - RK806-2x2pcs + DiscretePower
    - 1x HDMI2.1 TX / HDMI2.0 RX
    - 1x full size DP1.4 TX (Only 2 Lanes)
    - 2x 10/100/1000M Ethernet
    - 5x SATA3.0 7Pin Slot
    - 2x USB3.2 Gen1 Host
    - 3x USB2.0 Host
    - WIFI/BT
    - ...

To make the USB hub work, the additional patch from usb-next is required:

[0] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=00fcc9c86a134c488fd857b5460a7925228272c1
[1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=fa3bb5011f33cccd246072954e64d64483d0d774

Changes in v5:
- Link to v4: https://lore.kernel.org/all/20260121015357.291-1-kernel@airkyi.com/
- Remove disable-wp for sdio.
- Add vmmc-supply for sdmmc.
- Remove tx-internal-delay-ps for RGMII PHY.

Changes in v4:
- Link to v3: https://lore.kernel.org/all/20260112022823.91-1-kernel@airkyi.com/
- Move the USB hub code into a separate patch series, and that series have
  already been merged into usb-next.
- Fix supply and reset for usb hub.
- Add cd-gpios for sdmmc.

Changes in v3:
- Link to v2: https://lore.kernel.org/all/20260107070322.323-1-kernel@airkyi.com/ 
- Add binding for WCH CH334/CH335 hub controller.
- Add alias for mmc.
- Rename some usb vbus regulator.
- Add DP regulator.
- Change gmac phy-mode to rgmii-id.
- Add target-supply for sata.
- Change vcc-supply for ufshc.
- Add usb hub.
- ...

Changes in v2:
- Link to v1: https://lore.kernel.org/all/20260104023703.118-1-kernel@airkyi.com/
- Enable hdmi_sound and sai6.
- Add more cpu-supply.
- Use regulator to control sata power.
- Remove "cap-mmc-highspeed" prop in sdmmc.
- Add regulator supply for ufshc.
- Add the missing vcc3v3_hubreset regulator.
- Add otg capability for usb_drd0_dwc3.

Chaoyi Chen (2):
  dt-bindings: arm: rockchip: Add rk3576 evb2 board
  arm64: dts: rockchip: Add rk3576 evb2 board

 .../devicetree/bindings/arm/rockchip.yaml     |    4 +-
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3576-evb2-v10.dts     | 1020 +++++++++++++++++
 3 files changed, 1024 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts

-- 
2.51.1


