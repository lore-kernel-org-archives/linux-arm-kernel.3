Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08C1D5B86D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5CGQKYEwKl1UVaVEjkUh0R1fxVKp/wZq+zApkkscBjY=; b=wepjB6AwhwSBo44chFnjg+Tjtl
	b1634wzsYLrm3ElszwWuF1a94v4UwNVPsbdSwB5lcQhuVrqPozFZvQdGbGQiTXOPqPXRByDGMRhRu
	lpTSCYM0TN43gGiG3aLWDmOwxW2NJjl7xrbavzdu8nbj0kCadhodG3NqV24Eik8J0T7GlORppbAQv
	Cju+ZpM9fgSu3kmnnBOFvijaJYp0vKpYNPzOkRVPELEB2JaeT9RFBxax/D+Mhc7/TDAcAZsSzwD0L
	wdRbshqj/gw82mHJ9R+VIrf+Z8G/QaeA/9MyI+DwwbgxSWnGjplt1QwCuFyeRh4JjW7mXU5gHtc0f
	oTfQ4TWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG9G-00000004IUr-38zt;
	Mon, 15 Dec 2025 21:30:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG9F-00000004IUS-4BRs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:30:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1114460183;
	Mon, 15 Dec 2025 21:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE08C4CEF5;
	Mon, 15 Dec 2025 21:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765834228;
	bh=CrgPu0plMXLmrnLAcuh4XDVEnwJ+nVeUShY/6oynE/Q=;
	h=From:To:Cc:Subject:Date:From;
	b=JLc2GHJvCVpWibVzRkpwjgjichzDIKiUd7lw/U2mmIeCO8R2XyL0zdZcoGFtZm84a
	 bsL/4uxi40BVJ9GSdxSJtHcR7i3YZPcy2vFhHYVQbpEgT6QwRAMCjJ0+uC0qMpu7zd
	 90ZLF/Zkz/peZduG+g7DMfcHFS/qaI9i0qQtRcMViOyiu6BFbElLf/mUUc6IK65Kke
	 z5LHYNpZDVKoBiUT0ZlqTRlrvkFAfAQtYuSna26ugF0/z6l0X6mwAZqrqlNSbpLdm3
	 H6Weld3VEGGJ8TfHSx3ifl37N8H03EBsqVuiVA3Io7K/X8rxuMa92GBSeimmrnK/wA
	 82vsYdt/HgZpg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Robert Richter <rric@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: Drop obsolete brcm,vulcan-soc binding
Date: Mon, 15 Dec 2025 15:30:21 -0600
Message-ID: <20251215213022.3325133-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
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

The Cavium ThunderX2 aka Broadcom Vulcan doesn't use DT, but ACPI, so drop
the SoC binding.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/arm/bcm/brcm,vulcan-soc.yaml     | 24 -------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,vulcan-soc.yaml

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,vulcan-soc.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,vulcan-soc.yaml
deleted file mode 100644
index 3f441352fbf0..000000000000
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,vulcan-soc.yaml
+++ /dev/null
@@ -1,24 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/arm/bcm/brcm,vulcan-soc.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Broadcom Vulcan
-
-maintainers:
-  - Robert Richter <rrichter@marvell.com>
-
-properties:
-  $nodename:
-    const: '/'
-  compatible:
-    items:
-      - enum:
-          - brcm,vulcan-eval
-          - cavium,thunderx2-cn9900
-      - const: brcm,vulcan-soc
-
-additionalProperties: true
-
-...
-- 
2.51.0


