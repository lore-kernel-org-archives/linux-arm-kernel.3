Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD47CA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 18:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9J8fCoccqlH/aeweF3LPxe5JXxlaaXwR3l6t4WWpdA=; b=xVW2cwkR3acV4GVFKVDM/0KJFi
	zJNpP6yyJrN0vKRfJXFWF+CW9DBjsyeuHie5LlfPDzPe20hzMqfAJ0p60msMfH30EAJyMwVQrdUck
	AlEGqe6LgKyPTUqt8Iyv6ukyAlnY39fI2sOjx2tRRBul/T7B3E8sbvKOmv10vWYAgVU0Lf60gMWDg
	UkdCKN0HY2+WF1X3GNRzcQbOITi9F4AJ3HXKVJvTxEBxDOsNToOvlidpgCBnKQyHA9hZgybHAezNS
	INeTvvsyt9aV2ucTuKrPtk3VEcQVNSb8oo/JzT1/x7RB1xA8CvzPKbf0VUIyaTMuzwvxdS1yx657L
	W6ebNQSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCi7m-0000000CHdc-3mvA;
	Fri, 02 Oct 2026 18:36:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCi7l-0000000CHcu-0Ztr;
	Fri, 02 Oct 2026 18:36:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A1A2844793;
	Fri,  2 Oct 2026 18:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7106BC4AF14;
	Fri,  2 Oct 2026 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790966208;
	bh=oqriVhcuHi++E4d/LMJaua4G89WcpjjWhndoonwZOjo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AU51t3H9jmkA/VNmU+zgRyNpecRwVpO2NryljnfG19c9k85FiiKGI1mUhNV+t2Gbo
	 iBb+2QDYhUlxk+NvGyyO1ABvMaej+voQvdM7TgwuODdSjRjeIlsLYwzTb0h9e92bsH
	 8yZvRiKPAnKfAqY5CqbWSNuXjbGelZD4Y1HZn6+zmvCbbtVgsGkZs41KvCnQktrnfy
	 /4Ml6JVx6YBPDDzp56EMjdyDeYckNUgGIYfvc/RyFia6eItl5uL1Cgrpk36wvWuMna
	 d+L4HjbQrFc5MvsYgjwo9KmLYy3vbqeynk5TaIHa2UftFsRsYI1mLNfdi3cD4MLCHB
	 wM2E4i2Mx0Raw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50944CA5FD4;
	Fri,  2 Oct 2026 18:36:48 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 02 Oct 2026 21:36:47 +0300
Subject: [PATCH v2 2/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: run the
 SPI NOR at 40 MHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-hc4-spi-nor-v2-2-8366a4f91049@iav.lv>
References: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
In-Reply-To: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=NgYmk2F31b9kS7Gvan8KxK/AyfRvJU013G77W98iZH8=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFn7f+7jZI1dvfOXhXy3p/6vB+4Zb9KEd/yY7T37qcHF6
 riFFvsnd5SyMIhxMciKKbJMOKRxK2PJ1b/+HuYPYOawMoEMYeDiFICJtBxl+KfrcrAhfvrXmodh
 vD8Wh+5wFrTbV6OlsdOC6e88tdpD9j8YGRZMWV3JwZH/8Klbi0+tyKWsnqW/b8ws/xwZ99S1pOE
 9GzMA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

At 104 MHz, reads return corrupted data: bit 0 of the first byte of a
transfer flips from 0 to 1 part of the time. The same byte read as the
second byte of a transfer was correct in all 100 reads. One 4 KiB block
read 200 times came back wrong 157 times. Writes are unaffected.

flashcp verifies while it writes, so a bootloader update erases blocks
it should skip and can abort halfway, with the flash half written.

The Hardkernel vendor device tree for this board uses 40 MHz. At 40 MHz
the same tests pass: 200 block reads with no mismatch, and 14 flashcp
runs with no block erased.

Tested on ODROID-HC4 with an XT25F128B.

Fixes: 7178f340e929 ("arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4")
Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index c4b93d6619f2..5f15c2299509 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -134,7 +134,7 @@ flash@0 {
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		spi-max-frequency = <104000000>;
+		spi-max-frequency = <40000000>;
 	};
 };
 

-- 
2.43.0



