Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE40BC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 06:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ed9pd0rkWXEvHKY9PlVF670WS12tqCTEdzAdyUEs+WA=; b=XgFiLkzCxgYxoxZi3L3d3ELWQU
	x4GGeZk786d1ytW6oX3fUQ3HY0tla4iwTtyIp7Vop96IAZj69/CWh3Dm1gsKK1HSfpHHSlHtRrKkY
	mz4NifiSsrDaLK38FZWKsU8tGKJtyIC3vCq/0jDDQqmOAI6hXIgpmzxiglZ1oPdev7NPaLIcPo3x3
	8VXB5LDC9VL6BJy+E/eDNPvwjK43f4JSQYteHv6de7Lh8jaU8bDzgY6l1beFAQlIukfU31sezIQx1
	uHDCXr1oIx59BWexB8ignwOu5cb8nz+c+o+6pncsxUOUJgiHEtvT0cRhtMyqrzqXWZlCGKdj9Dh52
	q6mrvaqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vCN-0000000FyRN-1YET;
	Fri, 11 Sep 2026 06:57:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vCK-0000000FyPJ-2R6N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 06:57:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A0146020A;
	Fri, 11 Sep 2026 06:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1BE3C2BCB8;
	Fri, 11 Sep 2026 06:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789109839;
	bh=ZwAaadx5hjQEdyKyc9oxn254nSkQCL0+FG6XUZI7g9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nr7EvVxg3IdAGV5fYoEGkK1wQ901HEFtpaHVoYu4NiOdJOyWmaWyPsaStD1N4WStt
	 zMi/cgwVQuPPCUlHCHNXfhHckxE65zKGJ6RsweMYOs50s1nPPLxmYFuTbM4jiwrQAF
	 8a+tJQ/ImsHMcnEOP9spn92oEFunlRIduR6NfMys5Zss80grZIr9bMKeCNb9L2S2Uf
	 GMqECVrAhv7yPJFnXYfyxctkkqyLBSXTvqyVrCqHBEeTpNqmdoqnOSa4sdynGkhQCe
	 5lNPUgfOP6WbbIWo643JA7iEmT+h5p/Oek6EBMJwn/Jcp9kqSceAWpOuYKu8xTEdUT
	 /JcpNbhapoGXQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840C3C88E50;
	Fri, 11 Sep 2026 06:57:19 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Fri, 11 Sep 2026 02:08:34 +0200
Subject: [PATCH v4 2/3] dt-bindings: arm: fsl: add Free Mobile Nodebox v3
 CPU Module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-for-upstream-nbxv3-dts-v4-2-2fd07d5575ab@free.fr>
References: <20260911-for-upstream-nbxv3-dts-v4-0-2fd07d5575ab@free.fr>
In-Reply-To: <20260911-for-upstream-nbxv3-dts-v4-0-2fd07d5575ab@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789085313; l=892;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=EDQrDIoVj9BzoPOG09GyK9jZt6CKfC9K8e2yVKy7XuI=;
 b=VyZ5S5qCNcz/iULpMonVcIATemrHh/0BDQVFUuqGNFgDQJeihYERbA6zVBlUk2FeB8Nf3cQTx
 hQniqwFglcbCDWmBiiS21LK6WyTQMosSLwn4k5gA1iaRMUday69R9Bo
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

Add DT compatible string for the Free Mobile Nodebox v3 CPU Module, an
NXP LX2160A based board.

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



