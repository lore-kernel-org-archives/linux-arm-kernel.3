Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C1DE64001
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 09:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HG8LK3zLvqGGVVFMwLdWbCKig66mmIYOUx5h4FAdTrE=; b=jl7a4Sd2l+X1KGhY9mk65eebWX
	EAsu/+luMeIM02M5Qw1FSSvBUeZh+whMPQxT3DGjSQBcbc4HhXkpOBHitmDQumyfD0yHylccc4Rld
	++PV90wK7QDq7lIe+411sObh4/mOPRGqkGd79iQuxsF9pACXfgUX3qsIVoqFgjQ+N8Nntackpp6rT
	f3ay50UfL2Ha//47tV9T95AhtObPhN6ns6T28f1thj7TNEhR36qx2IZjK9sLgXnuifJI+qTUtI/ah
	AbY6HwQIDuaoS7qgef8W5e18wjwjGmICW9HZpLWVkUTENzmiqkoWgnrdaTbxd0q6rW94bI46EbJHn
	fs4PlRew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBr2n-0000000ECGz-2VE7;
	Sun, 12 Apr 2026 09:23:53 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBr2e-0000000EC9i-3ZH0;
	Sun, 12 Apr 2026 09:23:47 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 72015605EB;
	Sun, 12 Apr 2026 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1775985819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HG8LK3zLvqGGVVFMwLdWbCKig66mmIYOUx5h4FAdTrE=;
	b=tQ53KAI0x7LbPS4VjW5Q/YqSkoji4ud3ajJ44ShQF6x1kdqlsJTzUaKoa7aq5vLkSn0ZS4
	2FoYRb5v/lRhz/sY/2w9QvcbsbeOENDy3d2PBvPz5E9fNTvlXfMyFeLk+zHG97gmCVKJ4k
	EFzjsy73F5lTiPoAYMGhN1C6KVvvKx0=
Received: from frank-u24.. (fttx-pool-80.245.78.225.bambit.de [80.245.78.225])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 4262E1226F2;
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
Subject: [PATCH v2 1/4] arm64: dts: mediatek: mt7988a-bpi-r4pro: rename mgmt port to lan5
Date: Sun, 12 Apr 2026 11:23:29 +0200
Message-ID: <20260412092333.6371-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260412092333.6371-1-linux@fw-web.de>
References: <20260412092333.6371-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_022345_078566_087FE7F3 
X-CRM114-Status: GOOD (  10.87  )
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

It turns out that the label mgmt confuses users and now official case is
released where the port is labeled with number 5. So just rename it to
lan5 to follow naming convension (lan1-4 from mxl switch and lan6 for lan-
combo).

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: Daniel Golle <daniel@makrotopia.org>
---
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
index a48132f09411..1175ee156cb3 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
@@ -207,7 +207,7 @@ &gsw_phy0_led0 {
 };
 
 &gsw_port0 {
-	label = "mgmt";
+	label = "lan5";
 };
 
 /* R4Pro has only port 0 connected, so disable the others */
-- 
2.43.0


