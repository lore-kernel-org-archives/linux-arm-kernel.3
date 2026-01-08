Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6947ACFD635
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 08:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mTaHFNzKwKRUSp5XWQIpobvxQXjiW4s2lpVOknUAl0=; b=ZQ9d0wlOc0PeH8qIeWjjmlvPxX
	ZA6VLRhEUTZTqnK8mEuc/JLCQhDVB+GcEAmI2bveSaRDNL1idVCabLB4hFKp1ocQ1H0/ZIoH1bTZW
	csZB2SDnuS2s5tD9LPl0HRNSduMae3nTkp4fDYKUCwa85IStJhAuMx2Q57t7zLr16jkssq6+mbjEu
	ksLz8RYNAcvsaKbNVz4p8PUUPYhUzT+4CNUXkoCy4E5CYv+O7vdXiqv3Euf70Y8UDHTs0tftkaCXe
	ufXhWINF1Rju+sydC/pB/dLHvZFrMjCWjmIayqDMdhwr3duTsbHb5Yz2/Ey9JRGD6hV8dP3byFrZT
	FzvEOseg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlIP-0000000GGmb-1Cdn;
	Thu, 08 Jan 2026 08:23:05 +0000
Received: from lgeamrelo12.lge.com ([156.147.23.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlIM-0000000GGl8-1QsL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 08:23:04 +0000
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.52 with ESMTP; 8 Jan 2026 17:22:59 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO localhost.localdomain) (10.178.31.96)
	by 156.147.1.127 with ESMTP; 8 Jan 2026 17:22:59 +0900
X-Original-SENDERIP: 10.178.31.96
X-Original-MAILFROM: chanho.min@lge.com
From: Chanho Min <chanho.min@lge.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Kael D'Alcamo <dev@kael-k.io>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Chanho Min <chanho.min@lge.com>,
	Gunho Lee <gunho.lee@lge.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add 'lge,*' for LG Electronics
Date: Thu,  8 Jan 2026 17:22:11 +0900
Message-Id: <20260108082213.6545-2-chanho.min@lge.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260108082213.6545-1-chanho.min@lge.com>
References: <20260108082213.6545-1-chanho.min@lge.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_002302_701950_1EE13344 
X-CRM114-Status: UNSURE (   8.61  )
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

Currently 'lg,*' is used for LG Corporation, but LG Electronics uses
'lge' as vendor prefix for many of its device tree bindings
(lg1k SoCs, etc).

Add 'lge' vendor prefix entry to avoid confusion with 'lg'.

Signed-off-by: Chanho Min <chanho.min@lge.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..6c31fa4bee6a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -907,6 +907,8 @@ patternProperties:
     description: Lenovo Group Ltd.
   "^lg,.*":
     description: LG Corporation
+  "^lge,.*":
+    description: LG Electronics
   "^lgphilips,.*":
     description: LG Display
   "^libretech,.*":

