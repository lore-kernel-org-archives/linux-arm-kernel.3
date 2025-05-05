Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60106C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 07:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W8dw99Gm2MjCZCGOQPkYh4fdAw0NQcG5zRqV453oVro=; b=zpuFeVrIgHTOArzw7YkZgzLZW/
	o2SF8MfgtvpVDH0bQfdBUyGQeScG0oSdNycRjqJ+ZszHGEqg8NR/qZXsS3+oMOSmHK9wYrEYJ90Ye
	dOamGuEwUwmiFx+dRv79TV4y+ozyAwJzwFmrQbrdgsmBAvI62sZpetToEsLJ9UsKAky0dOy0hUEHU
	FbTv+MwM/Nw0YvzjLnytuXYw8e0KbnMcu3DZs65YGOYRKfXNCuLOoVsutXN92IUzJfdT5WRwBPDl6
	DT4sXwcLhyqXBQVfJ9p9jJ7bTcZHWDuwQDMZj67YB+g3At1Vr9c20JeiKH0p9hB9lsrayKqZqFYwQ
	AduZOAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqg4-00000006hsv-0AYk;
	Mon, 05 May 2025 07:55:52 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqbX-00000006geh-3A6c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 07:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=W8dw99Gm2MjCZCGOQPkYh4fdAw0NQcG5zRqV453oVro=; b=g0aI6aKUKJkBsmqjqc7jEd2WF0
	SXmUgqnOVFP5Vfkzywqi2+A2IJ16Tg2UuGhcjNksYbFQPEZT//yHtz6YKH3GLbtKpXXys7Wg6iie+
	LyUGCm5+Gw+2oO1tuA6GsJ/I/tR2SlzYrGQObfkpM+CYVFvxeNXWNEnmOXQxRE4DbjczqpMWhKDbx
	P/sF1C8LsASqZaYhKsiHNxHkHhAbb4ovHu510l5aCodkMWfedZ9a9HQw9r0mIsMYIwWMwUNGqlmzl
	btflI91CGqog8Ealw9nXHooivZRIxnnPNc/zEdIWftLG7lrucf58Yw+gpmEl92nk6J164lrOc3IJw
	CKmhxaaw==;
Received: from [89.212.21.243] (port=45262 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uBqbV-00BnPr-28;
	Mon, 05 May 2025 09:51:08 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 1/2] bindings: arm: fsl: Add PHYTEC phyBOARD-Nash-i.MX93 board
Date: Mon,  5 May 2025 09:51:06 +0200
Message-Id: <20250505075107.2579801-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_005112_109724_51911F62 
X-CRM114-Status: UNSURE (   6.35  )
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

Add devicetree bindings for PHYTEC phyBOARD-Nash-i.MX93 board based on
the existing PHYTEC phyCORE-i.MX93 SoM (System-on-Module).

Adjust the compatibles for the existing phyBOARD-Segin-i.MX93 board, to
be able to add additional board based on the phyCORE-i.MX93 SoM.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v2:
- add Reviewed-by:

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a2..6abb58d599a6 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1387,8 +1387,10 @@ properties:
 
       - description: PHYTEC phyCORE-i.MX93 SoM based boards
         items:
-          - const: phytec,imx93-phyboard-segin # phyBOARD-Segin with i.MX93
-          - const: phytec,imx93-phycore-som    # phyCORE-i.MX93 SoM
+          - enum:
+              - phytec,imx93-phyboard-nash  # phyBOARD-Nash-i.MX93
+              - phytec,imx93-phyboard-segin # phyBOARD-Segin with i.MX93
+          - const: phytec,imx93-phycore-som # phyCORE-i.MX93 SoM
           - const: fsl,imx93
 
       - description: Variscite VAR-SOM-MX93 based boards
-- 
2.34.1


