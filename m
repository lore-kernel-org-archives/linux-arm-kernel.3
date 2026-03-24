Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0876F54AD7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdyWYSyo287N7trPP5POqS+TCkxF/IFSb/acbmwgA54=; b=KXlX3I3/Mfbo7zU3uBsgoIGkor
	XWKc2eqR5aquCgqHwRGsDXga3Af8F7n/pdvsfHH+PIVk/wc0Io6wB8Gef0gaC9A/fL0ogp8XFMrrd
	2lTYTAzu3ub9TCCJlQ5VYyouwi7zHJR519SvFdLW0oVRKi7YY6duIsjGM1p5mYyxXu9hpubJFzG12
	1f8tdZ+h3kJzb1q9PFx48DEm1tveq+m4aTVPyuoMvZOAD2n/tIgyxEGKMH+SGtnyOH/YJZtEIbS5H
	WeGO5eGeiqFV/01DAiYL9UxVk5N2r9UcuqvIe6gQc7fpkXadNj7DZjaYpqD1bsvbLYbX7nDLS4yaw
	kB6YfBFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54rN-00000001uOd-3ZT4;
	Tue, 24 Mar 2026 16:44:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54rM-00000001uMo-07Yk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:44:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BD7E60138;
	Tue, 24 Mar 2026 16:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C16FFC2BC87;
	Tue, 24 Mar 2026 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774370642;
	bh=iRKS7gv8fCvjYKMqPMFIbD72v7V5hcNF6WcvPrFlSRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aZC1wnIqpt390sXCOeAD1YZhNVDEobbPtbLhavgjyVncHx+fw4LAXMLVlYf05pdE/
	 0HS/vMx1srrnsL4/fR4Br3IwKK4lSgo5hvP+w0H8kzeK715ScmVQNw7QjKoIG1YhUV
	 OvV8L8bakZ60LWvzbeauvAPsxlGCAcgg5uvWivDLoRystMAGmoXuCaYhBgyk2F7c6V
	 VTAopkjvzFp9IlonJhWVa6JnyWfYtleA89/YBO9bLoyUJ/qcDcr3Q3pCTUctD/3Zir
	 pQARZnGCx4oA/wuw5hljpxC2TbYDPMyZG+nRfR89Pt4YRwn6sqPk5oWLe1YeDJ8jEE
	 00MFpRc1uQq2Q==
Received: by wens.tw (Postfix, from userid 1000)
	id A81265FEB2; Wed, 25 Mar 2026 00:44:00 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: sram: sunxi-sram: Add H616 SRAM regions
Date: Wed, 25 Mar 2026 00:43:50 +0800
Message-ID: <20260324164357.1607247-3-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324164357.1607247-1-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
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

The Allwinner H616 has two switchable peripheral SRAM regions:

- The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
  to this region is enabled by default. CPU access can be disabled,
  after which reads will show the same stale value for all addresses,
  while writes are ignored.

  The mux value for this region is different from previous generations.

- The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
  KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
  CPU access is disabled, the whole region reads as zero, while writes
  are ignored.

  The mux value for this region is the same as on the A64 and H6.

Add compatible strings for both of them.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../bindings/sram/allwinner,sun4i-a10-system-control.yaml    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
index e7f7cf72719e..6e6ab2168a2a 100644
--- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
+++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
@@ -80,6 +80,7 @@ patternProperties:
               - const: allwinner,sun4i-a10-sram-c1
               - const: allwinner,sun4i-a10-sram-d
               - const: allwinner,sun50i-a64-sram-c
+              - const: allwinner,sun50i-h616-ve-sram
               - items:
                   - enum:
                       - allwinner,sun5i-a13-sram-a3-a4
@@ -103,7 +104,9 @@ patternProperties:
                       - allwinner,sun7i-a20-sram-d
                   - const: allwinner,sun4i-a10-sram-d
               - items:
-                  - const: allwinner,sun50i-h6-sram-c
+                  - enum:
+                      - allwinner,sun50i-h6-sram-c
+                      - allwinner,sun50i-h616-sram-c
                   - const: allwinner,sun50i-a64-sram-c
 
 required:
-- 
2.47.3


