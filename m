Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6604FCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 08:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aBAth7OC4HXESnQWCbnVVE+P6zORgmWjqjh0hqLI844=; b=43R7abeNF9QINR
	Q3VYcTngf0MBZ7w13VVCwWkpNzudaw6CU6zifBuhh3FWy+XgqFf0oJEUeHn7lvVNWaOK2A2q2ch1S
	/UBDTvwCazD6lH8iLEDu7i1jHgVcmZnSGhqqA0spbKqMjebwHw3I+8GApiML4WAgJJX0hle31daK0
	WkrF51WWO57BWWtqeTadPNjm635A3MnYzo+x/oVynq9x7L21KRx283P44D/gJc23oFbaARNqPkpgX
	wG5xrkIO8UkvS4VZj9AjHfisUN37Vo25gtJECOiILFviD1DPkrmf6OPKvj73/kO7CtkrI0xlWVigN
	B6kdt6adDZVfUya3aQeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Kxf-0000000FtRe-2Ecz;
	Wed, 24 Sep 2025 08:34:51 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1KxT-0000000FtMY-0ARV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 08:34:41 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1v1KxR-0006Aj-7V; Wed, 24 Sep 2025 10:34:37 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Subject: [PATCH v3 0/3] Mainline Protonic PRT8ML board
Date: Wed, 24 Sep 2025 10:34:11 +0200
Message-Id: <20250924-imx8mp-prt8ml-v3-0-f498d7f71a94@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAOt02gC/2XMSw6CMBSF4a2Qjq3pE4oj92EcgL3ATaSQFhsMY
 e8WnBgc/ic530ICeIRALtlCPEQMOLgU8pSRR1e5Fija1EQwoVnBOMV+Nv1IRz+Z/kkZr0Gq3Kh
 clyR9Rg8Nzrt3u6fuMEyDf+985Nv6lUrODlLklNHGMlWB5Tov2HUE174mPziczxbIxkXxS5gjI
 RIhrVG1akBLC3/Euq4f9TOPKPIAAAA=
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
 linux-arm-kernel@lists.infradead.org, Jonas Rebmann <jre@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, David Jander <david@protonic.nl>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
X-Mailer: b4 0.15-dev-7abec
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=4wvx639RnwwdY8F0v2Vj37kcv/o6/9JmJ8NAhXnPjto=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYsi4vFba0Pk8n2Oeim+bwmwF888J55+v+JZt43defuPjP
 xVJK9vPdZSyMIhxMciKKbLEqskpCBn7XzertIuFmcPKBDKEgYtTACZyRZuRYatq8smImfserIta
 ZfJgl1Nu1Ed3uVcp6fbZmmuSFr3lrWD4XxLwSyzYVJll52yVTfz9Z6anX9m37HnaiWym0rPZ9tO
 rWQE=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_013439_103909_7A657B6F 
X-CRM114-Status: GOOD (  10.67  )
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
Jonas Rebmann (3):
      dt-bindings: net: dsa: nxp,sja1105: Add reset-gpios property
      dt-bindings: arm: fsl: Add Protonic PRT8ML
      arm64: dts: add Protonic PRT8ML board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 .../devicetree/bindings/net/dsa/nxp,sja1105.yaml   |   9 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dts    | 501 +++++++++++++++++++++
 4 files changed, 512 insertions(+)
---
base-commit: ea21fa34164c9ea0a2a5b8714c7e36f54c7fb46e
change-id: 20250701-imx8mp-prt8ml-01be34684659

Best regards,
--  
Jonas Rebmann <jre@pengutronix.de>


