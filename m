Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9CFC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zj+BTmbsgrPwqcv//Mr/H9IwIs2+a+ComTkEhbWvTqE=; b=D3lo1L9vSD5/WEA7XNZbaTt9IP
	E9RpJWGFBo+hRiss/Cl6HUpRewhJtMeOYVEaNrRuGgRBjhmONQwdji6hGo1oDiWfaYD7PUw2QnMix
	vpbItAz3Dc+pVSCORebGZF5LQEb02hz453c6Eje9KPEtrPbjJVtqgYOebcrKd7p9iVsaw7Yc16rJa
	+lgnX4RmmVEiS1jY8sNsmGbS1B7Kn3nGGlHFgMJhZSHdMUtlAcYzp5kx0a2qpPgJRsEEhdlyNp6lA
	AhQYtltaASXxnik3EtsyvIBEIWEIOtJe9Dnk1WMYH/i4yE+84lyPIpZxx5MupMhgO0KFRwnOnX3qZ
	vZEgmvRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DsS-00000004evI-1jSo;
	Mon, 14 Sep 2026 21:06:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DsM-00000004etS-1C03
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:06:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D9481CE0;
	Mon, 14 Sep 2026 14:06:01 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33C263F882;
	Mon, 14 Sep 2026 14:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789419965; bh=Hzy5rOEU5SW9UaBzfF+yBdx5Py99f3rOUQJzaY2KHWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TE1Ui0h67Mro1Km5TPXj8AR26JvrPWARerU1mK+6DxYGNGmxUjxo3yPOCg8g/ziwu
	 EZ4K8qKMBwfFc2Zsa/aA29R/mXMeE3i3SdGmjTwyOQd0Nfue5QctxfZtVAjQc05VTv
	 5dpwFyivAFJg57af8QBFLvsh/7ociZVez1OjY8XE=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/3] dt-bindings: arm: sunxi: Add two Teclast tablets
Date: Mon, 14 Sep 2026 23:01:14 +0200
Message-ID: <20260914210115.28151-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260914210115.28151-1-andre.przywara@arm.com>
References: <20260914210115.28151-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_140606_373235_3B9E8521 
X-CRM114-Status: UNSURE (   8.81  )
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

Teclast produces some entry-level tablets with Allwinner SoCs, typically
featuring a new SoC early in the market.

Add the names for the Teclast P80 tablet, with an Allwinner A133 SoC,
but also the Teclast P85T, using an Allwinner A523 chip.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c630ac..28437c47ac01b 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -933,6 +933,16 @@ properties:
           - const: tbs-biometrics,a711
           - const: allwinner,sun8i-a83t
 
+      - description: Teclast P80 Tablet
+        items:
+          - const: teclast,p80
+          - const: allwinner,sun50i-a133
+
+      - description: Teclast P85T Tablet
+        items:
+          - const: teclast,p85t
+          - const: allwinner,sun55i-a523
+
       - description: Topwise A721 Tablet
         items:
           - const: topwise,a721
-- 
2.46.4


