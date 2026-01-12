Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B4BC9EC8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umNyXrI2ZeyzxxwZ/1XKsXXm7p8SZAfQvizgPCnLIWs=; b=cgq7Er7F9PEbtScVL+NJPJsCaE
	51ry58WBwRc92d9kgK8620Q7eoKCkHRLBtKPbQFe6ScHe9aexRJvO5NXsXTP0MzRUvKpfObPW/p8s
	+1ncSj8YpoV3pcYTbatWPkR01ClFihu9wSdkpmfAmRGJ2PTjiy/4evLU+8Qu66TZLXx/Fh2gN38og
	xbWbxIvNn9V89HUYl0ZGutSnLoiNz+JvW/uSaO74K26FWxwEOZKFKa4cYcV29zDeLKHQnNf/tz8g8
	XKgOYEhNS7qfLQprQtgOj6daqdk/G1yW5nVVK3Lis0brQ6185tSolW0uJTN6klPvYg1H0GNcKsrh2
	uBT9m0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJL4-00000005aJd-17vJ;
	Mon, 12 Jan 2026 14:56:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJL3-00000005aHC-0LRw;
	Mon, 12 Jan 2026 14:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=umNyXrI2ZeyzxxwZ/1XKsXXm7p8SZAfQvizgPCnLIWs=; b=lytmec8E0ytddMK1tsG01LqsCd
	gmKGLWccCyUs/kKcNtnvQJXTmlSD6SL+79wg7Wlo4tF17lCSXY7Q19yGWofdxTPsyRZpckbN8xdLR
	cA2bs603UUHXDr96LMr7BVRgvCIJKDTA5rgERhmXO86MF/gKCnt3Zv6fjNq4J9I3Uui9rx1gku8Zu
	RA1d5/1pDeSkE5jfML1QKAA6u7gG9ZKc0SZ44jkou6C12RcArqctYn3xan+nqPX6V2+FUTFe1MJrc
	Nt45gu4udANJjMLaqTxz1hKP07pfvw2n4zasz/LDI5xgbTo62Z1CcaDw7NWmZJAIwmL596pM4BF8A
	YuEeLk9A==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJKz-00000000xSR-1GCo;
	Mon, 12 Jan 2026 14:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768229764;
	bh=2+DvUYmYV9U/Yj8ZST1r0/xHoFeYFSLopr9bIm8GCoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MOzETribil6Cl9y0nxG5xkoWU+8V0zB3L08kfQ2O8t5Tl8FkHbdKCPwR0DEjX55Tz
	 xSsl6e7guJ8jfl4fm6o8F+p8HWe2vq0Whh6fInP33Nz1sXSXXjGuqaEhJVq3PM/lW2
	 kgCbvGwaeH4lhiXmb8y+FJkBA4PAZDkxwbzb7j6+/Iqw+m44DCMm6kTmE5rWnRAtfI
	 4YUQqPf8/oKYyW4hWGwz40YWUZyo9rBHiTEiaB0QEHgbCT5p4+cCG8ex6U9LApvVmm
	 27gx4ZToOO0iNxvt7ZrDBJyupZghIWETlxJmzJF6iOVEzojmMoaHm0qHy4CP0CmE7S
	 ZO2i4iUPMmuiA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9919617E13F1;
	Mon, 12 Jan 2026 15:56:03 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk+dt@kernel.org
Cc: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	conor+dt@kernel.org,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	atenart@kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 4/4] arm64: dts: mediatek: mt7986a: Change compatible for SafeXcel crypto
Date: Mon, 12 Jan 2026 15:55:58 +0100
Message-ID: <20260112145558.54644-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112145558.54644-1-angelogioacchino.delregno@collabora.com>
References: <20260112145558.54644-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_145609_499317_5ACA7054 
X-CRM114-Status: GOOD (  11.47  )
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

Following the changes in the binding for the SafeXcel crypto
engine, add a SoC specific compatible to the existing crypto
node and, while at it, also change the fallback compatible to
inside-secure,safexcel-eip97ies as the eip97 one is deprecated.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 7790601586cc..9693f62fd013 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -231,7 +231,7 @@ trng: rng@1020f000 {
 		};
 
 		crypto: crypto@10320000 {
-			compatible = "inside-secure,safexcel-eip97";
+			compatible = "mediatek,mt7986-crypto", "inside-secure,safexcel-eip97ies";
 			reg = <0 0x10320000 0 0x40000>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.52.0


