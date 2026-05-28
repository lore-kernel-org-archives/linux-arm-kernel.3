Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFC2CD6E4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 23:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVhbNGRA9/1U4zr01JFCIiYUqAzoqbgB2Uy8C1LiRyI=; b=S/0s5g5gURO8biqViVEXksakIa
	wrSVt6pfZAlELeUfvFff1yAIAwJNSfmgQOVV/YY51v2QpaYljUCOlmt8O1r9s2SVsys5HR2KvpHOd
	wtADsQ58bfjXKkh7fnpeVy5Zv4i9OTUFBGPbHNuG0h9m0FM51isuLj4WBAsMKH3FdfCBjH58WMMxz
	vrPTSoZEKkU4LTJXE9fjab/xDCn3FmzNPZFCvhOgawZPOOYQDo4DaliTQ9/iUiSaAnEdRpTcrr7h4
	E/3twRNRHRdekQT6jfUlCKqyCd7ulkiD7e9HikE5uuFz18OsMIhVxlvKNgozmwhcOgxlMq/XCTqVk
	T4GbXTQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSk5W-00000006Wgq-0mtZ;
	Thu, 28 May 2026 23:24:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSk5N-00000006Wbq-2up5;
	Thu, 28 May 2026 23:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=kVhbNGRA9/1U4zr01JFCIiYUqAzoqbgB2Uy8C1LiRyI=; b=hRSnCPVuLHTQWhGi4Ta3Nf2yUe
	IRWTOw6I/yYfUR0hNe1b40vGYGPDXknATK/hEAdeXRr6ah888hIst5/WFgDyYWEFIcVRnR11rbOfy
	3cHxFQGfJ5Vc1geHwu/5+1IBBn5t9HMOFTOd0kIvFUJLGpSCCiEuQ54q3bRclsLdX/tLtW9QICpKN
	jsEFi8fJJZtzP4n/S2zrrTt28kvwlhFHZGCJRbONwQNPU5ftjfS13TQlCzUPcTSroAUcukUsXvrNT
	MRpAwJ7XVTRwPwpXH+Eh78+peo2uXdsh0oaTlqeIPB+K2VOO9Gw1oukS0hA7seAEqMj5P7M1XuEiw
	Zav3mkWw==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	amadeus@jmu.edu.cn,
	jonas@kwiboo.se
Subject: [PATCH v3 5/5] arm64: dts: rockchip: Enable USB 2.0 ports on NanoPi Zero2
Date: Fri, 29 May 2026 01:23:58 +0200
Message-ID: <20260528232358.4054610-6-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260528232358.4054610-1-heiko@sntech.de>
References: <20260528232358.4054610-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_162421_794925_C0F8583E 
X-CRM114-Status: UNSURE (   9.43  )
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

From: Jonas Karlman <jonas@kwiboo.se>

The NanoPi Zero2 has one USB 2.0 Type-A HOST port and one USB 2.0 Type-C
OTG port.

Add support for using the USB 2.0 ports on NanoPi Zero2.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
index 9f683033c5f3..97d85124d21b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
@@ -338,3 +338,32 @@ &uart0 {
 	pinctrl-0 = <&uart0m0_xfer>;
 	status = "okay";
 };
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
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
+	phy-supply = <&usb2_host_5v>;
+	status = "okay";
+};
+
+&usb2phy_otg {
+	status = "okay";
+};
-- 
2.47.3


