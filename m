Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA60E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 20:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0KWxxPcB8W1i2Ck1ecMJeRfy5/gvd+3ejJHjRCKxkQ=; b=gHMGIUVkdyUaDR48Z0wGKfMNyx
	SuvynYiyucbR+vfZ/3Ljg3r5/gEXnI8vOBvUnC2bpI5lS7WbdoB4GzLHpR9l/Yqi96RMf9BrVx31t
	rCdR4pHZJZz0ljQ6jGcczAPk7Tr3zGykuKgkN+BK36vEICz2yCXkclJyHYhbip1iTQCEJIt43R+M/
	ilv9rEnMuuo+tthvp0NnJAJ0HYxotQLWP3vdeB4EvbYIZabFZS6Wes9fKBuya1/6uDM+paGFoHwtu
	kkN0AcTU/qlJ+7p7Gy0IVZ4wdSGBf/f8lrcrynYmbht+oZv/IFya374IzbbQZq+GbCf/Gbjzaco09
	IRWNu14Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUASl-0000000FVNR-18Lq;
	Sat, 04 Jan 2025 20:09:35 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUAQS-0000000FV3u-3sqv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 20:07:14 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=3lePwyNAPn3U6wu/lH/nXAjubLWQOq0Gbu2wnFG2j08EVZ9WE1Ik2gt7gnTmBfqLfB+fmtVX0ObztgawUMuRBaSDP2P6/P+idgvKG6uJt7WkVthRpVQ9QrfuECKgYXUEK4qqA+gBmMYpmokU9WP+dLrEsvE9bRAmDccyBOcm4Uasn34olYR+5YFBH0SkaplKZA9RQP+oGCyznVWWCJTj804MlIPSGXFhHmHaFWo4PUwBTSPosLLSnFoPrW9KpGko8kkuPcaSbHANDCqnuwE2GkxAIZ40e6g2EYFkt3MV8BlY58YB/rMhNte68HCRCu1nuf/WFq/ugwd7JQ4bo4rDmg==; s=purelymail3; d=purelymail.com; v=1; bh=NLp+riGjAPv1csRo6R16+mE/m7ajCADdLNWkrohWbs4=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1683504375;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 04 Jan 2025 20:06:28 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sat, 04 Jan 2025 21:05:56 +0100
Subject: [PATCH 1/2] dt-bindings: clock: exynos990: Add CMU_PERIS block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250104-exynos990-cmu-v1-1-9f54d69286d6@mentallysanemainliners.org>
References: <20250104-exynos990-cmu-v1-0-9f54d69286d6@mentallysanemainliners.org>
In-Reply-To: <20250104-exynos990-cmu-v1-0-9f54d69286d6@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736021184; l=2889;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=NLp+riGjAPv1csRo6R16+mE/m7ajCADdLNWkrohWbs4=;
 b=Wi2F6IM+S3aJ4VDzCH6Gfm0mNyprfqUuiIQwcK64vHmUBNMYojlXePVgZK28lCdoGV6rjzb/z
 o7I56jDwhLGBeWwNd9CR45WJu82+hRCixRYoK9wdLGGxP50Jax0H0De
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_120713_040272_969381E0 
X-CRM114-Status: UNSURE (   8.83  )
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

Add CMU_PERIS block compatible, and clock definitions.

CMU_PERIS requires one bus clock dependency, and it's used for i.e the MCT.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 .../bindings/clock/samsung,exynos990-clock.yaml     | 19 +++++++++++++++++++
 include/dt-bindings/clock/samsung,exynos990.h       | 21 +++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
index 9e7944b5f13b1df98ff8c2f409a3120fa43aaaa4..c15cc1752b026231d8d9c3c07bdab201016b6078 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
@@ -31,6 +31,7 @@ properties:
   compatible:
     enum:
       - samsung,exynos990-cmu-hsi0
+      - samsung,exynos990-cmu-peris
       - samsung,exynos990-cmu-top
 
   clocks:
@@ -79,6 +80,24 @@ allOf:
             - const: usbdp_debug
             - const: dpgtc
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos990-cmu-peris
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_PERIS BUS clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index 307215a3f3eddd579e6733b51a777fb45398bb92..6b9df09d2822f1c8e5086a2fc0bda783ca224812 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -233,4 +233,25 @@
 #define CLK_GOUT_HSI0_CMU_HSI0_PCLK			21
 #define CLK_GOUT_HSI0_XIU_D_HSI0_ACLK			22
 
+/* CMU_PERIS */
+#define CLK_MOUT_PERIS_BUS_USER			1
+#define CLK_MOUT_PERIS_CLK_PERIS_GIC		2
+#define CLK_GOUT_PERIS_SYSREG_PERIS_PCLK	3
+#define CLK_GOUT_PERIS_WDT_CLUSTER2_PCLK	4
+#define CLK_GOUT_PERIS_WDT_CLUSTER0_PCLK	5
+#define CLK_CLK_PERIS_PERIS_CMU_PERIS_PCLK	6
+#define CLK_GOUT_PERIS_CLK_PERIS_BUSP_CLK	7
+#define CLK_GOUT_PERIS_CLK_PERIS_OSCCLK_CLK	8
+#define CLK_GOUT_PERIS_CLK_PERIS_GIC_CLK	9
+#define CLK_GOUT_PERIS_AD_AXI_P_PERIS_ACLKM	10
+#define CLK_GOUT_PERIS_OTP_CON_BIRA_PCLK	11
+#define CLK_GOUT_PERIS_GIC_CLK			12
+#define CLK_GOUT_PERIS_LHM_AXI_P_PERIS_CLK	13
+#define CLK_GOUT_PERIS_MCT_PCLK			14
+#define CLK_GOUT_PERIS_OTP_CON_TOP_PCLK		15
+#define CLK_GOUT_PERIS_D_TZPC_PERIS_PCLK	16
+#define CLK_GOUT_PERIS_TMU_TOP_PCLK		17
+#define CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK	18
+#define CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK	19
+
 #endif

-- 
2.45.2


