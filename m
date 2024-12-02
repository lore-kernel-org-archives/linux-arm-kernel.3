Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7A5D78315
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOTUUuXSqJqOxLQg93hTp4f/UPGOv1pJxXtTWZSbqk0=; b=zV81f6K3jfRF3gs64vfNADjrlh
	5OspfW6FziZThJoP4k5hosnQ+bZpI1ZvMo2TAprLRU6w9ZPGb/15QE430MtT/hw92ElXmuTbhM+Ks
	2ZgC32AjsBD3B/lm03D6LOv6cSEVCz5dL8H4XSymdERyUFX1+Y/P+usSucFTMGMvopU/bzza50AAO
	0sQYAP1Qvk/x8VIaIPo3MbCFaxhI87BcBS2yUq9EFsvZLdeVN4c95Qc9O7gARo2Kk3rua3UmTlY2H
	pyr/BPpDdZ3CQWJGaW0ze/eXB7ELQAYRNfOYDirm8hXwSYD3gXeKEiGUkl54rCW5Tj0HKXchUiz62
	o/FMosgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5fq-000000066FK-32Aa;
	Mon, 02 Dec 2024 12:37:10 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5VK-0000000649a-1cjg;
	Mon, 02 Dec 2024 12:26:19 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 099BC41A49;
	Mon,  2 Dec 2024 12:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733142377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sOTUUuXSqJqOxLQg93hTp4f/UPGOv1pJxXtTWZSbqk0=;
	b=H6OlpM3/Aac3DMKCYY3xlXS2VM/daKxJhSSZuR+OZegz3mMh4L5ncx4xE7yzEMKh2v3Smc
	UkqjZL3DcYF/npJy+F2M0yGgG6OEr53vOrttMOir+BrBeL4GhMr83nh78TY0n37xAmUj3X
	xhl6YhDXYKNdAtAsqmEzPSK7/mkbt+E=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 77EDA360211;
	Mon,  2 Dec 2024 12:26:16 +0000 (UTC)
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
Subject: [PATCH v2 11/18] arm64: dts: mediatek: mt7988: add chosen node on bpi-r4
Date: Mon,  2 Dec 2024 13:25:52 +0100
Message-ID: <20241202122602.30734-12-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202122602.30734-1-linux@fw-web.de>
References: <20241202122602.30734-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: ce7d2449-692a-46b7-8c22-2fa241136984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_042618_573548_A3F60987 
X-CRM114-Status: UNSURE (   9.60  )
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
---
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
index 9037f35857a9..1c2a806f6f6c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
@@ -9,6 +9,11 @@ / {
 	model = "Banana Pi BPI-R4";
 	chassis-type = "embedded";
 
+	chosen {
+		stdout-path = &serial0;
+		bootargs = "console=ttyS0,115200n1";
+	};
+
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
-- 
2.43.0


