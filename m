Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DFEC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 07:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7uJC7/wnNtUu5pJ4qQt6a1rT5FvciTWgegURwHTTr0=; b=a/SufdiNvS4RRp2gkgI6TccmC7
	dDFSmdkHE7GiulAGe8Hi/L+UtIgwGT2NTkTt6HcIbI4h9J2FrCDN12b7inkHoI7KHx+ZOwfR2rNkD
	JexXJyfKrr1TUE4BzDFwElKIJiZwUGSh6ttMbwqSp2jL7qCD8BWIRfmMuq5F5Ki2gZo1q6q28H/gU
	rRXgQcpDDefsJQoYgl3exYA8bPksAcpfA4kWbW6+IWonetV6L+C77dkieVvXxFBgavCN5203RlqrF
	Ofuia3XEa6aMqBiBmGLZhYfzMJiWYAHTWemwOVETDK/VOvYyMRyBXlXzmdFvUnoUYceI1wrTr0Fyb
	xf80dwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tunXO-00000008BbZ-0d1T;
	Wed, 19 Mar 2025 07:08:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tunVh-00000008BF7-0vLU;
	Wed, 19 Mar 2025 07:06:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 61D1D61145;
	Wed, 19 Mar 2025 07:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17C15C4CEEA;
	Wed, 19 Mar 2025 07:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742368000;
	bh=tvgPwCRWbi/ALkXQMLlct6LyeXt6Qqe+tJZSRrxXF0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W8JXI4ps/GpodZ9fu7N4s22fdmV9+leBQrvBov4qjUUvvZ7JzgZIEMcPGcLSxUavI
	 bhO8Z05FLZAzpMKLWq9tazy0NcrsHvb5dA0C41XggqZWbV2TdlKyAOy9nDYzD4Ltw9
	 LUVXlxbDnaz9aKjZDLStMOcsHL8T6c8pvwqBsIQ7YXYX79cIQRywWiDFBGXqA1r80w
	 vJ3Xuzlwq9Y0RAXrS0PtE7RTLPJPCMaz6nvdH02L5I9n50ooRcHrNUJtvmIk2RpoUy
	 jHYJ+3YXxotJafv9eVK/Z7AsZ2oNd22AhtvM283Y5IYM5uY0g2qQV+Wd+GvPanE410
	 GTquB86c6Sueg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0E8C35FFC;
	Wed, 19 Mar 2025 07:06:39 +0000 (UTC)
From: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Wed, 19 Mar 2025 15:04:44 +0800
Subject: [PATCH v4 1/6] dt-bindings: clock: meson: Add audio power domain
 for s4 soc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-audio_drvier-v4-1-686867fad719@amlogic.com>
References: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
In-Reply-To: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742367997; l=1779;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=LILue2hV/0RBI1wyR/+9esvdXN1gHROx+an1AXnFBQ0=;
 b=5p4uPDUvvHQ9UwyB7WW54kKulEkuralm/Z3oOIisosXjHg1ryW9BuqvlnKrqjlbFOTuCyxTtp
 ZB7idtOCV1MAQgWuF9mAAU56S+UpnvWu8ImxLz9HLy4nvtUq8rlKrrr
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: jiebing chen <jiebing.chen@amlogic.com>
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
Reply-To: jiebing.chen@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: jiebing chen <jiebing.chen@amlogic.com>

Audio power domain found on S4 device.it need to enable before audio work.

Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
---
 .../bindings/clock/amlogic,axg-audio-clkc.yaml       | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
index fd7982dd4ceab82389167079c2258a9acff51a76..50a5cbb6eb64873dd5aa55f6f1a63e9e97542760 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
@@ -21,6 +21,7 @@ properties:
       - amlogic,axg-audio-clkc
       - amlogic,g12a-audio-clkc
       - amlogic,sm1-audio-clkc
+      - amlogic,s4-audio-clkc
 
   '#clock-cells':
     const: 1
@@ -29,7 +30,7 @@ properties:
     const: 1
 
   reg:
-    maxItems: 1
+    maxItems: 2
 
   clocks:
     minItems: 1
@@ -100,6 +101,9 @@ properties:
   resets:
     description: internal reset line
 
+  power-domains:
+      maxItems: 1
+
 required:
   - compatible
   - '#clock-cells'
@@ -116,12 +120,26 @@ allOf:
             enum:
               - amlogic,g12a-audio-clkc
               - amlogic,sm1-audio-clkc
+              - amlogic,s4-audio-clkc
     then:
       required:
         - '#reset-cells'
     else:
       properties:
         '#reset-cells': false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,s4-audio-clkc
+    then:
+      required:
+        - power-domains
+
+    else:
+      properties:
+        power-domains: false
 
 additionalProperties: false
 

-- 
2.43.0



