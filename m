Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6592BC982FD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 05:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Af8TwPCb7YQtB1DRhvXqZWJNq/YmJVSLp6iki5l+Los=; b=0EPTMZsNwiHQq/P7tjma51AoEd
	1F9O02K+/Ip0JqQ981YPH1rNtQEx1Yz+BGsWHqB4aS6zr9+znI/FmmhEMNvb4YvYwLlrEQxC13nWI
	bA0EhPuweWJI/p0djRljUh3dg44REQ2f3YcI7A4NVJK+EwLa5+L8nhjjpj7VHeCF7xb5THgJLVZDI
	zUM+dVCVwkZizoKjaGkt8Z9PJVlu4kj4xYbDaeuGfARhSzxoI0ohNje2HZByRPeXTWSXQFI2knGFH
	hagTcyMEuY+Vq8Pp3P8TaBvxBoBA8E8Rvp5aQEY/rQG/6RqHxtQXpAOeRkKarZO0vNgclVPMUlwts
	KUnDtHJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cMX-0000000A5Nd-3tCx;
	Thu, 24 Sep 2026 05:51:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cMU-0000000A5MK-2sDZ;
	Thu, 24 Sep 2026 05:51:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F9ED43F4F;
	Thu, 24 Sep 2026 05:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4BE7C2BCF5;
	Thu, 24 Sep 2026 05:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790229074;
	bh=A7pJRhG7NpywLWWaoMaC1pUfWSZ7AsdAS4qYr97/LYU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=i/PKkUWQCRZeWuO/uJcScyhyJRSLsD5k/27RsQRzQZnnab/NxIN41Btoy0I+1OGv/
	 DK08GgTz7lxN6iuOZm2RAxVsOhX6ScgpFOxDwP2daTSLoICS5HgtWu3QEAH12fCre7
	 O6kTuAXPnYUOSdWch14qHeXP8J5YDquBu7XtV8Cs2C9h8l2nRGeTEpkb+KzfmoKutq
	 7sdAGqMjAZKA6iMyMAFPjdtfrLnMsy5VI8Xzx8KvR5+3XpK7DfENen7AUwxA8jRmAI
	 ZPbpABZqkMsK21gmwgzPWLG/tBJ7nnnvFdtqX9R0G0R3MdP2zwKW316NSQyXw8qtWG
	 8rTdoB0kv+bHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD13AC98310;
	Thu, 24 Sep 2026 05:51:13 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 24 Sep 2026 05:51:08 +0000
Subject: [PATCH v2 1/3] spi: dt-bindings: amlogic,meson-gx-spicc: add T7
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-t7-node-new-v2-1-319d3c19b4b2@amlogic.com>
References: <20260924-t7-node-new-v2-0-319d3c19b4b2@amlogic.com>
In-Reply-To: <20260924-t7-node-new-v2-0-319d3c19b4b2@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790229071; l=1575;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=Cr+H2n7PINWdLBG8TQcHVSgRz7Rd2HsUY6kC9/oqBVw=;
 b=L8OZAvoJnP38zJl2OU6S+U61CNjL2hKNteVFl5Qj4MLNqx4kxoz1SHfp03/tNLBbTKSCMYOYC
 PfUe3ykqN4ZC+T5X392SZTEs6CCSZ6a/FBInRdr18naeFhtkGIlDhU7
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

Add the Amlogic T7 SPICC compatible to the device tree binding.

The T7 controller is compatible with the existing G12A SPICC
implementation, so require amlogic,meson-g12a-spicc as a fallback
compatible for T7 devices.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml     | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
index 4e28e6e9d8e0..f0ba15402a4c 100644
--- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
+++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
@@ -16,10 +16,15 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - amlogic,meson-gx-spicc # SPICC controller on Amlogic GX and compatible SoCs
-      - amlogic,meson-axg-spicc # SPICC controller on Amlogic AXG and compatible SoCs
-      - amlogic,meson-g12a-spicc # SPICC controller on Amlogic G12A and compatible SoCs
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,t7-spicc
+          - const: amlogic,meson-g12a-spicc
+      - enum:
+          - amlogic,meson-gx-spicc # SPICC controller on Amlogic GX and compatible SoCs
+          - amlogic,meson-axg-spicc # SPICC controller on Amlogic AXG and compatible SoCs
+          - amlogic,meson-g12a-spicc # SPICC controller on Amlogic G12A and compatible SoCs
 
   interrupts:
     maxItems: 1

-- 
2.52.0



