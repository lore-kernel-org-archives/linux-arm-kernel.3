Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6809EC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 22:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q/yKUykqMXCZwQzi+gFRB5wtVJeuGF5yZJuP2Mj4Bzs=; b=y2LHRY/O4cPxpLyITU3F2BBcyh
	eEVIgEltVLBDyepeHvhqEMMrUW4LriltEfOQk1Srq5VkoY47P/dO/fMjEvKgPnTIhZLSrpxIfPJ97
	R4I2DSJT4BHXIgpyHOpk49+umzk5MK8Jz8jbMcBXjk3Jzl9bvGUd+ZFxkMkQai4FwLRDtq6ruYPc8
	ouCbxKy/+jHA9BkzgNGHfwBer8WkTIyUiXNvq2NOuVK+Y2oBJQmDqVso9QJ26UVyCAMH1xrQQDDMs
	9/4JNr5sbYhNrT+hhBY/jhATrhwHm5GoIN9dPGJLWfCHbjrflq7ZxEPpLXe9dlCkz3Dyi7srjF0DW
	sus2yQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCmpD-0000000GqJq-1Zrb;
	Wed, 07 May 2025 22:01:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCmnG-0000000Gq0Q-3m0P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 21:59:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE63D629E5;
	Wed,  7 May 2025 21:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63634C4CEE2;
	Wed,  7 May 2025 21:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746655149;
	bh=9858hxWVasl9qYR0rBtvA66gC6j5dx4PpfDs0u1OvTo=;
	h=From:To:Cc:Subject:Date:From;
	b=ReoGpdNaV5J7M/aCOifp9gSt3dnm3MrMaoL4K91pjhOLRSU/MSTjKzXEJEOZPUrMB
	 bEO7tYLv6aGRy1OLdB4B8dNIpZ3uizXyjpt/73Tk18bZZqH6WnWlRKdsKI38H477uL
	 Xx3ufl0khAamWDDgwChmGJRugic2nWxDh3F8Wkmm9FqPufQN3cRAlenH+pW+KU1Ni8
	 8MSyuqbtgLY3wp8u9SFXFfQsdljbkJz7oh1DjJZGNn4TiimV8Qc1Ta9UxKJfQYsfL7
	 2vEb9nE4rNOUWQ9t1MBp8GklCqynV4pp0p5rtXaOSgEYF0+5twoNP/dgHTgJKDpUTg
	 OjPdicqxlYkvw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: fsl,ls1028a-reset: Drop extra "/" in $id
Date: Wed,  7 May 2025 16:59:02 -0500
Message-ID: <20250507215903.2748698-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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

The $id value has a double "//". Drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
index 31295be91013..558a8c7aab9c 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas//soc/fsl/fsl,ls1028a-reset.yaml#
+$id: http://devicetree.org/schemas/soc/fsl/fsl,ls1028a-reset.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Freescale Layerscape Reset Registers Module
-- 
2.47.2


