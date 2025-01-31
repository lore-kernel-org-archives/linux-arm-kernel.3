Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEC8C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 21:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFqxtCc0DMueUMEFIVJfUgZ9qFoe0P9JLtt4xvUJJdQ=; b=KzvAIX9VTe/1rVvozObI4EvEFY
	uCFVDbcf47lsIQOHVS+WdzvTx7sSScj3kjc/VFH7EAr1atWkzp8pZqAISEBsmn48ze2+eT7XIpLM9
	AWnQ+meYtl2w0TGM86tlWqa9tDyGSCdSw0wh0qffLZ113ImwADxI/ZiRoCja3I+cDepUwxeejSKCE
	pJd6cNl0w6gzSo0E0YxWVUDOfcw3kMenCv+0dUnJOQH+JT3Tz2+AbOjCTDYAwqeLNtIRNjW4U5Yqi
	cP7GNJ+L81u3fcfcy+5a9LBX1sclsqzofT0EKd3UZQI2P8a0r6ML4JcTT0s5ff25XGU6bHAAJiMI8
	xQi0IcMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyLh-0000000BR7D-1a62;
	Fri, 31 Jan 2025 21:14:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyFy-0000000BQFk-2cDS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 21:08:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 570F4A4255D;
	Fri, 31 Jan 2025 21:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9378CC4CEE7;
	Fri, 31 Jan 2025 21:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738357733;
	bh=RJ05aPYqi6Of4mqMNLTsRwytI7XXfUy6aHeMa00xhm0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V/v/u9OULjLBlZAbG9SfvhJWjqvHfxKpgA5GPv0nwU0mHTR9VjASNL/XIkUjyF0iE
	 IfWOHjp8IA+BZyPEGxr17rvbGNTGpLoMKxRKyUcFBMgH35stA4dwL8OCC2WQAGsDNV
	 utBnLlomkRAf7JHR8dKlv+2dxUDe3Jqp5U07YciF+HrPGhRdowJGIHCqmsSHwIXGDE
	 V/dqA3WUe8bJ302e+raJpmcKspc8rKkTbzkzYfEE4SatrqRUMI9Y5CVKpaKUuXxEKN
	 wsCPAOaROnaPucrSQraCQP+BL56s+RkmpN/ZOY9CzyWWxM2sp4AHjnOYBRcMWVqdOv
	 Tl+Fm2cQJrTOg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 31 Jan 2025 15:08:27 -0600
Subject: [PATCH 3/6] dt-bindings: marvell: armada-7k-8k: Add missing 7040
 and 8040 board compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-dt-marvell-fixes-v1-3-55f9f6acd4b1@kernel.org>
References: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
In-Reply-To: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robert.marko@sartura.hr>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_130854_731394_B088475D 
X-CRM114-Status: UNSURE (   8.66  )
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

There's a number of board compatibles already in use, but not
documented. Add them to the schema. These are added to the existing
entries which are missing any board specific compatible. Entries with
only SoC compatibles should not have been allowed in the first place.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/arm/marvell/armada-7k-8k.yaml   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
index f1a7e6576306..4bc7454a5d3a 100644
--- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
@@ -23,6 +23,9 @@ properties:
 
       - description: Armada 7040 SoC
         items:
+          - enum:
+              - globalscale,mochabin
+              - marvell,armada7040-db
           - const: marvell,armada7040
           - const: marvell,armada-ap806-quad
           - const: marvell,armada-ap806
@@ -35,6 +38,20 @@ properties:
 
       - description: Armada 8040 SoC
         items:
+          - enum:
+              - iei,puzzle-m801
+              - marvell,armada8040-db
+              - solidrun,clearfog-gt-8k
+          - const: marvell,armada8040
+          - const: marvell,armada-ap806-quad
+          - const: marvell,armada-ap806
+
+      - description: Armada 8040 SoC MACCHIATOBin Boards
+        items:
+          - enum:
+              - marvell,armada8040-mcbin-doubleshot
+              - marvell,armada8040-mcbin-singleshot
+          - const: marvell,armada8040-mcbin
           - const: marvell,armada8040
           - const: marvell,armada-ap806-quad
           - const: marvell,armada-ap806

-- 
2.47.2


