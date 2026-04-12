Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778B0F44859
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 09:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HT1LmTE+wyO1hbqhpbnpGgkpi6vYm7hFobdw7gJUxz4=; b=dPHK4NK4YfClMymnnHam4fw8zS
	uwxB5IVWeyur/V0unpwojyRVJmsWF0pFkgzjxEuV3CvCYzhbqRBTt3MsQTIICteZ9e6Rsa63hrnuo
	cGWYqAKdC1ENO7fQ8HZtAb435m1SZx7xUkwLbbvlMRjFJrs0Z0TQq71O+NYghBNijdtysi990ttvy
	nTO74iCpi9Mj2XUbavEQKwwd9ZWBdrVFmCTucPrV9p4XANz/dpnt8BMq8HHscDKG8TthLmCYkW+wU
	aXCac0mOmtur4sWROtSKJhtLLD8KjB+uQfKklGJiFH5yXR/x6i4X6DbjqMm3SKBhXEgps8cxE+yId
	AoyeAYFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBr2h-0000000ECBX-3FBD;
	Sun, 12 Apr 2026 09:23:47 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBr2e-0000000EC9k-3Xh7;
	Sun, 12 Apr 2026 09:23:46 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id A0DAB100501;
	Sun, 12 Apr 2026 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1775985819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HT1LmTE+wyO1hbqhpbnpGgkpi6vYm7hFobdw7gJUxz4=;
	b=BhALq0GLxllLVKbwbzl8x7kH5PUqeVVAHiZuXhvdJll5yG/N+MCTT5L5kEmcAeI9mdcRdE
	fEOwxd7M5UOD6rIsbe1CBAft5afYXJ1EE0mdtrN18l6SmPa6NJcr9TnNsdbONEa5osy7C+
	PdZ+MUwrwMrxf9sUyJRWC3X2wWvk/tM=
Received: from frank-u24.. (fttx-pool-80.245.78.225.bambit.de [80.245.78.225])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 7145B1226F8;
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
Subject: [PATCH v2 2/4] arm64: dts: mediatek: mt7988a-bpi-r4pro: drop duplicate fan properties
Date: Sun, 12 Apr 2026 11:23:30 +0200
Message-ID: <20260412092333.6371-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260412092333.6371-1-linux@fw-web.de>
References: <20260412092333.6371-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_022345_079698_9211DC99 
X-CRM114-Status: UNSURE (   8.26  )
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

These properties are already set in the original node and do not need
to be defined again.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi     | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
index 1175ee156cb3..759f608d1081 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
@@ -185,13 +185,6 @@ &eth {
 	status = "okay";
 };
 
-&fan {
-	pinctrl-0 = <&pwm0_pins>;
-	pinctrl-names = "default";
-	pwms = <&pwm 0 50000>;
-	status = "okay";
-};
-
 &gmac0 {
 	status = "okay";
 };
-- 
2.43.0


