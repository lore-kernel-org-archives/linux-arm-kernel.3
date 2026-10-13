Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C860DCC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 11:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yoPjZhSb5KCkFLQNsq/AfOKK0PfeyPWC0RufbhGAvcQ=; b=KhgfsXRa0wQ9b4
	NKwkbmoNEY9vLLoOCTTUTZ46cyIZhTkY6w7F+R39eh5x+zjbsbgiY2l8HNfXcqX7HbApJ4re0ouDX
	39CSbL7eKeX2HBbFrx3YZPsYPUVhCm7hX4alo0YG2SqhaJRPDb+LPEI4TC6f1bKieNFE3NE8Mwj1E
	pRkzwDwNW4l/O+XUk4G4pay0WFoaHKOigPoBXFyv1Pr8d1KYI6p7zR14bczU37o7xMd1kx1JCJFXt
	jJPJrRHyBcfpB9sutiHlb65XqAIEBPLMZh7RLaKwVaPZK0jj32tuNlioyY2SrG71XouVVRqE7hdX7
	SJmSu3gQTard7+3p5n0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGb35-0000000CkdA-40h8;
	Tue, 13 Oct 2026 11:52:03 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGb2o-0000000CkWU-2exS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 11:52:01 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791892303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yoPjZhSb5KCkFLQNsq/AfOKK0PfeyPWC0RufbhGAvcQ=;
	b=iMAXLYx+W9TX6mfZ9fJ+HFfO/H5ZJiR9CYcixlwqqr/AfDAlL8WWScEMhHX0GrJclPyeRF
	/AOBpXQi5CjkYOGoYG6GsKPa6pH7leOtT/N3o1iDE/XB4BEG6fIs1Wk087awOKFs/BfECd
	b6Oin0AUvHZ/3DO4pBnOfnudNiRq1OcX2ySvy4vS70p0z1lho+ZDG3HMbt5LZTkVrrVR6v
	V2HRw5a6iCptHr67RFPpMb9rHOUXok/7hNVphq0XgqIe3gBz8/9I8k/eiA0ljk354nuZDm
	I5TVoav40Dzn8ipijtXBnKtl0WZAPJyhFwQTm1mg9P2qXp2jcWU29ARzaPavnw==
Subject: [PATCH v2 0/9] arm64: dts: Kontron i.MX OSM GPIO Label Fixes
Date: Tue, 13 Oct 2026 13:51:05 +0200
Message-Id: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6DIBBFr2JYdxpAJbGr3sO4UBx0WgsG0LQx3
 r1oL9Dly/95b2MBPWFgt2xjHlcK5GwCecmYHls7IFCfmEkuleAih2UO0WP7IjvAMJODqe1wAkN
 vDKCMUboQpVZ5x5Ji9ngOyVA3Pw5L90AdD+fxGClE5z9nfxXH78/UKoBDVRheoS4lR3N/Ohu9s
 9ceWbPv+xf4tXT52wAAAA==
X-Change-ID: 20261013-upstreaming-gpio-label-fixes-6ff6c415c63b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=2618;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=JvAKBjpK4xKoAwy4jAjV8i0/BfGk7/Se2e8aQ/KOSFU=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIeuctOOPft9HmzIZLggvzihuuJp20+3vCb3jQj5fX/0/z
 neKW3xCRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwERupDAy7Mw+d9dnFlPo4Q9f
 JSNP5D18HKRY9zE3Ye2W5ZlTJ2fHr2P473b8x5bZHCaHVr+WXea5SDJu8/b1L++omp2+nlI0Yf0
 8d1YA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_045157_767271_81E9652A 
X-CRM114-Status: UNSURE (   8.75  )
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

The OSM spec [1] clearly names all pads and GPIO labels should match
the spec in order to have unified names across all boards. The intial
board support uses different labels for some pads and contains bugs.

Fix these to provide the correct labels the user expects from the
documentation. This invalidates some previously used incorrect label
names.

[1] https://sget.org/standards/osm/

---
Changes in v2:
- Also fix overrides of gpio-line-names in board devicetrees (reported by Sashiko)
- Add a patch to fix the i.MX8MP DL overlay using the wrong GPIO for panel-stby-hog
- Link to v1: https://patch.msgid.link/20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
To: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Eberhard Stoll (5):
      arm64: dts: imx8mp-kontron: Fix GPIO label assignments
      arm64: dts: imx8mp-kontron: Fix GPIO labels according to OSM spec
      arm64: dts: imx8mp-kontron: Remove obsolete VDD_CARRIER regulator
      arm64: dts: imx8mm-kontron: Fix wrong label for SPI_A_SDI_(IO0) pad
      arm64: dts: imx8mm-kontron: Fix GPIO label for PCIe_SM_ALERT#

Frieder Schrempf (4):
      arm64: dts: imx8mp-kontron: Fix GPIO for DL panel standby signal
      arm64: dts: imx93-kontron: Fix ETH_B_TXD GPIO labels
      arm64: dts: imx93-kontron: Fix UART RTS/CTS pad names
      arm64: dts: imx93-kontron: Fix GPIO labels according to OSM spec

 .../boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts |  2 +-
 .../boot/dts/freescale/imx8mm-kontron-osm-s.dtsi   |  6 +-
 .../boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts | 43 ++++++-----
 .../boot/dts/freescale/imx8mp-kontron-dl.dtso      | 25 +++----
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi   | 84 +++++++++-------------
 .../boot/dts/freescale/imx8mp-kontron-smarc.dtsi   | 75 ++++++++++---------
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    | 41 ++++++-----
 7 files changed, 135 insertions(+), 141 deletions(-)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20261013-upstreaming-gpio-label-fixes-6ff6c415c63b

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>


