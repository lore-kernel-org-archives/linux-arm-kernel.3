Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490E6CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qN0FqsVUISBvXoaqv4EYKW7KLfiSBDet0Hh1gfEi1U=; b=mN5dR3SmlSb0ZjGXI3QuGjcilz
	cYkNF73E7JodaPZLWSggTzqfmC4EK70+OoMYsUq/vqPkg1wneKyJsXKlFB8Bjj4F1iZWp21zdq1S8
	/RGevz7lwS1YzU3iWGmARJvSJT52XbEJdkPmXPulWiwiVtgGlOPtxIR/4tUsSHqja7FZz7Jk6OGoh
	X2RCeM9wwzHd6VQBOCuyrsEI28ijs9gON/jOa/DH1u8sOprfwzbVX3WHTlfL9F8U+qTdk59bCfB6Y
	7CNypleqIbdw8ed+6bkYSk8V6vCiy4tae/PL9rFfUnR91exErqX8omue7wIWOkf4wWyBLIMZUsmjB
	FjdzFb8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iJS-00000007dQL-31fb;
	Thu, 25 Sep 2025 09:30:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iJL-00000007dHL-3ngn;
	Thu, 25 Sep 2025 09:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=2qN0FqsVUISBvXoaqv4EYKW7KLfiSBDet0Hh1gfEi1U=; b=eCdggl4lv/fqUGDXszcglk9RpV
	5rlEBVUB0iFS6KuLthsRFwAfe3KmKAVx08gM/VW6QEuQr8+H9EHfD/Itd9Mpug9Lw2U2njvbFcO5E
	IOxZcxG3oTw/zjY+UJzCzV1V/LfB4Rmi3DLoYM0gl2mADYuYWdXfRHdGStx+a8y89X/ghW0IGRU6w
	WELjEJT7HZ5mW4pcFE+jcnBzv8MAoec09Zgg6WZNtvdGKCe/EhWxkDnmzjwkyHHXjdLs/5djFajSz
	AsS6Qg+b7+abXsISjgn0fjMEZ4kTaX20EBE7WLFupXPlKAVgDdYwUd7tXCwV70E0sQQFcjpgajgSV
	fNuJGtgg==;
Received: from i53875a54.versanet.de ([83.135.90.84] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v1iJH-0001Nz-C6; Thu, 25 Sep 2025 11:30:43 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 5/6] dt-bindings: arm: rockchip: add TS233 to RK3568-based QNAP NAS devices
Date: Thu, 25 Sep 2025 11:29:22 +0200
Message-ID: <20250925092923.2184187-6-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250925092923.2184187-1-heiko@sntech.de>
References: <20250925092923.2184187-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_023047_942181_FF3CF4F5 
X-CRM114-Status: GOOD (  10.69  )
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

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 28db6bd6aa5b..27c353c4452f 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -846,9 +846,11 @@ properties:
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


