Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B48E83EF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 09:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7C6sOZmDev20rPO1grHjaC2x/4LZuuGBj/em9R7llW8=; b=zRTReyUYBuIgN7B//1X+tNOjRu
	hZiF8LejnpRym4yRKuMCt4uRuTLX4PvlBgM1NHs2PIVYnC95ToDuSLfEqkpR68NesYCS4saE0GtJM
	el8i6WHfANxNYuPBtgWCV+3dwHegaAgEodIfdcERUbKMARZCpIwk6Uzko+dGgah1NU+9b1NmZwQLK
	PD8qBVhSikS6trlSidv5w910gI64wqsIYIwSn/7j9/Y9eha/f3e8wkEXGOZ23HenedWccJfmJ6HbF
	V1yaG38j0v1twk8ZbmmGWP/n1zHp9e7yeEEGuqdrPNaQBjsS/o3PwEJsUTL3XBZ8YuVQ0ipuOLVwm
	54U5tuBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYzA-00000008BtK-1qQb;
	Wed, 04 Feb 2026 09:15:44 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYz8-00000008Br8-1Asf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 09:15:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8DED6C24394;
	Wed,  4 Feb 2026 09:15:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDB6760745;
	Wed,  4 Feb 2026 09:15:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED690119A865B;
	Wed,  4 Feb 2026 10:15:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770196539; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=7C6sOZmDev20rPO1grHjaC2x/4LZuuGBj/em9R7llW8=;
	b=TjwoRbihtjvicDmdk0pMYQjCJseF0EOPq+K3/pSbdo638BMBnIhNTNbDZ+2Vm6/KBiIoz8
	MUU5ZP9dr1tHswCQKqQH1TrCCAGr3Ik9w5OHzHyVv0/5QOFzGYRJGsU26X6o+xd/XMd1FI
	7i3oYahHA5AGXpQkxk1aTTEo15K5rpf1X8DU8yndmw7/ZqcxHhA//gI5BksdoyyjLExcFM
	RLAQfAzySOjQn5vSTT0z+++Poq8Cmc8Lk/sNG7MrER2gXamKqPAtq3nOfulA4/L9i5Zr5/
	9FOZgsycypYDtZoTxpTiXM8blIQlNTkR2gMRL3YBHFHWocKcVDWM9qyT7vVXsQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	zajec5@gmail.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH -next] ARM: dts: BCM5301X: Drop extra NAND controller compatible
Date: Wed,  4 Feb 2026 10:15:30 +0100
Message-ID: <20260204091530.624230-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_011542_460090_0222C8E7 
X-CRM114-Status: GOOD (  11.28  )
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

Fix the dtbs_check warning introduced when the brcm,brcmnand fallback
compatible got removed for iProc machines.

Fixes: 4db35366d6dc ("dt-bindings: mtd: brcm,brcmnand: Drop "brcm,brcmnand" compatible for iProc")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

The above commit is in mtd/next and will be part of the opening merge window.

---
 arch/arm/boot/dts/broadcom/bcm-ns.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
index d0d5f7e52a91..46b650abdb90 100644
--- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
@@ -479,7 +479,7 @@ thermal: thermal@2c0 {
 	};
 
 	nand_controller: nand-controller@18028000 {
-		compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1", "brcm,brcmnand";
+		compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1";
 		reg = <0x18028000 0x600>, <0x1811a408 0x600>, <0x18028f00 0x20>;
 		reg-names = "nand", "iproc-idm", "iproc-ext";
 		interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.51.1


