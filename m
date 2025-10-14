Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1A8CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 13:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MDpqOMD5CL1152+rrCarLF7xPfcua1QkTl0LODc03k=; b=rVLlNPv0alEOoYqTgwnlZajeyJ
	ioTGfcPkUOEbEvll0Xb0u3062WZRkuLV9UeAkMgrnL9DJOgnENxxLANhmEUbKOj7O8TFWoDxfvFpK
	9/Av2O479BJo17SpLbSmb+CbwDm9ZbHUjLhWCkko2K+1Xjff15n114C79uG9b6iCqtTx5eVl79oY9
	7CAHihPpnddP1ZpWNf6dklb9R0oiIYu2DUFdODcInjq6pIw7Hpvuz5/vdUOcHXdiGqwonakUZRWyy
	IburZJlqcdgqpmaWLH0rceZ9LtSG4xvNfDHfeYiDurRw544YPjr1T34c3/PYNgPfGmtthwBryX2MD
	Xxm0Li1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8en0-0000000GPUZ-3nHX;
	Tue, 14 Oct 2025 13:10:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8emz-0000000GPUB-11ty
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Oct 2025 13:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7MDpqOMD5CL1152+rrCarLF7xPfcua1QkTl0LODc03k=; b=m8FE+SaRlWSTeR/es5tjLsA8uV
	98qVOoJHkr7bpjivQpiTtQCbio2x2qCciMRdNvzE9i5PuiBDo0qheppb3bPqo+O/hIk2vYkNwwmJa
	NxDlO/28OesViEeUG76k15ZNE+u/s3qvFBkSJS9TGfeM+2g1F3wfb4Kic6iOSy9/fhR+PWFn4F8fa
	pBqdwRlGc2r6ypqQSfzDb6u6VvJbcWXWyYowgBUTBHo+g0ysBHYL5sDONIWyriZRh5XvtNucx803w
	oh80O/hENgAaiyG0LRvOaFzfNBFRtjapIZNX1nb+EBG2gGgAbQb4IlXBSe7spzhgoT7GSPvl0Cm3d
	L4KZ4jhg==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8emw-00000005BDC-0uWp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 13:10:04 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1v8emV-0007EX-AC; Tue, 14 Oct 2025 15:09:35 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Tue, 14 Oct 2025 15:09:31 +0200
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: Add Protonic PRT8ML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-imx8mp-prt8ml-v4-1-88fed69b1af2@pengutronix.de>
References: <20251014-imx8mp-prt8ml-v4-0-88fed69b1af2@pengutronix.de>
In-Reply-To: <20251014-imx8mp-prt8ml-v4-0-88fed69b1af2@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@oss.nxp.com>, 
 Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.15-dev-7abec
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=es09yTqH3vjY+MucOzbeZ0YoUvTIbmtEWDEy+H56jXU=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYsh459378dOXh5m/dkXd/7b3oNapBfFaU93ebn2ScXSNT
 N3S/APlhh2lLAxiXAyyYoossWpyCkLG/tfNKu1iYeawMoEMYeDiFICJzLdm+CtRumBjxzrDqtZP
 pz1UPJ/XVFqE20979Sj3YhFz1Fqu9xYM/6sWsO/6054jNO3hYbcv+lNW9EoeVNfab2D1SeWmxVz
 Ps4wA
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_141002_550015_2D8977FB 
X-CRM114-Status: UNSURE (   8.39  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add DT compatible string for Protonic PRT8ML board.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b062..b135f6360733 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1106,6 +1106,7 @@ properties:
               - gateworks,imx8mp-gw75xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw82xx-2x # i.MX8MP Gateworks Board
               - gocontroll,moduline-display # GOcontroll Moduline Display controller
+              - prt,prt8ml             # Protonic PRT8ML
               - skov,imx8mp-skov-basic # SKOV i.MX8MP baseboard without frontplate
               - skov,imx8mp-skov-revb-hdmi # SKOV i.MX8MP climate control without panel
               - skov,imx8mp-skov-revb-lt6 # SKOV i.MX8MP climate control with 7” panel

-- 
2.51.0.297.gca2559c1d6


