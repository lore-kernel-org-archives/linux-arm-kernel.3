Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CC9D2AB1C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 10:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MnpLRRV6D0qYtjvT6N/RJ0yKKwRAeg0UPLRteadPcE=; b=F3vrYLcLaLULNkHTdlxcd0xlIc
	wfo66md+eTY0GHUVAWOUrjG97Y9p40R7zwF5FYJuFaW75TDFw6ADsmTaTnsFy9526Ha1Vv4UaPjKR
	2UHG3XFE6lTkGrwJ/VKRUemvfMqvD5wPht1fOOxwsaUM5KLK+8/0FEALTYm1x+jfzdzZpqTYTJSmk
	YeWjyTFe5CvboxH6vM1MQ4+yv6bP/kLgMG0nbu0Wi9h36WdD9qqFqc+UHnb0PjwsrWL4yoU4d3KWV
	01m12E4Dtj1iYEgqSUE/JtwJtMHiGqOpXtpgzv8zrJcKt4KhsYQyheIcrfoxfuWUFtT4GHdiOxBB7
	A1yjf5RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jp5-0000000E6n5-1kaa;
	Tue, 29 Oct 2024 10:51:39 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jdc-0000000E46Z-2oPY;
	Tue, 29 Oct 2024 10:39:50 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id B1765404FD;
	Tue, 29 Oct 2024 10:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1730198385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6MnpLRRV6D0qYtjvT6N/RJ0yKKwRAeg0UPLRteadPcE=;
	b=V2Ag1/d+nJ1XUQFIviC60Y2T9ospo5AwymtxtY4KMs8gVFNhcBo2LCVJGfSsiF8/pNKtVa
	JpNag7NrLDI65v14QLPUoZxURi4U0ns/PLJiPz6xiVEC7jq/AzvYUT9mrVhKEz9zH/IcGv
	CFlUi/I1B1FNvRr52ehFfqNw7bsN+fE=
Received: from frank-u24.. (fttx-pool-80.245.73.173.bambit.de [80.245.73.173])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 1B0B036037C;
	Tue, 29 Oct 2024 10:39:45 +0000 (UTC)
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
Subject: [RFC v1 04/14] arm64: dts: mediatek: mt7988: add serial labels
Date: Tue, 29 Oct 2024 11:39:23 +0100
Message-ID: <20241029103937.45852-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029103937.45852-1-linux@fw-web.de>
References: <20241029103937.45852-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 6858e22b-58d2-40a1-a28f-cb0b77144b8b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_033948_873779_719F7B97 
X-CRM114-Status: UNSURE (   8.93  )
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

Add Labels to allow easier referencing in dtsi and board dts.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 6d2ea317f9b2..e5e7951b24f8 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -178,7 +178,7 @@ pwm@10048000 {
 			status = "disabled";
 		};
 
-		serial@11000000 {
+		serial0: serial@11000000 {
 			compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
 			reg = <0 0x11000000 0 0x100>;
 			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
@@ -189,7 +189,7 @@ serial@11000000 {
 			status = "disabled";
 		};
 
-		serial@11000100 {
+		serial1: serial@11000100 {
 			compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
 			reg = <0 0x11000100 0 0x100>;
 			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
@@ -200,7 +200,7 @@ serial@11000100 {
 			status = "disabled";
 		};
 
-		serial@11000200 {
+		serial2: serial@11000200 {
 			compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
 			reg = <0 0x11000200 0 0x100>;
 			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.43.0


