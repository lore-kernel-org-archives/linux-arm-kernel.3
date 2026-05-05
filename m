Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DD3FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 17:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQYb9cx7Qy9HM2zG1blx8dDESq371LLINBDgwuG2XgM=; b=NT9AMsp1+aDDo186erKHJPY5as
	lJPAsHZgHS0/5+ssvMJtnRKSsqnsgAD0CpGHveZQcaQvNQpu83P9U3Y0E5Fg3AwaLzOKn3LcFrKCo
	TzmQUlgtZ/VCjkStPS9D+pk137CLcIKyA1JnYtJpnsr1Wnet/g88nzhaKXJjElG1r8d0+xe6kH3QQ
	QfB1SpEH1hgeHtzM0oW1PAbynD07sZEC24S4+84ODJQ0NFqFJ5j1zPYJ+ChsSCHNS9MrItEKW24yN
	zT4okZGKLXO+Z8bDKVfyRJDlkTwM8U7uuosjGF06gQUGR1jDbtcOVMmDk3BVyXN9+9YODmkD+PWmh
	doM3/sQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJJv-0000000H12Y-1j1I;
	Tue, 05 May 2026 17:12:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJJr-0000000H0wB-44vA;
	Tue, 05 May 2026 17:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UQYb9cx7Qy9HM2zG1blx8dDESq371LLINBDgwuG2XgM=; b=C5gbFqFSgN+Y5S3ACphkwJOBM/
	D7rlCCaffTtUgYumlyjC6W8Pt0cSaSfDEddlsu+INX6BMg8Jo6Ma2TAGWRHF+mwUSaWoqMTEioK6c
	M+Hh7DQwcbhMBA6h9FrcCUJbMYGMvno6hGPRxNnU9mdvcz3lvaWaD1LJBeI0KVpRvx9C166C8M7D8
	wzkEEyBCnKUl33TF0e07XWKAW4YN3AH9J+xrk98WSg4W4v/jICtkGrmzf5GcEsAvSg0On55suL1oN
	2DKrZm46rnbWFR7nBdK1P4lilpi/ndOXCsTPEcT81NZNkpABIgeKdF8Aemfn8Uhpv1mpjrrg2nm94
	eaVdxtfg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJJp-0000000E85D-0jIe;
	Tue, 05 May 2026 17:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=UQYb9cx7Qy9HM2zG1blx8dDESq371LLINBDgwuG2XgM=; b=M+TyBoi5RbYqE5X3+oLFHJXzIf
	kHSu1/BoxKyQlALWb7jDAN3l9PENbcTjYVK/3qH5yE3aJIbJzLnQCB+MJsImcoEImhc4BoZP+5RxT
	+W2lS5fJ6pdkKbQpLO0sW7FzO2qUrowP41pqq6bWIhRHdDG4n1ek0+oWmGFjISZSzec+dg3DL/Sqy
	d0y7nJLK25DmIaXZiquXSizgjTeX1/RJARU3gHdQ/RnTda5SX4JkLXs0trXPEqBswvPGUrEixTQbO
	1J8idjx6VG/3p4SzWmA+QeBvA3Bz3rQMrjm2zoCsv1txIXG7s2qq1M9sw9uUUzDhR1JutWOnIJM7D
	00qnKENA==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: rockchip: Enable USB 2.0 ports on ArmSoM Sige1
Date: Tue,  5 May 2026 19:12:07 +0200
Message-ID: <20260505171208.3267387-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505171208.3267387-1-heiko@sntech.de>
References: <20260505171208.3267387-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_181225_341351_5C1CC454 
X-CRM114-Status: GOOD (  10.88  )
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

The ArmSoM Sige1 has two USB 2.0 Type-A HOST ports behind an onboard
USB hub, and one USB 2.0 Type-C OTG port.

Add support for using the USB 2.0 ports on ArmSoM Sige1.

The onboard USB hub handles OHCI so only the EHCI controller is enabled.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts b/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
index c41af8fc0c8d..e15a4b2a1208 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
@@ -480,3 +480,27 @@ bluetooth {
 		vddio-supply = <&vcc_1v8>;
 	};
 };
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_xhci {
+	extcon = <&usb2phy>;
+	maximum-speed = "high-speed";
+	phys = <&usb2phy_otg>;
+	phy-names = "usb2-phy";
+	status = "okay";
+};
+
+&usb2phy {
+	status = "okay";
+};
+
+&usb2phy_host {
+	status = "okay";
+};
+
+&usb2phy_otg {
+	status = "okay";
+};
-- 
2.47.3


