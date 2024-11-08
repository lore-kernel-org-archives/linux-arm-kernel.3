Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8A6D5E14A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 09:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MitB8ZN62nrRBsPWXtDuXEG9EWUHpdNnzvACej0YSiE=; b=3CXR6scPEQ3Mj6ZF9xoRTVzdT0
	uZkkvLjVGNOPqeYaw8IjZoP+x8ySGAjEt/YEobMo0hf5JjC7WNuRB7WPJ2QdLSIV2h6r2ybpFU8O6
	V8zK/WJMCpAK4aUdd7Ub/dX0lELcgVnLJUrIZbuey7FOQ8R08Uz5NjW1x8pQmLFfVByvd5XERMj9V
	PLOHEcrY8STbsCelYgTK2+eyFbkhJA+5GPNt9sHdBG72q8VLZL/5Dmst3WTX/Qr5YGgfA6OBXn1/h
	NC0Hlbk1NSxinTlDa/AETuw8IVoXbcvoFjmAIYw5tTyKsL3hPc1D0mhIYTADE3jgaRcXevctu/G3A
	2YdOOi1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9LCS-00000009wfA-1Ivw;
	Fri, 08 Nov 2024 09:22:40 +0000
Received: from [58.32.228.46] (helo=mail-sh.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9L8r-00000009vtg-1yVo;
	Fri, 08 Nov 2024 09:18:58 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.39; Fri, 8 Nov 2024
 17:18:56 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, Rob Herring
	<robh@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>, "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3 RESEND] dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller
Date: Fri, 8 Nov 2024 17:18:40 +0800
Message-ID: <20241108091842.36961-2-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20241108091842.36961-1-zelong.dong@amlogic.com>
References: <20241108091842.36961-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_011857_559873_DC04B400 
X-CRM114-Status: UNSURE (   6.53  )
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

From: Zelong Dong <zelong.dong@amlogic.com>

Add new compatible for Amlogic A4/A5 Reset Controller

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 .../bindings/reset/amlogic,meson-reset.yaml   | 23 ++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
index 695ef38a7bb3..0ad81fe7b629 100644
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
@@ -12,14 +12,21 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
-      - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
-      - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
-      - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
-      - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
-      - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
-      - amlogic,t7-reset
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
+              - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
+              - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
+              - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
+              - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
+              - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
+              - amlogic,t7-reset
+      - items:
+          - enum:
+              - amlogic,a4-reset
+              - amlogic,a5-reset
+          - const: amlogic,meson-s4-reset
 
   reg:
     maxItems: 1
-- 
2.35.1


