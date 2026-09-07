Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F0BC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfi+VmLbPzh+bNouxViw0HQ3ja1quvZN33GcibfmRxU=; b=xPouYo6YjlEea3yZ0vEPWPpTew
	JOCJpBUWsa5tk4UnLolNBz1Ic592HmSoYMar1Tkdf4ceuC+A3kVNQlGQ+YmT0PjVIEUeYOYqSQR3N
	gismLD6Jxq1HshnaUsUq3x2YRQDZ20FJTklE3s+aC/8E6G23d4oZHnlsDEmCyS9cT2c3ACL6ScZAp
	if4titKY8NojjtIFaak76HY0AI9hfBsp3Kn0EcQIk1hQeKjkWiKqX1HLw5DBDS+KbZzhR2omu3AFQ
	/6YbeVlOEvPTRZwMahacV897L4qNaBkcGl5K4OWFJ1qzVop6pHzg3byLbFosgNnS09Jk2mZwqQAPC
	O0djN5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cuj-00000007RwH-11K4;
	Mon, 07 Sep 2026 17:13:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cuh-00000007RvG-3Loj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 17:13:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5276D434FE;
	Mon,  7 Sep 2026 17:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CA3DC2BCF4;
	Mon,  7 Sep 2026 17:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788801227;
	bh=R6VPu7/qGU2BYSDwQ7+fgFxQjvHX8hCgZTCn+hEyGGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=omjIZ53kIeHaikyI/7DDxfojiQ5p2RlwiEpIVOU+SnOntqFnbcluDAoRPP4mbMNgd
	 VQ7dwaUmdBeA0FR60klB81Le50qHt/cTg7a2LLE4pIc0MncBMZnIIHsHGskUTL4BGk
	 M1IV6jLqNTWgDOFKcZXicNv+BXaPrMyiHXopxD0I5FM1nTyP5hqOtQcevsI1ozDtE4
	 /Gjep6Urgfi3DbpIyYhN16JEyud9crEkDzxh3FWTdy0+hwhRcxwo0hqWFgBkg+RZbV
	 Fg21BV4Le2vC9Kgv61Tm/zIS0cNq+ssfSAGKSgaT2l1Pl0ByWICv/mJVxf5mng2gu2
	 h3Cvz5TuWuQ3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D183C79F99;
	Mon,  7 Sep 2026 17:13:47 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 07 Sep 2026 19:13:40 +0200
Subject: [PATCH v2 2/3] dt-bindings: arm: fsl: add freemobile,nbxv3 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-for-upstream-nbxv3-dts-v2-2-6b4afd36180b@free.fr>
References: <20260907-for-upstream-nbxv3-dts-v2-0-6b4afd36180b@free.fr>
In-Reply-To: <20260907-for-upstream-nbxv3-dts-v2-0-6b4afd36180b@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788801225; l=1075;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=O8dCXA7+FxVb3qjlvlxUSE16nNAWYoDpG+zNdVfj+co=;
 b=ZnPbOV+CeOOr81YAwGJxkubklSZW8BdIS3MxBjMt1PeLJJr76pW1P9j9vYkJwavOsTswtJxna
 oNAu5u8a7NiD1agtAmgaYNJqavn6HtDKEz0rzKTuf3rYzTsh5fTaOAj
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



