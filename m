Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A55C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 20:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWk0Uj7EtSr+A4K6uF5Q71FhGNUe4uLJWwkNmartVCs=; b=Bqk5FRsq/42AiwKtS0D9ZJfFFB
	5UEFcpg0XM8BbBaDrRbenMicpv7TezzZuv5wGaijUBpUtWZ8wo2AfM94iUE3Zu+FOjwbvVdGetpeh
	ExnzJDK0STrg0aJupUUKHTDmUrU7oOgnrKdvhSvVmdfBoXWqfn0BuC9Mx/3SpnfgXP9azfMDWU0Rx
	zmLzGYdxThZJtg6VZbHiyuUSmrroiy9H8FFEVuPsz5sMMHoh4bFHUK1qrPlDv+9IuIVGXuiU4NEE4
	gmW2z9MV1bY/ARw59tEWcdrNIeBrAl1H/Nfx0Q313QN0PNGM28zyerX7n9ZJfmKdu9cAmx7l6nTkJ
	VIvDX/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7Lz-00000005q30-1F8q;
	Mon, 17 Feb 2025 20:04:31 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7GZ-00000005ofe-2i8H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 19:58:56 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=Dw5kxt+HYYhcmvrjdOPCKyk43WTAUhyq2XDem4bo9okxTeWIhYPMqpMCAT1D+KxP6zQgWLfNX2HdFFS71GanVGEI3XN0ggxss0/GHWRBeG2Dy0qV7yS6tdsCUNWOwSliPP69iErIAjiGr4VjR1lcAPr6Wcx+T/9PYfl1BHeO4tLw6P6cQIcLllARUDjDyGEBBbYduES0QSYfberDIIOLxg+AFCrczBFLSQ6oIXX0aU2m3JAuxSRQmo2oqdzr7iUcwPEz8fPkUfYeWJA7jELFGXpgJQjmX3ZTEE1sj6jnDBhYFbfSHSRj7efZagJF3TjF58+SRjpb9IrLlU6FeoLGoA==; s=purelymail3; d=purelymail.com; v=1; bh=SPdcceQIrWy9e+q/WCXMdXaf03a7PKveE0Jmb4TEZcI=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 234657940;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 17 Feb 2025 19:58:18 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 17 Feb 2025 20:57:38 +0100
Subject: [PATCH v2 1/2] dt-bindings: watchdog: samsung-wdt: Add
 exynos990-wdt compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-exynos990-wdt-v2-1-3eb4fbc113f4@mentallysanemainliners.org>
References: <20250217-exynos990-wdt-v2-0-3eb4fbc113f4@mentallysanemainliners.org>
In-Reply-To: <20250217-exynos990-wdt-v2-0-3eb4fbc113f4@mentallysanemainliners.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739822294; l=2817;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=SPdcceQIrWy9e+q/WCXMdXaf03a7PKveE0Jmb4TEZcI=;
 b=6zHp7CPANnkBjbzBYEOe3e20TGfEEKu7Vfl9+SRJzL+5xXnS8kfEe4vZ/2WSfgJotlrPRU5rw
 C8WBkMB4FrOD2NG+bcQTUwEQ3LnrAyHVyFz+6n5qqBe1jibMPxpeSxT
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_115855_754938_AD540165 
X-CRM114-Status: UNSURE (   9.86  )
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

Add a dt-binding compatible for the Exynos990 Watchdog timer.
This watchdog is compatible with the GS101/Exynos850 design, as
such it requires the cluster-index and syscon-phandle properties
to be present. It also contains a cl2 cluster, as such the
cluster-index property has been expanded.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index d175ae9683366d33b1f9d9d820501d1e7c5964bd..53fc64f5b56d33f910395d32b35e0905b8b9aa53 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -25,6 +25,7 @@ properties:
           - samsung,exynos5420-wdt                # for Exynos5420
           - samsung,exynos7-wdt                   # for Exynos7
           - samsung,exynos850-wdt                 # for Exynos850
+          - samsung,exynos990-wdt                 # for Exynos990
           - samsung,exynosautov9-wdt              # for Exynosautov9
           - samsung,exynosautov920-wdt            # for Exynosautov920
       - items:
@@ -49,14 +50,14 @@ properties:
   samsung,cluster-index:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      Index of CPU cluster on which watchdog is running (in case of Exynos850
-      or Google gs101).
+      Index of CPU cluster on which watchdog is running (in case of Exynos850,
+      Exynos990 or Google gs101).
 
   samsung,syscon-phandle:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to the PMU system controller node (in case of Exynos5250,
-      Exynos5420, Exynos7, Exynos850 and gs101).
+      Exynos5420, Exynos7, Exynos850, Exynos990 and gs101).
 
 required:
   - compatible
@@ -77,6 +78,7 @@ allOf:
               - samsung,exynos5420-wdt
               - samsung,exynos7-wdt
               - samsung,exynos850-wdt
+              - samsung,exynos990-wdt
               - samsung,exynosautov9-wdt
               - samsung,exynosautov920-wdt
     then:
@@ -89,6 +91,7 @@ allOf:
             enum:
               - google,gs101-wdt
               - samsung,exynos850-wdt
+              - samsung,exynos990-wdt
               - samsung,exynosautov9-wdt
               - samsung,exynosautov920-wdt
     then:
@@ -102,7 +105,7 @@ allOf:
             - const: watchdog
             - const: watchdog_src
         samsung,cluster-index:
-          enum: [0, 1]
+          enum: [0, 1, 2]
       required:
         - samsung,cluster-index
     else:

-- 
2.47.2


