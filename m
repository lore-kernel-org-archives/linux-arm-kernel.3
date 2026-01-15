Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE407D3CCAA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 03:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6An+59kZrrX/6VO4uDw/aRmHE7vH01Ooy0Q4JMyt7Bk=; b=nJPcuN8vI0JplvM5zQ/XO83FA+
	98DNb3McLYifs1DNOAfURkq21beiYdLaIwccRSifGeEeWEPk/LPVOBPFOmsqhHxbHlt6MTtbQVmu6
	3kryhqDRnHKmIK71/EltTyr2L1zD8bePczi8E8LWWOevUtG713+CP2pwtJLYdUWUOwXVhxUxmgxci
	h2Rod1AFVS3fk1NjmjGXlq3LuNblz2gO4mYusfT/myn5oyvA79wmim00N/S4Muw5epL0Z4VxVqt9Y
	93Dhf9mB0cPMT+zejJuTBoCPPk7YtvyhE4+7hKS6VcCLFPV2Ftw1Hdk4Ra6SaHUnGVdXf/vtPcC9u
	gUkJG0ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgE9I-0000000Bgmf-26ZI;
	Thu, 15 Jan 2026 03:35:52 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgE9C-0000000BgfU-25X3;
	Thu, 15 Jan 2026 03:35:47 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 15 Jan
 2026 11:35:29 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 15 Jan 2026 11:35:29 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Thu, 15 Jan 2026 11:35:31 +0800
Subject: [PATCH v9 3/3] MAINTAINERS: Add ASPEED PCIe PHY driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260115-upstream_pcie_rc-v9-3-d6c82a1556a7@aspeedtech.com>
References: <20260115-upstream_pcie_rc-v9-0-d6c82a1556a7@aspeedtech.com>
In-Reply-To: <20260115-upstream_pcie_rc-v9-0-d6c82a1556a7@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768448129; l=878;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=ukzk8V/+iAWF9vSX9HcoXRh6kD8Xte6R6G0Qmwo0orU=;
 b=Gd49zuaoYFSMlRUbrx/0CcYL0v85DMGnAT15UunB5qirAWWKqhtQBGZ0mNuX9C1azisZvb01Y
 Dmr5JiU/CshCdJ35bT2bREho6WwUWC6sG1gkYxiiAXHjTtHPelXSBg/
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_193546_548772_9F0723D9 
X-CRM114-Status: UNSURE (   6.82  )
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

Add maintainer entry for ASPEED PCIe PHY driver.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf755238c429..a1979c574759 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3844,6 +3844,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/crypto/aspeed,*
 F:	drivers/crypto/aspeed/
 
+ASPEED PCIE PHY DRIVER
+M:	Jacky Chou <jacky_chou@aspeedtech.com>
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
+L:	linux-phy@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
+F:	drivers/phy/aspeed/pcie-phy-aspeed.c
+
 ASPEED PECI CONTROLLER
 M:	Iwona Winiarska <iwona.winiarska@intel.com>
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)

-- 
2.34.1


