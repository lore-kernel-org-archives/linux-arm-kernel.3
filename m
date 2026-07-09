Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447DEC44503
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgMr1sVH1gqNoIkV7hj06U0SLfWgO0TXXsqV4Sv8fno=; b=drjK2F556ABWbjtNgKgV7FAgwc
	mPods5S/pr0FpsgW5fZAQl0zgCyqr35XwYCln9nj/8JKZxjrz/L6eQTTYYl1KAuF6s6Er3pwYaXIA
	I/hBSRLEVfRhPU0sE0L4WpVUiMgV4Y9sU/IRIgm7ktJnjLzm1WIYFTWw5e622vtWT5N3pt2wIT1RD
	6njset5hs/04uyVG3YeCXCD7ys1Rjg/4thHsojWySRrvQeH9szTmxabahRU2et5XWjZH8PIFZbqQO
	e3cPo72u/0YqzBQj8wFVHT6FTXFvJaROsXAj2gN1CLZM4bEWKr2lVzUYlZhkefiVXbcwuvIwzbx3V
	eUfI1nDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whk5v-00000001Pi3-2BIY;
	Thu, 09 Jul 2026 08:26:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whk5t-00000001Pfj-1So0;
	Thu, 09 Jul 2026 08:26:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B95F943EA4;
	Thu,  9 Jul 2026 08:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9668CC2BCB7;
	Thu,  9 Jul 2026 08:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783585612;
	bh=wy5SZcpI6/jWc/lOr/zKxKWEbpIR/CMuHGQUzKbv9qY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VCLhaRXOUoZ7zkZUf3rbYh6H6r9VVysnQmXfaOT9ZaJOldwR489rV1Ga3nToRF+Vi
	 aATrIp6IaeRsOKOzDyghiCzWbgqTmzBufW6RzdsIlSOe2dyI5AOtlSpUYeCI2dW9j8
	 1GGY3prAEbIQ1RVw5mZirDSmHOLLOIj8kECIoBdeWBMN6ss9JfEeYsgGn7oft/HEzh
	 vEZDV+YwjF47N+J4DGm5YcZ1SzNZwTuAyE6kLyes0Ujx+woxrgJZb9aSWodK3wz18U
	 S2G4f62ZpZS+KaJwGwdbnZQLgcgKV8mCQAoqtNYT4snm1FOW3wXHQjQKJYfYS/tBK4
	 /2fiO522uIwAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78BBCC44501;
	Thu,  9 Jul 2026 08:26:52 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 09 Jul 2026 08:26:48 +0000
Subject: [PATCH 1/3] dt-bindings: reset: amlogic: Add A9 reset compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-a9-reset-v1-1-fd7cf039b853@amlogic.com>
References: <20260709-a9-reset-v1-0-fd7cf039b853@amlogic.com>
In-Reply-To: <20260709-a9-reset-v1-0-fd7cf039b853@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783585609; l=1435;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=7LNW8ZvaZWeVEkBMdvk9VNvgoGwo+rCuBHKz7WRUMqs=;
 b=uONKi2L9TMAYQPdEjU+xjWFSPacFpUyOPj/7ey/WJawPT5d9d7oUYGyYwElqMKrmSROx/YAT6
 mvpejoyMxsQC/NK7D3hLvk4NGmdJN1+MHHtqheucvSKrVtHXXoHJ2wc
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

Document the reset controller compatibles used by the Amlogic A9 SoC.
Add support for the A9 AO reset controller and add the A9 reset
compatible with the T7 reset controller as fallback.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
index 150e95c0d9be..e585f71879f2 100644
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
@@ -19,6 +19,7 @@ properties:
           - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
           - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
           - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
+          - amlogic,a9-ao-reset
           - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
           - amlogic,t7-reset
       - items:
@@ -26,6 +27,10 @@ properties:
               - amlogic,a4-reset
               - amlogic,a5-reset
           - const: amlogic,meson-s4-reset
+      - items:
+          - enum:
+              - amlogic,a9-reset
+          - const: amlogic,t7-reset
 
   reg:
     maxItems: 1

-- 
2.52.0



