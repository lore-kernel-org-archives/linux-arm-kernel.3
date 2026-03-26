Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBC0106F30F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQfjcrXN4LP2Ehl6VhlQGgqoemvh6X6NfnxGdeDxSXA=; b=mziT55DUhM0ru4yq21tpWN4gpK
	nmvC+4na0PcRzYcSTHw8mbu8nxA2ca0g+fUsg61NLnsLJfJSsAqFfl1lir6e4dP8nqJa16oiabXZI
	ADA31dokoqmkWenJWUBx+WpHoQ4QzhYhQEzlnSDiRMYa2G0D9QGv9hoZAXrXgvVfzc2MlCT2RKZxl
	MAzQF4RSam9/sqTA8pnWHqbqSsnf/RB0XfkKv64gB9xsHP2v7LTh/vU8ZHJUo4dJi2ZLwOYBs6Owj
	I/H+VySiFDa3eG2voIdC5CCinCE9fxB2EoaQoeQXet5Ro2I7VnNaHqoZogEl5yriL5ULhNluksl3J
	ccgk2rwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gzk-00000005994-3JY7;
	Thu, 26 Mar 2026 09:27:16 +0000
Received: from [64.106.246.77] (helo=mail-sc.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gze-00000005942-2yPk;
	Thu, 26 Mar 2026 09:27:11 +0000
Received: from rd03-sz.software.amlogic (10.28.11.121) by mailsc.amlogic.com
 (10.8.11.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 26 Mar
 2026 02:26:03 -0700
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh+dt
	<robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>,
	devicetree <devicetree@vger.kernel.org>, linux-clk
	<linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Ferass El Hafidi
	<funderscore@postmarketos.org>
Subject: [PATCH v3 1/3] dt-bindings: clock: amlogic: Fix redundant hyphen in "amlogic,t7-gp1--pll" string.
Date: Thu, 26 Mar 2026 17:26:43 +0800
Message-ID: <20260326092645.1053261-2-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260326092645.1053261-1-jian.hu@amlogic.com>
References: <20260326092645.1053261-1-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.28.11.121]
X-ClientProxiedBy: mailsh.amlogic.com (10.18.11.5) To mailsc.amlogic.com
 (10.8.11.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_022710_745023_613F596E 
X-CRM114-Status: UNSURE (   9.42  )
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

Fix redundant hyphen in "amlogic,t7-gp1--pll" string.

Fixes: 5437753728ac ("dt-bindings: clock: add Amlogic T7 PLL clock controller")
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 .../devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
index 49c61f65deff..b488d92b7984 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
@@ -72,7 +72,7 @@ allOf:
           contains:
             enum:
               - amlogic,t7-gp0-pll
-              - amlogic,t7-gp1--pll
+              - amlogic,t7-gp1-pll
               - amlogic,t7-hifi-pll
               - amlogic,t7-pcie-pll
               - amlogic,t7-mpll
-- 
2.47.1


