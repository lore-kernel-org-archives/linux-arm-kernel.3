Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2ABD78312
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 12:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uIVXD+ggnYVJ2OypdUsH1KMHttJYvEwI8nTci5/ARXk=; b=cQJAO1iv68Y6RKM5tdpBQDOXh5
	t4Prbw2mlS75NtZESb4yrZiqdBCn56kCKjaRpt078GWR+bU05jEnbHIOWTSJVtX0NAiAsRkPJvb2E
	00eZUYFVrsGGRXzoCXQitjdrC8NaFXWiPNV7BedR1NqxbQLOm/zAoti/ZixHTWtJJLWLISbCBHTRe
	GVjnFQ259V1GJcUMpaDYRs9AJX9a0S37ISkgLYHXofJeGEH3T2TWvYcEIs7EuFKKM5MWkd8Enqc27
	MDi+ne1cNuHiK5Vhd58MaLAvSKs31Rxc5/1tEE651GF5iuV1yxlb1L6AImZWbNepc1cRAuICkUGUS
	ksfTbQ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5Y9-000000064q5-1nLs;
	Mon, 02 Dec 2024 12:29:13 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5VE-00000006461-3X5I;
	Mon, 02 Dec 2024 12:26:14 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 954E741044;
	Mon,  2 Dec 2024 12:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733142370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uIVXD+ggnYVJ2OypdUsH1KMHttJYvEwI8nTci5/ARXk=;
	b=BGoxqognHJL0UXPkeLLMu5yMPfM+090AIv5wTybZ9N/nVz8TIs01vPqbwggxtfQXFbm4Lh
	KwvViq644H+2+cwCslnQ/d+Nv32KxcQDJZ/mEvF/DmdELr5Ugien5JkHDrYqb+vhE3DAe+
	FKNQpwkVlaiN1tB7QXzDKWQgIjRslTI=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id E2D253600C0;
	Mon,  2 Dec 2024 12:26:09 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 00/18] continue mt7988 devicetree work
Date: Mon,  2 Dec 2024 13:25:41 +0100
Message-ID: <20241202122602.30734-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 9e46718b-c2e1-4f2d-94be-63a5bc01281d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_042613_022770_7FE28BFC 
X-CRM114-Status: UNSURE (   8.41  )
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

From: Frank Wunderlich <frank-w@public-files.de>

This series adds some missing labels and new nodes to mt7988 DTS.

based on pinctrl-series
https://patchwork.kernel.org/project/linux-mediatek/list/?series=913700

changes:
v2:
- reorder and squash label-commits to where they are used
- add some more nodes
- add changes to bananapi-r4 board
- moving some nodes from SoC dtsi to board dts

Frank Wunderlich (18):
  arm64: dts: mediatek: mt7988: enable watchdog on bpi-r4
  arm64: dts: mediatek: mt7988: add mmc support
  arm64: dts: mediatek: mt7988: add fixed regulators for 1v8 and 3v3
  arm64: dts: mediatek: mt7988: add lvts node
  arm64: dts: mediatek: mt7988: add thermal-zone
  arm64: dts: mediatek: mt7988: add thermal trips to bpi-r4
  arm64: dts: mediatek: mt7988: add reserved memory
  arm64: dts: mediatek: mt7988: add mcu-sys node for cpu
  arm64: dts: mediatek: mt7988: add operating-points
  arm64: dts: mediatek: mt7988: enable serial0 on bpi-r4
  arm64: dts: mediatek: mt7988: add chosen node on bpi-r4
  arm64: dts: mediatek: mt7988: add missing clock-div property for i2c
  arm64: dts: mediatek: mt7988: add i2c to bpi-r4 board
  arm64: dts: mediatek: mt7988: add pmic on bpi-r4
  arm64: dts: mediatek: mt7988: add proc-supply for cpus on bpi-r4
  arm64: dts: mediatek: mt7988: add i2c-mux on bpi-r4
  arm64: dts: mediatek: mt7988: enable ssusb1 on bpi-r4
  arm64: dts: mediatek: mt7988: enable pwm on bpi-r4

 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 186 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     | 137 +++++++++++--
 2 files changed, 311 insertions(+), 12 deletions(-)

-- 
2.43.0


