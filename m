Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D03CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 17:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+abTBmbB8/piaQpd4nBLbfx6uLiJ0tuzxThZfR9Zig=; b=gXZDCKCJkKs98HAQz6KghDJKd+
	HTYNgAmJ+vPi41zqVA3hkmQO6LEMg7ziJ+4qzBIH7sU+vmPnZDIcf3V42FpTWOUF/BVVaB+Q/eAAl
	/K2IQ1u+ChDTfQ7ip8czRPMxmc7bASzUh4xSpqVsQo/ZUjVV3kQqK/6b/nxLenVDndQsnI9DyYiAx
	zbT4Y+AA7A3QMp5xhrlF2ErSAtXhqojOeT4VVcAQuJ5hRRkS/M5Zgosr3+9EGxVZSRET4fyNV9Y18
	U2nzSkydLcQWZW6Qrn5eRK8MPrJGs/K4wHUAOUla5KQuFxW7nGdczgxSfQTcoOHkFYOQLeIEckKOo
	HgzwdgqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJJq-0000000H0v5-34YS;
	Tue, 05 May 2026 17:12:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJJp-0000000H0uS-1xu2;
	Tue, 05 May 2026 17:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=I+abTBmbB8/piaQpd4nBLbfx6uLiJ0tuzxThZfR9Zig=; b=qRoLmmUR1ArMjOpEzrLyU3j5ai
	4BPoL18bRZKoBC9vWJMAlSCA3YHOItEDMEaBlP1yWdpdhLIoMvo5Y8u3/bjtW8u2nmtHMYTfz8om3
	eWCWA326PhcAKYYDCjlR5htLPi/Gni26UIN7McwQbqWsIqkoo/FSvhezu4/CMTFcykMcFtHtGGxjv
	FdNAvr30ZHyZO5xCjBHEovj44HwGFlxw1PnQkQejiYeqh+Qsr3M2gUE7msghQny2OKXqC1T1qdVWy
	1zVWeMQM7I5fBz+Cpe++mPuh4hpyXStoOu7HQCoYxm4H0y9c35lo1bSrCO9BlFKPDSZ6hQ7eYXELc
	WefEaFEw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJJm-0000000E83c-3XxP;
	Tue, 05 May 2026 17:12:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=I+abTBmbB8/piaQpd4nBLbfx6uLiJ0tuzxThZfR9Zig=; b=O8/sNvnPsRvzC3YGkftsWhmo+m
	g/3I65a2RulhRWVWE4WwNqhVwBAEZ/lDewGFA79BAcTC4ef2G1Fe/zyfbowvBiJRmmkxL4lAWNahA
	MufFMRzx0UgHQXbCJ2J20nY9XGCAe2YBYIzopZPbB6tE3KcWalXQOIO2ZQaoBl6pSQUbXtrhONWvn
	kDEbXmKvaFuZdFp0N3siftFEhvGVcqlZppiFnqTZJC23sbNWzrlqEq3OiInis4AygP/C7wL+yR9ja
	cqz9iF/g0hXvsnpsjiGutXFpn6w2jC1eMRai42ERAW/oY8Ocd67aL3TVkYp3zX8r1DIHjfIo8JyfQ
	4W8saUwQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] arm64: dts: rockchip: Enable USB ports on Radxa ROCK 2A/2F
Date: Tue,  5 May 2026 19:12:06 +0200
Message-ID: <20260505171208.3267387-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505171208.3267387-1-heiko@sntech.de>
References: <20260505171208.3267387-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_181222_972112_78059F21 
X-CRM114-Status: GOOD (  11.66  )
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

From: Jonas Karlman <jonas@kwiboo.se>

The ROCK 2A has three USB 2.0 Type-A HOST ports behind an onboard
USB hub, and one USB 3.0 Type-A port.

And the ROCK 2F has two USB 2.0 Type-A HOST ports behind an onboard
USB hub, and one USB 2.0 Type-C OTG port.

Add support for using the USB ports on Radxa ROCK 2A/2F.

The onboard USB hub handles OHCI so only the EHCI controller is enabled.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts | 13 +++++++++++++
 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts | 13 +++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi b/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
index aedc7ee9ee46..501a91f4c23e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
@@ -166,6 +166,10 @@ rfkill {
 	};
 };
 
+&combphy {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&vdd_arm>;
 };
@@ -291,3 +295,16 @@ &uart0 {
 	pinctrl-0 = <&uart0m0_xfer>;
 	status = "okay";
 };
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb2phy {
+	status = "okay";
+};
+
+&usb2phy_host {
+	phy-supply = <&vcc5v0_usb20>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts b/arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
index 0b696d49b71f..e23ad1763bc8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
@@ -79,3 +79,16 @@ usb_otg_en: usb-otg-en {
 		};
 	};
 };
+
+&usb_host0_xhci {
+	dr_mode = "host";
+	extcon = <&usb2phy>;
+	phys = <&usb2phy_otg>, <&combphy PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
+	status = "okay";
+};
+
+&usb2phy_otg {
+	phy-supply = <&vcc5v0_usb30_otg>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts b/arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
index 3e2b9b685cb2..e15cae28dde2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
@@ -8,3 +8,16 @@ / {
 	model = "Radxa ROCK 2F";
 	compatible = "radxa,rock-2f", "rockchip,rk3528";
 };
+
+&usb_host0_xhci {
+	extcon = <&usb2phy>;
+	maximum-speed = "high-speed";
+	phys = <&usb2phy_otg>;
+	phy-names = "usb2-phy";
+	snps,dis_u2_susphy_quirk;
+	status = "okay";
+};
+
+&usb2phy_otg {
+	status = "okay";
+};
-- 
2.47.3


