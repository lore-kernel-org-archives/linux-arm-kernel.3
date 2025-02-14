Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3094C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXtChml9DRiHxGkolGnpJNI0TSg0LXJfLXP1P/YuOZc=; b=WAu3+SNaB4uJNStsusrHlD9WO1
	hfTV9W2byF+yLa6UhCWKRlWz6v/33zSF/gAsGVlt6fEJfajAgqfDO3v3Bt1Irs3rzx/HpTLiewmBG
	7+qn+wcKTqyWs2ShRriXSg6Pm//AI48ONTqAiOT85hCdZxsYrYU3jrOt4cY5IRHhOSFHYMnF3kD2y
	nc8FbjbxxszJeK5ZQNXusc8NSOWRHH0Rf6s0tLimeUjJwPk+930s+pEG/cKTphyoIcy+5xO582d5w
	YEsf/sdCMFUCcYvi03InpstBNSQqlMK73iZS2ccLGHflv4IVxBoGU14Ic5ogb3BpML+A7j2CtYAxm
	xifyGTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0hB-0000000FvjM-2uxf;
	Fri, 14 Feb 2025 18:45:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07P-0000000Fp3e-2z2C
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 18:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nXtChml9DRiHxGkolGnpJNI0TSg0LXJfLXP1P/YuOZc=; b=NCpWBq35iAp1rZuiQ4lSMKhPdy
	wazMHzKa8K21Smvok2of09jKZDIg/55D+Xc7VqN+BpO84FEwmWFVsbuMOi6KkKn8HxpdMaGFz8ZO0
	oTK47Fmv/rM3bLd3+4R9+nZa5x/fDkqIsJ83hXdLo7252jGDJftzv30MrEnWCoVe6Pp0DaO18eDtc
	7Ig7CBd0DxsEH2Zpidudy0XNAe6+tTWfG9nwe1G59CLlDKCP9gD05fnBQCqR6jkgQvIohfZs2pltx
	Y5cmIEDAAj3ozPfQImrvb6x5oLhMLnf8+0u0qMXCnaoeV+5l9W7RYb/L8cARJg1pdeYqBvIq2oboN
	TAxutWqQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07M-00000001J2u-2LpF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739556529; x=1771092529;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sKWqjvEpkcI2HOheld8cEwxYIv45wbwACNAWn1NaBNQ=;
  b=HXcaTnb/ogAbsGzJvh2bnmDq1zvEY4pfqWcKu2NNN4dgVGKw2zcCe6/L
   eewjUt5b8rC4u14cegPo7H0seGlydVF0p9e5pIw7Avo1/zpZx/g8DL23y
   kWOGsYVDFvLQLm0RJIKX1vbsWn2uEUQ0poxzmAX9Gmono/4vhV/8gQ1Kx
   cBe9BV7jjqcdwjOpeZegAjCqG3nqmOpPN+jbN7KihgL9InGnZqDFtCbR1
   8XxeA9dMoOfRD6xz/II/3x0vaM54qv2gw2ZhR3RbMeyp3nv9ZWL9ynE0g
   w4H5dzTH/c6YSNpXtwJYHqVLhElArUs9XYTlgU7cVYSmUwH+FOXBb+80W
   Q==;
X-CSE-ConnectionGUID: afEECSQvQkGMMmDvtHvTFg==
X-CSE-MsgGUID: Hc1GFQtYTc6wh5HSOspKzQ==
X-IronPort-AV: E=Sophos;i="6.13,286,1732604400"; 
   d="scan'208";a="37700927"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Feb 2025 11:08:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 14 Feb 2025 11:08:26 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 14 Feb 2025 11:08:26 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <vkoul@kernel.org>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 3/8] dt-bindings: dma: atmel: add microchip,sama7d65-dma
Date: Fri, 14 Feb 2025 11:08:16 -0700
Message-ID: <8b69f0c6d8955790edcdbe5d1e205b43dedb99ff.1739555984.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739555984.git.Ryan.Wanner@microchip.com>
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_180849_056187_8937F793 
X-CRM114-Status: UNSURE (   7.33  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add microchip,sama7d65-dma compatible string to DT bindings
documentation.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
index 9ca1c5d1f00f8..73fc13b902b38 100644
--- a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
@@ -32,6 +32,9 @@ properties:
               - microchip,sam9x60-dma
               - microchip,sam9x7-dma
           - const: atmel,sama5d4-dma
+      - items:
+          - const: microchip,sama7d65-dma
+          - const: microchip,sama7g5-dma
 
   "#dma-cells":
     description: |
-- 
2.43.0


