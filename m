Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98287CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 07:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQx+mwF16Ws2c3BMSABJS0KO6FKXd3VLzeSfwnur18Y=; b=39u0DAzL50liYAE0Tv3nJWGJ3Y
	7BfGjlwSI4nHegNrzLzpHULZw9lwC+I+UXrNhfvOBW8Ao1b1UdEHx1vZ6ZJY4oLVSfOWiN1D8Spz2
	SdH37hW0xtCyb9QmWLcRF6ScuhHQ40Bzd1HKhZ+oPKJKLB6m6pKuIyExWuVg9xcC/O8nhwWCuJUtb
	lvbv5Y0cQAh31Lyb7Vm9NmiQQ52W5mGL+FuqDphT4G8VniHGyRa7idVw9Cb3mFOk4JECbK0N+PGHo
	DR2Qg6VngmSycLGkIFNZ+VmcTZEj6/KQhj4i2gBK/feW4WWcuJaqBYKuTK5z5QZIiRsXm1vZGiJlM
	6RtjNkjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v77Vi-00000007rD5-24bN;
	Fri, 10 Oct 2025 07:25:54 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v77Vf-00000007rBP-3diB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 07:25:52 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 10 Oct
 2025 15:25:40 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 10 Oct 2025 15:25:40 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Joel Stanley <joel@jms.id.au>,
	"Andrew Jeffery" <andrew@codeconstruct.com.au>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Mo Elbadry
	<elbadrym@google.com>, "Rom Lemarchand" <romlem@google.com>, William
 Kennington <wak@google.com>, "Yuxiao Zhang" <yuxiaozhang@google.com>,
	<wthai@nvidia.com>, <leohu@nvidia.com>, <dkodihalli@nvidia.com>,
	<spuranik@nvidia.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v15 1/3] dt-bindings: clock: ast2700: modify soc0/1 clock define
Date: Fri, 10 Oct 2025 15:25:38 +0800
Message-ID: <20251010072540.666673-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251010072540.666673-1-ryan_chen@aspeedtech.com>
References: <20251010072540.666673-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_002551_906147_8E3718D6 
X-CRM114-Status: UNSURE (   7.73  )
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

-add SOC0_CLK_AHBMUX:
add SOC0_CLK_AHBMUX for ahb clock source divide.
mpll->
      ahb_mux -> div_table -> clk_ahb
hpll->

-new add clock:
 SOC0_CLK_MPHYSRC: UFS MPHY clock source.
 SOC0_CLK_U2PHY_REFCLKSRC: USB2.0 phy clock reference source.
 SOC1_CLK_I3C: I3C clock source.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/dt-bindings/clock/aspeed,ast2700-scu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/aspeed,ast2700-scu.h b/include/dt-bindings/clock/aspeed,ast2700-scu.h
index 63021af3caf5..bacf712e8e04 100644
--- a/include/dt-bindings/clock/aspeed,ast2700-scu.h
+++ b/include/dt-bindings/clock/aspeed,ast2700-scu.h
@@ -68,6 +68,9 @@
 #define SCU0_CLK_GATE_UFSCLK	53
 #define SCU0_CLK_GATE_EMMCCLK	54
 #define SCU0_CLK_GATE_RVAS1CLK	55
+#define SCU0_CLK_U2PHY_REFCLKSRC 56
+#define SCU0_CLK_AHBMUX			57
+#define SCU0_CLK_MPHYSRC		58
 
 /* SOC1 clk */
 #define SCU1_CLKIN		0
@@ -159,5 +162,6 @@
 #define SCU1_CLK_GATE_PORTCUSB2CLK	84
 #define SCU1_CLK_GATE_PORTDUSB2CLK	85
 #define SCU1_CLK_GATE_LTPI1TXCLK	86
+#define SCU1_CLK_I3C				87
 
 #endif
-- 
2.34.1


