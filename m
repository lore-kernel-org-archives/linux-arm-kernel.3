Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97E8CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDfG+k1bfMBfzYDx8oY+ojasDozysccBiv5dRopA6jE=; b=ncXBlNrr0RFAd9x9KcS14puNyZ
	IJ91EZkL/jMptuAZR6HE5iFThWoiKT/ug4T9Jn6nVNvK06duNnu4LgLKUUGoYFIzoMhuI8uRVMuwn
	yTcKcl24XO2CR0lRxWoCF+HS8xqXNf1FaP1jgnkMC+8hF5nsvM2nEqEMvMWmN0KhESAsHBqZqRvJA
	rcR1LqKkQGrZ5DwCZL7Vvj/043euo1uOrrQeGoyZYWSp8lAwTaTpwetPH6NGiYe1ZbYSO5hk3H89f
	xyarkDL7CHCt0olUO3BYljMBJeVPEk2wyb64ydyLNlDykzT32pxpjp3vBFCLmLfL8WqETeUdk81EF
	/ohu6HLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyVm-0000000G5m8-0GVl;
	Mon, 17 Nov 2025 12:39:14 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyVf-0000000G5br-43JJ;
	Mon, 17 Nov 2025 12:39:09 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 17 Nov
 2025 20:38:52 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 17 Nov 2025 20:38:52 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Mon, 17 Nov 2025 20:37:50 +0800
Subject: [PATCH v5 3/8] dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Add
 PCIe RC PERST# group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251117-upstream_pcie_rc-v5-3-b4a198576acf@aspeedtech.com>
References: <20251117-upstream_pcie_rc-v5-0-b4a198576acf@aspeedtech.com>
In-Reply-To: <20251117-upstream_pcie_rc-v5-0-b4a198576acf@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763383131; l=996;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=eCwurs+etNk9IZUbL4gYRtCoD7wND5BKbITNEzmXYdo=;
 b=sPosEZ/wkjdf29OY69lw7oC2/zenr2ThFF2d7ELCddl9NPYar33vYegkwz8XC2M31mQFY24aO
 qNJhq6sJSMxBLhO1h+IUkfVCCQ4cby4+19CRo5+rlf16S2J4WXBRHzz
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043908_029920_B2789FBB 
X-CRM114-Status: UNSURE (   6.75  )
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

Add PCIe PERST# group to support for PCIe RC.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index 80974c46f3ef..af8979af9b45 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -141,6 +141,7 @@ additionalProperties:
         - NRTS3
         - NRTS4
         - OSCCLK
+        - PCIERC1
         - PEWAKE
         - PWM0
         - PWM1
@@ -369,6 +370,7 @@ additionalProperties:
         - NRTS3
         - NRTS4
         - OSCCLK
+        - PCIERC1
         - PEWAKE
         - PWM0
         - PWM1

-- 
2.34.1


