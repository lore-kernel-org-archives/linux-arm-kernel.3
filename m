Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB16D0C851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3+ofC4pAq+Cc+Gia14c5xG6C6LJBETJOJwGOeQVHf0=; b=B0oUhYpHwH0aFSDQat4SRqSbT8
	zRSFFUgJXG2kkcOXKizyI+rrCdvV5XDtBAy2OewWK4CBX5+VmqVC7PFqgu/i6PzZOyCMbOtYIrjTH
	Kc+AbUOLnkKnOD/MJNWAhGln99DgQj4SOfH4Yn4PPCL22hqDeXBw/xPu0poFilnttIQQDTTc3CrTI
	jSGsTT7hCmAMX3kNqDxeH6REryy/UKI6LdAnDI7SSnfrsNnBxEDK/xu8cQJeTsD2FFPkBjOi7UE0b
	w8+F87gg6R1cfQ0SCTESwh4hdeeHtYkvddSDQz5fTF8XObf34dRiQ98q9rhPabJwCpoTYQUAkdBBC
	IXoYvyVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8m-00000006xYY-3nAx;
	Tue, 13 Jan 2026 11:00:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8K-00000006x5R-1LtD;
	Tue, 13 Jan 2026 11:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768302018;
	bh=P8yUfp90P4V0tRkcOJdc6UzTaZTjo0W3uSd4T2juM4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eB/F/bvfbe1aMzl7d7zwOd4lyiJAJlsoUvtgQ5gnhy51W+hNBjgIVbpwJxWRf29S/
	 L5N5U54/Kec3NjwuqJmifhEe9fKSWLR1mw+s1KSfJbrLMR+eDqnpT1lg/1XLiY7Xib
	 An0NrxP4yOTtYiuvtJpRjaEexNwOdzE5t/dHOM9oK+UaKYAeotBiOUh6cceNCPG77H
	 wGSF9J15ZnmuMgiPfHgiMC80IeQIu0yzjjhzJkxypbwev4vToFRzPEN/Nl28nfsOQF
	 eN7YCwgr897MSdaUgNAdXXjfIci5+3z7P7f6tyzM7e0OQsfhWHFDuU8l3yHr6KLFU9
	 id6Sfw5thccoA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D504817E150D;
	Tue, 13 Jan 2026 12:00:17 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 5/5] arm64: dts: mediatek: mt7622: Add missing power domain to afe
Date: Tue, 13 Jan 2026 12:00:12 +0100
Message-ID: <20260113110012.36984-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
References: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_030025_576985_E3542118 
X-CRM114-Status: UNSURE (   8.51  )
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

Add the missing MT7622_POWER_DOMAIN_AUDIO to the audio controller
node to fix a dtbs_check warning and to make sure that the AFE is
indeed powered on when needed.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 133a6dcc8ef7..bfd96a0ec3dd 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -621,6 +621,7 @@ afe: audio-controller {
 			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_LOW>,
 				     <GIC_SPI 145 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-names = "afe", "asys";
+			power-domains = <&scpsys MT7622_POWER_DOMAIN_AUDIO>;
 
 			clocks = <&infracfg CLK_INFRA_AUDIO_PD>,
 				 <&topckgen CLK_TOP_AUD1_SEL>,
-- 
2.52.0


