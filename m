Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1C3C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 11:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kn/+F5wzHlw8bIMGSe6Fg0qLWsnCPJXbYp/WDkuz5w4=; b=Eoi4aie1+r360BFd4eZbjc0Kbh
	fVFaVG0e7w9FwpNZZ4kqUdcLBDiIUj0280Zh51JEMPzEfw+Ov/S5c87gw30KZs/9BYFJX1byMkAyu
	ODWClR9dNIONfvgGGWAvifmqP/t1Go9rO/+y52izNGNaCiP4OMXgat//vEZL14mvd6Uttsig8EDyh
	03SMKppTCcp5QgjyGEDXCzGzGl5yiAzKghGKnyoZkbrbl8GqRsjcv8k/pnhMxBEbAC2QcZTulZW3t
	T99QNcj1gVAah7tmNP8fVIB4ACEUqt8xih8YW0swjsVFCuP1ILFQ4V3tB3SOCIeEWkD4P4A8H5Ny8
	VpitS+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEj1-0000000CwxM-0VDq;
	Wed, 28 May 2025 11:13:36 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEQM-0000000CvGB-465G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 10:54:20 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=jTiJGQdsCmZMEXP3gFgOQDOSjH0QEjZ8GGVwwvgcwHzLqI0p5osRERcq/pfByCUMf1TNS5fRePgSJDzD9AXWhAa3FGqWBOFZpozxG+M2p40ZCxSn8BhCEp50LrrxwMf/9fSBQc7t0kavcKTXhSe25HJR32dPFyPwoTDUKhdGbuxXPIJmDg+RAO9Y+PqX9Bp0S76oRAeNcm4nVebItWQhth7ujro99NQA6pbi2fwVn8XfNXj1iMlF4fy/FVDJqvXfNa8GvsHOi6XH40jmuCHe290ElWsKm6GDOC7tmqPu10f/Xhi4vUAof03dW/w45jI3T5uwFVP4K5NLQHP6Jtc6Lw==; s=purelymail3; d=purelymail.com; v=1; bh=JgCYTvLWUK/mh8lOqOaJ8RLcYi0tSYTu+9p0SfSb+sI=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1157235224;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 28 May 2025 10:53:47 +0000 (UTC)
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: clock: exynos990: Add CMU_HSI1 bindings
Date: Wed, 28 May 2025 11:52:51 +0100
Message-ID: <20250528105252.157533-2-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250528105252.157533-1-umer.uddin@mentallysanemainliners.org>
References: <20250528105252.157533-1-umer.uddin@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_035419_111461_E47E0C51 
X-CRM114-Status: UNSURE (   8.50  )
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

Add dt-schema documentation for the Exynos990 CMU_HSI1 block.

This clock management unit provides clocks for the DesignWare MMC
controller, PCIE subsystem and UFS subsystem.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 .../clock/samsung,exynos990-clock.yaml        | 27 +++++++++++++++++++
 include/dt-bindings/clock/samsung,exynos990.h |  7 +++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos990-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.ya=
ml
index c15cc1752..ce3b845ce 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
@@ -31,6 +31,7 @@ properties:
   compatible:
     enum:
       - samsung,exynos990-cmu-hsi0
+      - samsung,exynos990-cmu-hsi1
       - samsung,exynos990-cmu-peris
       - samsung,exynos990-cmu-top
=20
@@ -80,6 +81,32 @@ allOf:
             - const: usbdp_debug
             - const: dpgtc
=20
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos990-cmu-hsi1
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_HSI1 BUS clock (from CMU_TOP)
+            - description: CMU_HSI1 MMC_CARD clock (from CMU_TOP)
+            - description: CMU_HSI1 PCIE clock (from CMU_TOP)
+            - description: CMU_HSI1 UFS_CARD clock (from CMU_TOP)
+            - description: CMU_HSI1 UFS_EMBD clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: mmc_card
+            - const: pcie
+            - const: ufs_card
+            - const: ufs_embd
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bin=
dings/clock/samsung,exynos990.h
index 6b9df09d2..3164cca44 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -254,4 +254,11 @@
 #define CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK=0918
 #define CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK=0919
=20
+/* CMU_HSI1 */
+#define CLK_MOUT_HSI1_BUS_USER=09=091
+#define CLK_MOUT_HSI1_MMC_CARD_USER=092
+#define CLK_MOUT_HSI1_PCIE_USER=09=093
+#define CLK_MOUT_HSI1_UFS_CARD_USER=094
+#define CLK_MOUT_HSI1_UFS_EMBD_USER=095
+
 #endif
--=20
2.47.2


