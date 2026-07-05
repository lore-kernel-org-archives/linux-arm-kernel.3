Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF4BC44502
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eii7pRqmdDKs+6pukJXm2+s7N+UcgUU6RSz5gucuVf0=; b=qS+ynu3qDKaJ1up62Y3reyrCZZ
	PSiH2V/nbiKzWrd3kmD1KSqdEUlPrrHOmnd+Bs26D5ZhlUNcJ0iYgtZg/QyLVgBLY1c4DzotFTso4
	qYDXYaRxFYTCgIiTssXbdwW5D2lCDd2MeGAlRBrV10y+n2gNrlB66S3MyMKg1HhuziMWjb/+dwwEK
	mipAr+Z5ed4TDV1jjwLY8brKebnJT4Xlr+bWQ45NYTT+9iYvxB8oWW1OHh5kV0kIP7OqP9YVHgYct
	ChVnjUtT9zzvPZ03Y/QWaNSlpvBUeEI5cMH+Bi6/d34DEM4uTLRg2iu2DjVUoCHV+QE/AYaMgSgqs
	l0vOXYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgNFE-00000009MJQ-1ebg;
	Sun, 05 Jul 2026 13:50:52 +0000
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgNFB-00000009MHv-1RYs;
	Sun, 05 Jul 2026 13:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783259438; bh=eii7pRqmdDKs+6pukJXm2+s7N+UcgUU6RSz5gucuVf0=;
	h=From:To:Cc:Subject:Date;
	b=aoD1QXz95A9Awq1Iv3UEPQVF5vu55K0JhXGSLdaCY2g4bhQdIWjW4G3UQzdgqYRpp
	 PX4c/4hXQdr6NaCxMjcZxWS0KLlZ3yF7+gQOErnJoeRZvmjhbItWPbXgDiDh69HD/p
	 nLqF3OJTBSREIflXWOk7Cwi33fi1Adpexe9TJZ6U=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id CA0A8E0E; Sun, 05 Jul 2026 21:50:32 +0800
X-QQ-mid: xmsmtpt1783259432tszyimyia
Message-ID: <tencent_749430DC83091C814933F9C6080491564C0A@qq.com>
X-QQ-XMAILINFO: MQAOa38Yz/8/w3tS9QLsBMsPGP8v0YHyUR1ulMTfgdIQRKcGxeyFyqmWzs8bva
	 alatwwlh1GoJexJkzsi650qZYQCSvstKpjqI4JCsrMbGs1gdfzHhvnKHeeq3zzkn6bWFphY5mIFb
	 nGLC4o8iXiCeP42Ao+y6bMdyKTwyKl6FIcrXuYzcInaR5LgC11VgkfO25lArITI84J99aD9z/O3P
	 /JuDZgBh10sitllD3LFi/rf2KruAKtBV7cfy6kQTqj1+bmz+tCpoZ8uihkfJ/nNAfBVOLR7dFxLU
	 gNtiiuod4z9xWwAelas5bTNYrBQ8yB7OWz/YcD7g7BexpBGqk/mw49mIinANRN0h/7TfUcd2AHBS
	 sPLP9EwZH5Eg0V3BHvFSS5WeyMRMhGKqw3OfQfu/XdHFm8N7e6BcOsPt0UIRSAUYnWhirXjXYCHh
	 oW1HM4uy045rOJAjNvUET4Qcpt5MmWUcrHXW2wsQxUZvtIglO11smCNyQ2EIyRIM2rdLp5naE4mO
	 jzd9dr0qMPabQ9aDJYyM1qhOfXnhJAAeX2YiDXCB/Trinfl7xuN345leXQVgAQy5O4kLv9NUvt6g
	 4eQc2LaKC1gDJtr4HJswuekCvXt5YXBJ7ys7JiiFcUPM083CxmB/bNY3lNfa1VTqx3+/TZEtQ3bq
	 Wcr+u76+HHsn/zoy98ZNh4pHa1fmjpjomXKvt/BHxitUgdsJEa4uTfz74AVe1SEP/6ABG/99NujN
	 1lfUOY7pJZ4iWOGFd4tJBxYkcUd+X6EIcbfsDPA/CM0FnHhS74k6OiaoI8W1kNJm2O7LaCqobOOm
	 FJxhwe5aopocISASLb5fpE//ehs239slHo+dYtU6IfLw7H8hZ07OxIp4geL02QE11YeArWh/NQYQ
	 fl4mIpbHKVTp/LnfWlmZq6A3qJ679GKaS5WoAopdLThr/4dq9IGgT1XS7nbgkZSCMyZTXmSi/Dse
	 4T29kn88/we3xRnJOsYrEphNBLSEOGJg/VnB7ckkywa9VGSPQrT5DE3PYs6BVNotakRhGpzluBCM
	 mbojQ5/0rVVCF5rh3/
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: LemonFan-maker <2254650260@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add support for EmbedFire LubanCat 4 board
Date: Sun,  5 Jul 2026 21:50:12 +0800
X-OQ-MSGID: <20260705135014.1004166-1-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_065049_918050_A1652253 
X-CRM114-Status: GOOD (  11.96  )
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
  - GMAC1 with RGMII PHY on MDIO1 (JLSemi JL21xx, described via the
    generic clause-22 compatible)
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
serial console from both eMMC and SD card, and Ethernet on GMAC1 comes
up and passes traffic.

LemonFan-maker (2):
  dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4 board
  arm64: dts: rockchip: Add EmbedFire LubanCat 4 board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3588s-lubancat-4.dts  | 782 ++++++++++++++++++
 3 files changed, 788 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts


base-commit: b143af2d0da7b01f82f8ea795a0623effab394e7
--
2.55.0


