Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6C1C44511
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/O57VNU8BraXBD7yfuRNkzyKwzILilSv8tk8HPBEj4=; b=YVd8PvqGc/NPTtoSIzvfKczV77
	mMxOH3J0aBXtr8HUwfR+UbYXQXtXqUIJRWHQlAV1TH9Gre8Or/3P8qtbdCyQrBb84BUiVASikvft7
	TXHgeIKY4tAMwbpgRTkDrMscxXs4aTsCROmgJW0M9D6TAgH9R9klsgn7bolor9IBgUlF/xWghddyH
	JOCKZM/fcAJNviOK7pg2JetDkHMypucPqbZmaG1TBMKA8FgBpLWnEHrM8jyHDjYdDq+klOKvLLIbU
	xUFK8+ye5gSie3935RvKemWo82OrzdtZlWT+N6ZJ/GrDQqeJNa6Rebc/Cv706OnT33mSOQKyD1wD7
	E64tngiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkP7B-00000000Bdq-2qQI;
	Thu, 16 Jul 2026 16:39:13 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkP78-00000000Bcn-30f4;
	Thu, 16 Jul 2026 16:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784219940; bh=v/O57VNU8BraXBD7yfuRNkzyKwzILilSv8tk8HPBEj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QrmRJhAjL6TBsupCzI7K2WAkk6L6pMe/ndS2W8Btc7SMXdWChc3uisfWNDh+Z9AI6
	 fGFu/C287TU40u7scv/PZj9Ep1INCRS0p7eXeOdHNxesBNVm9yougc8cJLTnSJwJHt
	 U4NnqDKhVFMH+lYKwjNiD8qv9J8csAGBsn9c04VM=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 9B93789D; Fri, 17 Jul 2026 00:38:57 +0800
X-QQ-mid: xmsmtpt1784219937tjlubsc0q
Message-ID: <tencent_BF0C040955E894BCDDCF0A9C8169306DC70A@qq.com>
X-QQ-XMAILINFO: MzNwb/pqyJTkn2T2DeGWmdRsr2uACT666ZtiofJzN9NjNFHUNfJS/3YvxS0xoa
	 bQBGYsiwN8jt0SRgbFZZ1i6PveNdWfy//i6xURbZWg24Vf4qu0cna5b4GVJw9dfhqJX3U0ObRlRI
	 gBXy3pICJkpXy6AcraaQVBKL3at9saPX0MevVtX4Y/h1TrGvMya7dNc3f5VEksG4wAIxOrbiwosp
	 OYEn5ReYHcoOFresCwaiWMv9K4QEgbKHNhLSQr+Wru9c5U/QU5KQ9u109k9+pDRLxoSpsWvnPtQD
	 UUC90fL4QnhTH+sXXDMPyTjkEWDGiDKk50qsbxdwCKoZ1XPG0D9Jagr+PndGktHN6Fk3qlmYc0Z+
	 Zky8y7BST5MFIQ5TW1pfx2z65r1YNDzaNGFvN8gpKeK0l0ny0N0zDKGjUfbR2J5oCNDWwVJ5mKAV
	 LucjGJbFYEPHXQzWRR2HXwrrUxfqi7XucNYbjWEbqNK4qYyiP5u0Ux32KET+/IIXemwpDKxfKEIZ
	 Ls7mpf9D7gzA8zFQAOeq+x2DyfHIJXDxLW4iat7RQPVZCXLs5KPOK6WSBj+A/IqN8H3xxwVwBolo
	 kqLKoDaokLiegDikJHhlFXeOt2i0kmX5MXBkLYoFyMD8FSzMOFsFkmEecf7Wlx56e1xQiIfaqlAz
	 WE/AtGL9Jt7/ngaJXx+dNo+EhMIak7DzRoRiUycZI1uVJiwYnt9cAUJAZyTWrwgXG9kllasU/yRv
	 My+Sm46rYBOP7cATjWpX8ZWqk2/J+v4mKezVkSMCK2XtbJiBS0BGE+Zi766WRpykTS9XZjVCoZqS
	 3vbRi1CSGmHm4p7kGrmYsNFLJu1/sAIQSSXMh8sDe/lA0zplYIGo0ssJ7NwYuFRyPrS7CtcL3zTS
	 cWRFyiIRr2TMC2kyfnmjBNNCAvVm8v86LK485odBW561TH0N8eDiixKSfbgQnxAgVFlc7KTllKIC
	 mjh8Ib1eXlHZQDPpxtxxuZ7YJGn52BpBCsNWGLM5UxZlHMc8mXFfgR74QoJPuZbRxaHv6RsvcI3B
	 uGWOcZQrBE2aUWN4hIZiF7PRLszds=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Pufan Jin <2254650260@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add support for EmbedFire LubanCat 4 board
Date: Fri, 17 Jul 2026 00:36:30 +0800
X-OQ-MSGID: <20260716163632.418500-1-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260705135014.1004166-1-2254650260@qq.com>
References: <20260705135014.1004166-1-2254650260@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_093911_103284_193E314C 
X-CRM114-Status: GOOD (  14.66  )
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

The LubanCat 4 is a single board computer from EmbedFire based on the
Rockchip RK3588S SoC.

This series adds a device tree binding compatible and a board DTS
covering the peripherals needed to boot into a userspace from eMMC or
SD card with networking:

  - UART2 debug console
  - RK806 SPI PMIC with the full regulator tree, and RK8602/RK8603
    fan53555-family supplies for the big CPU cluster and NPU
  - eMMC (HS400 enhanced strobe) and SD card (UHS SDR104)
  - GMAC1 with RGMII PHY on MDIO1 (Realtek RTL8211F, described via
    the generic clause-22 compatible)
  - HDMI0 output through hdptxphy0 and VOP2
  - PCIe 2.0 x1 (mini PCIe slot) via combphy0_ps
  - USB 2.0 host ports and one USB 3.0 host port
  - HYM8563 RTC on I2C0
  - On-board heartbeat LED and PWM fan header

Peripherals that require drivers or bindings not yet in mainline
(ES8388 audio codec, FUSB302-based USB-C, MIPI-CSI, NPU/VDEC/VENC,
DSI panels, IR receiver) are deliberately left out and can be added
in follow-up series.

The board has been tested on hardware: it boots to userspace over the
serial console from both eMMC and SD card, and Ethernet on GMAC1
negotiates 1000Mbps/Full duplex with phy-mode = "rgmii".

Changes since v1:
  - Use real name in From/Signed-off-by/Copyright (Conor Dooley)
  - Correct PHY identification: board revision 20241026 uses Realtek
    RTL8211F, not JLSemi JL21xx as stated in v1
  - Change phy-mode from "rgmii-rxid" to "rgmii": the PCB provides
    ~2ns of trace delay on both TXC and RXC, so neither the MAC nor
    the PHY should add internal delay (Andrew Lunn)
  - Drop tx_delay property
  - Add comment explaining why "rgmii" is correct here (Andrew Lunn)

Pufan Jin (2):
  dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4 board
  arm64: dts: rockchip: Add EmbedFire LubanCat 4 board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3588s-lubancat-4.dts  | 786 ++++++++++++++++++
 3 files changed, 792 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts


base-commit: b143af2d0da7b01f82f8ea795a0623effab394e7
-- 
2.55.0


