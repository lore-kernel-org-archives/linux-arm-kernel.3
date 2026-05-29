Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB2DCD6E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 19:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Qap9xu0frJwoROC4Fz1lvaI3J69wr8XiXfsvmPF6zc=; b=koc95yWh8QNSAM4xnsGhWp5veV
	YGBVFqCflBGxTF8hVZGgfZPBrJCkFsSrx6UQD5SZ4YgXLpMnSaNOdGcK6hfnxU+QkTHQZdl2TAupQ
	TWJb78nD0i+iugQjtJkanjdug9NAN+cwqCIzOcfpQr1BegSnHk1QN27EO32C2yITfbK+M858NbpiI
	nqL0g8W18AV7it9sSEZddmJ5fpeFBpSLgns9b+53dqPYJ/k+kwIgr36umoL2adERrknvjy3Ce2LYI
	daE8fKgc413JK+BoWDfSGh7cn7RCfys0Pvd9OmLipI/WS5qEUrINhwniyD843P1V3r4erurPoRZEd
	KMthh0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT2VC-000000089pn-1Kle;
	Fri, 29 May 2026 19:04:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT2V3-000000089jI-18oW;
	Fri, 29 May 2026 19:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=9Qap9xu0frJwoROC4Fz1lvaI3J69wr8XiXfsvmPF6zc=; b=VfAU+7uWANC9Scl9/1zcBQzCYp
	1nm7JY/CKtffuKPdCb1qVeW1PjFlTPCtgTjQOWeTsRJIS2/Kj0VuvOKytaH/ImvJiVKAY5n7klYY/
	ui6QoJcg5/evyTCB3fLN6Vky4LsQD0fWSodbZCfUJjFH4Sh2Kp5Aly5/vyXo1JCcwiE96JeKGlvv8
	8pd7jwyHjbBFi6VD3ph8+tfoWBbBL8oURxbvGPx/wEZ+ChaujSIkpCs5MMtjf0qzpUA023eWMMuir
	mhEShrLXrWXnCelgdP1QzjAYVDwgeP29b1VIdi7GMhZbwo4xnSnTj5YK87dXEyzy2CtiyBH7bWMQZ
	ncmUp98A==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	amadeus@jmu.edu.cn,
	jonas@kwiboo.se
Subject: [PATCH v4 0/5] rockchip: add USB nodes for RK3528
Date: Fri, 29 May 2026 21:03:50 +0200
Message-ID: <20260529190355.4148175-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_120405_377897_6CF84AD5 
X-CRM114-Status: GOOD (  10.80  )
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

This adds the USB nodes to RK3528 and therefore needs both the dwc3
compatible [0], as well as the phy support [1] to be merged first.

changes in v4:
- phy-supply not vbus-supply on armsom sige1
- adapt e20c commit message explaining the hub
- describe my changes to the original patches inside them

changes in v3:
- moved snps,dis_u2_susphy_quirk to the soc dtsi
- describe both usb2- and usb3-phy in the host0
  if boards only wire up half of the functionality, they get
  to override the phy-properties - as they already do
- add vbus-supply to armsom sige1

changes in v2:
- split off from original series [2], that added all 3 parts

[0] https://lore.kernel.org/all/20260505164509.3254707-1-heiko@sntech.de
[1] https://lore.kernel.org/all/20260505170410.3265305-1-heiko@sntech.de
[2] https://lore.kernel.org/all/20250723122323.2344916-1-jonas@kwiboo.se/

Jonas Karlman (5):
  arm64: dts: rockchip: Add USB nodes for RK3528
  arm64: dts: rockchip: Enable USB 2.0 ports on Radxa E20C
  arm64: dts: rockchip: Enable USB ports on Radxa ROCK 2A/2F
  arm64: dts: rockchip: Enable USB 2.0 ports on ArmSoM Sige1
  arm64: dts: rockchip: Enable USB 2.0 ports on NanoPi Zero2

 .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 25 ++++++
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts | 29 +++++++
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 60 ++++++++++++++
 .../boot/dts/rockchip/rk3528-rock-2.dtsi      | 17 ++++
 .../boot/dts/rockchip/rk3528-rock-2a.dts      | 11 +++
 .../boot/dts/rockchip/rk3528-rock-2f.dts      | 12 +++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 80 +++++++++++++++++++
 7 files changed, 234 insertions(+)

-- 
2.47.3


