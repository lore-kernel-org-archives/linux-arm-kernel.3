Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBCF103E167
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I0XE4egujiloS4JwN3oMEE3RFFNH/YbmfcDSzX4Ew+E=; b=HF46NCQtVrv/RzcqEJrDUWrJea
	5Dr9VZHkNGanhv1B5zRsclVzHdetzbVqWpvxivSMgjvhfK545XPiCbsZS60m8VjhwbErKUu6ocJ0A
	qQIg/zv7DQPBcdsTSH5z6WigNTi20eOQRljw09ljiMb5GdfZ9pROIukhHJPgvvloxyWqn2Rgzy71J
	yB8J7XBTDTCA3wwgD8H+ei7L3QPYD7AvdccNlUwxedZGG4d6dLBR8IwAQw699zybMwjln0kxYkps+
	QEl5QasO1xGMRZGjvsc577BV5Mv5hv2gL+mGJXVZGCNbPRac8FI8bj8JYQjTGFffU1jyIz4btaru8
	VDLIgJBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pJU-00000008KX1-2epg;
	Wed, 18 Mar 2026 11:43:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pJT-00000008KWm-0JbT;
	Wed, 18 Mar 2026 11:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=I0XE4egujiloS4JwN3oMEE3RFFNH/YbmfcDSzX4Ew+E=; b=kXEVAc/+bTPS3uMg7QF3zZtIaH
	v6w7smOfhQ/bd+QW6N2g2CQdq4E0zB77dUQtSKnbDd9qYGmvT4nb1lHbyVcc9mWbjKIidqbM9eKsX
	90XcGpWb9hEj+rXwhOaVkd/jdc3lLizwPSbhbqJ8HBhcW9dcvrCDZqYFNjd1tk1qmbk+ZYKIASuyz
	VhlrRDBbQGzuR7kz2rIWnfEsTsvl+U04JYrh9UDVGwvVNFhIVf7wbLnuWZoXxZIW24q7NWNPaYrJC
	VIAjzzdBW2LPVmblnGQMIyfbN4v0C57pPXt0sC2kmavuX+28C3cMjagAuaIWToILkCLWo+qgOaW+2
	970WA2XA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pJP-0000000B6Mz-0e0i;
	Wed, 18 Mar 2026 11:43:45 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62IBem7dB1609497, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773834048; bh=I0XE4egujiloS4JwN3oMEE3RFFNH/YbmfcDSzX4Ew+E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=jpHCgHVtbyJC681rg2oCVBGXh2EZYNkTQueHQaU6SJtASr01Pq+CxPat4SgaiW8Pf
	 EvnJOURTQ4lt3Re1v6LFNwYNLR1/0mii8a2qQjZJwe0pcIQWHJnmbBvKGW+v3XK6O5
	 gtXOV9TxLooRwH4hESgb5dk50qOL4ywuJrewna9W/XffqyZpdIQtVRQ0js4JhW4SZF
	 dVYurjMRWrf0HrvZRr5gTzx3HvYqedeZZgMhyIN8Dfdw7qkLPqx62EkDix7L9KA9nJ
	 nkKbH1uice7P92tnNig8fYuNg4hQvQbjVC+kQuKlQ4IKyIM2yzL461un8olKNiUolr
	 1swmLzCYR16BQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62IBem7dB1609497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Mar 2026 19:40:48 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 18 Mar 2026 19:40:48 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 18 Mar 2026 19:40:47 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 18 Mar 2026 19:40:47 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linux-kernel@vger.kernel.org>, <linux-realtek-soc@lists.infradead.org>,
        <afaerber@suse.com>, <arnd@arndb.de>, <alexandre.belloni@bootlin.com>,
        <linusw@kernel.org>
CC: <fustini@kernel.org>, <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <james.tai@realtek.com>, <krzk@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>
Subject: [PATCH] arm64: dts: realtek: Fix memory node unit-address mismatch
Date: Wed, 18 Mar 2026 19:40:41 +0800
Message-ID: <20260318114047.2804171-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_114343_799856_D6FE9158 
X-CRM114-Status: GOOD (  11.87  )
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

The memory node unit-address should match the first address in the reg
property. Correct the unit-address from @40000 to @50000 to align with the
actual base address (0x50000) defined in the reg property.

Fixes: b095c27fc874 ("arm64: dts: realtek: Add Kent SoC and EVB device trees")
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
This patch series is sent to both Realtek and ARM SoC maintainers.
While Andreas Färber is listed as the Realtek maintainer, there has been
limited activity recently.
---
 arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts    | 2 +-
 arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts    | 2 +-
 arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts b/arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
index 09e544acfd34..e487622424f1 100644
--- a/arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
+++ b/arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
@@ -13,7 +13,7 @@ / {
 	compatible = "realtek,phantom", "realtek,rtd1501s";
 	model = "Realtek Phantom EVB Chromium (8GB)";
 
-	memory@40000 {
+	memory@50000 {
 		device_type = "memory";
 		reg = <0x0 0x50000 0x0 0x7ffb0000>,
 		      <0x0 0x8a100000 0x0 0xdef0000>,
diff --git a/arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts b/arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
index 9c23d901c49c..f0f810ab8aa8 100644
--- a/arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
+++ b/arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
@@ -13,7 +13,7 @@ / {
 	compatible = "realtek,krypton", "realtek,rtd1861b";
 	model = "Realtek Krypton EVB (8GB)";
 
-	memory@40000 {
+	memory@50000 {
 		device_type = "memory";
 		reg = <0x0 0x50000 0x0 0x7ffb0000>,
 		      <0x0 0x8a100000 0x0 0xdef0000>,
diff --git a/arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts b/arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts
index 9fd6976e0d9b..375c18322c3b 100644
--- a/arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts
+++ b/arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts
@@ -13,7 +13,7 @@ / {
 	compatible = "realtek,smallville", "realtek,rtd1920s";
 	model = "Realtek Smallville EVB (4GB)";
 
-	memory@40000 {
+	memory@50000 {
 		device_type = "memory";
 		reg = <0x0 0x50000 0x0 0x7ffb0000>,
 		      <0x0 0x8a100000 0x0 0xdef0000>,
-- 
2.34.1


