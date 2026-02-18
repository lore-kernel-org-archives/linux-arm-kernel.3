Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C834CE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W5XQvr67ppKEv7j8lI1OxJ8VB1al1Zi7HovSXR/21hA=; b=b3Kbu+Luz4o2+xL7k201La96kZ
	LzV7SIGhzkDcTSd4DqEgD48RMyEC8QyvzLHF0qgO2qzejjMEvgrSDu05HAslCnT22UHv4VIDq+Zlr
	JjvJ+zXY72zApzikt9EGqLStfcePImSRmRQse35DWIOj2n9H72l/6odxwv18FkUkfxM3vLVn3I+qK
	CNVpxwLNR0gxkbrIJ3U38fAJqLVoGTGPVCrRhAURCIblhJgtLD//DId9mp17wgWD/3tGKKzAO6J9y
	ump7HZSquUic+Exrnmmhut9WdmqCuDKx0TWk6nwapOO/EUaPzDeYZRGRdyLnlH5YV5oeOLQXB1+7W
	JdIPlmIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshYY-00000009s9J-3dlS;
	Wed, 18 Feb 2026 13:25:30 +0000
Received: from mail.fris.de ([116.203.77.234] helo=mail2.fris.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshYW-00000009s5c-0kmq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:25:29 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1771421123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W5XQvr67ppKEv7j8lI1OxJ8VB1al1Zi7HovSXR/21hA=;
	b=MHXeV1uNtdW1YLFHFyT66YlUJwbKIAtBas9rb3Uge3Y2URC+dVIXW5xcVXxUdgUl3IlpD2
	nKFfaPO9Wroqyi7wqUB4ec/m3Nn0w1ZaeZSk3WAtbYR5LBp2Ac+rzMLv9S2jCgTgbydWab
	rMJCxqcq++eXq04ZPs34TtExr99uQMGpuxI5c1RKl9kRlwqFQfiZ1XVzfddFNuMx2MPs2n
	lSn8S0oUNDNwp2VQEMH8/HCREEpOSqZtUO8Jn/YE4d5zpluIuLtWWySgipvpWPwTYS3ZoV
	udpNQ9I0LACTlMsP3wRN8XnOf/FN+SOFqkSNAVSXRAX1tbnQISdib2n3wQRNkQ==
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
Subject: [PATCH 0/4] Kontron i.MX8MP OSM Devicetree Fixups
Date: Wed, 18 Feb 2026 14:25:04 +0100
Message-ID: <20260218132519.74570-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_052528_652654_20238214 
X-CRM114-Status: UNSURE (   6.28  )
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

Annette Kobou (1):
  arm64: dts: imx8mp-kontron: Fix boot order for PMIC and RTC

Frieder Schrempf (3):
  arm64: dts: imx8mp-kontron: Fix touch reset configuration on DL
    devices
  arm64: dts: imx8mp-kontron: Fix SD card supply on SMARC eval carrier
  arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines in DL devicetree

 .../boot/dts/freescale/imx8mp-kontron-dl.dtso | 26 ++++++++++++++++---
 .../dts/freescale/imx8mp-kontron-osm-s.dtsi   |  6 +++++
 .../imx8mp-kontron-smarc-eval-carrier.dts     |  1 -
 3 files changed, 29 insertions(+), 4 deletions(-)

-- 
2.52.0


