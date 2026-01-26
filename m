Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629D7C88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 06:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9whQ6q8MBQUnIiNUSIGUTvw/Yph5xN75tmxAj059O8=; b=mR1QjoeoWLeYAz9uqZvlfSnd93
	w/zUTXDuTUu29/dtnbou0Y9ITFNeVNzL9E4czIkfbA8AFBJPU6Ygkza/LYDwugYdfBraoVivysbyu
	ZYTDyF5y8cT/z3netfAqpe/74PMdmvgLBDFI+JZqnaK9DdR/CRnncHJTA4WMDMwEJjYHCMPIngHl0
	L8pi6i2acKmns9lFkraQVipu7dG0NBqmkftj8GcbqEHDDuIoLiyZru/JSq9FZ4TYtnpAYTlSHMBY2
	HBZpuFbV32TSW66h5iUsimAiu8omODrkxV1QpOYziTjOJWAwRR+9bQIUzpjafmIAdvml/xrbiRtx0
	QeELhrpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkFfw-0000000Bxf6-2u0Q;
	Mon, 26 Jan 2026 06:02:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkFfu-0000000BxdD-0zfe;
	Mon, 26 Jan 2026 06:02:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2222F600CB;
	Mon, 26 Jan 2026 06:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB2F6C19425;
	Mon, 26 Jan 2026 06:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769407328;
	bh=BrhkKB6HmcoErJBgY91N9xBBRXQmOjBv4hptw7osCQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XjGHUeOAuJBndy5IA2twsmAdEhN6c8RZhnyAtidCEEatGKrhIMuv4NSO4ANlNGSEi
	 OFTtPcS14hy7XfXBKhp5iTq2ezBPIZDkL3nHPPzo/Vtkp9Si/h4I33ITYVYkbKXXbm
	 sxVU0IhBUzzHm27jjXaijzGxM7QphqDgifvGehicgcD4MJKZkUHwUKZzWKkuA62SMw
	 A+q2sqOUXJ9rFxAyJ7M/+rEB+iSPT+UtQ3zf/XbI+CZe9lAlwvsDs0m5S1V0llQg/N
	 JTBMEDpn/F3nJr9+WEBazuzZmFLauN7o2PiSl1HIaZ5VuTYusbROYD5ZnlDmVogyh/
	 9SXg+xIU6tJtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA66C88E4A;
	Mon, 26 Jan 2026 06:02:08 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Mon, 26 Jan 2026 06:01:42 +0000
Subject: [PATCH v6 1/5] dt-bindings: clock: meson: Add audio power domain
 for S4 soc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-audio_drvier-v6-1-99e350855bc2@amlogic.com>
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
In-Reply-To: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769407326; l=1646;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=6xMGlQVRnvNr+HsMV5CJO4QIQGLb0IjOxYc1JtOCi88=;
 b=w8tEvILb0hHB/6DvWewpbF1lzzl0s7YS496kAxyxmfxGSiLWpA8TEOwgYiX+oaT3sHOyHQEfo
 ziTCp0wYllVCkqezBVVqun/ZpuK7kJv535HAsHQpnC7jEPf/SH22Uc+
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: Jiebing Chen <jiebing.chen@amlogic.com>
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

From: Jiebing Chen <jiebing.chen@amlogic.com>

The audio power domain has been found on S4 device.
It must be enabled prior to audio operations.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
---
 .../bindings/clock/amlogic,axg-audio-clkc.yaml         | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
index fd7982dd4cea..1cd9a99e5ff3 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - amlogic,axg-audio-clkc
       - amlogic,g12a-audio-clkc
+      - amlogic,s4-audio-clkc
       - amlogic,sm1-audio-clkc
 
   '#clock-cells':
@@ -99,7 +100,8 @@ properties:
 
   resets:
     description: internal reset line
-
+  power-domains:
+    maxItems: 1
 required:
   - compatible
   - '#clock-cells'
@@ -115,6 +117,7 @@ allOf:
           contains:
             enum:
               - amlogic,g12a-audio-clkc
+              - amlogic,s4-audio-clkc
               - amlogic,sm1-audio-clkc
     then:
       required:
@@ -122,7 +125,18 @@ allOf:
     else:
       properties:
         '#reset-cells': false
-
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,s4-audio-clkc
+    then:
+      required:
+        - power-domains
+    else:
+      properties:
+        power-domains: false
 additionalProperties: false
 
 examples:

-- 
2.52.0



