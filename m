Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC6DE64009
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 09:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b/1+h/woDJ+LRlAGuVlOPR5DC6XTRRSPJZgjVIzkrNo=; b=ltqkifoUjz9otnZMUiGSIQqe2V
	cbM10ihp4P50vMz5z3Um5/eSbrvMu/Mf1nLFPuVmvu6e3s01nqAJdcal3CW5s4OUdk/MzY/JwC70Z
	W4XmY+X1PhVt09sd5by9CRGt0o22jO1Il7dsismuKSXDHR/TqIaqMFuO6174HU35MVh250GX5Vjnb
	TMB5c2kkT9s/wiDWIqACFIglM9rKuytc8Kq7sLCXpk0Onb9695WI5dYWqUlcI1wj+y5fip6CR5aPd
	F+eSLnby8ESxP7EU34JRtKvYBTEDGEfKUmvlXcG/tAN1twiaWqud/PoPzgAos0wHD0pai/FsQAe93
	EEGUeppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBr2i-0000000ECC4-1IPr;
	Sun, 12 Apr 2026 09:23:48 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBr2e-0000000EC9j-3jF2;
	Sun, 12 Apr 2026 09:23:46 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id 43F953FD57;
	Sun, 12 Apr 2026 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1775985819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b/1+h/woDJ+LRlAGuVlOPR5DC6XTRRSPJZgjVIzkrNo=;
	b=W71RaUil2TlB22R4Oj27Frd8eB/xlxBF5yLCx+8I2kbJNzBYYaJnGCO1BB1Y/1RpVkclTH
	AKEWqUUc6TI2LFVulCgtMpD4rmZYvIBOul+0pbFD4EbUQkOCWEBvh6f72aP+O5cX+kxfBx
	pDdSagnUCxWeAZY2IQnFJmVYYqiualU=
Received: from frank-u24.. (fttx-pool-80.245.78.225.bambit.de [80.245.78.225])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 112E11226B6;
	Sun, 12 Apr 2026 09:23:39 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew LaMarche <andrewjlamarche@gmail.com>
Subject: [PATCH v2 0/4] some BPI-R4Pro dts updates
Date: Sun, 12 Apr 2026 11:23:28 +0200
Message-ID: <20260412092333.6371-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_022345_077820_D4F5DC58 
X-CRM114-Status: UNSURE (   9.82  )
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

There are some parts of BPI-R4Pro DTS that need to be changed. Currently
there should be not much users of the mainline-dts and we noticed some
things while openwrt integration.

v2:
- added mgmt port renaming as this patch is still outstanding to keep
  all in one series
  https://patchwork.kernel.org/project/linux-mediatek/patch/20260303202006.37515-1-linux@fw-web.de/
- dropped default-state in gpio-leds patch as suggested by daniel

Frank Wunderlich (4):
  arm64: dts: mediatek: mt7988a-bpi-r4pro: rename mgmt port to lan5
  arm64: dts: mediatek: mt7988a-bpi-r4pro: drop duplicate fan properties
  arm64: dts: mediatek: mt7988a-bpi-r4pro: update gpio-leds
  arm64: dts: mediatek: mt7988a-bpi-r4pro: rework pcie gpio-hog handling

 arch/arm64/boot/dts/mediatek/Makefile         |  8 ++++++++
 .../mt7988a-bananapi-bpi-r4-pro-cn13.dtso     | 20 +++++++++++++++++++
 .../mt7988a-bananapi-bpi-r4-pro-cn14.dtso     | 20 +++++++++++++++++++
 .../mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi | 15 +++-----------
 4 files changed, 51 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso

-- 
2.43.0


