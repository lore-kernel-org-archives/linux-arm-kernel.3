Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EF1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoE9T8EMVY/jwTn46Thvc2E604kSFwKrhCanyO+vbh4=; b=iOhwgUodechUW0I6psp8ykPsCS
	SgEC9nN0Oj4Mz5Fntb9qKK969CYO+ddR0pBSwACVyIlj2fu2vlEDg3qJ4DbOoZXCLSz4K/+zc1loE
	e/TuQ1y6jfzoWDSIU4OXF1WPLX5U+mvgzX0xd/78xF1PgGnFReLP00X2jvJFjiamkMs7U6EhDAg0Y
	9KoiHh2mWgndRr0Ce9xDNstJQEglw7w6VDRGRMCjPxo5zYVLMEZee4XDNyv111zURurSCApMo0VQT
	CD7pD3yQ0PYYO3avdpHDWJOCiQwzDkIR2KR5QI2haCsykfv76IsfMIOiu5ddkZFePEqyBB0nihVh5
	jYwzgwpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMbi-000000087rp-1T6p;
	Tue, 18 Feb 2025 12:21:46 +0000
Received: from smtp-1908.mail.infomaniak.ch ([2001:1600:4:17::1908])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkM6Y-000000081WG-0dch
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:49:38 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YxyVg6P1Hz79m;
	Tue, 18 Feb 2025 12:49:31 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YxyVg2l5Zzk6M;
	Tue, 18 Feb 2025 12:49:31 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 18 Feb 2025 12:49:16 +0100
Subject: [PATCH 5/9] arm64: dts: rockchip: enable I2S0 in Haikou
 carrierboard, not Puma DTSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-tsd-align-haikou-v1-5-5c44d1dd8658@cherry.de>
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
X-CRM114-CacheID: sfid-20250218_034934_329481_D2DF19C5 
X-CRM114-Status: GOOD (  11.14  )
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

I2S0 is routed to the Q7 golden fingers and, on Haikou carrierboard, to
an I2S codec. Nothing aside from signal routing is done on the SoM,
therefore it's the duty of the carrierboard to enable I2S0 whenever an
I2S codec is present.

Such is the case of the Haikou carrierboard, therefore let's migrate the
enabling of this controller to the carrierboard DTS instead of the SoM
DTSI.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts | 3 +++
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi       | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
index 327fbc0a56655d5e544a99cedbfb1bcd39ad769a..df8a8ec582ecc6830ef11be372f204057759d1f3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
@@ -185,6 +185,9 @@ sgtl5000: codec@a {
 	};
 };
 
+&i2s0 {
+	status = "okay";
+};
 
 &pcie_phy {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index 548bd7b486c185c80be87d433f149c3fac65ae8a..399c86bcbfefa5c667f11f31b3491eb693cfae76 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -447,7 +447,6 @@ &i2s0 {
 	pinctrl-1 = <&i2s0_2ch_bus_bclk_off>;
 	rockchip,playback-channels = <2>;
 	rockchip,capture-channels = <2>;
-	status = "okay";
 };
 
 /*

-- 
2.48.1


