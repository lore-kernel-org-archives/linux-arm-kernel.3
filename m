Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DCEC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0384NZ5P88+S5UmkFQn+bUE/+ihVeSwKV7E2cHdJGM=; b=OZ6Js9mZUT+Z1eKFOoypO1E6K1
	QXbfE1OV+n5LwOcZ9tsEnTyn3RRZD84q6Bo1FQyyuu63KbeyEWP5rj3DOzvVZqhnwQEZdH+Q2Xd7H
	K2dU2Szb/QAEVBUzVcRaL6P9JFIxsrm0Ht4WNpgM3whj1PV4DKbHRnVqQzvKhYHbwiJFOJOmkgz1H
	OjrbaTZYu0P67dNU2xTwyJUs/iLC1kkVx3MRQkp8+7uQhj0u1d1mL+xov6Lb19Y46jqbveDOY8HyC
	8/V+cLiKQUoXTcverp+/xUHAAYEuOUNPPMmt5vex6Rw/6iXF6oEy0m3vlHVRcmIw4q5VngTDR8NWk
	vYoXiX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMOn-000000085KQ-3MeW;
	Tue, 18 Feb 2025 12:08:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkM6g-000000081c4-1QYs
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 18 Feb 2025 11:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=U0384NZ5P88+S5UmkFQn+bUE/+ihVeSwKV7E2cHdJGM=; b=LZidXhXhbNuC4wnkVR7fCzGY0I
	wg8rL+nEvGvsR/+/w1Yz7DioQR2zl8UagT69xDzBiIoBJ5YftQ39XqQ9cb0DCWFEq/EKABkK5oKdx
	Et2KUSAqIhPgyRSkPYN/TFQTHB6BKfYr0oRGuHHRW0oQXCwZNCZE6ndVGmAYXZ88vcpma2uvy30SS
	1Lzioth0kYCZgNq7pEk/ll097WrJbgEyKNj1KOKu49q9nATkYKeHHWWeVg3okudtMTFDaQaVUHO+Z
	1m4/tcYiBRC7lYXUoQU2JUxrwbe7MMU68Hd0miQVJK5o/vnuRrwxp+3p3ZShKmlys+mDMTQTbIN49
	SiA/COUw==;
Received: from smtp-42aa.mail.infomaniak.ch ([2001:1600:4:17::42aa])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkM6b-00000001zRr-0KLp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:49:40 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YxyVh6rg5z5v6;
	Tue, 18 Feb 2025 12:49:32 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YxyVh2lmRzjHM;
	Tue, 18 Feb 2025 12:49:32 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 18 Feb 2025 12:49:18 +0100
Subject: [PATCH 7/9] arm64: dts: rockchip: enable Ethernet in Haikou
 carrierboard, not Puma DTSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-tsd-align-haikou-v1-7-5c44d1dd8658@cherry.de>
References: <20250218-tsd-align-haikou-v1-0-5c44d1dd8658@cherry.de>
In-Reply-To: <20250218-tsd-align-haikou-v1-0-5c44d1dd8658@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_114937_437520_3A882238 
X-CRM114-Status: GOOD (  10.78  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

The signals are exposed on Q7 golden fingers but it's not a given that
the carrierboard will have an Ethernet jack. So let's move the enabling
of the Ethernet controller to the carrierboard DTS instead.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts | 4 ++++
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi       | 1 -
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
index bea146d0d3f02afaf5e406d61d9a8ab7476fa8df..47775005874308e217a523659bfd92dc56fba8e8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
@@ -149,6 +149,10 @@ vddd_codec: regulator-vddd-codec {
 	};
 };
 
+&gmac {
+	status = "okay";
+};
+
 &hdmi {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index 399c86bcbfefa5c667f11f31b3491eb693cfae76..e00fbaa8acc1685af46495c0dfc9bdac7e6e991c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -183,7 +183,6 @@ &gmac {
 	snps,reset-delays-us = <0 10000 50000>;
 	tx_delay = <0x10>;
 	rx_delay = <0x23>;
-	status = "okay";
 };
 
 &gpu {

-- 
2.48.1


