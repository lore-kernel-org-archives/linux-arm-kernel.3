Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CACCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 19:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0i2l9rmJG/vn/wo//SdqtapwvCPkTpI4NEickiZAa4=; b=CBWsmYolqPWNEo8oRYU1KBZPOg
	4mY7GdzSS59US3N1MlMtvzaJPuf5UoOTU8jprHDorwMHY0V5DtF8WQ4KGOH0vGcyqowisC4XaiI5D
	7g0oOwPJOxruZpacSrit+xVPYy2NRs9DC4TGJOJVxs2El6+r8WWolMLCOqY4rs9PoZMSZdLfojQVa
	kA64Pq9U00Jcr+zMfsxPfROXK8I06lQCrSNFaiXLwCh7uQr/mFf7kmYUOzNh8zALU57yghj67/n1U
	TNuVddsk32jxwu6fLaCRC3ba+IIKGlQRSXxap0FLB5vjAgtzx0s3IFn3rXI8O4rGxmH2qe0HsPWMt
	+3tK5vWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT2V5-000000089lN-2tbz;
	Fri, 29 May 2026 19:04:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT2V3-000000089jT-19nw;
	Fri, 29 May 2026 19:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=B0i2l9rmJG/vn/wo//SdqtapwvCPkTpI4NEickiZAa4=; b=L7XjVZlkce/mpdKdBZu6v5XTL0
	QNWmQKZjBTyjWZ/YcwhsB+CljYx4qvg4rMuBTuqxuHmtD104O/XR1spWq55np/EdpU6OrchsiipgU
	6rsqdwLNLWFPdG1pVBJ6fn/2M+Ezp/A8/rH9O4lNkGWRJscNbA7mYL4bmCXPaIkQYb0vbYLlht2lM
	QxY2+qX3rGLrcibosf6Rp0uep2vNl5eUdT9BJ/rUJX2X6UnCu0JqCmq42Y701bousQ5YdApUwQX+A
	sbcvazW9H5wtiaGe63kt++L1sUMdY4a0ufmA2i54O7VZj+M3oq5iPrZRd3caKhI19lwA4Luxlc2MX
	+RMaC1GQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	amadeus@jmu.edu.cn,
	jonas@kwiboo.se
Subject: [PATCH v4 4/5] arm64: dts: rockchip: Enable USB 2.0 ports on ArmSoM Sige1
Date: Fri, 29 May 2026 21:03:54 +0200
Message-ID: <20260529190355.4148175-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260529190355.4148175-1-heiko@sntech.de>
References: <20260529190355.4148175-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_120405_369720_343CDBA0 
X-CRM114-Status: GOOD (  10.46  )
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
[added phy-supply for otg port]
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts b/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
index c41af8fc0c8d..ee4183fb980d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
@@ -480,3 +480,28 @@ bluetooth {
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
+	phy-supply = <&vcc5v0_usb_otg>;
+	status = "okay";
+};
-- 
2.47.3


