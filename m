Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F72CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 13:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jw2TYmtavCL/WQvnr1OyHbLSFcEf3xgnHgfFKXj980E=; b=fXenL14KA1WVNF
	+xD4d4Lur/kxuZjWHQ2r2rIWBlXydzOJqVeb9tg9TjfK8iuSArrlJaAIo+dRIz+xpi381nfyEOaWv
	O/BUPHQlruXtHVpswMAQ0jiMuRA8CMw8iDCo7tnPMvrO5OJaORWpyipFUTXvCh8kXMfyqUMhlj8Uo
	nS5yJ0PvkroITQrfd+8hr+py1k+eqk8GWum/FVx2TCmBjWcuiUir8B4MIh573dgnvtzbwhwzPAP0m
	evOzuY1IOpQb6chRed77Bg8L+p7iCVokD0eI6oFez4Bo7f7/QNd7wTZoSFv2mPHvuvNP16IBLYYHx
	XjJzO/oLQu5n0SYLYuNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8en1-0000000GPUq-1XkN;
	Tue, 14 Oct 2025 13:10:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8emz-0000000GPUC-2HEZ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Oct 2025 13:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Jw2TYmtavCL/WQvnr1OyHbLSFcEf3xgnHgfFKXj980E=; b=d7ag5yKaDFqwaNlNDi6zCmZAh+
	3MjbjYUeAgnqZ1OgLC/1HB9orvwCIZBKSfMOWvHub/Cv1qKajpU9aBAzursyIEdm7hVoJlgjMDkkl
	vy/cl1RKGeCm/SNXpFBDgSuDNbQpL2rtfzYHMk66oiXXGviXQOJ79zmKq/UA5mZzLN+kb0W/NjI5/
	hq0jZoMyla4GGip4kOZ5zkLd6wm+IHhQH8vh38GqyBhhd0bV0tLT/LqHn6aeAkLaGNe1gtAOunJK+
	0ITOxsAGyqmbSJN86/JEepu0+XxVJHn83k0X9efvrNgggXXSKqrtNIJxKZBly7MOACBh6C9T68NSR
	/FzSln8g==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8emw-00000005BDD-0uTl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 13:10:04 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1v8emV-0007EX-7j; Tue, 14 Oct 2025 15:09:35 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Subject: [PATCH v4 0/2] Mainline Protonic PRT8ML board
Date: Tue, 14 Oct 2025 15:09:30 +0200
Message-Id: <20251014-imx8mp-prt8ml-v4-0-88fed69b1af2@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIpL7mgC/23OTQ6CMBCG4auQrq3pzxSKK+9hXICdQhOBpiDBE
 O5uwQ1Bl++XzJOZSY/BYU8uyUwCjq53XRsDTgl51EVbIXUmNhFMKJYxTl0z6cZTHwbdPCnjJUp
 INaQqJ/HGB7Ru2rzbPXbt+qEL740f+bp+pZyzgzRyyqg1DAo0XKUZu3psq9cQutZNZ4Nk5UaxJ
 /SREJGQRkMJFpU0+JeQO0LAkZDrF5Brk9mMFzn8EMuyfABQVCBoNQEAAA==
X-Change-ID: 20250701-imx8mp-prt8ml-01be34684659
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
 Jonas Rebmann <jre@pengutronix.de>, David Jander <david@protonic.nl>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
X-Mailer: b4 0.15-dev-7abec
X-Developer-Signature: v=1; a=openpgp-sha256; l=1732; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=2tt4zSuVjsO7A5I6VZ49Wzvg4d7IGcTk/fszUM8KpGE=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYsh4590zpX7/AScjzaOeE/jEDCeLfg54/7/Lk/e1XZc9a
 82plvYdHaUsDGJcDLJiiiyxanIKQsb+180q7WJh5rAygQxh4OIUgIkI32D4p3204cQBibtq+i5V
 UVqbpdczaV2c6vY/wf1r/buOuUfcbBkZdny5vndi3az3j9/aHkxeuSPAizO6P3fu5qsHf73prpn
 9lRkA
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_141002_625787_1B40777C 
X-CRM114-Status: UNSURE (   9.71  )
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

This series adds the Protonic PRT8ML device tree as well as some minor
corrections to the devicetree bindings used.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
Changes in v4:
- Dropped "dt-bindings: net: dsa: nxp,sja1105: Add reset-gpios
  property", applied to netdev/net-next.git (Thanks, Jakub)
- Comment on deleted OPP and deleted dma, correct tps65987ddh node names
  (Thanks, Peng)
- Link to v3: https://lore.kernel.org/r/20250924-imx8mp-prt8ml-v3-0-f498d7f71a94@pengutronix.de

Changes in v3:
- Add comment on the intentional limitation to 100Mbps RGMII
- Link to v2: https://lore.kernel.org/r/20250918-imx8mp-prt8ml-v2-0-3d84b4fe53de@pengutronix.de

Changes in v2:
- Dropped "ASoC: dt-bindings: asahi-kasei,ak4458: Reference common DAI
  properties", applied to broonie/sound for-next (Thanks, Mark)
- Updated description of the reset-gpios property in sja1105 binding to
  address the issues of connecting this pin to GPIO (Thanks, Vladimir)
- Added the fec, switch and phy for RJ45 onboard ethernet after
  successful testing
- Consistently use interrupts-extended
- Link to v1: https://lore.kernel.org/r/20250910-imx8mp-prt8ml-v1-0-fd04aed15670@pengutronix.de

---
Jonas Rebmann (2):
      dt-bindings: arm: fsl: Add Protonic PRT8ML
      arm64: dts: add Protonic PRT8ML board

 Documentation/devicetree/bindings/arm/fsl.yaml  |   1 +
 arch/arm64/boot/dts/freescale/Makefile          |   1 +
 arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dts | 504 ++++++++++++++++++++++++
 3 files changed, 506 insertions(+)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20250701-imx8mp-prt8ml-01be34684659

Best regards,
--  
Jonas Rebmann <jre@pengutronix.de>


