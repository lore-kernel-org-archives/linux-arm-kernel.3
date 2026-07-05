Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDCEC44501
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 13:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvQUAUCwAfcZDX8PHBveczrclI+JvLBIutD5E9eHeUc=; b=EDQW25O6bhKSjkm/MCma6hdiec
	bCWEw6WUa/vCcRWp8GRZWoHOrCmJCUtMxV0GTAkEjovlWKhEMpaIC0iJJM3YpcSOv+a8ODk4BjSF4
	OIAgcl9sG63bd5+IM70NwUqVtt0Mldz32zTFqjkINxRluFZInLtPTJWfV07EeQrYahEBUya27Lqka
	0QDthd56lHubxCwvTT3a2ymEIxL2oQL0k8eJzyaOGgyYtbjrRn71dbTIpjzdhZZAmTd0LOBOC/7Ur
	CAHxuorfPRm7qanPW8aKsrORRVFd3liE6M7FwJ4whsRTTbWboMfIDOGfWh7+TIwXOlwKWO2nqwJEF
	z4jlMZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgMjK-00000009KJM-0DBa;
	Sun, 05 Jul 2026 13:17:54 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgMjE-00000009KDw-1hlG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 13:17:49 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1783257457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rvQUAUCwAfcZDX8PHBveczrclI+JvLBIutD5E9eHeUc=;
	b=cvUbClnTIcZskgU4JHtxxFc3LPdzucm49wvEX6rJARN+1wo0Xtd14UVkou93tVsslD4P/N
	UKbATiSe/guNgSOgKSrkI6sLbGW3IoeUVNj5l+sq0rqun2BprR2Mfooq26ZjkZqEYy6/Oc
	7vwOkQedMzOvA4+wG3FbWa1guQjCBV0=
Date: Sun, 05 Jul 2026 15:17:28 +0200
Subject: [PATCH 09/10] dt-bindings: arm: apple: Add M4 based devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-apple-m4-initial-devicetrees-v1-9-e5655ee56523@cyberchaos.dev>
References: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
In-Reply-To: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Hector Martin <marcan@marcan.st>, 
 Linus Walleij <linusw@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_061748_642347_B83A8F14 
X-CRM114-Status: UNSURE (   8.02  )
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

The Apple devices with the t8132 SoC (M4) are very similar to their M3
predecessors.

In addition to the MacBook Pro and the various MacBook Air and iMac
variants, a Mac mini is offered again with the M4.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index e49403c73f9d..3262292252d2 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -315,6 +315,18 @@ properties:
           - const: apple,t8122
           - const: apple,arm-platform
 
+      - description: Apple M4 SoC based platforms
+        items:
+          - enum:
+              - apple,j604  # MacBook Pro (14-inch, M4, 2024)
+              - apple,j623  # iMac (24-inch, 2x USB-C, M4, 2024)
+              - apple,j624  # iMac (24-inch, 4x USB-C, M4, 2024)
+              - apple,j713  # MacBook Air (13-inch, M3, 2025)
+              - apple,j715  # MacBook Air (15-inch, M3, 2025)
+              - apple,j773g # Mac mini (M4, 2024)
+          - const: apple,t8132
+          - const: apple,arm-platform
+
       - description: Apple M1 Pro SoC based platforms
         items:
           - enum:

-- 
2.54.0


