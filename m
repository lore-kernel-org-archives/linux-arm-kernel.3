Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F3DC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 14:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfi+VmLbPzh+bNouxViw0HQ3ja1quvZN33GcibfmRxU=; b=gryM//jKZuiUWa6c/afUZHWQjt
	wZoq/qU2J3rsUKKmxkHUm/lFhLWmahw3w4BWOPw5tLIDSJvC0vnFEMoKM1G3pwWALBjOaThApE4Oc
	g2euPAA4vsMA4RVpdjJbUgBvnDWeFwJGP+pFowURG8q1eexplnt0dIYnkcMVVk3TeMc/tINY2ras1
	IKPkfG2FXlXDIA1dT99RGMgQlkGZMYEfklZTsLewDkYWDFXVXKXg/N/0h3uhdXJZIAJaxvgBWL6GA
	z+RXQTPJRr6CTChZQsAnwR7FSzDielYbVGFX9tDz3v4Ad2m5zQW2/PUg66Yk7d+N/rnP3Nys/u4k+
	ScAhLj1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aMO-000000072zU-3QPV;
	Mon, 07 Sep 2026 14:30:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aMN-000000072yp-0lki
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 14:30:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC14544226;
	Mon,  7 Sep 2026 14:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD3ACC2BCFD;
	Mon,  7 Sep 2026 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788791410;
	bh=R6VPu7/qGU2BYSDwQ7+fgFxQjvHX8hCgZTCn+hEyGGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZLE35/HdPpS4LBByktSN+jvhyRCgiE2Fq0cfylSnFkkLN+QIAvDy6JMnShUIG/n5g
	 423Z3z54x0ROAyxBFI4D+uFwWdnKKcjGjE6Zqjxnv9z45W3oZF2lL0+SvR6h4gVDvQ
	 RDwE5M3XJLTTuYQ9f5uHpS/CjiE3iDnI0ynHOuGzDqB4pEctjXpXB6ry9NMk5S5cc6
	 9pARBp47YPOdc3VI141c/zxzrRJmXpQ9CM7YS935QyjldS7GNY1meR8td5Age2h+gp
	 vCDENPX4aJbcugjPljFCt0JhAZxZkyDfilCpdckp6azfZVqzJWbEAFQB1LR/ZJLrgw
	 GRTxUqz78SgIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A065C79FA3;
	Mon,  7 Sep 2026 14:30:10 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 07 Sep 2026 16:27:38 +0200
Subject: [PATCH 2/3] dt-bindings: arm: fsl: add freemobile,nbxv3 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-for-upstream-nbxv3-dts-v1-2-f43fd0028b78@free.fr>
References: <20260907-for-upstream-nbxv3-dts-v1-0-f43fd0028b78@free.fr>
In-Reply-To: <20260907-for-upstream-nbxv3-dts-v1-0-f43fd0028b78@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788791274; l=1075;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=O8dCXA7+FxVb3qjlvlxUSE16nNAWYoDpG+zNdVfj+co=;
 b=94RATUWJeloIqnP09OX1OLE4DlfY92svTyaPKrvKIrD8l6EMbja5kY/sQG+QnEY3Wn0JGx7gN
 6Q5qrDG58qMBCm6RyDpXGdSG4mO0KRjRlFcKBlKoF5HvYrUobo4dLlP
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
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
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vincent Jardin <vjardin@free.fr>

Add the Free Mobile Nodebox v3 CPU module to the list of
NXP, former Freescale, LX2160A-based boards.

The board's root is:
  "freemobile,nbxv3", "fsl,lx2160a"
and the DTS is at
  arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts.

It is needed for
  make CHECK_DTBS=y

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d53..baff4f4159b29 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1937,6 +1937,12 @@ properties:
               - fsl,lx2162a-qds
           - const: fsl,lx2160a
 
+      - description: Free Mobile LX2160A based Boards
+        items:
+          - enum:
+              - freemobile,nbxv3
+          - const: fsl,lx2160a
+
       - description: SolidRun LX2160A CEX-7 based Boards
         items:
           - enum:

-- 
2.43.0



