Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CCFD1681B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=czh3DWiHh4V5ZTj8SylELCqytTFxNMFySgpnZYxJ5Ic=; b=sKrEeWWwN932ubz8/MuUN9kQix
	e/a/d9lh98uUDfwIX6vEfePdU68Cawy02goFsKuB8Y+O8Axdy6OtLRgGWcxF6KKGZUKhb5rceKpfX
	NB8Bp8DhuRPM64IUyFg9jNvFpQmzEGThUDsuEi3dLO3eKXI0j6xn+gF8tpJMx2rUz4/tiRaQhXc5g
	p0zrTJ1jyFzkNHc2EHb6wOyWNSI+8N2YoC4rzqzV6/jk1HzEsto3lh/G3NJQZzZ/y06sPOQW+yb2Q
	YUDOmIJRLOYpiPNEd0PrryTdNilhMbqnFmuoEgk9caQE73isYnaYmXHKbS2I/y2UAFb5Wwck2ULFf
	RBF/6AXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyN-00000002F0v-0Jcz;
	Fri, 09 Jan 2026 11:48:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyG-00000002EtH-04uK;
	Fri, 09 Jan 2026 11:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767959275;
	bh=XE4iCIg/Tr4IYc8+mGcegtbGiZIFmns1DrVHYez+y7w=;
	h=From:To:Cc:Subject:Date:From;
	b=XrxIJFn5oOwDI4mTISAdPmckr3wzoNVN3h8N+Qhf0jRK0qkoEJRs/9eRKasFzApSG
	 kbLdMnJp8BsdLuq0YVSCt3w7+iEKyAxv5/HB4GtRfKIKMIc+mgK++NtWusOFQ/1R6E
	 9IZq29nC4tdJSxa317c2enXXAngvfz/WiOfsvNHv+8qv7P6Jnv5Kzy5vomQfSZpDY6
	 x4o0RvtfTP8N97BON0M80GEfbyeff82I3sqxEk6QmdrzH9cZd9cKNB1JUv1568wOs3
	 sChT4jCk56xh6SOrBXLN1G6IBLzGSHvCkB3DG8frAoN/Ion0JfaiIuJWSbFI9Xi7gL
	 vdkbd8LeX5pMg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E8B8017E0FF0;
	Fri,  9 Jan 2026 12:47:54 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sjoerd@collabora.com,
	hsinyi@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 00/11] MediaTek DTS dtbs_check warning fixes
Date: Fri,  9 Jan 2026 12:47:36 +0100
Message-ID: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_034800_234100_0BB9EA22 
X-CRM114-Status: UNSURE (   7.60  )
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

This series performs some fixes as pointed out by dtbs_check and
does some small while-at-it cleanup.

AngeloGioacchino Del Regno (11):
  arm64: dts: mediatek: mt8173: Fix pinctrl node names and cleanup
  arm64: dts: mediatek: mt8183: Fix dtb warnings in display graph
  arm64: dts: mediatek: mt8183-evb: Fix dtbs_check warnings
  arm64: dts: mediatek: mt7981b-openwrt-one: Remove useless cells from
    flash@0
  arm64: dts: mediatek: mt8183-jacuzzi-pico6: Fix typo in pinmux node
  arm64: dts: mediatek: mt8183-pumpkin: Fix pinmux node names
  arm64: dts: mediatek: mt8173-elm: Fix bluetooth node name and reorder
  arm64: dts: mediatek: mt8173-elm: Fix dsi0 ports warning
  arm64: dts: mediatek: mt8173-elm: Remove regulators from thermal node
  arm64: dts: mediatek: mt8192-asurada: Remove unused clock-stretch-ns
  arm64: dts: mediatek: mt6795-xperia-m5: Add UHS pins for MMC1 and 2

 .../dts/mediatek/mt6795-sony-xperia-m5.dts    |  48 ++++-
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts |   2 -
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  34 ++--
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 167 +++++++++---------
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts   |  60 +++----
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  28 +--
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |  36 ++--
 .../mediatek/mt8183-kukui-jacuzzi-pico6.dts   |   2 +-
 .../boot/dts/mediatek/mt8183-pumpkin.dts      |  16 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 119 +++----------
 .../boot/dts/mediatek/mt8192-asurada.dtsi     |   1 -
 11 files changed, 235 insertions(+), 278 deletions(-)

-- 
2.52.0


