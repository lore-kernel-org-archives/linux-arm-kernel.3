Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97239CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 12:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2QunDDhvbDjoqKI4SNeC4maqaklTgCcRQIiK7HqiNgg=; b=jdM1nFxr2/q+75
	FgOSzpBidgsQcAKaQMz2VpTsfaS8UqRBCJ3CX4RT7FHRrTM3dggPGSCMXy2W3wCMox1RQO7KqnrPv
	j0oNdJKr2/fIwz/UWuD+p6YR5dI+BzG8ltI2Cr4SlZ0TzG4BNQI+z6j9xqIR2zmmRw+NrGUNMLa6n
	xaPmN/+CN5zzsXxFNPVsiGD9/pSlUW8uflbN1t3Jb2R9oemA860ohB5PHQBk4IUhTe/LE+7dl71eF
	L1zbNhT4NMU4FVxG6E2fIzrcUIoNYo2jDTgmA8jitRRVjLdVhS3TZ/lxO/AUNr5rcteM02iGTGelz
	N14xLQDgYCTscTrTI53Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwK3Q-0000000E9Mx-2xtc;
	Wed, 10 Sep 2025 12:36:04 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwK3J-0000000E9Gn-2G2V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 12:35:59 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1uwK31-0002Rk-F5; Wed, 10 Sep 2025 14:35:39 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Subject: [PATCH 0/4] Mainline Protonic PRT8ML board
Date: Wed, 10 Sep 2025 14:35:20 +0200
Message-Id: <20250910-imx8mp-prt8ml-v1-0-fd04aed15670@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIhwwWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwND3czcCovcAt2CohKL3BxdA8OkVGMTMwsTM1NLJaCegqLUtMwKsHn
 RsbW1AJ6ooaxfAAAA
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
 Lucas Stach <l.stach@pengutronix.de>, David Jander <david@protonic.nl>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
X-Mailer: b4 0.15-dev-7abec
X-Developer-Signature: v=1; a=openpgp-sha256; l=988; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=XQ4gxJpcOh8Z0XnCFiM0h78lv72v3EN1lEY0NA2CNOk=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYsg4WDCDL8Hr5A2hDRmHDvOt+uZSkM79a1l3xeQ5bLL+U
 UfC/qnu7ShlYRDjYpAVU2SJVZNTEDL2v25WaRcLM4eVCWQIAxenAEzkXSYjw8QP7grLBI71V7VG
 Okp6t/Mwbz7jdcVTyfw915kiloaNAgz/tI9Y7gljr4q19ZI7/+nAvhq/u505q9pSn6yuLdkZuju
 SBwA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_053557_578971_CDD684DF 
X-CRM114-Status: UNSURE (   7.82  )
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
Jonas Rebmann (3):
      dt-bindings: net: dsa: nxp,sja1105: Add reset-gpios property
      ASoC: dt-bindings: asahi-kasei,ak4458: Reference common DAI properties
      dt-bindings: arm: fsl: Add Protonic PRT8ML

Lucas Stach (1):
      arm64: dts: add Protonic PRT8ML board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 .../devicetree/bindings/net/dsa/nxp,sja1105.yaml   |   5 +
 .../bindings/sound/asahi-kasei,ak4458.yaml         |   4 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dts    | 409 +++++++++++++++++++++
 5 files changed, 420 insertions(+)
---
base-commit: d34bbb45b57c90a5c1bcac5f327df79ddfbfe957
change-id: 20250701-imx8mp-prt8ml-01be34684659

Best regards,
--  
Jonas Rebmann <jre@pengutronix.de>


