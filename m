Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C06EC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRh1SLhMiStwGt9nJg+3zWmBJZsQViVNXNAHf567sjs=; b=l+gTP96dzAXb5W0ucATEdBxAp0
	6ZyTX1Bq7sBWqxlRqeSWh814DE7XNxyK2wHn4xKL0G2RP9IK1VZIm1aZf1XDXljAd9KCcHtrSMf45
	E1/sKYIbbl55xL9M6B+Tdq53n3QaEz+NbYWfmoC7sdxS4r9tQRFbmnAKGv1uCWrUiBjQbLnEcvUzO
	Nwr7ps3uwg87Pcy5HgDgrJ5Ogy1hY7rZJlkkwP812ok42km+XayMRiOS2nLhg1FPykcT/D6UyG3UQ
	sH2fe1KfTMf6ZShbQLdovSBxWu8Gayx2Y4Q1b9/pq3xkOpxOO8xSt+fMAA78aDtuQ2+Ti06MWJyI9
	izBUUyEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54au-0000000HHBx-1Qwv;
	Fri, 11 Sep 2026 16:59:20 +0000
Received: from [2a0f:4ac0::3a11] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54ar-0000000HH69-3Tc5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 16:59:19 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1789145940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xRh1SLhMiStwGt9nJg+3zWmBJZsQViVNXNAHf567sjs=;
	b=QO96gQgvJK3AcAfDBNzqVilkvuyE1sq07mFRJ3aH+WgzpTZfcHKsfHY918Li9ziYcjjS2F
	hjHve62MjiDeNkL/S7BoRIDT9o4BK/jGLTPFoTyITakpZQ5/rqB9WO+vZQb3Tzu/YKspJo
	V1DIQ9dVy6yYgg39kg8bvbVoipzTfbo=
Date: Fri, 11 Sep 2026 18:58:38 +0200
Subject: [PATCH v2 1/7] dt-bindings: arm: cpus: Add Apple A18 Pro CPU core
 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-apple-a18-pro-initial-devicetrees-v2-1-08d06cf011d4@cyberchaos.dev>
References: <20260911-apple-a18-pro-initial-devicetrees-v2-0-08d06cf011d4@cyberchaos.dev>
In-Reply-To: <20260911-apple-a18-pro-initial-devicetrees-v2-0-08d06cf011d4@cyberchaos.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_095918_122303_F7D50832 
X-CRM114-Status: UNSURE (   8.39  )
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

Add "apple,tahiti-e" and "apple,tahiti-p" compatibles for the A18 Pro
efficiency and performance CPU cores respectively. As with the M4 cores,
there is no longer a generational codename, so we assign the core
compatible based on SoC codename ("Tahiti") plus core type (E-Core /
P-Core).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index c328e9fb9843..5d79da63301b 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -95,6 +95,8 @@ properties:
           - apple,mistral
           - apple,monsoon
           - apple,sawtooth
+          - apple,tahiti-e
+          - apple,tahiti-p
           - apple,twister
           - apple,typhoon
           - arm,arm710t

-- 
2.55.0


