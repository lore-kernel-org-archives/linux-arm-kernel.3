Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48017109B478
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 14:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2vXEyzRwq8XFnMfv1noGMutc4dR8xtcHqaxGghsk7U=; b=ClmgmYKWyAXHzQ+hP9WsVw9vb/
	8OK97EdWnZ1Oal+CNz7YEab0iz4FspYFwPyzh26x2tRn7XkvQRWGDfHclSlFBnjXzMgUWHULD2dii
	QigxXAy17Mzimpbpe1tXNhtZi7Dlujadipw/Z/m2XESaxH94LGMq3mNreT7IzO3ULsdwH3Sz30KBh
	d8p92F9/chsjd1cxTgHtP8IJC1/KHfkIhKLtjKiJKAPPcUzddg6nFy4/No5cDLKs0cFgHxL5z6FmN
	SVzLLybdO7r9Q1I+8vKJvO2oTvOrMWZEir07n9OH/gJmUrZXtOM+WTkvQT42alOVyThhEUw42rXl5
	B2qAiFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ZwZ-0000000D4Sc-0poH;
	Tue, 31 Mar 2026 14:19:47 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ZwL-0000000D4Jp-0nWU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 14:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=K2vXEyzRwq8XFnMfv1noGMutc4dR8xtcHqaxGghsk7U=; b=LrFZMSSDz6tOn7NWo7tbHOV0kb
	NKGL+fKaOaykGDv1XiZ5qC+IGJhnWrjGdMg4tugLg0Llx27IgVHxQNJ3ZKTi7wdkT9scS+bLzNb2p
	1NzCWGyOe4cnUxWWyQiqgnP5IHPCTAW3qE8Qr930vagJ95DeN3bplKed+QC2kQ+qkg7nHVl3T0uvu
	wS9uvmn5xjfa19UkGHEvZMv4h8swKhYVSQZ+47Fu1yOl4OFL/NDqhLnWAXrwNVM9V4/0ESsoS7Uw/
	79fQbeCuBtvniHG4zM1U77ZfexVkTWd6vDZycENL6lwn6RevPCK/fC2aS9LojimM4bc5RjKAsZBKL
	eZGE3u2w==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7ZwE-000Jta-2G;
	Tue, 31 Mar 2026 16:19:26 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7ZwE-000Mdz-02;
	Tue, 31 Mar 2026 16:19:26 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH 7/7] arm64: dts: fsl-lx2160a-tqmlx2160a: Remove deprecated properties
Date: Tue, 31 Mar 2026 16:19:08 +0200
Message-ID: <20260331141915.2918927-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331141915.2918927-1-alexander.stein@ew.tq-group.com>
References: <20260331141915.2918927-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27957/Tue Mar 31 08:24:30 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_071933_228181_466DC6AF 
X-CRM114-Status: UNSURE (   8.58  )
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

Setting #size-cells in MTD nodes itself is deprecated by mtd.yaml.
Remove the deprecated properties. Fixes the warning:
fsl-lx2160a-tqmlx2160a.dtsi:62.18-76.4: Warning
 (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@0: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 or "ranges" property

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
index 5ca950ff908e7..d64879ee5e54a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
@@ -62,8 +62,6 @@ &fspi {
 	flash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 		spi-max-frequency = <10000000>;
 		spi-rx-bus-width = <1>;
 		spi-tx-bus-width = <1>;
-- 
2.43.0


