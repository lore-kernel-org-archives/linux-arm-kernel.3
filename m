Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1420D2AB20
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JG70TegBMj/ibFZUxIkrxShKc87NYQy7WkHukok4xoE=; b=Nin0+hiF7nqRp6lU7SPvhnphv4
	1sEqs3LlTCIkNaONaVDdhyWsfOxL0ya7xU9dPoncTXHshCG6nvVPkECWYhoWZ44jVXZ4cvylgK9G/
	hjTS5Zn/Hh+wTpytU27URDdLPT0n4898yNHiQ1G+8+nOWvO6h50waYeRx+YSzxAi6PUffdhKsLrhq
	1fCzgclmq8+XGECMSbzDT7c2u5XZVLfv/B2MpAh0E1728uyqzh3CpXJC+VzRcwjiatDp2osxKgBF1
	eY4Huyu5f1iIPFzLVsphKVUUVC0DIG3qipD8TRLIo+DHr9d6cLuFmnaZz0KMJET6FJD0phG4GMPz/
	+4mIYB6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kjr-0000000EIBr-1e44;
	Tue, 29 Oct 2024 11:50:19 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jde-0000000E48L-0eN3;
	Tue, 29 Oct 2024 10:39:51 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id BC3EE60644;
	Tue, 29 Oct 2024 10:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1730198388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JG70TegBMj/ibFZUxIkrxShKc87NYQy7WkHukok4xoE=;
	b=O7new4Pb2Nq6S/vobN0VL74FAHFkpDjBzr9klQ48cO3crw0XnNIn0QXbRTpIJYLfOwmVvw
	YFUFVqyTMXHc0lm3SMYaHGAggtgH0gMjgu4HW0aLZ+u/0JGQDBzPkgJKsAmS6fh4kC/DmF
	KiIbm7wfOG71mCl7nfo12HGPcF77GN4=
Received: from frank-u24.. (fttx-pool-80.245.73.173.bambit.de [80.245.73.173])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 24BBF3600D8;
	Tue, 29 Oct 2024 10:39:48 +0000 (UTC)
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
Subject: [RFC v1 09/14] arm64: dts: mediatek: mt7988: extend efuse node
Date: Tue, 29 Oct 2024 11:39:28 +0100
Message-ID: <20241029103937.45852-10-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029103937.45852-1-linux@fw-web.de>
References: <20241029103937.45852-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 8e66c03e-5b0a-4db8-be5a-f6e0180b4bd9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_033950_411269_30D12C87 
X-CRM114-Status: UNSURE (   7.18  )
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

Add subnodes for efuse containing calibration data for lvts and phys.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 7371cd80a4ff..ed8ce1e6f68b 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -330,6 +330,25 @@ efuse: efuse@11f50000 {
 			reg = <0 0x11f50000 0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			cpufreq_calibration: calib@278 {
+				reg = <0x278 0x1>;
+			};
+			lvts_calibration: calib@918 {
+				reg = <0x918 0x28>;
+			};
+			phy_calibration_p0: calib@940 {
+				reg = <0x940 0x10>;
+			};
+			phy_calibration_p1: calib@954 {
+				reg = <0x954 0x10>;
+			};
+			phy_calibration_p2: calib@968 {
+				reg = <0x968 0x10>;
+			};
+			phy_calibration_p3: calib@97c {
+				reg = <0x97c 0x10>;
+			};
 		};
 
 		clock-controller@15000000 {
-- 
2.43.0


