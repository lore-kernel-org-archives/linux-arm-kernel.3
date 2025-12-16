Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F80D5B87A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 01:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RhNafO/gTt7s+4qnbSOhDj1++UmBr/KGMzxaJhGj2c4=; b=4QVdGKeYif62rDm6Z/AnOmW+AX
	MpmWzQCXTK1TMHlb6JDY0oGJzasWFE4Y8FrNpPNCmzW1M8yOsZEpjbE5ccctH+FuUmM9podB1TLOD
	63c4btXK3PHAirSI/SibgOEQJIkJ5dhK5ylkha3pM4zmDHjl+j011NVLsYWJmNwJaO3zHFYZuzrFr
	t/g2M6gzV+n6fumqnvhqHztH3BxJwG1V62ili8nb2quFdi7z0n5bkxf/FZvlhL0tqTIc6b0yuhr6F
	QwhYEpkq1MSgKPLMZ7e/INdKcQXxEm3pQD3lDartitHckY4jULkHXG8GewG/+GW5dHr7qlJxE/z2t
	m2psQJQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKCt-00000004WO3-3A1P;
	Tue, 16 Dec 2025 01:50:31 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKCq-00000004WA6-3klr;
	Tue, 16 Dec 2025 01:50:29 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 16 Dec
 2025 09:50:01 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 16 Dec 2025 09:50:01 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Tue, 16 Dec 2025 09:50:06 +0800
Subject: [PATCH v7 7/7] MAINTAINERS: Add ASPEED PCIe RC driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251216-upstream_pcie_rc-v7-7-4aeb0f53c4ce@aspeedtech.com>
References: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
In-Reply-To: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong
	<neil.armstrong@linaro.org>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765849800; l=1055;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=r0BgtIbXNsHedoFkI9b0LevHO8akl3hnwnFy2Ogu+vM=;
 b=yKMzRhd9HSP2M5gJwufO22Da3hHoj7aHBs7q/17VluqfHqxKR+FgCxIVV2wr0ZUGrlORlBriP
 u8wFcI7/wZKCnVH8+P5PCvLWUht/yvwSjzHWTfVmq7f7kaxujr9+v3e
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_175028_951265_6769C967 
X-CRM114-Status: UNSURE (   6.74  )
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

Add maintainer for ASPEED PCIe RC driver.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aff3e162180d..c327ea375746 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3900,6 +3900,18 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
 F:	drivers/media/platform/aspeed/
 
+ASPEED PCIE CONTROLLER DRIVER
+M:	Jacky Chou <jacky_chou@aspeedtech.com>
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
+L:	linux-pci@vger.kernel.org
+L:	linux-phy@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
+F:	Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
+F:	drivers/pci/controller/pcie-aspeed.c
+F:	drivers/phy/aspeed/Kconfig
+F:	drivers/phy/aspeed/pcie-phy-aspeed.c
+
 ASUS EC HARDWARE MONITOR DRIVER
 M:	Eugene Shalygin <eugene.shalygin@gmail.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.34.1


