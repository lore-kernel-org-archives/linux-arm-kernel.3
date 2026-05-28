Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77746CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 23:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8H5DQ7CcaB8f4L2bn2qFR3HsY7e4EIJ4njM/r7R9UU=; b=ib5Tkjvu3o/7xqdzTvGsRP76Li
	Al5gqlOvtl8IfVMzkSFEk9gKwwz+UKgC4NKBTSlLc711pZx1MV9DkfRWp8X5GUFu1DYR1w4figKna
	mQPx9SLDhPuR8PTDDC7sGbPyiwV5cb+XCkX2y3qKvwqTTOp6X+cH+f/h6jXEXMBp5YmwlVrGLGdQp
	KwuZukdV/kLaYyrBziL5BWIgQ0DG/dnaq3OaIGoEW8W9Q6LN80qCuNSrpyeLJuwiQ2AoQ1Y5jvu7l
	jegqmBIY42Y3Oo2cifBFSZ/fACtZVdyX8bI73dKLxz4nas6gpbF/k8uQMeIuWCUeKbh9qKKwJd63S
	OxpENrDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSk5W-00000006Wir-3Wql;
	Thu, 28 May 2026 23:24:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSk5N-00000006Wbp-2vOH;
	Thu, 28 May 2026 23:24:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=N8H5DQ7CcaB8f4L2bn2qFR3HsY7e4EIJ4njM/r7R9UU=; b=q/fCHDNXDeDF6M7cnzkE73d4Sz
	TBZM0jlszXZyqnf5AL2keJd2Pr2bIOSGY8AhCqOCfZfoxo/r3j+IZsjyQHX5uxKQ4b1vJEktH7Tie
	DlSxhTol2PF/lFnIQA0U6TIMKL13gQkJqJj7BHMx7zkrBCSbZ/gtW5FV/YCh/IbPf0bWCvZGI5YT9
	Y56Qp6jC/IwGVN+q9gK+AQtf/aKSoPTlSxpHQo9UBMcsPETi/lT5LsHXXvolzkklmHQULXnHdYd26
	tH7BS86QffL/LSSzghQHH2Kb1VQ0PGzH5M6dYWOSLWmQGDwYbrn/NqWxtE6d1voZ/nZMccxZP3k8h
	0UzeUNTg==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	amadeus@jmu.edu.cn,
	jonas@kwiboo.se
Subject: [PATCH v3 4/5] arm64: dts: rockchip: Enable USB 2.0 ports on ArmSoM Sige1
Date: Fri, 29 May 2026 01:23:57 +0200
Message-ID: <20260528232358.4054610-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260528232358.4054610-1-heiko@sntech.de>
References: <20260528232358.4054610-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_162421_811594_876E826D 
X-CRM114-Status: GOOD (  10.34  )
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
 .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts b/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
index c41af8fc0c8d..51ae8e2d4566 100644
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
+	vbus-supply = <&vcc5v0_usb_otg>
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


