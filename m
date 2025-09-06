Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C61CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 09:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IN57UbybZgGpLphoMiHtvFo9GptJMBL3XZlrIhgvryA=; b=QoQ/MIoxXr7qvtWDhIvg/20lLn
	5PgcpDFOdSDxhv1rh/0ykj3tC1SICaWWr0NXzhpebXen53foAxI0b0JDXY2riFnPCRMVT5Y0XlhMW
	0HNEiwAdZTHp7rckXasrIwuU0/nbvByBqys7EIPdKA00rynAUqCU2sJefYmP/MbubdCpXBesEgqa8
	1QKKJX8TWgMfMF6DWw79S2V1m5LmLrjhNzwZnnLawL0BfWthsYvqI/RILeuE0LSqBgYH9GLeQuD3o
	1P/XbL/OBId4QBVusu/xfuLTL+1BrH95eQcpA8nr52LUD1VOEnQGtzRV6zj/f2rLgK+Lj8/u9Wk7X
	pAlmcnDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uup1R-00000007J2G-0GKU;
	Sat, 06 Sep 2025 09:15:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuovp-00000007HP4-2JDT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 09:10:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5B7640852;
	Sat,  6 Sep 2025 09:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9439C4CEF4;
	Sat,  6 Sep 2025 09:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757149799;
	bh=CKaMxVjr2jWFkmaLip35qyMUvXrsM1VU1NB2L1dKWEQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SAHSwb6+5FMtTO2rsGdBGumNvDHdj7GS7PyaP6UEEIjQapAB4Y1FazsW02ps3qxb3
	 ognqgZA5+nqu2Kz/TeMZ03Iij2Mmxsgy7ED+QHlUO0vtJm1Opb3Yob6WOgxpfpktfD
	 d5n7oMid81tHG6hR8CEZvW83JN6nfXGt3QcA7GnNg7BrYz+lH6IWnfQUBQMny6EHbV
	 8D8fiAQ/Mg7Q5eikqBJlml+lCFyapnMDGNqbk41GnIEfJUbGl6npyy15tUIXoi/tzx
	 X13Is9+7djfdQ5qJO11sowFxi9hNa9gBsfCe9Yaz9wfYjxFF/d61PD3q3wr06Q5X3L
	 BDAvDPQ49KXDg==
From: Andreas Kemnade <akemnade@kernel.org>
Date: Sat, 06 Sep 2025 11:09:12 +0200
Subject: [PATCH 1/4] dt-bindings: mfd: sy7636a: Add missing gpio pins and
 supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250906-sy7636-rsrc-v1-1-e2886a9763a7@kernel.org>
References: <20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org>
In-Reply-To: <20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=CKaMxVjr2jWFkmaLip35qyMUvXrsM1VU1NB2L1dKWEQ=;
 b=owGbwMvMwCEm/rzkS6lq2x3G02pJDBm7fwVY2l80u7DcT/GRy07WRQYZ/9nvBn2cvvOc8oUJ3
 Ffydm+M6ChlYRDjYJAVU2T5Za3g9knlWW7w1Ah7mDmsTCBDGLg4BWAi0msYGZ6FiL2exPV/iX1L
 dtO+P8+sfj1pKFUwbL9949K/1JMbV3gxMnz/cuqHprc7m+sGic9pPBb1mz4vzIuR+Oz82oXlmEj
 tD34A
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_021001_636939_B2509872 
X-CRM114-Status: GOOD (  12.24  )
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

Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
---
 .../devicetree/bindings/mfd/silergy,sy7636a.yaml         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml b/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
index ee0be32ac0204..08ad593e237f1 100644
--- a/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
+++ b/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
@@ -32,6 +32,22 @@ properties:
       Specifying the power good GPIOs.
     maxItems: 1
 
+  en-gpios:
+    description:
+      If EN pin is not hardwired, specify it here to have it set up.
+    maxItems: 1
+
+  vcom-en-gpios:
+    description:
+      If VCOM_EN pin is not hardwired, specify it here to have it set up.
+    maxItems: 1
+
+  vin-supply:
+    description:
+      Supply for the chip. Some vendor kernels and devicetrees declare this
+      as a GPIO named "pwrall" which does not exist in the datasheet,
+      disabling it makes the chip disappear on the bus.
+
   regulators:
     type: object
 

-- 
2.39.5


