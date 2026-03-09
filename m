Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06183EF3718
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 08:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y99r0w3uvANePHf5fQI+vO5duMCpkElUfeZ9uqmXL/A=; b=agchkWfAvQ+G7QGRAwILhmiKVi
	qFvAaojgzsFmh7Lbml5QoSscS0H2eQ3mDfoRu+hKDNX7k1OxMm5B369fdGvUa+MnBwHslFWUJOXYt
	9nNjsjn8AqMdUcwKAJRP6GdR9mUh9XrsmA9+CZUMWHLG94PjMamQKJDVqeAHSFpHfGVu/zLzwl0Oh
	8z0lJvAYAATutIAomfiRYMrCuuerTDDegqRetOK6hvuPWiDErwqrfgEOLZMdD/TkKBraWdi6AXTcx
	H6/XOMxBZ/jaeZQFTHM3WXxRoKAxT3O+AyVhhsrsviqCt9BCqRy+fug0O7w+G5eEHvrB9KGGuEKLX
	2jMap5gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWRr-00000006uti-3WKS;
	Mon, 09 Mar 2026 08:58:47 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWRo-00000006usY-39xK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 08:58:46 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1773046717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y99r0w3uvANePHf5fQI+vO5duMCpkElUfeZ9uqmXL/A=;
	b=OMeGQgsOMQfKeYMepAkcSFK6Pmo3P2OnR9lElVhTasV7aPzEeAHNVeu+oMmENaTUo6Y2MY
	7DYqHW85Zd6YGRXVYHHFyq61o38AhxF7LYfFJ7Ly29AYf2epva9H0piiUSsi844nmyJ5+z
	Lw3QXwoE46Q0vmU08fw/Z7+z/ru94w6Wv8F+Ja5bgfI7Kmihm53barnTFuPiQe3dsZjSfF
	SMY0IoI7lGhqNHl049lBGsrMd27FxZCoBNmfXghy37eZRn8ZzVnSFn/+ILrA2C1wdJiUJ8
	k1fWTYwdDauIoag9Iz2Zey8yT7LLqAhcs/KTWoUQhn5ucoKd6JrknKkqD6cHHQ==
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 0/2] Kontron i.MX8MP OSM Devicetree Fixups
Date: Mon,  9 Mar 2026 09:57:41 +0100
Message-ID: <20260309085749.25747-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_015845_245370_2D3D62D6 
X-CRM114-Status: UNSURE (   6.37  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This contains three fixes and one cosmetic change for
the Kontron i.MX8MP OSM devices.

Changes for v3:
* Drop applied patches
* Add missing bindings patch for RV3028 RTC

Changes for v2:
* Add Frank's R-b tags (thanks)
* Enhance commit message of patch 2

Annette Kobou (1):
  arm64: dts: imx8mp-kontron: Fix boot order for PMIC and RTC

Frieder Schrempf (1):
  dt-bindings: rtc: microcrystal,rv3028: Allow to specify vdd-supply

 .../devicetree/bindings/rtc/microcrystal,rv3028.yaml        | 2 ++
 arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi     | 6 ++++++
 2 files changed, 8 insertions(+)

-- 
2.53.0


