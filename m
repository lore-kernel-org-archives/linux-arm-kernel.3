Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB32CC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1yC2vfl11Uvz+rPgJVGzarEqP1vrhE7ym9xxRH2Eha0=; b=zcySOiye7YXEMC39v6hYaTgKkP
	p1SRYOowgURrfe2hoY48/UV6EBJKO5sjPh1a4QN9ryeDurbrCKyNJ2tm22gfFuehbr/Tgxwfi3cH+
	NJaV+hT2TtqWwxZjP9Wh3oQCdNP0CJLSyovHhIS5dsEWszGi7Lw9sziNGVF2RxkzU76hVxBoC/heF
	6E+pcbxq93mzpFfv2BqAvQGR2lC6FUSgTDugmaj9KJelytVR9jvGCpUfCvy9/KUmtlwv7XdHxtZEY
	rDU/InJYQbnrkqB+s+fdfpcBvBFwozZXUleQWFdhN2zoJ5kvqa6TeItV2jVc0JECMZD9dFMjszsz+
	8CsJKRTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtsk-0000000EpmV-0ByU;
	Wed, 14 Oct 2026 07:58:38 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtsf-0000000EplP-1Kud
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:58:36 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 8F98A22925;
	Wed, 14 Oct 2026 09:58:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791964708;
	bh=1yC2vfl11Uvz+rPgJVGzarEqP1vrhE7ym9xxRH2Eha0=; h=From:To:Subject;
	b=IIMSMLfBZLhPlC9dzthw9/IeIr8yB0aT2jxjCI7A+Gy3afeV+bD+lDTo2g5tr9Ue8
	 ybqG0Wc4TAkAhBJpOAXQFAA/bdhzOhgAsgkagm6oMw+sCI3nwkbF6/ME+yRjao+lFk
	 1bHGhonHW3ASGuaPt76ML1D49go1ojvrvVRQqMUPxbqddsi/ZvUbLW6GnILSWtUJR6
	 Y2sc+Ft2qkgaofzz+oDcN/83CK7o2Uezmi2Wj8BNxCXQmIIeZ+aG18GKcJmKl51sWO
	 fDN4DsTyoqZvGL03h437HN/Y8S8vVO5yyqI625d/ZQx8EaQni4hJsH5dF4QzgD2Ev8
	 RZ+ES7r3g9phQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: freescale: Remove Toradex OSM Development Board ETH_A PHY interrupt
Date: Wed, 14 Oct 2026 09:58:08 +0200
Message-ID: <20261014075812.29154-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_005834_666382_03A2CDD5 
X-CRM114-Status: UNSURE (   8.23  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

GPIO_A7 is a boot strap on the OSM iMX95 module. The pull-up on the OSM
Development Board Ethernet PHY interrupt line causes the module to enter USB
loader mode instead of booting normally when the reset button is held for more
than 0.5 seconds.

To resolve this issue, the PHY interrupt connection has been removed from the
carrier board, and GPIO_A7 is now exposed in the jumper area for
general-purpose use.

Since the OSM Development Board is shared across OSM modules, update the Device
Trees for OSM iMX95, iMX93 and iMX91 accordingly. The Ethernet PHY now operates
in polling mode on all three modules.

Francesco Dolcini (2):
  arm64: dts: freescale: imx95-toradex-osm-dev: Remove ETH_A PHY
    interrupt
  arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Remove ETH_A PHY
    interrupt

 .../freescale/imx93-imx91-toradex-osm-dev-common.dtsi    | 6 +-----
 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts  | 9 +++++----
 2 files changed, 6 insertions(+), 9 deletions(-)

-- 
2.47.3


