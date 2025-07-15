Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D59C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 23:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lAgqzrLQFgULC/NyYg790w7pnHGpDDP+rKXydLeBdro=; b=w27DnOG1mflEJ0emQKYbXAy87x
	uHxnYlDeWzv/QnmQCapo+ghS8OUua47NKmC00aEKRIe9YgRxa4p4fO2EHkrZd1S3aQcxiApbLYeAS
	HlxFmJi+XaKAV3kyAd9V1acRoZ/tRXp8fVf3QoTRcAMMY9tXHUL8h+IrhPyyPc+71ljf1ajrhRVCb
	H3CNqdC0u5TxMWNiKL8AZdhUvyiUzS/okwEFnm/Tn3X2a+8PuNh7BR0K6X8wQc82zU6J3pRnuHzEO
	aIFQ0jDdAslXCq9EmysAyDQCV+GklivsQcpQSNKIgz37SIBYzovA5KmIoMdvgpdnmrWgv8If0P33C
	BNmFrGIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubp1D-00000006Oyw-0ShC;
	Tue, 15 Jul 2025 23:25:03 +0000
Received: from mail.adomerle.pw ([185.125.100.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubowg-00000006OM8-3V8k;
	Tue, 15 Jul 2025 23:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202506r; d=adomerle.pw; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1752621609; bh=lAgqzrLQFgULC/NyYg790w7
	pnHGpDDP+rKXydLeBdro=; b=PKQLyvfoHzhI/2nBfmwhUQkKSq5uRNhnHw0uA3sAdxMHJCOqBE
	MKeaDpccaY0X1fCL5mKTVmgBNicSX5aNXHTv2vLUhdQwoU9UAGgrX+0nWAMe3hT/Nl7Z/G54Zju
	NvqwGAYSbGdwTV1rb7AYLGY2SOmva3Jub2aUv5F6Q6Eb7+kFfq36et+R15Bk6jkZt1Ws1YG4Ea3
	SPaJcXKAj8IJL57YUhPtEEGUHH9yjEeXWnjKDa9ee791fXcm+LHGWiXS82nq9P7nVa7fLu1ntXS
	sLK7DFEnIT1IU0cqFzEi6PGeu4DLThSxdt9SUPVkOGnG8w02K2OpvYFzvY3Wd9NBS2Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202506e; d=adomerle.pw; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1752621609; bh=lAgqzrLQFgULC/NyYg790w7
	pnHGpDDP+rKXydLeBdro=; b=+w1ImdG0wGwWNIhr3PfI/9CU7GW5NQT75nkl4OSm2eJcLap64D
	9eG/29pnL0Y2pi1kZ8hloCXIh5K5JSJGofAg==;
From: Arseniy Velikanov <me@adomerle.pw>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Leilk Liu <leilk.liu@mediatek.com>
Cc: linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Arseniy Velikanov <me@adomerle.pw>
Subject: [PATCH v1] dt-bindings: spi: mt65xx: Add compatible for MT6789
Date: Wed, 16 Jul 2025 03:19:21 +0400
Message-ID: <20250715231921.4527-1-me@adomerle.pw>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_162023_212523_7F8DDAF0 
X-CRM114-Status: UNSURE (   7.68  )
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

Add a SPI controller binding for the MT6789 SoC. As a note,
MT6893 SPI is fully compatible with this SoC.

Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
---
 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
index 3bf3eb1f8728..0635aec29aae 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -49,6 +49,7 @@ properties:
               - mediatek,mt2712-spi
               - mediatek,mt6589-spi
               - mediatek,mt6765-spi
+              - mediatek,mt6789-spi
               - mediatek,mt6893-spi
               - mediatek,mt6991-spi
               - mediatek,mt7622-spi
-- 
2.50.0

