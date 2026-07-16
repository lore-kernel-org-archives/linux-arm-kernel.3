Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DF3C44511
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Mime-Version:Subject:Cc:Date:To:From:Message-Id:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZQtPPVGvllEpvHbONqrSqV63ntNhTs4cpIf2KvSgDt4=; b=SIegrVLAQrdgrTrX5uMKiYfo6T
	nqeCixAnYY0jVeqtOxBcUIhC6JdDLDR4Ngb0pEOtn09RthbCv4vR1Ox6whJiacwN65Bw2e19mkONY
	r+WtgJpoAEEHPKH0M4SbqDeQ2xoTcavUmJLGmtynv/5uyUn6Fu7K5m0hWrGTr31PAmJtAFrjx+gl2
	aRKzIJvc29C9GGYSgFX4IXexgcHU7IzbZJBNLDuAjdDBKKjeeL7fYC+xm5+V+tHP6dMWj8uARoMXe
	TSpGoH2/gfVIguQs+ZGXuOy/Tx1BIiJ53tpeAhdKhCKISyY9L9U+m7idBaXdVOJED3HAheW5qusCe
	vTT4BpHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG0j-0000000GaT4-3gn8;
	Thu, 16 Jul 2026 06:55:57 +0000
Received: from gy.d.sender-sib.com ([77.32.148.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG0g-0000000GaP2-3GyL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 06:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
 q=dns/txt; s=brevo2; bh=ZQtPPVGvllEpvHbONqrSqV63ntNhTs4cpIf2KvSgDt4=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=IWtGK1fCXHqyeHD0eQJTELt4RLo9qyfRIlNfcAtnFmbtNlSF6OV5y/9jaz2niMyh220oqxHxd12r
        9AI1HPZjGRMqE3zh6OeOPqbhZ2342j/p6bTFtt88GDnTqZ35eNlwtTARfu3eGJlMAwJrO8YyX1Xc
        WrjY9e71xeGixiKQRADPopJXXL8puRHA7lXgNGkMs4ZU8U2tFSVFinHk2dsX8qSkX5Nsht9STZCi
        swDof2PUhRY9n1EZEjT1qehk1t1sEWjhkDy5YK5FHIOqSIyJF+WnPQV38O+SLSmw4FwxQ4PK+Crp
        j5s7ub4UehaViBvp4zgv+7LpuwEVD3SWxf0lKA==
Message-Id: <cdc0bf39-27f8-457e-bfa7-5648ab788834@smtp-relay.sendinblue.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.25:11677070_-1:11677070:Sendinblue
From: "Jiaxing Hu" <gahing@gahingwoo.com>
X-CSA-Complaints: csa-complaints@eco.de
To: <heiko@sntech.de>,<robh@kernel.org>,<krzk+dt@kernel.org>,<conor+dt@kernel.org>
Date: Thu, 16 Jul 2026 18:55:46 +1200
X-sib-id: Qp9pp4Pfpp60EQ6QCWvAttrFfPYEUK3HhWajGrqXB0_OXQFyRdH191kWUjrBta3Gm04HeRErNb-Bfa7yTDkfj-9haJ8kHacTogvVWHHKITKvpDnsFS6DgD7vOukfazzhdtp2jcbHXaFXjFQZ1XW2ERWqhdTADfoEiNuLvUf4nmZ2HbEDPpbAWHNthE8O7RGEu7o1
Cc: <devicetree@vger.kernel.org>,  <linux-rockchip@lists.infradead.org>,  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Origin-messageId: <20260716065548.2466198-1-gahing@gahingwoo.com>
X-Mailin-EID: NDg1NjE3NDAyfmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZ348MjAyNjA3MTYwNjU1NDguMjQ2NjE5OC0xLWdhaGluZ0BnYWhpbmd3b28uY29tPn5neS5kLnNlbmRlci1zaWIuY29t
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
X-Mailer: git-send-email 2.43.0
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_235554_972328_6B250E59 
X-CRM114-Status: GOOD (  13.00  )
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


Add mainline support for the ArmSoM CM5, an RK3576 compute module, and
its CM5-IO carrier board.

Patch 1 adds the binding, patch 2 the module dtsi and the carrier dts.

The on-module YT8531 PHY has no crystal and needs the SoC 25 MHz
reference clock (clk_mac_refout). Ungating it for RGMII needs a small
dwmac-rk change sent separately to netdev [1]; the clock is optional so
this DTS applies without it.

Tested on a CM5-IO: the YT8531 is probed by the motorcomm driver and the
link comes up at 1000 Mbit/s; RK806, HYM8563, eMMC, microSD, the USB3
hub and the PCIe root complex all probe. dtbs_check is clean.

I have moved to gahing@gahingwoo.com; v1 was sent from
huhuvmb88@gmail.com. Same person.

Changes in v2 (reported by sashiko-bot on v1, thanks, plus what
dtbs_check found while fixing them):
- Type-C DP alt-mode: name the altmodes child "displayport" and make
  svid a /bits/ 16 value; drop the undocumented svid from &usbdp_phy and
  add the missing mode-switch.
- Move the FUSB302 role-switch endpoint into the connector's ports; the
  fusb302 binding does not allow a port on the device node. Rename the
  node to usb-typec@22.
- Drop the ES8388 node. It was disabled and its compatible was wrong
  (the binding wants everest,es8328). The audio claim is gone from the
  commit message too.
- Drop the unreferenced gmac0_rst, bt_reg_on and wifi_host_wake_irq
  pinctrls, and the WiFi/BT claim that went with them.
- Rename the wifi-poweren-gpio pinctrl node, it collided with
  gpio-consumer.yaml.
- Describe the PHY reset at the MDIO bus level rather than with
  snps,reset-gpios. The snps properties are deprecated, and a per-PHY
  reset-gpios is applied only after the ID scan, which is too late for a
  PHY that boots held in reset. Confirmed on hardware: per-PHY reset
  leaves the PHY dark, the bus level reset brings it up.
- I did not add vmmc-supply/vqmmc-supply to the eMMC as suggested: every
  rk3576 board upstream uses full-pwr-cycle-in-suspend without them, and
  dtbs_check does not ask for them.

[1] net: stmmac: dwmac-rk: enable the reference clock for output mode

Jiaxing Hu (2):
  dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
  arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO

 .../devicetree/bindings/arm/rockchip.yaml     |   7 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-armsom-cm5-io.dts     | 401 +++++++++++++
 .../boot/dts/rockchip/rk3576-armsom-cm5.dtsi  | 564 ++++++++++++++++++
 4 files changed, 973 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi

--=20
2.43.0




