Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538F2CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TCHCHz8WpC+lEPyVcB8rziQv+HQY2JiGtJ++Ref4Bd0=; b=YQjjKOoaD4HeY5jDjpkyfDHh4v
	UcI/7UZa57Dnwdq224Fjjryw67dA7M9YB7hlDP8tTgrb+xSN0304C5PBxs30rAyeGAebdcPxxTUjQ
	zHgYuf0O3Ssx4N1Io7j0Wuwmubf4VeCIHoQbyDHBBHjiVFohwDBv5p/g/hRslOk706TayC6OvGpRe
	7ytNxNgwyYofc6qcupoiJvmLzo04U+CsBcm4vDCZCOOQmxQpzzTo6zex1Bbt8J9Nnmk/0Ngh/kXnn
	Ew5VH6+gHYmql+S4lehXx0dkHjrxxcGpVu1mAgR2Q6XKYUzqO5AxGw7EAZxawsOWJno5EAUznfEIx
	DDqT+UDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKjT-000000008UA-3qqA;
	Thu, 15 Oct 2026 12:38:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKjS-000000008Ty-3yWt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:38:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 621A9416B1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A54F71F000C4;
	Thu, 15 Oct 2026 12:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792067930;
	bh=TCHCHz8WpC+lEPyVcB8rziQv+HQY2JiGtJ++Ref4Bd0=;
	h=From:To:Cc:Subject:Date;
	b=bF6x2iULR5Ko8Z7qaYtB2V51+qOT8kVVzPfxIzvNRerjqfkMYT5X6qQ86/CcFbYPg
	 HK+zCqxFoMOfoWBaKw/vMoa2mZPPe8M2oL9sUIXkhLSh+On1WoYNWEyW00qxdJY1AV
	 UgzfzBeZz+gUmUFQz7C8y61IieUgstKoLwFvtM6ZpGxWEAM3FyGl6OcoD6KuaGkkJ2
	 kAZhxJ9mwj5jXhjuLovH97hXo2AqZ0trREMVW/jJO2RpahB9nl1GAP1J7U9ES41mKg
	 2AbsfBeSYV6ua9pF7KRiTaiNaxT7ycxB/2Honc4UMWrna6wmHFVQc4Uh0kgdDAfJ+X
	 fC1K3aJjnlsJA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCHv2 1/2] dt-bindings: arm: altera: document the Agilex27 platform
Date: Thu, 15 Oct 2026 07:36:59 -0500
Message-ID: <20261015123700.2137706-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Altera SoCFGPA Agilex72 platform will be rebranded as the Agilex27.

Add the "altr,socfpga-agilex27" and "altr,socfpga-agilex27-socdk" bindings
for the SoCFPGA Agilex27 platform.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2: do not deprecate the agilex72 platform
---
 Documentation/devicetree/bindings/arm/altera.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 5fce1161210e7..f7058f00975c6 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -99,6 +99,12 @@ properties:
               - intel,socfpga-agilex-socdk-emmc
           - const: intel,socfpga-agilex
 
+      - description: Agilex27 boards
+        items:
+          - enum:
+              - altr,socfpga-agilex27-socdk
+          - const: altr,socfpga-agilex27
+
       - description: Agilex3 boards
         items:
           - enum:
-- 
2.42.0.411.g813d9a9188


