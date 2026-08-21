Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F363BC5DF96
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 15:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BwNNtgtguTBrAJ236L5Fx173zbpqjSentCCoSnY3y8=; b=ty2nZXzC8tD1Q3gAHQOAsSxsh3
	G8cxkqAFyh9OQvrY7Vmjq+JMM1M47tujhMBeVFHGtzZS22SvRU5g8MKNEtOAEiNVWzLfXOlzG4U0z
	bSWj1GV9hglfbibI9NQJ0pZnPP/ZlVRWZLYDbaAos9wmh48sPC9/+5nO5U+algylCaT1p+Nqc5idY
	Nh41oP5D7dcJ+6Ijz/gnFWD6WVMdYZB5DrlgwW2VW6f76peaLlgEfLTnyLmLPOk/X/sfEPl4iyJeX
	JWogPODGw5y8QmBcKn22npLhNrm2BaGWnGtB88mObzwfLuUQ8/Sh2UZzlVmguqAHuzFyz6oKnNY3U
	LMNpw5Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQxY-0000000Ddtu-1Xe1;
	Fri, 21 Aug 2026 15:15:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQxW-0000000DdtQ-35Kd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 15:15:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 10A5643BC9;
	Fri, 21 Aug 2026 15:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E34E7C2BCF4;
	Fri, 21 Aug 2026 15:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787325305;
	bh=NxlBY+QLfLmAZPcARcDdEqlxKsH4KI7HO6myhnvxzaU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NUTGEqiUFGVHxvS6KCrURe2ElqRZ3m5myIwvZznWJt6M27xYpWGw94Ksy8M+Ue/qJ
	 HM0KGLEdq715nnNg2g47/E1QSxCGzgBkYaZ9ZzrmH8o0kUzloqC1avUcbruN/+ORO6
	 qMdoZa0Qwy/Ad5H5GWZj5T0PhQmaeUAQrDSD4e/JQI+XVhVZcZ1Ud5maYxaxTdeX2n
	 NPYFdyhL/fgQfC6VSs78bKS9gKZnecCDPk0LqEt/JmlnSC/1yReWrTF6HrLd8ZYF6J
	 HuUHF6vO2t3Jnj+bXMv4G42HVxACunFBvWS4nCYGL7xaWgM5ZJM3/mOQJ8Hdq746KC
	 Z04vGyHYIKEtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C7BC5DF94;
	Fri, 21 Aug 2026 15:15:05 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Fri, 21 Aug 2026 16:14:49 +0100
Subject: [PATCH v4 1/2] dt-bindings: watchdog: samsung-wdt: Add
 exynos5515-wdt compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-for-next-lucky7-watchdog-v4-1-d070cee5009f@member.fsf.org>
References: <20260821-for-next-lucky7-watchdog-v4-0-d070cee5009f@member.fsf.org>
In-Reply-To: <20260821-for-next-lucky7-watchdog-v4-0-d070cee5009f@member.fsf.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2313;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=FomCRWunoZv/FcOKS7xgccqo7tYm7xEPkwn4AZZPbfA=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqiGt3Q8tb/3X2CNP+j2XwOC3vSWGkk8rvEPwIY
 vrBosRFilGJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaohrdwAKCRBJJwGyxHrX
 6xynD/95Qv0k65rFNjCS+jgOWHLGqO6p52BTj0Go3on1RpJydts29MLNi6SZ8GZlB6yoowT8iz7
 s2aEYRE7xN5fzBnZ7WasfMF020wcFisNZt07Y5pW02TdICOhv//UzfT2Lji4TDjVdhKSBHeQpd9
 2ZjlTKWevZ4RO/akI+3m+PSfek9jVdwgK91wt4jVjq0Vb/VdWqgNikhH5ZJ6OHewN0U90hg+/52
 kTvMBnqLPftY9onmQ3ufLwlUM9HuRkjDEJdpw1CBQbepUx2n24tdkhjBgwOzR1AddcHrUrejWG1
 7JNlVTi6CJLFl15SYInCVQvcypN+X0Ap1SMi9bfNAcrfNNwihrvWOQsmKEyJm9Ha+CopvzoCjzy
 X2d5Nydt2bOdtRsMPPONUy2oKX8peTSimt279ACB7+pyFjWBdqx/4mNtoZwtm5pkKMb9XK2ZTLp
 85Zy1V6/udnbo/E6aZjxHlUDd9UdIoaiONm9ihEr/YhJZDdKke5UbYPoIeHLphbgCnmd5GlZtNS
 ljwjUFyVoWmkVmyQr+rnc2q2PBJd1JA9BZALIgpUvdxexZ74G8LxCTd4HcCJKuQmNzMENKUexkQ
 e+AoVeL2Br1tAFSJjE+AHTZ+JzM8UcqORDzonNPiCbYo3ZVuGAl2w8Q21xHddjwLIUJOPoMu0Wq
 5FbcEpSuR3fr64Q==
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
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
Reply-To: aidenisik@member.fsf.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Aiden Isik <aidenisik@member.fsf.org>

Add a dt-binding compatible for the Exynos5515 watchdog timer.

This watchdog requires a syscon phandle, and the cluster index should
*not* be specified, as that does not make sense on the Exynos5515 SoC
(due to it only having a single core cluster).

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 41aee1655b0c..a32c47831577 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -22,6 +22,7 @@ properties:
           - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
           - samsung,exynos5250-wdt                # for Exynos5250
           - samsung,exynos5420-wdt                # for Exynos5420
+          - samsung,exynos5515-wdt
           - samsung,exynos7-wdt                   # for Exynos7
           - samsung,exynos850-wdt                 # for Exynos850
           - samsung,exynos990-wdt                 # for Exynos990
@@ -57,7 +58,7 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to the PMU system controller node (in case of Exynos5250,
-      Exynos5420, Exynos7, Exynos850, Exynos990 and gs101).
+      Exynos5420, Exynos5515, Exynos7, Exynos850, Exynos990 and gs101).
 
 required:
   - compatible
@@ -93,6 +94,26 @@ allOf:
         - samsung,cluster-index
         - samsung,syscon-phandle
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos5515-wdt
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus clock, used for register interface
+            - description: Source clock (driving watchdog counter)
+        clock-names:
+          items:
+            - const: watchdog
+            - const: watchdog_src
+        samsung,cluster-index: false
+      required:
+        - samsung,syscon-phandle
+
   - if:
       properties:
         compatible:

-- 
2.54.0



