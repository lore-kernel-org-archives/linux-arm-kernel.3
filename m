Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB2CE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKsYOqlLWlZZ8BNWUWGXYqge99kuK2EmHZh2v+IIWGc=; b=HlXTuZcrkuzFx212nUfvDJV6WB
	0lgIoENgiQP80yYYGdjhKeiIHPIaopDBpPDBWB/LHTjINjNQcUtVAqQq9psXTxlkGHwpcfho/x0Ka
	AXnGXvpnmevnOkpBOKzCE1rjuh+KHGNjjwjjAoAAYgQjtXIOHFvJztSBbhTqgZ4PBtP1EfxaQZqQ0
	1o+TCijWo9SpDh6uJvBUZG+G553txL0bEPiBO/IRRB2gMTaKlAAEuC5ix7TbGXgkvEYMPdeBl3ThJ
	3x9mwAnTmDgzEpwtalpePu5qBBQIkJEVS7w8zrWcARFIk5S8mBGdiqmG96bmwzR01daovN92bN5oW
	0/AfQoBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNU3P-0000000CxPK-0IV1;
	Tue, 17 Dec 2024 09:39:47 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTdY-0000000Cr6t-2mdl;
	Tue, 17 Dec 2024 09:13:05 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 520D5605F0;
	Tue, 17 Dec 2024 09:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734426783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XKsYOqlLWlZZ8BNWUWGXYqge99kuK2EmHZh2v+IIWGc=;
	b=TmiZ+k49hlgiTVw42Z+W3n5hORU4ILtAL6emBM4z9K01icAi4cnqrON1dlnB6d3lCH6QvI
	265VRREOkWJtmXpnCaQhYvYhN7jvQtTNWyigL9v1Zp9qW6NfiYj4h48YQEQVzgNB5+u3Mm
	MAKe7Yzp+iNXnw+aXqsoj2JNw7LlKHo=
Received: from frank-u24.. (fttx-pool-217.61.150.187.bambit.de [217.61.150.187])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id A56B51004DD;
	Tue, 17 Dec 2024 09:13:02 +0000 (UTC)
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
Subject: [PATCH v3 16/22] arm64: dts: mediatek: mt7988a-bpi-r4: Add default UART stdout
Date: Tue, 17 Dec 2024 10:12:30 +0100
Message-ID: <20241217091238.16032-17-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217091238.16032-1-linux@fw-web.de>
References: <20241217091238.16032-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 78664bc1-ee2f-4faf-b659-93544f0edf05
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_011304_857557_4C137377 
X-CRM114-Status: UNSURE (   9.31  )
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

Add chosen node on Bananapi R4 board with stdout and default bootargs.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
changes:
v3:
- changed stdout-path to contain serial settings and dropped
  bootargs property
- changed commit title
---
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
index 9037f35857a9..46117df7d44c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
@@ -9,6 +9,10 @@ / {
 	model = "Banana Pi BPI-R4";
 	chassis-type = "embedded";
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
-- 
2.43.0


