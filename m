Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F92DCCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 23:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFTN/83Dw7cTrDD0Xt25qXAGDTGZ+icbmJJMOc+9iGU=; b=B6a4H/3FWN0eBTP5n+vXdaNFOz
	T0EMAW78a4HyEemfXTMConilizCqgrognXvTSlGGcGnBF+VAraJMFe7E1mw6lO95Jjnrjjwzpd7j8
	UryDhB+AO1Ua/fAIznzS5VfOSXC3+Sr7QkZSehymMRz920ELNwphX3y7xd9TT5dCx++D1Hp1e8owK
	3E+PmoeSWw/qMal3MoVsdYenxsliPEeRcqF2+vOsdTaUA7RmnZj3CdKxPghSYOUGYm0zwOQ05gvbr
	ngxR+uJlSm/0Jb6vue6gjPg8pQuDwPK2Iyq+ErWyV/vQT53kOGFc7mA5PigbcZlNpMxTInenFNxoc
	+zDVwUww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG4AT-0000000An7s-1c5v;
	Mon, 03 Nov 2025 23:40:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG4AO-0000000An4r-1FnX;
	Mon, 03 Nov 2025 23:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=CFTN/83Dw7cTrDD0Xt25qXAGDTGZ+icbmJJMOc+9iGU=; b=PVbmxVvG+OYwY/Gz2fFLvDAk6I
	aAuQaPh++ttBSY15koqMj8d3uvnBDoAj16CO25TWZIcOxbmbnL2ueJ0z40pwdaEMoXOqIDr5uXlPg
	2CN1K8OMBAPpJgG86QATc2MtoGgDgTWkgyZruj/h4stAN4jksj8JEK102zJe/dh1nUCYjldpkuA5g
	VZKVjazRFkuLIwtz+n/0Xhula5ONHdLVDtKqmIktsbbBooMbMS2hovfE5QHpoq3NrckAR6lRfNZGg
	eaDWwbSQG0bvwWKv698zB9HYm5eFG/EHMQnjkgySa0WXVxHdMGip2jv5dt5m+ht+5BF7EQ1UDkeFf
	nD3CYsSQ==;
Received: from i53875a3a.versanet.de ([83.135.90.58] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vG4AK-0007rE-E8; Tue, 04 Nov 2025 00:40:48 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	michael.riesch@collabora.com
Subject: [PATCH 2/2] dt-bindings: clock: rk3568: Drop CLK_NR_CLKS define
Date: Tue,  4 Nov 2025 00:40:32 +0100
Message-ID: <20251103234032.413563-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251103234032.413563-1-heiko@sntech.de>
References: <20251103234032.413563-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_154052_335931_5E3457AC 
X-CRM114-Status: GOOD (  12.08  )
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

CLK_NR_CLKS has always only be used on the driver side to calculate array
sizes should never have been part of the clock-binding.

Let's drop it, since the kernel code no longer uses it either and nothing
else has ever used it.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 include/dt-bindings/clock/rk3568-cru.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/rk3568-cru.h b/include/dt-bindings/clock/rk3568-cru.h
index 5263085c5b23..f01f0e9ce8f1 100644
--- a/include/dt-bindings/clock/rk3568-cru.h
+++ b/include/dt-bindings/clock/rk3568-cru.h
@@ -483,8 +483,6 @@
 
 #define PCLK_CORE_PVTM		450
 
-#define CLK_NR_CLKS		(PCLK_CORE_PVTM + 1)
-
 /* pmu soft-reset indices */
 /* pmucru_softrst_con0 */
 #define SRST_P_PDPMU_NIU	0
-- 
2.47.2


