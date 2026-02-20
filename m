Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481CEC55184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 10:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6tAL8GI9iApgRaPZmu4GB32Zrpmts92Rjsp7FmvajSQ=; b=q60gFc8p23d2/65PoCxvW3aO6d
	Yiy4EjCEJOxbYMMjL6RQryN2M27erVF5nVxDs1hEKJZRX23MxP/XjgQsQ1mP8fjbK/Hmfh4Nf+1MJ
	L8KMfyjPEIN/oSQsZ8OkGx83X3/+hCzlTvtDs2Lq/gf1EqBbIUlAM/HiTqNncKgGebxTtSJRTh8h9
	WV+6ucFMgtBss1JxSjGjtKEtcpeY3oVy62Kpld8UVyZjaXJC+DAM0ThTAZFkhcUNFt6D0+xYjv/cT
	HStA8mBRfXTS2q9dYZ6ffTpsbZe1rjJol4SBtjrkLHz3Ialhvdyg629tl2xnGyUDaNHgZwG4mJ+Rj
	TVwf5SDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNsR-0000000E5ii-1e9j;
	Fri, 20 Feb 2026 10:36:51 +0000
Received: from mail.fris.de ([116.203.77.234] helo=mail2.fris.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNsM-0000000E5ao-45O7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 10:36:49 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1771583801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6tAL8GI9iApgRaPZmu4GB32Zrpmts92Rjsp7FmvajSQ=;
	b=kguP8LI8u1PoAj8In3GfvOKdb8oc8Ne0lq2zdwc2k7DNeUOZwhreRoSk0zAjouCBX8kxOr
	hRgICRvMg6TC5thAT5wvu0RN+0z1j/gfPf9uagk7IxeDkc87+FXviOWebfg32895/s4oY1
	rPugm+dFePo8o3OeUJUIc1pBkqCSenFhcRnz3Q18xwPeS+MLMRkYQMH//c+JM83IuEam1J
	XlUCeLT1Dq3LIjTjYwnI+ZwlNu+9jUREHEJoSuBwhJ43bKTSxwkYHNYhxjal0IiSE6aklq
	Vj/T4R28X8BKo2dVhOo3SznAFLwxuXcMl/p3U3pI84jaacyqfENiqZXGpMlWeQ==
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 0/4] Kontron i.MX8MP OSM Devicetree Fixups
Date: Fri, 20 Feb 2026 11:36:15 +0100
Message-ID: <20260220103636.9697-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_023647_474156_10B88E8A 
X-CRM114-Status: UNSURE (   6.95  )
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

Changes for v2:
* Add Frank's R-b tags (thanks)
* Enhance commit message of patch 2

Annette Kobou (1):
  arm64: dts: imx8mp-kontron: Fix boot order for PMIC and RTC

Frieder Schrempf (3):
  arm64: dts: imx8mp-kontron: Fix touch reset configuration on DL
    devices
  arm64: dts: imx8mp-kontron: Drop vmmc-supply to fix SD card on SMARC
    eval carrier
  arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines in DL devicetree

 .../boot/dts/freescale/imx8mp-kontron-dl.dtso | 26 ++++++++++++++++---
 .../dts/freescale/imx8mp-kontron-osm-s.dtsi   |  6 +++++
 .../imx8mp-kontron-smarc-eval-carrier.dts     |  1 -
 3 files changed, 29 insertions(+), 4 deletions(-)

-- 
2.52.0


