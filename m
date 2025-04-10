Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08EDC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 17:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0KsVX7QP+/8G7CYT2lcP7VHyf5esDemqunzcFxtcdJk=; b=cei09ldsSlg2uqMaBW7bTx9gYw
	CSzh3/+w+bg2Afw2ZyGYfoOHBdDy0Qj0Q0Uz1h2oqtmMLIPs/3UKML1GJBzrN9Xaah2ZAYi7wINv5
	coik99pjYi82DixUlUyFK0hm2BtO0wUFP7+KRFNIgFaI6PNxkmiNjrjjOifdEV5AnDEDo7qFWHxhy
	yGYcGmAiyUlLXEZgUEYIXnLpksCQ3zgwSyP1ApKThI0cSIs/0vRvCd3ttQwuUpY0zmsPy8ZHz9qyl
	TZ9fyBWEfT5/GtCGhOjjYelD+Ld5BInR+ReXp1ZmgOpXZt88JDvm++KtXRms3PxNtp5MQD254BqI2
	N5LhT1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vSg-0000000BKy0-1u9I;
	Thu, 10 Apr 2025 17:13:10 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2uZD-0000000B9AJ-1RmK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 16:15:53 +0000
Received: from ramsan.of.borg ([84.195.187.55])
	by laurent.telenet-ops.be with cmsmtp
	id bUFi2E0061C8whw01UFie1; Thu, 10 Apr 2025 18:15:44 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2uUj-00000000JQC-1k7S;
	Thu, 10 Apr 2025 18:11:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2uUk-00000009pN2-1sLE;
	Thu, 10 Apr 2025 18:11:14 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: soc: fsl: fsl,ls1028a-reset: Fix maintainer entry
Date: Thu, 10 Apr 2025 18:11:12 +0200
Message-ID: <185e1e06692dc5b08abcde2d3dd137c78e979d08.1744301283.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_091551_530151_8A847D5A 
X-CRM114-Status: UNSURE (   9.18  )
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

make dt_binding_check:

    Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml: maintainers:0: 'Frank Li' does not match '@'
	    from schema $id: http://devicetree.org/meta-schemas/base.yaml#

Fix this by adding Frank's email address.

Fixes: 9ca5a7d9d2e05de6 ("dt-bindings: soc: fsl: Add fsl,ls1028a-reset for reset syscon node")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
index 31295be910130c2b..234089b5954ddb97 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale Layerscape Reset Registers Module
 
 maintainers:
-  - Frank Li
+  - Frank Li <Frank.Li@nxp.com>
 
 description:
   Reset Module includes chip reset, service processor control and Reset Control
-- 
2.43.0


