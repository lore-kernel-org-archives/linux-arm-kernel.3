Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C146E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lloMQbmYfGUU3oRChaF7UVRYfYj10RXDsqr7nUOj9mU=; b=gu/noxGO/HBLfd33pGy4rFHqB6
	77qNZql9VbhbEfP4AaAH3FyVMwV2QsChmTkuJD8AQsBdkaQ+kffp9B7TheP0C7SCB21CuxJ6EnDpV
	1DNeIc3i8hGcWxNAoMGZEeY+ZFPRO4rwM/zqyMqBGYnrZd7TPIrPKRDE/n+r6SsM7AmCnmdu0ThqJ
	NHEYWxeLXMVrQTObL3VzD+Yp7UxAJKUWAk6tZ65Z9WJooosQuvt2JmRAXHBYyxiEHsi0+NFWVlrEC
	0ht6bl53jt2dyl9NsGXKgDPhCHW7DrdHhffylN++HwrIrvH0PSiKilYPdTAXjAlaZMcrXUtdHuTgn
	QqrxaCVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTnX-0000000Ctv4-07YL;
	Tue, 17 Dec 2024 09:23:23 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTdN-0000000Cr1D-1Pxs;
	Tue, 17 Dec 2024 09:12:54 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id D6FDA3FDBF;
	Tue, 17 Dec 2024 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734426771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lloMQbmYfGUU3oRChaF7UVRYfYj10RXDsqr7nUOj9mU=;
	b=WoXJFhQwLhDqmFy/NC6ozKoJ9eQvTiXo2bKbi6VUZ7EeE0e94dTj3jVcT/eBZoraEmCV+2
	AWdUf1XuGh7rMQApmYAyY+pyBIWzHqVbUvCTd+czzekOgzGtB2WjlBegeQvAeUzD/r90BC
	v91BKJNZ1srqOSHYABHbcloHwB8V8Bs=
Received: from frank-u24.. (fttx-pool-217.61.150.187.bambit.de [217.61.150.187])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id ED23E100720;
	Tue, 17 Dec 2024 09:12:50 +0000 (UTC)
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
Subject: [PATCH v3 01/22] arm64: dts: mediatek: mt7988: Add reserved memory
Date: Tue, 17 Dec 2024 10:12:15 +0100
Message-ID: <20241217091238.16032-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217091238.16032-1-linux@fw-web.de>
References: <20241217091238.16032-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 91503590-2908-4ce4-a7b9-4a59157ac282
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_011253_518665_08EB9FD5 
X-CRM114-Status: UNSURE (   9.87  )
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

Add memory range handled by ATF to not be touched by linux kernel.
ATF is SoC specific and not board-specific so add it to mt7988.dtsi.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
changes: v3:
- move commit to first of series
- drop secmon_reserved label
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 46969577c87a..d205717ac78b 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -62,6 +62,18 @@ psci {
 		method = "smc";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* 320 KiB reserved for ARM Trusted Firmware (BL31 and BL32) */
+		secmon@43000000 {
+			reg = <0 0x43000000 0 0x50000>;
+			no-map;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		ranges;
-- 
2.43.0


