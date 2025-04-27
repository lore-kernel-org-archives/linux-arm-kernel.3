Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6464CC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 08:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+oNp7kZwyjwPU4Kaggu77LkvQ8spC/gbYZMK3mhNrw=; b=IWRIWk7Zc15c+bj6dzF/euCNK+
	9R8FyVC2mtTbaWu/bhI2omtPBS+8ECtxDYILZ+pbxscmwlEmJkAdF+jln2qXIR5tre9529W7+Z2lJ
	lXydI2QIeXsTpy0MnPZVBeZrNIEHhQMKyTPPDw6zKGmK8tzER70/ScKZ4GJBy6ZO8/F2dORa3gxbs
	pPGCl+HkH0qxPkOPV6DbAv9aiUFdtThDC5l9f2cELrUUhdur13jBW4QhD44na0DE9TjdGrINfXFgp
	dDbsaiz30mnMI0EvladMLsN0qsSqvYqmdBg/EUHQYBJwJUNWpJyTWYmoHVVEf8q8T0mTGbkSn4cRr
	yLxxcVhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xPX-00000003BUd-3BjS;
	Sun, 27 Apr 2025 08:30:52 +0000
Received: from out28-116.mail.aliyun.com ([115.124.28.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vrA-000000032tQ-1kcQ;
	Sun, 27 Apr 2025 06:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=coolkit.cn; s=default;
	t=1745736674; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=g+oNp7kZwyjwPU4Kaggu77LkvQ8spC/gbYZMK3mhNrw=;
	b=ERhuVFDn00TJVThwGifAPD8j5+epy7y3CFq1FUKexAfErSAj99mEa7Rd62CgP9HXIiA0zEkHcnc7ZkhNZiLF6C/bLINGIXtLyt7nQqiTPjYlypRuRqDYVlWMuj/bEHSyaS6sLzPtCrn3CTKlx166MhuLut0GJCMYjFkm5lyKsS0=
Received: from ubuntu-z.lan(mailfrom:hao.zhang@coolkit.cn fp:SMTPD_---.cY70L5V_1745736638 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sun, 27 Apr 2025 14:51:13 +0800
From: Hao Zhang <hao.zhang@coolkit.cn>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	"hao.zhang" <hao.zhang@coolkit.cn>
Subject: [PATCH 1/1] ARM: dts: rockchip: Wifi improvements for Sonoff iHost
Date: Sun, 27 Apr 2025 14:50:13 +0800
Message-Id: <20250427065013.99871-2-hao.zhang@coolkit.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250427065013.99871-1-hao.zhang@coolkit.cn>
References: <20250427065013.99871-1-hao.zhang@coolkit.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_235116_604097_C7CA8216 
X-CRM114-Status: UNSURE (   8.82  )
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

From: "hao.zhang" <hao.zhang@coolkit.cn>

After some Sonoff-iHosts have been running for a long time, 
the WiFi module will run abnormally.

Adjust the pmu_io_domains and sdio properties 
to solve the WiFi module operation abnormality.

Signed-off-by: "hao.zhang" <hao.zhang@coolkit.cn>
---

 .../dts/rockchip/rv1126-sonoff-ihost.dtsi     | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi b/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
index 9a87dc0d5f66..3c0371103015 100644
--- a/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
@@ -323,15 +323,15 @@ wifi_enable_h: wifi-enable-h {
 };
 
 &pmu_io_domains {
-	pmuio0-supply = <&vcc1v8_pmu>;
+	pmuio0-supply = <&vcc3v3_sys>;
 	pmuio1-supply = <&vcc3v3_sys>;
 	vccio1-supply = <&vcc_1v8>;
 	vccio2-supply = <&vccio_sd>;
-	vccio3-supply = <&vcc3v3_sd>;
-	vccio4-supply = <&vcc_dovdd>;
-	vccio5-supply = <&vcc_1v8>;
-	vccio6-supply = <&vcc_1v8>;
-	vccio7-supply = <&vcc_dovdd>;
+	vccio3-supply = <&vcc_3v3>;
+	vccio4-supply = <&vcc_3v3>;
+	vccio5-supply = <&vcc_3v3>;
+	vccio6-supply = <&vcc_3v3>;
+	vccio7-supply = <&vcc_1v8>;
 	status = "okay";
 };
 
@@ -342,18 +342,15 @@ &saradc {
 
 &sdio {
 	bus-width = <4>;
-	cap-sd-highspeed;
 	cap-sdio-irq;
 	keep-power-in-suspend;
-	max-frequency = <50000000>;
+	max-frequency = <25000000>;
 	mmc-pwrseq = <&sdio_pwrseq>;
+	supports-sdio;
 	non-removable;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc1_clk &sdmmc1_cmd &sdmmc1_bus4>;
 	rockchip,default-sample-phase = <90>;
-	sd-uhs-sdr50;
-	vmmc-supply = <&vcc3v3_sd>;
-	vqmmc-supply = <&vcc_1v8>;
 	status = "okay";
 };
 
-- 
2.34.1


