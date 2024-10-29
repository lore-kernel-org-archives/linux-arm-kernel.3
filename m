Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E85ED2AB1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 10:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M1NzIDk/zjZn+p9F0pg3KmI2reD3ofe4GIXlaqHK0ds=; b=SSsVJWVj24n9cM/SsOVrRAG7nJ
	H0A86qo+rVgclxafdBfyV/FDEoJclAuSOJWuO0IpzUv92QoC+2yOkGZvbv8i1SLfRwQHWkc4ZrybA
	fPHF6CwAgc7DB28BNxZxgealTN5ZghncKQo9w1w8Q+P7gC/k3u92WHlZti6laXAgEejKBDQ0CVb95
	6SshIeF70aoPuEoEqCr1dGlMTbviaBc5nKhM8fT1unQUhzEgpxFUMdPk0w7LDGlNY9wALAtH+ADsX
	15uBaBG7tzm+nK0kBw8uzVy95QXN6s/hMHOSEwle+BhhurKKoCsqRFcSNt5HkcxkyZEv9vQSPjCrn
	WbzbJTzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jls-0000000E5yB-39tz;
	Tue, 29 Oct 2024 10:48:20 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jdb-0000000E46W-2LPR;
	Tue, 29 Oct 2024 10:39:49 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id 4D0CD61620;
	Tue, 29 Oct 2024 10:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1730198383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M1NzIDk/zjZn+p9F0pg3KmI2reD3ofe4GIXlaqHK0ds=;
	b=HpbWarL4vYFyplMfLBsstBRfZ1NyTw3Fw9nqnTPn/W7mZE9LkovSRMSbS3kvNxsEA+5Xt0
	+Le5S8v7T5GycCoXmUBjZ+Z3X0y0s1pp5Zsd1kiTlb978XU2N534PxFiUDLBw476MbOSmh
	nYi1tX2JzIG0T/+criCQRfmB+fNXeD8=
Received: from frank-u24.. (fttx-pool-80.245.73.173.bambit.de [80.245.73.173])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 896653600D8;
	Tue, 29 Oct 2024 10:39:42 +0000 (UTC)
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
Subject: [RFC v1 00/14] Add some mt7988 DTS labels and new nodes
Date: Tue, 29 Oct 2024 11:39:19 +0100
Message-ID: <20241029103937.45852-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 1dafb263-a617-4e48-b72c-736ee605b004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_033947_785516_009C1E1B 
X-CRM114-Status: UNSURE (   7.63  )
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

This series adds some missing labels and new nodes to mt7988 DTS.

If wanted i can squash the coommits adding labels to have less patches,
but for first review i let them separate.

Frank Wunderlich (14):
  arm64: dts: mediatek: mt7988: add missing label for apmixedsys
  arm64: dts: mediatek: mt7988: add labels for i2c nodes
  arm64: dts: mediatek: mt7988: add labels for usb nodes
  arm64: dts: mediatek: mt7988: add serial labels
  arm64: dts: mediatek: mt7988: add label for pwm node
  arm64: dts: mediatek: mt7988: add label for efuse
  arm64: dts: mediatek: mt7988: add mmc support
  arm64: dts: mediatek: mt7988: add fixed regulators for 1v8 and 3v3
  arm64: dts: mediatek: mt7988: extend efuse node
  arm64: dts: mediatek: mt7988: add lvts node
  arm64: dts: mediatek: mt7988: add thermal-zone
  arm64: dts: mediatek: mt7988: add reserved memory
  arm64: dts: mediatek: mt7988: add mcu-sys node for cpu
  arm64: dts: mediatek: mt7988: add operating-points

 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 196 ++++++++++++++++++++--
 1 file changed, 181 insertions(+), 15 deletions(-)

-- 
2.43.0


