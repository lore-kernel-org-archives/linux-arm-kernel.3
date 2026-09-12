Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26333C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 13:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miy2ZPuwH3WkyFN1MqRAGPc/Sjkl6jje6x9YtphAAJE=; b=Y88rsxaLlqyhvVbx8N9msvo//R
	bIqFYrE0QNo1RAd3+PaGV+iL/lb9zioS3QXMHilXj7+t43p1Fk6lG3YqhntmuIksslNhK6FLV3Bn/
	m5OEeTTj+BSFRgyy9y0UKUTEUCEJu8oRl6AcUEutuMNUKHu00FYZuSt4zBrbh5sfB9aE19A6Ys2MQ
	9HXH3ytyO5BKGjXARgdzq/UbMeQ4A5FkjR1YZ+/G5wr1DIa12SXALb8lNPiR8N3uDG6j7qwKRgiVB
	FqCG5pv+4Iv73t5dde63HIDl5GTvLyKCJuXWvr+L4kuiHQl6Oa8LTD1caMKIhZXBHlGQSxhChr4qE
	uNzEQPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5NqX-00000000u28-25Gm;
	Sat, 12 Sep 2026 13:32:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5NqW-00000000u1Y-3GvG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 13:32:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DDA2C6024D;
	Sat, 12 Sep 2026 13:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E241C2BCF6;
	Sat, 12 Sep 2026 13:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789219963;
	bh=JkwzbNYwRAgQqV5i3Ky5WDnTYDRC8C/A4yQ5N2SQlvs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k9gAkp0JWhV7mBN8QWBqNqigjYp78I4lt8FZrxRf2jW0P1EcSYeviR6rt8WxD+Tb4
	 35NX5AsEkAdvx9GEvvhGMM08TRPgFcUNr0AN+Mtu8eqiDOq8MSuxcMPSOQSuKHJK6d
	 KpqwsUwRyckwWEBv/hjnwaU5YIK0hFxdJFjOLP5Un/peh7q/RDzt2jRJ60eSO5RDz5
	 BJh323p9LYwrMRuv0Yf8akW/JnLyvnq2l3upSb+P51neENMNvsKxcOUXr8ZCY61Cr9
	 Bg0wdUqS62BB/6ixb8a1QYzx7ZVVH3PRsKdo4zv62VibOmRf5PxS51OqLhH6ph4A+Z
	 sDvv0pMj1Zdcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E51AC88E53;
	Sat, 12 Sep 2026 13:32:43 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sat, 12 Sep 2026 15:32:37 +0200
Subject: [PATCH v5 2/3] dt-bindings: arm: fsl: add Free Mobile Nodebox v3
 CPU Module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-for-upstream-nbxv3-dts-v5-2-ead604dba61b@free.fr>
References: <20260912-for-upstream-nbxv3-dts-v5-0-ead604dba61b@free.fr>
In-Reply-To: <20260912-for-upstream-nbxv3-dts-v5-0-ead604dba61b@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789219957; l=890;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=6NRdekrvZ1bADwMMSU8BctmnPr4DJ0Rx7XWnLNXPJac=;
 b=oYnzQwBQLJRk7ZpVu3rJN78/oGczQp1xYVeQKVjG73zu54wxvJB0DAiodIs1x37ZRyQHlTLpV
 1AgbD+BhuDgB0+/JhUrFD2pGdLbG5FJXHZCpDBDJ/rK284dkX9QZUMb
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
index 656f2596e1d5..baff4f4159b2 100644
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



