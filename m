Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662FFC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 08:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vsmVBz9IQ+2byx1Wv6YhTy8OyswkF2WvFAB1mu7D3HQ=; b=X2mFtN+hMC6/KTOjY8zmbic9Ps
	cnDGF3MjIHK3EvKDl+ESEP+30y3chKJWdPjhAorXzOFrodaOZ0R8gg2vigFdV3H3hZ+zGpmeJfFZL
	00lNI4jLMFh6DI9TYmluXYYVOkKlimQ1ScJCosnO9XBdPrWYFqvobYCPw1lUkLLQHxCGafHSTJVXe
	6D0XavqmQ/pjToykDZcjPBYs5E4yKpQKSp+5Z+2WyFwjB6NRcFtBYYVgwJ05CL49G5ZXswPRqg9Ln
	lUgWrOWRAdiY83xSb007az8OQF1nXWIVqqjzV2CirT8lqUFbc1OFjguvc/1XFDTY04xAzsd8GRHA9
	onPzHpLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Cg3-0000000H5fd-3TDb;
	Sun, 20 Sep 2026 08:13:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Cg3-0000000H5eY-0W9r;
	Sun, 20 Sep 2026 08:13:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0870444E7;
	Sun, 20 Sep 2026 08:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58B79C2BCFB;
	Sun, 20 Sep 2026 08:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789892014;
	bh=zJ4Kq0ilfuKS6ulNMZMQIAYed/md/A689VodwX/hPzc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=M6SyDQS8Snru8vjucK4v7O4WRsM1gD300q/JYXyIsM2gcOm/OvKd53Jr8juTiZsrD
	 WBPVVmkqopihFl9v1BhYpeOu7nFtvo0XuWFYE0oImf5SgaYwPqTiFNQmcFeuXo/j8a
	 +NbByStJZ4R7gw0Cj6dBi9e7RWxD6iNhSVUMG0TpIsJ9PC2Q7cws4pVzbp0QSEiOtk
	 vCoNondtGjtuXxfs1TZeAwHtdzPDOD12slhjruifvY0gqOAPh18xxYpACW6VKN4Ymy
	 MZTQ3nPkba1mOwwC3sn6u3yplZCrfiIcKDkCJPl/PILi3TQ5qUStWABw57gjRzha/v
	 GCp3wwoZtNitQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABEBC982E6;
	Sun, 20 Sep 2026 08:13:34 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Sun, 20 Sep 2026 08:13:29 +0000
Subject: [PATCH 2/3] dt-bindings: net: meson-dwmac: add T7 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-t7-node-new-v1-2-e6e0840c1b0b@amlogic.com>
References: <20260920-t7-node-new-v1-0-e6e0840c1b0b@amlogic.com>
In-Reply-To: <20260920-t7-node-new-v1-0-e6e0840c1b0b@amlogic.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789892012; l=1537;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=abTtflC0UcLD+x5kKzaRfULETMk7wpSe7VhzrgrkyKk=;
 b=Xcjkq4cXvlSWwCECEchY3frjVxn0apaxGFXF2H1YZnqGdeP0qtqcPy2fGBF3YbMQaLZhc1VPM
 75XgH1ade34C1T7656apcYR9pzp5XdTv6rBpsQq5G0yHbxF0IiyuR3m
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the T7 compatible to the Meson DWMAC binding.

The T7 DWMAC controller requires the following compatible combination:

amlogic,t7-dwmac
amlogic,meson-axg-dwmac
snps,dwmac-4.00

Add a conditional schema check to enforce this compatible combination
when amlogic,t7-dwmac is used.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/net/amlogic,meson-dwmac.yaml       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 5c91716d1f21..f75a275e2d75 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -28,6 +28,18 @@ select:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-dwmac
+    then:
+      properties:
+        compatible:
+          items:
+            - const: amlogic,t7-dwmac
+            - const: amlogic,meson-axg-dwmac
+            - const: snps,dwmac-4.00
   - if:
       properties:
         compatible:
@@ -139,8 +151,10 @@ properties:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
     contains:
       enum:
+        - snps,dwmac-4.00
         - snps,dwmac-3.70a
         - snps,dwmac
 

-- 
2.52.0



