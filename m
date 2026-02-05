Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55305EC1EB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 13:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeQc4I22S/UXDWf+JHFQEowvvJWwX66W6o2VwpZ0DL8=; b=4OfAoP7tH4m+7jRwL/51esGR5x
	fs+bsBsN0cq/oGmjQP9frKOPpKPHZBug3ObImBNoEV0Rmj+iy6e1Koee5tLfWGh9noOAYFBC4tiV5
	Nf0q3Lvsz5QcHs2CTaL4I/3u1G9c2I+q/fP2SU5g73OSXvu8HLdM1HotQOx1jkQp2IeMim2203b8n
	i9IAvdGqmigCT9EMiRR0qReuZ3cprcXaoCsj9QiPSlvs9D8dF6mx/wnIdADwpgj7V+ATcpF1hQ5Bm
	UfQI5dF/1H4TZZsxTnvCjp3OhFZsYctqBTcth2NJV/9dIj0vRr+aybHCSCuzCeoeRSIq/mW5AqnGI
	7dhRkSlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnziq-00000009yhN-3AEn;
	Thu, 05 Feb 2026 13:48:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzio-00000009yeB-0mwI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 13:48:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3611C60133;
	Thu,  5 Feb 2026 13:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAE98C16AAE;
	Thu,  5 Feb 2026 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770299316;
	bh=Cn/EAtedZedYK0uwF8Wq9LrAwIhhurB1Z5r8jOfkbbY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XqzVgEzNjyHwC5ZCkCixwqYrm1jLIJILBWKaECAC+ucgA2qhE11aY5hgQmSTB0xbi
	 qKRV4M3RBUuzD1AQN9qfS1adfG94ELk6qTPZP0TjGxM9tNZT61xabJ2yQTLNX0Fe1V
	 c+hjelofT3yqMVLmecXvawhr2Ib28wrE3mfwZmbyFXXot+gmZ9ctUEGq+Hg2nJYZ4w
	 TGmgMQS33qqeRY+HBam5MSpEPZ5IzmtaaCWvD+Wa6DCQrNmSKuL8IrVpN4nkFuCxtr
	 bcvUW/rdaC04dASR8QjkV4PeO+nXoGFbdhowWVt+IDeEDJYJRJsUeH2WfvemXBi6Kc
	 ziGlqxkVYTt1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2128EC1EB9;
	Thu,  5 Feb 2026 13:48:36 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 05 Feb 2026 14:48:25 +0100
Subject: [PATCH v6 1/5] dt-bindings: arm: fsl: Add GOcontroll Moduline
 IV/Mini
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-mini_iv-v6-1-f7cdd8f88144@gocontroll.com>
References: <20260205-mini_iv-v6-0-f7cdd8f88144@gocontroll.com>
In-Reply-To: <20260205-mini_iv-v6-0-f7cdd8f88144@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770299315; l=1193;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=algPq/arrGx+pf1g3Tkp7Enc4ftUcdmvQiHVariAEtA=;
 b=c4+YM52B9c2HTNxpMVCWvx0euSMVsO0pWdEoTxuvfBUW2pf9LVaJF8GyBtqlRr49CiIRXuBse
 A4+BTgKNksjDzS+1ndtl8V+2pHmoHq02trvOttLwT81o3g4lMQXC6Jt
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
index 5716d701292c..c76c1731b4f7 100644
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
+          - const: karo,imx8mm-tx8m-1610
+          - const: fsl,imx8mm
+
       - description: Kontron BL i.MX8MM (N801X S) Board
         items:
           - const: kontron,imx8mm-bl

-- 
2.53.0



