Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD805E98FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mryd7M4BBNCf0x0XGUmEBpmyy0q21EcRX27SGthtwuU=; b=cmgXqogcxAIwZbp4OZ0P8hFPLn
	90TkivyELnwEtyYnooNxaf4aaRtWIj0i0+J3TVvrIQ+bw88JS67f29wsx0KL9BCqm7PqGPxkbIqSu
	s31wUevHcO0umTL4yLzMylsoZZcbG8XuIz9BzH2x6ASIcqPwvF3Z53WUFBXnThrPyt8pW1/15vogX
	HtP0kjRy1qQZJlKwaLjB4sGzREEc3iz7aY8UGzCir7Jo+HDFbVfRJQ9d8z5nYAovEd4hEb0IH6Ctz
	jn3OV9q35bbWCEWHtTX+9MeZFjpBLpcbxTRVoSzC0iRjmSOp+6Jw7H1SrGo6oJI+s9LRZb9iMlyxQ
	aUH90u7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApHQ-0000000ATXg-2N8g;
	Thu, 09 Apr 2026 13:18:44 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApGu-0000000ATFo-0RFs;
	Thu, 09 Apr 2026 13:18:23 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 3E3345FCDE;
	Thu,  9 Apr 2026 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1775740684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mryd7M4BBNCf0x0XGUmEBpmyy0q21EcRX27SGthtwuU=;
	b=KBruie1KLoeO9Oq624VdhuqzP2Gwf5S3GXX202bCwsXxYZYoqdsKBTsv26sL1M3q9ym7nS
	s+P3x93XtbgEqXHiwxsNaHIsQyPkpfcP1L3Z0eCesC6lOXprSWI3mhPeB4MPfo9v8dZ0WB
	GtJrJIyvSATrYlCHUzMzpFGFBFQmnOQ=
Received: from frank-u24.. (fttx-pool-217.61.155.21.bambit.de [217.61.155.21])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 10CEA1226C0;
	Thu,  9 Apr 2026 13:18:04 +0000 (UTC)
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
Subject: [PATCH v1 0/3] some BPI-R4Pro dts updates
Date: Thu,  9 Apr 2026 15:17:48 +0200
Message-ID: <20260409131754.121737-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_061812_598115_591A717A 
X-CRM114-Status: UNSURE (   8.40  )
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

Frank Wunderlich (3):
  arm64: dts: mediatek: mt7988a-bpi-r4pro: drop duplicate fan properties
  arm64: dts: mediatek: mt7988a-bpi-r4pro: update gpio-leds
  arm64: dts: mediatek: mt7988a-bpi-r4pro: rework pcie gpio-hog handling

 arch/arm64/boot/dts/mediatek/Makefile         |  8 ++++++++
 .../mt7988a-bananapi-bpi-r4-pro-cn13.dtso     | 20 +++++++++++++++++++
 .../mt7988a-bananapi-bpi-r4-pro-cn14.dtso     | 20 +++++++++++++++++++
 .../mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi | 15 ++++----------
 4 files changed, 52 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso

-- 
2.43.0


