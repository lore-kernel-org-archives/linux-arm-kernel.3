Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB20D5E364
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 09:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ekv8+GjqNv+Xg5rGbFE8IYBvUPz9b5og8Y0KA1yyQ+0=; b=H96xuXXXyS293N/uxizfCL9S0B
	8QkCwctCeVvAdba6d2Aum4MN1Pptk/4Nf0f54FbpdR8YtzNqHYm8hoIcGPkZNbmZHdCBa1QtK70r5
	NgittQ6WMR7vBeMjRqA8PVnl1zu9RSFM1GjGXrxJFbCRU1u6FjZVE66aFMF165bGvpVhvVXEbyBOq
	e4QUeWtvgHxIpzi5Tt5l7oKnGscr2MYE3gWbkQxJQUzpezQ/jIoUcaQubVXwWL/D4uOBhs81jSLCy
	uMdCOkjAFoU7OY2XzZtifNOW0jESYaTau60xUs+kmMntZNZ6DzhnYTQTdpndRP040i9tt+mq73u3w
	4/f5cKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9i8Z-0000000D1Oe-0UAs;
	Sat, 09 Nov 2024 09:52:11 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9i3L-0000000D0qy-2O5X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 09:46:50 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout4.routing.net (Postfix) with ESMTP id 76D5E100941;
	Sat,  9 Nov 2024 09:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1731145603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ekv8+GjqNv+Xg5rGbFE8IYBvUPz9b5og8Y0KA1yyQ+0=;
	b=W3biGNogm3aojbL/nk+Ur8qPuqlet+nybLy9JOpicoYqP38zbP7pIjKE+rX0617etp5t+0
	23VIK/9CHcbiLP4DjPFmwIFd3M0lcLB5JyX6KCk9q9Iadn7qKVLbzXhfnQJavMwBnAag5h
	0+fes4Q1xTFoxOAEbq9u8cZsUUmcnhs=
Received: from frank-u24.. (fttx-pool-157.180.226.68.bambit.de [157.180.226.68])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id AD46340044;
	Sat,  9 Nov 2024 09:46:42 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Hans de Goede <hdegoede@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-ide@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 2/3] arm64: dts: marvell: drop additional phy-names for sata
Date: Sat,  9 Nov 2024 10:46:20 +0100
Message-ID: <20241109094623.37518-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241109094623.37518-1-linux@fw-web.de>
References: <20241109094623.37518-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 47633f1f-8324-4bc6-82ae-a21587be3939
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_014647_783158_FA80347B 
X-CRM114-Status: UNSURE (   8.82  )
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

Commit facbe7092f8a ("arm64: dts: marvell: Drop undocumented SATA phy names")
drops some phy-names from devicetrees but misses some. Drop them too.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/marvell/armada-8040-db.dts     | 2 --
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
index fe5d6cb9d692..9d45e881a97d 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
@@ -307,11 +307,9 @@ &cp1_sata0 {
 
 	sata-port@0 {
 		phys = <&cp1_comphy1 0>;
-		phy-names = "cp1-sata0-0-phy";
 	};
 	sata-port@1 {
 		phys = <&cp1_comphy3 1>;
-		phy-names = "cp1-sata0-1-phy";
 	};
 };
 
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
index 5043cf2eb33e..0d4a5fd9503f 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
@@ -345,13 +345,11 @@ &cp1_sata0 {
 	/* CPS Lane 1 - U32 */
 	sata-port@0 {
 		phys = <&cp1_comphy1 0>;
-		phy-names = "cp1-sata0-0-phy";
 	};
 
 	/* CPS Lane 3 - U31 */
 	sata-port@1 {
 		phys = <&cp1_comphy3 1>;
-		phy-names = "cp1-sata0-1-phy";
 	};
 };
 
-- 
2.43.0


