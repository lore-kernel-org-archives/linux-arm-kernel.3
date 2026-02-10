Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A77EA3F2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 08:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeQc4I22S/UXDWf+JHFQEowvvJWwX66W6o2VwpZ0DL8=; b=DY8KDUezmyCWugCGh2Wdp11KzO
	Py1XqgURz6p0s1fZwoqnaF8Qnl2XaFUqY9IFIZb3nLHTL2c76FGxGJXiN5ho1TPEkgoWCMy8HEpPM
	cbxIGAm+SRosG7vlfr0vh4kddOs0F4AWRCmlp0D7kh6jMGa3Je02leqck7F9KkQyZB/lsRx5NfYUR
	0MbJQsNN8/3jqf7FUHW5h+YWQ6rNTZXrfP7YsLQcyL1G504tWSiY+OQuwNQP1BvZiPVm9I1hGLnDH
	rzNFwMFxe3rFraiV9TIhea9abEE9aBgqfu661YjGM02kOSWIbnSrpblyQSH1zbUYOnzV2c+nTjFYf
	644i2WZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpjNW-0000000GhYK-3m1B;
	Tue, 10 Feb 2026 08:45:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpjNS-0000000GhVX-15K1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 08:45:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D8C6144135;
	Tue, 10 Feb 2026 08:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF23AC19423;
	Tue, 10 Feb 2026 08:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770713144;
	bh=Cn/EAtedZedYK0uwF8Wq9LrAwIhhurB1Z5r8jOfkbbY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FTW2/WTgldLyGfEnOkOm6OZT+xXaXOR/jcEg9gkjGhKNIsbayoRoLKaFZ4dnKrUNS
	 wB/3YVyQAUdetK4Skl0Q7JWpTXWc0ia/13TPMJoY0SH3Po4HmaTVt4baM1hxTREmiM
	 Z8CAvJLtok4kCTtZcn4W2JKX7rBoyeHZnkA8cr4rwWdWyplEIroUGA2N3wTk7WF4up
	 7BbOpKTRFrva5cXhPH8TvwJ7bDU7fqLo05q4OeT7KKkncseKr+ZeHuFtLCWMRLQbOW
	 +eEPl23keC780uR0S+DFnS+AyG5EvBFh/BhMN44hy8H+lrVia1G0py30HJeKo+UaLq
	 TosYXi9B6XagA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE4EEA3F22;
	Tue, 10 Feb 2026 08:45:44 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 10 Feb 2026 09:45:39 +0100
Subject: [PATCH v7 1/5] dt-bindings: arm: fsl: Add GOcontroll Moduline
 IV/Mini
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-mini_iv-v7-1-a3ad8e7ddf0d@gocontroll.com>
References: <20260210-mini_iv-v7-0-a3ad8e7ddf0d@gocontroll.com>
In-Reply-To: <20260210-mini_iv-v7-0-a3ad8e7ddf0d@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770713143; l=1193;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=algPq/arrGx+pf1g3Tkp7Enc4ftUcdmvQiHVariAEtA=;
 b=LOoXIRGdb5Q0XkniyBxhSrhM+HrO3jKKnhitagvu8ObMWQ9cAz7VNgsFZLCj38gtkj4iE2wpy
 F7xvHIk+L2cDGtfT24gG/uh1dZu58PDVwS+XzTrEY3wIo+rWPprR8vG
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_004546_343580_252CBCDB 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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



