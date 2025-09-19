Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1D3CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 05:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSXv9MtMB5lO2sv9lOCTrZsJ/p1Q4KH4kHig4fmSXgk=; b=Ip2qE44WergDsaXsA4pCS9nOQ+
	j96+8zo/I+077J3NQyfpCR3uKX0KP61A7I0+hxZoUTDOC4lyC6SzL59u+2+7j47jKLsoXJ4cWRHGq
	hpzv33pBdoWGHsMgVikx44xqWLbuNvhYYvUX7PDIlzKt0nxOavPUFVYXPZP7vxuRVNyq1D7UqQr7M
	slYCl8y7F7y0Pd4q5ZidXuu+ATLEp437kErHeyhBM8z/in1lhqWEghYA0YoWTyAHE1gs4UZeF9TJ1
	QmXJAMQsyOqcTEHfv37vvNIb+E7JpNEqGG2cHA54UPiEz8qX8H0wRt1ez+cI1xhMXGl7xxvuMJrwd
	pEkeVnYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzU9K-00000001u3t-1Y8P;
	Fri, 19 Sep 2025 05:59:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzU9H-00000001u2q-3XqD;
	Fri, 19 Sep 2025 05:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EEB516021D;
	Fri, 19 Sep 2025 05:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91F59C4CEF7;
	Fri, 19 Sep 2025 05:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758261550;
	bh=QLoUf6MbemExweEkSHZ6Cs4Fo/cev8YIR8uKZymd67k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DdmmGPmg3TR3TMfxLtnLjyVcgG9cVOkyMT+JFYcLGXFUlyF1fl4JODVB8CF+VTHXK
	 F9ExPLXTcQNzAbSun1YmtzOxc+VouR635zPDG0pVePHDRIHDOvzi9ZZZVYL5fu4RLC
	 iBJgGBFBI6AbE13rqU7/kCXUFZ7z3V7dxU4Ljkv0OQ2KMBZUkLglxrWAxTBeSestrI
	 hUefAAbJsKFsxUQ/jHTSvFFyQc2pV9XDWvHooqRrVDsW8m3jqWR2lF2rLMuUJMPpeD
	 fLLjwS2Hb7+yXhhd3QQ0vXwBX4bLW/2ob86U+aXmdZsCkm7PtyeLRqY60sL8/9d8eb
	 0NJyA/08sSyiw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81091CAC5A8;
	Fri, 19 Sep 2025 05:59:10 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 19 Sep 2025 13:58:59 +0800
Subject: [PATCH v6 1/3] dt-bindings: clock: add video clock indices for
 Amlogic S4 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add_video_clk-v6-1-fe223161fb3f@amlogic.com>
References: <20250919-add_video_clk-v6-0-fe223161fb3f@amlogic.com>
In-Reply-To: <20250919-add_video_clk-v6-0-fe223161fb3f@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Chuan Liu <chuan.liu@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758261548; l=1277;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=oFTBK7GmWCd1bTbEyxd9lw2QoXtneH1SDFph2xdcxG4=;
 b=qgOii3kCYety9Xap68/0E6rPikg6BVV+MXY2JSJ82KyPp0Vw9nm3HCAFXsY+3VabzegaeHx4p
 P0bxD3847auCuNMQOyYEvyTNeronrG/nAohEiE3pqXV7p+ioBRh4M0x
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Add indices for video encoder, demodulator and CVBS clocks.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
index 861a331963ac..b0fc549f53e3 100644
--- a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
+++ b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
@@ -232,5 +232,16 @@
 #define CLKID_HDCP22_SKPCLK_SEL		222
 #define CLKID_HDCP22_SKPCLK_DIV		223
 #define CLKID_HDCP22_SKPCLK		224
+#define CLKID_CTS_ENCL_SEL		225
+#define CLKID_CTS_ENCL			226
+#define CLKID_CDAC_SEL			227
+#define CLKID_CDAC_DIV			228
+#define CLKID_CDAC			229
+#define CLKID_DEMOD_CORE_SEL		230
+#define CLKID_DEMOD_CORE_DIV		231
+#define CLKID_DEMOD_CORE		232
+#define CLKID_ADC_EXTCLK_IN_SEL		233
+#define CLKID_ADC_EXTCLK_IN_DIV		234
+#define CLKID_ADC_EXTCLK_IN		235
 
 #endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S4_PERIPHERALS_CLKC_H */

-- 
2.42.0



