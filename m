Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1FAC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5B/vZzoZuX96M04fD0UoU2qDVSNKydBpBo9Sk/Nr/I=; b=mbnFtGa9mQosyoax1a8HF91S7W
	Drv5lqYbjlVgqtakZNe1ch8BGY4xH6GBNTcAyfQLKLLuWwkr2Y/gJW1zw2fXABM4QS9YPKF16UyiQ
	OydQfHO6CjpcelDH97ksDR+67EjCJDyxX7I28I7ujzHMeF35U5KxQvfwo6fGK5n5txhhWenBbEd0H
	LHufg9NTSeRqBoRi8FGFLjeI+EuatDn6kMQLGajlVuBsq6Iw9E78SMqlDKhryAlzlzibb71c0Fdy4
	Jp0IHTWgirkQM/rue3jkHuueBozm5w6i9vQMfSbngIixpdZcIEmgIfekJzkOTU8WlZzGqYjYEmqWy
	REPVc1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvkM-000000006wp-2mOr;
	Mon, 03 Aug 2026 16:42:38 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvkJ-000000006tm-35OK;
	Mon, 03 Aug 2026 16:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=d5B/vZzoZuX96M04fD0UoU2qDVSNKydBpBo9Sk/Nr/I=;
	b=PGnl9k4WkMoLC5FCZo4lTIJyW763VsnMKlV3cppJoaSrR2D3357lxYfSmwPVC6
	bGqFKmg3YoAlWG4eUt+z575chHwNl5znKjyERwI2fNWrCRHM8epAuF+f0A1uPoW7
	wkFIyhGYcVx0K8W0HxX09hNzcgrZLWNC9wZIO1o4Zfu1g=
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnqYnmxHBqPXceMw--.40390S2;
	Tue, 04 Aug 2026 00:42:15 +0800 (CST)
From: Zhyi <zyheihei_123@163.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Chukun Pan <amadeus@jmu.edu.cn>
Subject: [RFC PATCH v2] arm64: dts: rockchip: H28K: release RTL8211F reset
 before MDIO probing
Date: Tue, 04 Aug 2026 00:42:14 +0800
Message-ID: <178577533421.26919.15449256732994709630.h28k-rfc-v2@163.com>
In-Reply-To: <20260803104646.26836-1-zyheihei_123@163.com>
References: <20260803104646.26836-1-zyheihei_123@163.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CM-TRANSID: _____wDnqYnmxHBqPXceMw--.40390S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFWftF48tF4fGw1kCr47XFb_yoW5AFy8pa
	ySkFWrJrs7KF4F9398Gw18ur4fAanaqr45Cr1Igry8CanxZr15Kr1jgFsxtrWDXr48Cay5
	ZrnIqF1kZayq9aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UgJ57UUUUU=
X-Originating-IP: [240e:390:2ef3:c801:e498:7ace:78bd:b49f]
X-CM-SenderInfo: 521kvx5khlsiist6il2tof0z/xtbC2wchu2pwxOeVcAAA3a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_094236_144565_CE501995 
X-CRM114-Status: GOOD (  11.44  )
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

arm64: dts: rockchip: H28K: release RTL8211F reset before MDIO probing

On the HINLINK H28K (RK3528), the RTL8211F reset line (gpio4 RK_PC2,
pin 146) is left unconfigured at power-on and reads low, holding the
PHY in reset. The PHY node's reset-gpios are only acted upon after the
PHY has been found on MDIO (fwnode_mdiobus_register_phy() reads the
PHY ID before it requests and toggles the reset GPIO), so the first
probe deadlocks and eth0 never gets a link:

    mdio_bus stmmac-0: MDIO device at address 1 is missing.
    rk_gmac-dwmac ffbe0000.ethernet eth0: cannot attach to PHY
    (error: -ENODEV)

Move the reset to the MDIO bus level: mdiobus_register() asserts and
releases the bus reset-gpios before scanning the bus, so the PHY is
out of reset when its ID is read. The PHY node no longer declares
reset-gpios for the same GPIO (a second consumer would be rejected
with -EBUSY).

Fixes: 145d4af4b204 ("arm64: dts: rockchip: Add HINLINK H28K")
Signed-off-by: Zhyi <zyheihei_123@163.com>
Assisted-by: Codex:gpt-5
---
Changes in v2:
- The root-cause analysis and this fix were developed with the
  assistance of an AI coding assistant (Codex, GPT-5). The resulting
  DTS change is minimal and the hardware validation was done by a
  human on a stock HINLINK H28K board.
- This v2 supersedes the accidental duplicate of my v1 RFC sent from
  my Outlook address (Message-ID:
  SJ2PR04MB851017E50140354C2F5B3FF3B5D52@SJ2PR04MB8510.namprd04.prod.outlook.=
com);
  apologies for the duplicate.
- Use the standard MDIO bus reset properties (mdio.yaml reset-gpios,
  reset-delay-us, reset-post-delay-us) instead of the deprecated
  snps,reset-gpios on the MAC node, as suggested by Andrew Lunn.
- The PHY ID is not hardcoded, so boards populated with either the
  RTL8211F or the YT8531 work unchanged (as noted by Chukun Pan).
- Thanks to Andrew Lunn and Chukun Pan for the review feedback.
- Validated on the stock HINLINK H28K board with Linux 7.1.5:
  eth0 shows "PHY [stmmac-0:01] driver [RTL8211F Gigabit Ethernet]"
  and phy_id 0x001cc916; both eth0 (GMAC) and eth1 (PCIe RTL8111H)
  work.
- The U-Boot side (generic RK3528 DT does not configure the reset
  line) is out of scope for this DTS fix and may be addressed
  separately.
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts b/arch/arm6=
4/boot/dts/rockchip/rk3528-hinlink-h28k.dts
index 0ec50e9..7ba3fa4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
@@ -200,14 +200,14 @@
 };
=20
 &mdio1 {
+	reset-gpios =3D <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
+	reset-delay-us =3D <20000>;
+	reset-post-delay-us =3D <100000>;
 	rgmii_phy: ethernet-phy@1 {
 		compatible =3D "ethernet-phy-ieee802.3-c22";
 		reg =3D <0x1>;
 		pinctrl-names =3D "default";
 		pinctrl-0 =3D <&gmac1_rstn_l>;
-		reset-assert-us =3D <20000>;
-		reset-deassert-us =3D <100000>;
-		reset-gpios =3D <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
 	};
 };
=20


