Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B100C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 09:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4+SDHkGQub2M803DuAn/oXEZ4KRv6c1CjhqwzQNrquo=; b=PenuO85QyRI4S7xQupPXba3gMt
	ynAR1xB1+8zPod8fy3vkY7giGV+Vh3+DMD7yAEhJdiT3xy4+b1buIXYUsEqnmQ1msoYL68MEjSHxX
	hTcABI4Mo80AvLIQcaJ15EO4KQoPTN3SkXRqMBoK1UCGbPJC5d3Ta9jSNc1k6UmLTabkKjYU+FNLQ
	WkxjnOlUsKz2o4YMSdnx9s+IaK+bdFnqy21jhiDHsbbkPVYhZKkl13XbPhkKQ4a8YaPGC89bQx94a
	4o5525XQVnHUrSn53x5VACz/WxLmKSTqy2Q5St0hrUlOcQN9ihLDhLXQJkNYT+glT63/scEwIKtqL
	+koJ3ZHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ybC-00000003J7C-0MFs;
	Sun, 27 Apr 2025 09:46:58 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8yXL-00000003IgB-2U5X;
	Sun, 27 Apr 2025 09:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1745746952;
	bh=4+SDHkGQub2M803DuAn/oXEZ4KRv6c1CjhqwzQNrquo=;
	h=From:To:Subject:Date:Message-Id;
	b=b88ElFoZiRbVWjWFbhMGfqILv7kpqO7hA4MdTDLovooj5jrwWidKLYU+Zh2MB8vBh
	 5nsUso1gBTMzY5/fHVkVM0clNoX58/YuKypvZHm+cU4gIEKY8blNQsnMFt8z3oUbzh
	 CWx9lwCZcYeBBSsKhQIQROeJ/xvTUI2Mhvfnx3Qk=
X-QQ-mid: esmtpgz13t1745746944t8989c152
X-QQ-Originating-IP: y6iJRkIkSVZWqfIl5qBr3OIRxyRvJ6n5dpIC3CBmOXE=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 27 Apr 2025 17:42:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12595977349983944088
EX-QQ-RecipientCnt: 20
From: Chaoyi Chen <kernel@airkyi.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add support for rk3399 industry evaluation board
Date: Sun, 27 Apr 2025 17:42:09 +0800
Message-Id: <20250427094211.246-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: N5QhsOwzP0INIoqwFLSoVCKGR9LUgb7tLt/sIpJEhY7xmx1T5J9akfn0
	BoNPeZH4/hJE5f6x0AjWXNq+ZoiPVm8fA3ERVgtsO+hcOHHx91MrAe598d4sQJgB8q487f6
	fXPm2vRGCvpJPd+oSuUojQv3//2jvAocRQ9JIT23aRTJqII0H4o9YbomCnoSNlrzlPDaJl1
	R4fw1pZzQ/G2j01G5mqyfPG6IwyOl6nn3+/zzSL29GQgR5IwpagrKs36FO/Jq4opdqF27eK
	MPUEKg73fca0ZDUj2oPIn+iCpv8PdRZaBxG03yQVjVOeNZyG0XYLcw64G2dnnHFDCpATNpu
	X/k0olJy5sIvTeHkUfhne3INgUoLg+5XFKBdvNX+6RXYZgFtVwNwvg8VklTryrwU+kw2ITs
	QXyYQOup7dxq/zQSOPhQB+sV8/nbrsIBfBrS7cia+a8gWN+C41agxcwSHF/llgFlAfo70HK
	JSBtg0RKizpaZSJ4Wn6wDilsCn29cEW4b4schzBmor/9H6ROcI2x8rvnql4i/JsanuN331H
	cqjPBYTk+ezEPtgLj3x7qw79ASW98QqP+JjIpfZC7c1WTXieBBreg1DBu9xxkpjEALox5GG
	tcoFWh2uJYScu7QW6UzDxhjqIviu9catWcgV3FqzGV1ixhoXK9wcrgSDoCYj0jhJ8LzVyPU
	aK5gblnfWJQ1zukfxO+j/QdLjPBhWDhOD2WxyTucLxwDXctFH1CNwyOlv1v98fmw5vg7VMw
	xsCdK/1QCsiEdjG3BX8x6iKItQc6KuqACBNsmQ0NSFISbTsmCAn2KJ3wjCaa0w5oH3m6KEK
	ubO5qJuQjEsXbqGchSdPwHOgCLQKtj8IJ6kJ1zMau3CBAYfAe319Ff/gX6B5CKUFvVa2hz+
	QPBaT/y/tY+QI8ZvgkUEZ0Tyjpb8S7J1hy1teoikyAA3ItiJOidozCcSa+9T7Rd+CFCgLzN
	o381d5A6VmGXz+GEdu3C4WyjbPJpvHMtjz8YfWiSpcGg5a0DhY3VHUu9ys8JEoSDv7P2WlP
	lCrx4mAe8kR0mrf5k6mrkGV3QbCjY1uuHZnEQo2w==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_024300_478829_5907B260 
X-CRM114-Status: UNSURE (   8.70  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

General feature for rk3399 industry evaluation board:
- Rockchip RK3399
- 4GB LPDDR4
- emmc5.1
- SDIO3.0 compatible TF card
- 1x HDMI2.0a TX
- 1x HDMI1.4b RX with TC358749XBG HDMI to MIPI CSI2 bridge chip
- 1x type-c DisplayPort
- 3x USB3.0 Host
- 1x USB2.0 Host
- 1x Ethernet / USB3.0 to Ethernet

Tested with HDMI/GPU/USB2.0/USB3.0/Ethernet/TF card/emmc.

Chaoyi Chen (2):
  dt-bindings: arm: rockchip: Add rk3399 industry evaluation board
  arm64: dts: rockchip: Add rk3399-evb-ind board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 222 ++++++++++++++++++
 3 files changed, 228 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts

--
2.49.0


