Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD1DC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfi+VmLbPzh+bNouxViw0HQ3ja1quvZN33GcibfmRxU=; b=wS71I0qVC6IyrBdIkWVhGLv8Bp
	FCHRwa9Aw7S6s0k64bsIwolD7Oo5kWJvzf89DqXCKDHZzqLGzbKEe8lh0lvZM5NdGKe9GhRQkh+6s
	iYac5KfgE3AE3LDKvQZYSKucAMUR2wo+5LBEfIFI6K43bFDSa3u0Z/tcq1VsM37FL6y/AiuFauniC
	CHd5qRwHIhoiGtTikrajIzmnNQN1Gn27yN9OaUWZDZaS1TriTzBDUkyJJ1JQYthmjREbg3XF46UXf
	4dw/at3n+7qD4nlsS9ITHUfvtxIUqh/wSM/ztt+Ck+mCus+gVu8oDEqVedXfkbF5iEEwncPKrIBjH
	7iAyvCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ydV-00000009end-3qAI;
	Tue, 08 Sep 2026 16:25:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ydU-00000009emO-2t5f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:25:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C30843A5A;
	Tue,  8 Sep 2026 16:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A4B3C2BCF5;
	Tue,  8 Sep 2026 16:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788884726;
	bh=R6VPu7/qGU2BYSDwQ7+fgFxQjvHX8hCgZTCn+hEyGGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=In1GsxsKGDkhqOC0FMq9h0InyQMutg/u4n1DJ85BoRWsvAWuQnR8TvAMMJScwR78a
	 Wt6U6Na4ZUuV+IAEqJFgJuRcylfoJn6OTKhFrYEtoDcrVnwQskgX8YKxVRRDStgcl+
	 3g0TEucG6F6IgMg2K9Z3hNM+awL0Et8FnUu+wEOvWl/Lipy3fRc48w4yGpsANpxUl7
	 eAv5e+iBlNjpn/EIbyf5D6W3upPDpKiITfiC3TOHwCzTHp9yxtQTn0J6C43YyhibxZ
	 spa/72M4oLvop4oyjCwChNDqzIkLeboWNHRtc+FEcV97qGKJOjwCcentX8o6cbSmhs
	 AToh130T/jJww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9D1C79FAE;
	Tue,  8 Sep 2026 16:25:26 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Tue, 08 Sep 2026 04:12:44 +0200
Subject: [PATCH v3 2/3] dt-bindings: arm: fsl: add freemobile,nbxv3 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-for-upstream-nbxv3-dts-v3-2-1d88b2c11680@free.fr>
References: <20260908-for-upstream-nbxv3-dts-v3-0-1d88b2c11680@free.fr>
In-Reply-To: <20260908-for-upstream-nbxv3-dts-v3-0-1d88b2c11680@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788833565; l=1075;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=O8dCXA7+FxVb3qjlvlxUSE16nNAWYoDpG+zNdVfj+co=;
 b=dCOb3PjMPsNwF9nyF/4TaC1kok9kdLTRo4Dth1OL2pRKW2tQDyRu3877cfXITSxWqslSnbDaK
 bCHIqTW568EBa4mc+a6khbjDsFuXnfRDAxf6C+nBP3LvDqx2X8uaAoU
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



