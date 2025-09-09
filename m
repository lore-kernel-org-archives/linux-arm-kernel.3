Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FB4CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkyvTEnjsG/NRyPsiIz5XqN8gm5f+l5Gksm/lmDex2g=; b=gIrJteoz2SLiYXaWWszUbew1Qs
	HRjvpCcPq/IQh9Ge16AVsu4kykG9jqIh5/Uy7XMDk5lCtIPjESRNIyOvwvJy/5i45T/UTUBwYD8XR
	G2QsDStSRDUvwUKXa5XCGdkTYmGB5dlvEwtiVLzVk7q/C2BbW3I3J4R7ybvtfZOLgjKBik56tXVZP
	fqoDjdSjIj8iNRdXk2eWSjUWMObFJj99yH61xEoCMk0nuv/OW3RDbC0fVecEsmIU1xmaOw5fJmB2j
	BpIRKC4HVn9IeVDeGewKrvw8nXml6TzV+0GtdbK48UHJtF9LgYWHVQ9ZZd9gZoeDNz5TdR6IhgZHa
	HEgO5HvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1wz-00000008pUP-2Ip0;
	Tue, 09 Sep 2025 17:16:13 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwh5-00000006nfs-1vkh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:39:28 +0000
X-CSE-ConnectionGUID: 507sXnTvQliEhFBs3Q4Mdg==
X-CSE-MsgGUID: Qc/LLW2OR6SwhPfPrNNvTA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 09 Sep 2025 20:39:26 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.24.0.1])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4AF0E401E4F5;
	Tue,  9 Sep 2025 20:39:17 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: catalin.marinas@arm.com,
	conor+dt@kernel.org,
	daniel.lezcano@linaro.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lukasz.luba@arm.com,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	rui.zhang@intel.com,
	sboyd@kernel.org,
	will@kernel.org
Cc: biju.das.jz@bp.renesas.com,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	rafael@kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 4/4] arm64: defconfig: Enable the Renesas RZ/G3E thermal driver
Date: Tue,  9 Sep 2025 13:38:39 +0200
Message-ID: <20250909113840.122785-5-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909113840.122785-1-john.madieu.xa@bp.renesas.com>
References: <20250909113840.122785-1-john.madieu.xa@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_043927_606434_ED3DEFD1 
X-CRM114-Status: UNSURE (   7.85  )
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

Enable the Renesas RZ/G3E thermal driver, as used on the Renesas
RZ/G3E SMARC EVK board.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366c..8def47e094d0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -728,6 +728,7 @@ CONFIG_ROCKCHIP_THERMAL=m
 CONFIG_RCAR_THERMAL=y
 CONFIG_RCAR_GEN3_THERMAL=y
 CONFIG_RZG2L_THERMAL=y
+CONFIG_RZG3E_THERMAL=y
 CONFIG_ARMADA_THERMAL=y
 CONFIG_MTK_THERMAL=m
 CONFIG_MTK_LVTS_THERMAL=m
-- 
2.25.1


