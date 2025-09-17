Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF255CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lCAI6w3epICgyga2zfT/cViCkNVcYjzKtFkhz+ibWE=; b=tsgu9mpLlK7m68dJx7jU2In/5g
	h6Xzsmm99orspSkL/LmKFrBDr4rS5zV/yFA9WkROPnnwIshmjjPNY8suW2luH9k1LhUlaF3T+3LzV
	/T8T6j1nNhfVOY5pR3JVEPdNJMfi6kaCnEIhsc3QypQ9rTnUormr0st3JDmnOkoQKfs3t+Wzjms59
	YYR/utPwmX7c+p99e/SrkcNLQrQbHq5AYMOGZw5/pI45ph6loJl5tgBZw8dB+OsswI+lXsYNNCvie
	oyXzowRa3lrKKQuQOyLMF3fsED8n4O+B6r6X4N1kU3hj35DDbcwY0tg3t3wr6rntHwPFHR6f2jQDz
	RkiSKaeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymNZ-0000000AQjo-3QC3;
	Wed, 17 Sep 2025 07:15:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymNX-0000000AQiH-2MDX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 07:15:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE4DF4004C;
	Wed, 17 Sep 2025 07:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9C0C4CEF5;
	Wed, 17 Sep 2025 07:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758093297;
	bh=Vy8T6/mn9AJwiVS8Y6wf4dci3WFA1RUm779pXGL5VPs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eqA6MoClEfQcR8aCziXs8fPeEDBdtzP0pNeKqSOisv0f/nTMJAi/mcMkzpA9RxjLD
	 Er2YB68U/aeB/skI+UcPdyy0xAl0rN+5KcSnqJcmoEZQFN1sweSy3bnCCTpTp22MU0
	 yfEIQZkuSSqPI8asxmRGOal04RrTpXnQeQJigUBJ+38yncHLrI3AKLgzf5vNv7GzKx
	 H6z4uoDX/Z0Ex2+xgUONpkqT1kva1LUGHZjyXgBiMmMZqRfiUCnL3KhrraHVay83Gf
	 OA7DAj+wZgDyVF/CfXo8XjVvm0Rnm896CFNeN2zM7oh9gyp1vMREGdRfYRWw9ScmxX
	 d77g6LJMr5cfw==
From: Andreas Kemnade <akemnade@kernel.org>
Date: Wed, 17 Sep 2025 09:14:29 +0200
Subject: [PATCH v3 1/3] dt-bindings: mfd: sy7636a: Add missing gpio pins
 and supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-sy7636-rsrc-v3-1-331237d507a2@kernel.org>
References: <20250917-sy7636-rsrc-v3-0-331237d507a2@kernel.org>
In-Reply-To: <20250917-sy7636-rsrc-v3-0-331237d507a2@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Andreas Kemnade <akemnade@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=Vy8T6/mn9AJwiVS8Y6wf4dci3WFA1RUm779pXGL5VPs=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDBmn4l/uE7I2/rPE09BHea+qAEOoR4fip5+P1risC1nPf
 ve0S8WpjlIWBjEuBlkxRZZf1gpun1Se5QZPjbCHmcPKBDKEgYtTACZydikjw5Wq4jPPZDc6dvq/
 dLLarDU3+daSCUs9mVSNvYpW9eZM+8/IMN+4TvXuk6KUzv1LysxqF0j0i4R7rGg9dGKzi3+nr54
 PHwA=
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_001459_630036_F35E5BA0 
X-CRM114-Status: GOOD (  10.89  )
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

To be able to fully describe how the SY7636A is connected to the system,
add properties for the EN and VCOM_EN pins. To squeeze out every bit
of unused current, in many devices it is possible to power off the
complete chip. Add an input regulator to allow that.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
---
 Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml b/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
index ee0be32ac0204..4f829fe75d41d 100644
--- a/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
+++ b/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
@@ -32,6 +32,17 @@ properties:
       Specifying the power good GPIOs.
     maxItems: 1
 
+  enable-gpios:
+    maxItems: 1
+
+  vcom-en-gpios:
+    maxItems: 1
+
+  vin-supply:
+    description:
+      Supply for the whole chip. Some vendor kernels and devicetrees
+      declare this as a non-existing GPIO named "pwrall".
+
   regulators:
     type: object
 

-- 
2.47.3


