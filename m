Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B94AC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4h8dquu6slcO6eGmqY9QueeVQuamfZ2A7/alu4byEQ=; b=tWppatjTC0xfOz+3I8Cu4j5YWL
	KH8ysTNie06ImtE05Pn3upijPZ+H8EW8qlzBjEvi2o2bWSwNNvork969GloRWpDAKLsLR9rxQto8X
	PFXcqY6iiq1aH8ZsMwz1liYI8Hn21KksLYKzd7LliLMkS4pGlHekotHRZp1sv9+ploxn3Oz7OAf+d
	2sOGzD6CF4WwWX1yXcVAXC7pqGY1iwcs3u8niYQfB2RkjMJrlZvAKnoBFhr6wnox1l/APqefeV3cs
	udVOrDEF26yhJ4QcUXDj4bxJ9X1lhhauydBBcXR2PxT2cqdUMxE/QyKw5uZbLkXE+cTOTh9uJz2mw
	ShKzmcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvh-0000000BjaG-3LdY;
	Mon, 10 Aug 2026 12:16:33 +0000
Received: from mail.zlab.su ([109.73.193.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvQ-0000000Bixg-2PAz;
	Mon, 10 Aug 2026 12:16:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E28FBFAEB;
	Mon, 10 Aug 2026 15:16:12 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364174; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=P4h8dquu6slcO6eGmqY9QueeVQuamfZ2A7/alu4byEQ=;
	b=p3lpEu4YgBYMt+wFTdv6GcHxB2FgHpdNIsekfb3e0VR8ElDPJ5k6G4qGQJv04ZwbYKHXEs
	JqUMLMZbWVb9b81EemukQjlFHeq7FzgvuSnGTh4ArOsYZbUZJyqfbouyImWXGEeqqc4Y9r
	NJz5+EuQXz09JVf9jf2uTGllt3zoetxrHsiuEfjM+kiQ1XcCV2vtC9nayPxCov7wqVK60A
	tPoQfpQ0kPgi/cuP861AAHAdq7os26PvgLxzVQkAoZrRYBGHnTsSOUOC2KQe4qu8ePbr8U
	rTIZTN7j66KshiBYvadQPI7rhuKThzVmfhQfcl0HemlEVdNuokFc89d5I2kFOA==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 15/25] dt-bindings: clock: rockchip: Add SCLK_IN_SPI1 for RV1106
Date: Mon, 10 Aug 2026 15:11:06 +0300
Message-ID: <20260810121121.210040-16-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_051616_872061_10421437 
X-CRM114-Status: GOOD (  10.05  )
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

Add the clock ID for SCLK_IN_SPI1. This gate exists per the RV1106 TRM
but is missing in the Rockchip BSP kernel. SCLK_IN_SPI0 already has
a binding, so add the SPI1 counterpart for consistency.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 include/dt-bindings/clock/rockchip,rv1106-cru.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rv1106-cru.h b/include/dt-bindings/clock/rockchip,rv1106-cru.h
index 80244988e139..ec6e7cd36f08 100644
--- a/include/dt-bindings/clock/rockchip,rv1106-cru.h
+++ b/include/dt-bindings/clock/rockchip,rv1106-cru.h
@@ -303,4 +303,6 @@
 #define PCLK_CPU_ROOT		286
 #define CLK_RTC32K_FRAC		287
 
+#define SCLK_IN_SPI1		288
+
 #endif
-- 
2.47.3


