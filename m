Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB65CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 09:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UNv3b1LV1oc60rdjH6HeSpWhFtcDp87XphoA4vFQrBk=; b=1qRecjZht7vrhz
	fRAO995PrkPkFAhNfuEhUFwhabUMrcKcdb3x5ZHoJt1FlFsirwiTg/VJ7CtLscdesX3q214H0m271
	8no2c++5aMRDQ3skrBZZcGZTzlWJ5q1NIsGR3uJW6HMpNOGTLAyHJtzYAWo/0F5mUmCuZf1XcD+RJ
	0jaqbEWwlDOEbIKS8yuMcCSSzBsjBjZ7QWRXQ0GlYIKlQaxZKK1DfAHxhHYCm7d3JdhMpnb4KBWyO
	mn5s33Y5xuliogwyZUPRXWwt7GItALBaOOnDUk7lCD8pjoxjVlW+yCzI3zvX6GPAL1mje+2KryOQA
	MueDy+gcZ0SleoXYuEgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4G3b-0000000ABrO-0grA;
	Thu, 02 Oct 2025 09:57:03 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4G3Y-0000000ABpz-0UhU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 09:57:01 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 2 Oct
 2025 17:56:51 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 2 Oct 2025 17:56:51 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] dt-bindings: clock: Add AST2500/AST2600 VIDEO reset definition
Date: Thu, 2 Oct 2025 17:56:51 +0800
Message-ID: <20251002095651.2211900-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_025700_151975_E2C55CA0 
X-CRM114-Status: UNSURE (   6.93  )
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

Add VIDEO reset bit definition for AST2500/AST2600.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 include/dt-bindings/clock/aspeed-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindings/clock/aspeed-clock.h
index 06d568382c77..421ca577c1b2 100644
--- a/include/dt-bindings/clock/aspeed-clock.h
+++ b/include/dt-bindings/clock/aspeed-clock.h
@@ -53,5 +53,6 @@
 #define ASPEED_RESET_AHB		8
 #define ASPEED_RESET_CRT1		9
 #define ASPEED_RESET_HACE		10
+#define ASPEED_RESET_VIDEO		21
 
 #endif

base-commit: 7f7072574127c9e971cad83a0274e86f6275c0d5
prerequisite-patch-id: 80cfedcb62367922b1e875e8e734ced8f7cc19ba
prerequisite-patch-id: d74dc2e0aff712f033ca5c2f299410ae92867d8c
-- 
2.25.1


