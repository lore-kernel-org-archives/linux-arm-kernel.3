Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0F3CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 02:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSXv9MtMB5lO2sv9lOCTrZsJ/p1Q4KH4kHig4fmSXgk=; b=b1TZm1e8JQVeVGomhR2b4SOGoW
	050WIz3aJKsV5/+Dmeu3JYNnncDwevf4Teq3grsjeaz8GD5kW0R3H47VieWivIkkNvUAgMMw4iFf2
	IDS5nEDBjrzmxiyOs77fLIvjrBMC93H1vsqL6tWm3A52iPmjt6rTEqY3NZJj8buy5C/e45k2gg7GA
	wMJuvApHJZwUbR15te6CcKIzcQVMT4T0/PN6tpSgPRdofKibujWK3s4VkaIKVMEu/yFmIuiTSqnG9
	QH7r85INAezpq/XJ/Z5HcmSwonfwly6P01DjxVE0fnZ40nak70os39NW3QgC38f2+SVSbugV5mSH1
	MWgDV/cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyL5Z-00000006Frd-0Xu8;
	Tue, 16 Sep 2025 02:06:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyL5T-00000006Fg0-002a;
	Tue, 16 Sep 2025 02:06:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24B39450AF;
	Tue, 16 Sep 2025 02:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7AEDC4CEF9;
	Tue, 16 Sep 2025 02:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757988389;
	bh=QLoUf6MbemExweEkSHZ6Cs4Fo/cev8YIR8uKZymd67k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=agXC5LkCqWnp1biTl5BUVyg8SRFUovUf8ygMm5nxJhdZzpS8hI5Wqod1JkjpSxqRc
	 c5JjwdzhQJC/RAl3tnRr1HNafCjiLtRJrWYEKvx992Ms5ZptQTf89fMjUDin7oCrEY
	 925zBkjpvR4Cfp2zi7xfW/5qT8hqXCKGJljKuSVszi/7dKHFtFHkeO5SY9E9jF5BDq
	 2OnuloGHfpPieJT0SjUb/nBudwZNftcPJd56EnhOIGSkMdByk1vhLYHbeX+INbqgje
	 0EX8RLcOkgcLtwWEIAUTSwDywt1G9h1nWHHBbKQcl4g9G5XxRH2Caw6niYI+wYtBjW
	 R+Hd2RZg4T7oQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B56CAC599;
	Tue, 16 Sep 2025 02:06:28 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 16 Sep 2025 10:06:06 +0800
Subject: [PATCH v5 1/2] dt-bindings: clock: add video clock indices for
 Amlogic S4 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-add_video_clk-v5-1-e25293589601@amlogic.com>
References: <20250916-add_video_clk-v5-0-e25293589601@amlogic.com>
In-Reply-To: <20250916-add_video_clk-v5-0-e25293589601@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757988387; l=1277;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=oFTBK7GmWCd1bTbEyxd9lw2QoXtneH1SDFph2xdcxG4=;
 b=oMOS0qBWNYhTCkKeIJSvkDNEQ0rEh61ZqxQ/unVz/WlVjattQnvHeUAxpbBLp6uTsxK+3GdcQ
 bRx59VjWVi0DWeb2isz67xp/LBjCVFPxmrquIFsIf5kCP2ElCGt7DAA
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_190631_122336_A5469F3A 
X-CRM114-Status: UNSURE (   8.30  )
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



