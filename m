Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE157CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 01:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6e66eEW12onx6EDljKtOSazUXDVJ2aQXuZ6H7WvYQ3M=; b=oDcPVFzm7S4V2NrlsSUDCeDxmz
	HIOQKFLJetOhd99AukuIhfn5pGcAhBfgqap/0CYqdFOMcx33lhZ5czyHsarecMs8vnk9Q+yRrVrR7
	pO3X+K7nx0Dk0eOvyXbSvLC5mB1TlTBU7z+U1EsuYQNSD13yfFohUO7HopmjCDtGSusW6lmDtI5cS
	iLYPhLskGfdedGU1NuKv0pi7A4S4E1w32Rx5Ja+fSMEW0QC5+uECzfIqGSySHX4qFMbWzgSYrNelb
	d8mN99/dWhQ8o+ZVyVaUrXI8RX0uPrKoRINJQDAk4b4QUP6fucnV+X+kUz+amzDZIAfRo3WvBZRX8
	rOl19s7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4V4Q-0000000BX16-3MZx;
	Fri, 03 Oct 2025 01:58:54 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4V4O-0000000BWzv-2gPx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 01:58:53 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 3 Oct
 2025 09:58:45 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 3 Oct 2025 09:58:45 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: clock: aspeed: Add VIDEO reset definition
Date: Fri, 3 Oct 2025 09:58:44 +0800
Message-ID: <20251003015845.2715538-2-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003015845.2715538-1-jammy_huang@aspeedtech.com>
References: <20251003015845.2715538-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_185852_679068_B247A84E 
X-CRM114-Status: UNSURE (   7.62  )
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

ASPEED clock controller provides a couple of resets. Add the define of
video to allow referring to it.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 v2 changes:
  - Update index of ASPEED_RESET_VIDEO
---
 include/dt-bindings/clock/aspeed-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindings/clock/aspeed-clock.h
index 06d568382c77..671e5a476eae 100644
--- a/include/dt-bindings/clock/aspeed-clock.h
+++ b/include/dt-bindings/clock/aspeed-clock.h
@@ -53,5 +53,6 @@
 #define ASPEED_RESET_AHB		8
 #define ASPEED_RESET_CRT1		9
 #define ASPEED_RESET_HACE		10
+#define ASPEED_RESET_VIDEO		11
 
 #endif
-- 
2.25.1


