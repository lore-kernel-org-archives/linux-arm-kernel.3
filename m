Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AD7E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGMVUzg70D55505GQQEnbxpAmhShtyOEYa1yvSmDy/Q=; b=ijC9tQhhay+x6f6PXiRf9tJzRl
	K25uO4k6fMvlj+iddlr7vbm+ARAVF+g/ki+nGWyQdJqOhfcWoyKAa+IOOO5tnzOc5wRass9ekmtVg
	qW5hIdSO8Z2o6YGlwbbyVulLKvz4IVRTYBiegSBLMIQH5Iqmk4wkIDtfEL577gf5WcHN8qzO8jDsM
	qvACfcidUYLCHGXIeWMcrXndbu/N8jEUV8R+M7D7coSroGJGui5Ipd9rrw8lJu/gz0ApRMcW8Dex5
	IVV9HHANp0DzMBgwoFUKniznxAVEumsHbPfYabk98ocSnLm/N43lNx2A9Es1CKjrGY4XkUaulj0Mq
	v9uBB70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTrl-0000000Cv6W-0LAi;
	Tue, 17 Dec 2024 09:27:45 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTdR-0000000Cr2y-05vO;
	Tue, 17 Dec 2024 09:12:58 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 9B25F60270;
	Tue, 17 Dec 2024 09:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734426775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bGMVUzg70D55505GQQEnbxpAmhShtyOEYa1yvSmDy/Q=;
	b=dOA1B2xfYIs3BkwOtNnQy5fyL/WBpd8Cv8Pn6QcVogbAdSW4OsVJJ/Z1yWl3/AZi0uzovi
	HtOkK3NLJoZ3aHHlT7oXPwFbDGRID/SpOXxbXEX8Leh3JmTz9uEHz9ycAW5VHYQgjvhaA0
	qDlmwfjMl3ud6Fm/l8+msDqAYEq0EO8=
Received: from frank-u24.. (fttx-pool-217.61.150.187.bambit.de [217.61.150.187])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id E6B56100549;
	Tue, 17 Dec 2024 09:12:54 +0000 (UTC)
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
Subject: [PATCH v3 06/22] arm64: dts: mediatek: mt7988: Add mcu-sys node for cpu
Date: Tue, 17 Dec 2024 10:12:20 +0100
Message-ID: <20241217091238.16032-7-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217091238.16032-1-linux@fw-web.de>
References: <20241217091238.16032-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: f53882ff-a533-4d87-84ee-c8b7a0182036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_011257_205687_3A25823F 
X-CRM114-Status: UNSURE (   9.16  )
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

In preparation for adding support for CPU DVFS and clock tables for it,
add the MCUSYS clock controller node.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 16b28fcf1e3c..5e53ea47f159 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -192,6 +192,12 @@ pwm@10048000 {
 			status = "disabled";
 		};
 
+		mcusys: mcusys@100e0000 {
+			compatible = "mediatek,mt7988-mcusys", "syscon";
+			reg = <0 0x100e0000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		serial@11000000 {
 			compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
 			reg = <0 0x11000000 0 0x100>;
-- 
2.43.0


