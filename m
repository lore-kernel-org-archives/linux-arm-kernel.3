Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1819AE7BDAC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 13:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kO0VB1BEv3J+3eLQioEcsNhejC/SPgKU4zf42sThvak=; b=EGnrNjsDWltZBjhdIG883EkfHS
	JCiV66eSb/KHFqiC9IosJ6VbazyjkEayg3jLA+/b9p2PBDL+NG5xtT3XqekPxylOhL2S3X6Bgjn6Q
	qCgZkzO8yrTedlSf9fmfSfxK3fhNN2iz+M6hZ3Qi5KWQANbTOQHEqyHIM8E78jLdDQDbRkj4vFuqH
	XvT1NQIRoKtqMmWBiodKDYw5lUghK7p/Y+WoUPO2aok8WNbal71KCYLD17tt6R95EaQ/KFoDW8/Pi
	5nx0S1WFLTQ4XBLM6+TEKRCHrjlEW6Kuqk1Bi7hXShE5p/QTnHaZKR1n9+6f6Air7vNXvlhPzzpPv
	k9cslklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vryJu-00000006cBt-0Mrn;
	Mon, 16 Feb 2026 13:07:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vryJr-00000006cAI-2zwN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 13:07:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD34661338;
	Mon, 16 Feb 2026 13:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85D31C4AF09;
	Mon, 16 Feb 2026 13:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771247238;
	bh=t7mc8h6wdur6fw9C3zYZUzQS2fGxcRyDjbJei3wLb5c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PRGwzYM74lTLpjgAl5Inopj8bsTg76DTYwPnl/bXxxl9pP2JVlauD+R9BYKkiQc/C
	 T8zsrg6pAaIGGCwTycAzrTuq3/UlQIJxz50LPg96Q2hvvQqK0XNwl3wg3ZASdNvgQJ
	 B35HhTHVkdtNov4zGtpgzuPZ1IJ8ImCju+JtSN81oCaxetiQ+dv88MPjUP+lrJba9w
	 PTmAqCeMjTVm6iGORyzUtLsiskl0pwGCnNtHGr97ndhrzZZ9UNM8tiFwaQ5oQUQKx+
	 9xdXBxfHqZGWzQFvjcSN/PvoSrMdEtyFuXj+Std6COxh+bXLJxgNFQLrn+SAeLcFkm
	 BknT38BbGx8/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FFBE7BDB4;
	Mon, 16 Feb 2026 13:07:18 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 16 Feb 2026 14:07:08 +0100
Subject: [PATCH v8 1/5] dt-bindings: arm: fsl: Add GOcontroll Moduline
 IV/Mini
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-mini_iv-v8-1-8d528e7cb454@gocontroll.com>
References: <20260216-mini_iv-v8-0-8d528e7cb454@gocontroll.com>
In-Reply-To: <20260216-mini_iv-v8-0-8d528e7cb454@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771247236; l=1188;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=6IJfd0YMc8bGgvz2beaVfM9bpCeb2oZi6B9JfUEwk04=;
 b=NaNE3aKgiPJekNQmIv2+rV4c5ET4l3RFR22+XI/cYt7dZfNGAGC960PDcT/EblPFNpF9JHfas
 R8Agd9q2pG6Cx27thEf3qAAPOqrDWqCqHxwG2yKrqikfCMvmmczrcAi
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

Document the compatible strings for the Moduline IV and Mini.
Also add a compatible for the Ka-Ro Electronics TX8M-1610 SoM that they
are based on.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292cf..2897d535c3d72 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -996,6 +996,14 @@ properties:
           - const: engicam,icore-mx8mm             # i.MX8MM Engicam i.Core MX8M Mini SoM
           - const: fsl,imx8mm
 
+      - description: Ka-Ro Electronics TX8M-1610 based boards
+        items:
+          - enum:
+              - gocontroll,moduline-iv-306-d
+              - gocontroll,moduline-mini-111
+          - const: karo,tx8m-1610
+          - const: fsl,imx8mm
+
       - description: Kontron BL i.MX8MM (N801X S) Board
         items:
           - const: kontron,imx8mm-bl

-- 
2.53.0



