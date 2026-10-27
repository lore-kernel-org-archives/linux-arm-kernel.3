Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0CB606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 11:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OjbKZqJK;
	dkim=pass (2048-bit key, unprotected) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=W4XXs8+B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vfd5Zd+m6HNfCiZ4UDrZ6b24cU1Wbos2NPOmkyVZCys=; b=OjbKZqJKzzXDECgCJW55FmWVH2
	8Eb7/3WfBAaGFACijaAwVc5jQuYes1cGT1esoDUdcFXQxMaQOMdKvsLL0vnKzc/z4J9BBCQ75gY8W
	ppMVuRFqsUJujTNxb8QwajLiqq3scIfsP+8SQ75ng8CtYv06aRAp9tgifLAiqwV82eG0nMWrhOLOK
	QwnEoQ2UQ2EPec1+BzY9+o9gwZUf6hn3ekMVa3oSvl9j+nVxbUMokuR38rz/uqtWVz91Crkk9ZtM+
	L+JacfejUBOiswwbjQb98DdYE88cZsWoOdFqFKY02xy1NCaCc9wLKUsGyWTaA+4UuK9CmTIkbf8qL
	oqj9Dj3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfC4-00000004Syz-411C;
	Tue, 27 Oct 2026 11:18:16 +0000
Received: from mx2.securetransport.de ([188.68.39.254])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfC2-00000004SyS-0Ru2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 11:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1793099857;
	bh=Vfd5Zd+m6HNfCiZ4UDrZ6b24cU1Wbos2NPOmkyVZCys=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=W4XXs8+BGcoaj6tHtxuj3wTH/EFcsnI6WENGz5on3tcr0FdkJErdfh8oiI5lTDQDr
	 MifUHCrXsJ/DLIVjHClXiMQ0uGaBH9qJ8r+UNqGqiWYh80b4eMe+9QVqTqin7M0eSG
	 z1TE/FBGQK4f3P+l3CYWp+WxiQOww0zYEUta0DMvKJ9xSokpCyuRQx1rTi8FnUNf2m
	 siTRx0CicILpVAjTByYDe9nRblZxc/qDwAW6jksVV5Loc7x+/yJ18+DhtT3X+9VmG7
	 nMrAoeOjMGEfIFd53zQQ4YVNP3LwmCeP7WgJieh8t/Yg5SLcisncyFjjHdDPDN4kZ0
	 bvi0iP79I07eQ==
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@nabladev.com>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<kernel@dh-electronics.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 2/2] ARM: dts: imx6ull-dhcor-maveo-box: Correct PCB number
Date: Tue, 27 Oct 2026 12:12:01 +0100
Message-ID: <20261027111201.20936-2-cniedermaier@dh-electronics.com>
X-klartext: yes
In-Reply-To: <20261027111201.20936-1-cniedermaier@dh-electronics.com>
References: <20261027111201.20936-1-cniedermaier@dh-electronics.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_041814_305637_4BAE2A53 
X-CRM114-Status: GOOD (  10.56  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PCB number of the maveo box isn't 525. Change the
number to the correct number, 625.

Fixes: 145e2732a5e9 ("ARM: dts: imx6ull-dhcor: Add Marantec maveo box")
Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
---
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Marek Vasut <marex@nabladev.com>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-kernel@vger.kernel.org
---
V2: - No changes
---
 arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
index 0b48de79c595..0f900e58d8a4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
@@ -6,7 +6,7 @@
  * DHCOM iMX6ULL variant:
  * DHCR-iMX6ULL-C080-R051-SPI-WBT-I-01LG
  * DHCOR PCB number: 578-200 or newer
- * maveo box PCB number: 525-200 or newer
+ * maveo box PCB number: 625-200 or newer
  */
 
 /dts-v1/;
-- 
2.30.2


