Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67BDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2iahX1buMzs5p03vC9Zh7kp9EyqKjlKiO/Ae93S060=; b=ZL1Gmj8YBTxsNEpn9Ed7bw45KV
	TsZ6igzHzBgGnBasmLa48dBEOhFqLXmKysh+eMY9cCoV4lIjHvT9zSAB15Zu1WlZc8lrphqxeBBJ+
	4EB125ZN2D/wQVRcndgguMMlylIq9mc6C2AnY2eD5SOnv88pIhwnw5rQAM2/ApAGOwEAhC9L3lhHI
	f13ZuOhTjSGbhcKjMhvcmvrzQ0kHWPsT3vhPq49OPMVE5fO/k4B8Am9woOxMbHWuUxPScpI7zaeE/
	1X+PT9xWcwqIJ67cNjHOOfnOnd9znhV44sStd7tssJ0zDrsy4zVL9RPS/Zn4A3OTe1odtnOpyIRLI
	nneg/gEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTf7F-0000000CkTS-15OI;
	Fri, 03 Jan 2025 10:41:17 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTf3g-0000000Ck3o-42TO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 10:37:38 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout3.routing.net (Postfix) with ESMTP id 51691605A2;
	Fri,  3 Jan 2025 10:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1735900653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D2iahX1buMzs5p03vC9Zh7kp9EyqKjlKiO/Ae93S060=;
	b=eHzB+yuiY9jr3y6dXPaAaDCDMM+2kVQQKJY44VZzx154UmOM6eQKF1ebC/7PntzMAvSL+8
	pG68WgWOMQWMPlPzEPz59OxrOxp6vfQJS5Yn294w7EnWxnFj6Wt6hh3ZZnDAEE98P4mNTj
	oSOnBuxOjVz84X3q7Ev6eu2gmmrnaRE=
Received: from frank-u24.. (fttx-pool-80.245.72.216.bambit.de [80.245.72.216])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 6474A8020A;
	Fri,  3 Jan 2025 10:37:32 +0000 (UTC)
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
Subject: [PATCH v2 2/2] arm64: dts: marvell: drop additional phy-names for sata
Date: Fri,  3 Jan 2025 11:37:22 +0100
Message-ID: <20250103103724.6223-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103103724.6223-1-linux@fw-web.de>
References: <20250103103724.6223-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 36ba5333-1016-4fad-b8ef-f646e7a56354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_023737_144494_9C62E11B 
X-CRM114-Status: UNSURE (   9.35  )
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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


