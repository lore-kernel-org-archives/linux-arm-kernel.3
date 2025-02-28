Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5BFC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 08:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+OL3KH00YP4wEJQ9GeRxGskIYNWL+kcfeKyJ6xiOXM=; b=jvRwQrueK1aBrXuaQ896tnF6bM
	gyupXh6WzmvYT8q5lfmi10J7iVWUSsvFKiM7zkt9tmFK0L7LWcdWDZynmh7iUMj6wce44jJ9KQgyu
	HKl9CLYxID83/peUeALlxkdH9RmlBEAkslT4B0wbG2Sd30d//cfE+Z9Hdw8v3QUqWv4Gg4Ohj7r+b
	Rs2iDmtjUVY+12tIcebdkwXE/7tUfWxpH7tjfJQCFYya8Pquz9Xuzahd/DsBL8bvPEF1R/7WdgWPI
	qXiG8arp7Ru65R4S9MBtpctotIvtn+LZjOVDd4GtWBGkj+UUpMjhqMt8YuTFyEa+70ywh2jil6FLD
	GxaxLi1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvST-0000000A7HB-36gB;
	Fri, 28 Feb 2025 08:10:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvMK-0000000A5SY-2Kub;
	Fri, 28 Feb 2025 08:04:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD3725C65D0;
	Fri, 28 Feb 2025 08:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2E1CC4CEE5;
	Fri, 28 Feb 2025 08:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740729875;
	bh=qclF5RziGVkBEvVZQqyLYKAdgb+35oYJQiogxiNf9tI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=azJ8TAnBSVd9E4xryncpwYxjmCrt7LKSTxTH6icuiX9bYCh0EJUkcvmLTGoaLbC91
	 vvlNAX7i1UMpShEe8JATEmTo9hrxuJ9CksqHhAHsYBY7enUbemOVHy+5kGPHHCEUaF
	 9Xh+XU95N1wHAQetPXpPQamsPP4LAPGNZ4yQflrnTOxheH+C6zdLjrsM5Ilm+nFBwD
	 F/kDe4UXIEh1M+NLTYWnrJa29zvwlqxBeQ+o6xEacHfXr2SterDiom5ZF8hLU2Ur9X
	 6b0zmP1j8zizosDMIWq+BdOlBNdy9raTNXFP5ZORwvBxSTnFNFJ8hqn1Htw4uhQ11k
	 uXS5VcdIiZpdg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BCBC282C9;
	Fri, 28 Feb 2025 08:04:34 +0000 (UTC)
From: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Fri, 28 Feb 2025 16:04:09 +0800
Subject: [PATCH v3 1/6] dt-bindings: clock: meson: Add audio power domain
 for s4 soc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-audio_drvier-v3-1-dbfd30507e4c@amlogic.com>
References: <20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com>
In-Reply-To: <20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740729872; l=1660;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=uJ4Qa4aXJPLqZsf/j77ROeiKcn94cDW8vS8T/9MHHao=;
 b=7P167RBJ6BxgHSA35fu6wKaUYR4qXSmTQ8Uz0DAk0J4gnWzl7E7aa37NHs4369qaLnS0or1NH
 /fIUnGYGCHEC2cJT65yYsp8o6vKon/3nLYCnAsN9iEKmLAdi7kQaPXq
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: jiebing chen <jiebing.chen@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_000436_713379_50C84BA4 
X-CRM114-Status: UNSURE (   7.90  )
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
Reply-To: jiebing.chen@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: jiebing chen <jiebing.chen@amlogic.com>

Audio power domain found on S4 device. It need to enable before audio work.

Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
---
 .../bindings/clock/amlogic,axg-audio-clkc.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
index fd7982dd4ceab82389167079c2258a9acff51a76..364783c6f7572b09d57de2b35d33adb7bcf7db18 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
@@ -21,6 +21,7 @@ properties:
       - amlogic,axg-audio-clkc
       - amlogic,g12a-audio-clkc
       - amlogic,sm1-audio-clkc
+      - amlogic,s4-audio-clkc
 
   '#clock-cells':
     const: 1
@@ -100,6 +101,9 @@ properties:
   resets:
     description: internal reset line
 
+  power-domains:
+    description: audio controller power
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



