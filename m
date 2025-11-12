Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77988CD4857
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 21:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2DpkjORXKClcfZTmW7CaccU88dCo7Vxf1K3yE+R8sc=; b=viHSDecI5MSUSv6nuZayqm9Jqi
	wLVzGMETB6fTZMA5OR+exAklEBS2aPso96Y7dhM4ivVZYaJHx4yP4ytXGhrgyVNNGXckKTMapGzrJ
	XprWZoHucgru5TUrsYvjxAamFSovm2lvkr3J+Z/VsW0l/Ku9fk1iYgwSyYA/ObqagV7l9IJa8p/sE
	eFCdPXQxjfWX0tV6lyQMdeP/ppejaL7du26NMG2BhvKaMFUXGw2gdvkPk0vchmz4m5ikgYshsiY9g
	3BdOeh5GcRnrebWZg2Rzs2sAwG5pQJHpDPkqAId/BItz5e7j1fPXAXclQ2H5DuS9hQ2dWje4GzoUb
	0LH7VXxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJIbr-00000009Y8D-1PjW;
	Wed, 12 Nov 2025 21:42:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJIbl-00000009Y1x-2fU2;
	Wed, 12 Nov 2025 21:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=m2DpkjORXKClcfZTmW7CaccU88dCo7Vxf1K3yE+R8sc=; b=gC1cEODl4Rnftt6sX/oOIDWLGl
	fzFAclVMca07MkCloXmDpTfcO9Jf+QCg+X0gEbgf8Tcb9Ft9dnb58Agekwrs71TCBIocIjAhSeDlV
	MZpsC5Udws9nEUnXd4+BB8vCMYjkQJ2VItN1vB4Fdm2IYEHWS45fpZOaKpOzV8lYYh/BrMmrmyIlH
	vxV0TZpsSXpPzH8ktzYl2t3eu28NU3RGOZi4DavejB/LJXOCngLiG8mTalu5MlaTqF5nysH8nOj9D
	0AX+c+BvEaEEcOXKIx9qobaS58pdwezMLOkPb22NuK9p3+TMWfGIDV3PJjwZQtXQvAMHtis/2EeOO
	6OFSyxUg==;
Received: from i53875b63.versanet.de ([83.135.91.99] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vJIba-0003tg-5D; Wed, 12 Nov 2025 22:42:18 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 4/5] dt-bindings: arm: rockchip: add TS233 to RK3568-based QNAP NAS devices
Date: Wed, 12 Nov 2025 22:42:05 +0100
Message-ID: <20251112214206.423244-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251112214206.423244-1-heiko@sntech.de>
References: <20251112214206.423244-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_134229_679081_044C89E4 
X-CRM114-Status: GOOD (  10.29  )
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

QNAP builds a number of variants of the RK3568-based NAS design.

Add the 2-bay TS233 variant.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6aceaa8acbb2..790f910aa38b 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -868,9 +868,11 @@ properties:
           - const: prt,mecsbc
           - const: rockchip,rk3568
 
-      - description: QNAP TS-433-4G 4-Bay NAS
+      - description: QNAP TS-x33 NAS devices
         items:
-          - const: qnap,ts433
+          - enum:
+              - qnap,ts233
+              - qnap,ts433
           - const: rockchip,rk3568
 
       - description: Radxa Compute Module 3 (CM3)
-- 
2.47.2


