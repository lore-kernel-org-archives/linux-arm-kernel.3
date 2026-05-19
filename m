Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5231CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0vgr2TFiIAMJx6h+rp5U3hOaL0MoSAkV2DOrH2cnoVw=; b=KFGhwmBfdYAr0fODwyh0zkhA9x
	hTYzA4FvnUXa4/GHart4hU/EdEHwpajtUofLxTk0DVvZeTjTAP0aAujBHNXr9oiiG+rYwfYEWqMOv
	3bxPEByiYteYTeF0duVNawzUJULB4zaSVEDadDDiv263J4IWFT3EG1dtx4HkH7lzCwJcjTqGRV/ff
	Xsbxmqx6LuTFcg4/KWP4jNffyxjVonDASzcXvzCpz1oBOYn/cYFXeOsyucpZDqcvttSAjs5q1Rn9e
	3IJ45wFTokqgZaJnpzTfpwQE8XgiHcr7QMkIk4Bm0gb73gH/mEjB8t6y+WhzeGIDi4dnEhN+Z59lI
	10KEVC4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPImN-00000001Ld7-2KLy;
	Tue, 19 May 2026 11:38:31 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPImK-00000001LaT-3FNW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 11:38:30 +0000
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E28F558;
	Tue, 19 May 2026 13:38:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779190693;
	bh=Ldqt2evZpICTczUXVRvtMMUJkyF1TiVte9LKC1slNqY=;
	h=From:To:Cc:Subject:Date:From;
	b=tm3aHWiHl4Z6Jlmnae4PnkraK95fhgvaH9ewKvsmBEKk2sUPn6jQqMFiR+wCBN7k9
	 764ChDBpFkzZRSWxIoVTdVpp9F3vBvyOX5PtYqkLw4kSg73vZ39xIWTst1WFTxGq5a
	 5L271GTl1md7OuMN4fP+gXlpyeH4H6bUehAu7RrY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Robby Cai <robby.cai@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: dt-bindings: nxp,imx8mq-mipi-csi2: Fix example endpoint label typo
Date: Tue, 19 May 2026 13:38:23 +0200
Message-ID: <20260519113824.91533-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_043828_949796_65B2774F 
X-CRM114-Status: GOOD (  10.75  )
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

From: Robby Cai <robby.cai@nxp.com>

The example in imx8mq-mipi-csi2.yaml uses imx8mm_mipi_csi_{in,out}
endpoint labels, which is confusing for an i.MX8MQ binding. The labels
could be removed as they are not functionally required in the example,
but they have a documentation purpose that brings value to the reader.
Rename them mipi_csi_{in,out} to avoid the confusion.

Signed-off-by: Robby Cai <robby.cai@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Drop imx8mpq_ prefix from label name
- Update commit message
- Drop Fixes: tag
---
 .../devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
index 4fcfc4fd3565..9eee67ed2685 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -220,7 +220,7 @@ examples:
             port@0 {
                 reg = <0>;
 
-                imx8mm_mipi_csi_in: endpoint {
+                mipi_csi_in: endpoint {
                     remote-endpoint = <&imx477_out>;
                     data-lanes = <1 2 3 4>;
                 };
@@ -229,7 +229,7 @@ examples:
             port@1 {
                 reg = <1>;
 
-                imx8mm_mipi_csi_out: endpoint {
+                mipi_csi_out: endpoint {
                     remote-endpoint = <&csi_in>;
                 };
             };

base-commit: d97d13c24d7893abcfb80d38630ce74daaa1434c
-- 
Regards,

Laurent Pinchart


