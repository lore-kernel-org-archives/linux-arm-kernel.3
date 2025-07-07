Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E415AC83F0D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UssX1ASejeE1FfOOTatFss1tZXaYm0On8IoX7Y///lI=; b=aUypdAfQ4IVQdv+45DRPXeW0C/
	M0a14UfEGqWrZqoziirw1CXLNX7vC1Sz1l1Nvu/hVCGi4vrEIi3OjFGiXAVo+WviGkOyzaaHauRdj
	sknBwOWiGIWHHxIcSpnyA2x8Wn4xrU9nAxUnIgS9KNTu6nCbv3HXiQ306L6yjkenoSDwb9RVOQVml
	5YURZADNb1IwrtedQgk/oqLLl6cceiamYb1aRkrWTKMJpUoCAfmReJ2FjejfZdaTNS6mFctEe+423
	DLK2JXppsGX6dfhODmdlwRxTCmgDeDdC54UpAYxbs+pqgJI/FXQrPC+RuTqJVgyQxqCimVfvb6Udt
	IbMylm1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpgC-00000003Avg-3ZGr;
	Mon, 07 Jul 2025 17:31:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp2I-000000033tS-1Y5b;
	Mon, 07 Jul 2025 16:49:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=UssX1ASejeE1FfOOTatFss1tZXaYm0On8IoX7Y///lI=; b=pYYzZY8mQ8czGLIn/1QmcdGsNP
	7ooLfZukGQP9nDSqZmkrwX4Z8QK1B3XlGyHIvM9d60hE8lJw/Bt4dugJxKxYBSxfkW9gKyvGWyahs
	SpEbaJTl20RwPrs0yZEdH9nXD+xDbzoiY6P/gP4hOy0zGuQWPJJkZNVYcyXNwHsA4ZyiWs+0BhC6u
	6QqMDhKaerWdDCKvrsrp00wOfIuEbRugqthQQuS2H+w6WTtj3J9qpcE6iwMW5bx9zpTH6RshdJvsW
	axBWW4ya8xGTXuHF4vC5En3zKI+j0buxKSgUIxSf5EhEhQIuQtLt/MbsihJpMqP5oug9wmD3S3x1+
	NVAZv7wQ==;
Received: from i53875bf5.versanet.de ([83.135.91.245] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uYp1r-0004yl-NF; Mon, 07 Jul 2025 18:49:19 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	andyshrk@163.com,
	nicolas.frattaroli@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 04/13] dt-bindings: vendor-prefixes: Add prefix for Shenzhen Bestar Electronic
Date: Mon,  7 Jul 2025 18:48:57 +0200
Message-ID: <20250707164906.1445288-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_094946_413894_E2374FC7 
X-CRM114-Status: GOOD (  10.66  )
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

Add the prefix for Bestar, named in full both on Panelook.com and their
display datasheets as
  Shenzhen Bestar Electronic Technology Co., Ltd.
which produces at least DSI displays and maybe more.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6..5e066c07c188 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -216,6 +216,8 @@ patternProperties:
     description: BeagleBoard.org Foundation
   "^belling,.*":
     description: Shanghai Belling Co., Ltd.
+  "^bestar,.*":
+    description: Shenzhen Bestar Electronic Technology Co., Ltd.
   "^bhf,.*":
     description: Beckhoff Automation GmbH & Co. KG
   "^bigtreetech,.*":
-- 
2.47.2


