Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044ECC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INah13hy1wCxOZtE4Ul+QZds5mncb1L+9rSd5GNhBEU=; b=26zGO8f7mpIp3nFUt+s1ABKIS3
	DPf+e0lqYQbODduXsY7Aaslg5iSzqerTFZC/6SZjWTFMos4iUu2vu/U2xH4Sv4N5JL/FJo2fRH/1d
	haM9S1Dlfu/vtl89Dm2pq08s8IywEPk9Wf6eIns1w+wPkEiJRbxqQ7G9YUfYjqY6rC2Bwu9lWSH+G
	3lZYSczB21uyOVPkf7CPvUPv4CUdtm3toqajgatcvoP/rSs9HKytKOfI8GZZrBnzXQRkNMiYdAbur
	DIHF4tp9NP/Z9Y0EVNmb+yi0vtV3J8Gon/4OgmKQyQmLCLLSAipQqIfxVfidCqp5lISLn1pttwT/W
	DqVsl4mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YOd-00000006n49-2HAt;
	Mon, 07 Sep 2026 12:24:23 +0000
Received: from out-211.mta1.migadu.com ([2001:41d0:203:375::d3] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YOW-00000006n1a-0J7t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:24:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=waGL5biJ+0DdJSi3zAqUa3WT8EXSFWxNSrzn0Sze2VM=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788783852; v=1; x=1789388652;
 b=KsG1M0nTa8nOlT0hFw3iLevFTgamhJpKvMtLzroCUWEGTY1a9YwYPrm+5BvYrSoV4Qi5MNJI
 cpSFDeZLsUMC+XC2qo937gTYBS+oYsujW7eY4u1hfqmq+o6b+C3NJIrWIzaMu9Yyvla0O0V0PaM
 vWN2Gha32h6s7ck2Gosm3LA3N5PcO9n6r9G6nIDJEXSItnckceq808cJCvm8TQ5jIEkEznPp4I2
 t5naHdaOeq2hTmyVX82UUAJWd8g0sgOyGIS5NF6iBE709WoK5IjLnh2sXzD2LNq069B5grzkg2u
 GO/M7Q8zPzOiLUjA/WOA6hm5tzbe7O6zDfRB/lJOZU5Zg==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ceebd85e94b4903c;
	Mon, 07 Sep 2026 12:24:12 +0000
X-Mizu-Trace-ID: ceebd85e94b4903c
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Joachim Eastwood <joachim.eastwood@gmail.com>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 1/3] dt-bindings: arm: rockchip: Add FriendlyElec NanoPC-T6 Plus
Date: Mon,  7 Sep 2026 14:22:43 +0200
Message-ID: <20260907122406.1862398-2-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907122406.1862398-1-diederik@cknow-tech.com>
References: <20260907122406.1862398-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_052418_227025_6728B800 
X-CRM114-Status: UNSURE (   8.11  )
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

The NanoPC-T6 Plus is the latest addition to the NanoPC-T6 series.
Add it to the NanoPC-T6 list.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 81744fbee98a..aa828ee60d21 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -398,6 +398,7 @@ properties:
           - enum:
               - friendlyarm,nanopc-t6
               - friendlyarm,nanopc-t6-lts
+              - friendlyarm,nanopc-t6-plus
           - const: rockchip,rk3588
 
       - description: FriendlyElec CM3588-based boards
-- 
2.55.0


