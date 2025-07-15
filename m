Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03CCC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 14:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQteid4vNgTBFG2yi3NNGtW0TgTE9i7JNB6L+lT3fNE=; b=vhaXd13nIh44oJBS17s/X4HySe
	cvBk/qaSgNhJ2Ht3ZrUb381dJGgTlzdgsGwGAOcw//Bk+RAme1zUttIftthV8b16uzeYHS4+a7Wxf
	TLWzeGNTqhsGaYsCVQSjgk9GU1c3xTHNbRc9tHpAzOcHI7F7E4N3i13iILUNRzbongHp+7loKnxlG
	ANkPQ+CGop0F7zC33uRE9tSbfM0P/F0n0Vj0odlyd1656WkrAixrHu+PLXv/85W4sfCragSqbR0Ea
	ER3IwOrXNQWWm9IWq0oUcspazJ3EIm22ssILH2o5LWD+HlL3Z7VzQtwbELkGWZe43hu5p7SLGbZUJ
	+LcHLKhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgJF-00000005JWU-2JqW;
	Tue, 15 Jul 2025 14:07:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubf8K-000000057hy-3iz1;
	Tue, 15 Jul 2025 12:51:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCE1743759;
	Tue, 15 Jul 2025 12:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6896AC4CEF6;
	Tue, 15 Jul 2025 12:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752583903;
	bh=2TkqcdkiWyrnm1Y72+wWgizVw6FEwqJ4t2W4Sl/s5HQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TIoCqEGv0LZj54U2MgqyqflIK2m5GfGdmC7j8er6E+p5yUgyDSDCcKM7DPSzpC/oo
	 qxGdmI7mCU5HB1VOGKnjFlCnV+8M2iM+MDvBRqwDyLrXtnPqV8FKkYRU77Ekp6J4ae
	 mRnDhu+4ulNMMNQoxPTGKXTbQ0Zd9C3UMwBcn8Nkt8VqsaM0N8lJL/oGecE4LiTMGO
	 yNqeaBU7fNb2VKFtcpfqmgduCxZuDC+PHfYlzNawfeMl0s5VqyrJ7bJTB7rtjDX+52
	 WJ2NmjcCCstD65Fpn8nU7etJJaois9QF4el9rPhqCqxfKKpS/wtaXeIOx13TP6vv3I
	 hHih3xvWGJ2CQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56FBEC83F21;
	Tue, 15 Jul 2025 12:51:43 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 15 Jul 2025 20:51:38 +0800
Subject: [PATCH 1/2] dt-bindings: clock: add video clock indices for
 Amlogic S4 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-add_video_clk-v1-1-40e7f633f361@amlogic.com>
References: <20250715-add_video_clk-v1-0-40e7f633f361@amlogic.com>
In-Reply-To: <20250715-add_video_clk-v1-0-40e7f633f361@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752583900; l=1212;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=LztxELd9EtqmjCHRSvnKXiDEtIhmTixy/0hdsbLfFOA=;
 b=H9D6zYFXC/H+ChDtNW3x0uSFhuScIdrRXaA1ArwghGEqWePsiq/3BLToknEoNOGIzsLvNoED7
 Ek24Wg8K0TNDNgnd9VqLJPVZuJUu7vagTAQu5PiiMFhgy7HYBtzljT5
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_055144_950865_021B88F1 
X-CRM114-Status: UNSURE (   8.23  )
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

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
index 861a331963ac..a1cd22b25102 100644
--- a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
+++ b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
@@ -232,5 +232,19 @@
 #define CLKID_HDCP22_SKPCLK_SEL		222
 #define CLKID_HDCP22_SKPCLK_DIV		223
 #define CLKID_HDCP22_SKPCLK		224
+#define CLKID_CTS_ENCL_SEL		225
+#define CLKID_CTS_ENCL			226
+#define CLKID_LCD_AN_SEL		227
+#define CLKID_LCD_AN_PH2		228
+#define CLKID_LCD_AN_PH3		229
+#define CLKID_CDAC_SEL			230
+#define CLKID_CDAC_DIV			231
+#define CLKID_CDAC			232
+#define CLKID_DEMOD_CORE_SEL		233
+#define CLKID_DEMOD_CORE_DIV		234
+#define CLKID_DEMOD_CORE		235
+#define CLKID_ADC_EXTCLK_IN_SEL		236
+#define CLKID_ADC_EXTCLK_IN_DIV		237
+#define CLKID_ADC_EXTCLK_IN		238
 
 #endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S4_PERIPHERALS_CLKC_H */

-- 
2.42.0



