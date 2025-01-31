Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469A2C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 21:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Kv3tELbGRteR+FHvYsv5r70TIfhm0NNGS79jrWuxbU=; b=pU7P1qEwUQZzvEbUCwknYihJLY
	Elg84ywjZpEL7m5QUblVifsANbSuVCVYAGhnk9rhzP8dKTN25cVqqvAdzCMBJ0awfOoe5Q/gwQ0d5
	n0TAIf3Hn0cWHSugTkkRmysRsgwJmjTHckGGjGO4+DccaKiYmsYba8O89GJZITBWTAPLv2OSrDH+E
	uaD/fEFxW4JdPQaAnOB9ti/6SKNs7iKfNoMQNQMrcYbZdg8Ba0/twDzCLgLLxXxFFFrxbuy5pc5ny
	yFoHCSfifuwuPMUA0pEddYRdd5LGoATjzZ0LGUfoOdRm8OKWqYyVwvDOFaXIBT9bmdjFR9FO69Wtr
	K4c1qnmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyPX-0000000BRQG-18vT;
	Fri, 31 Jan 2025 21:18:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyG1-0000000BQG5-3ebP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 21:08:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 050C5A42566;
	Fri, 31 Jan 2025 21:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FABC4CEE5;
	Fri, 31 Jan 2025 21:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738357737;
	bh=JiQ9WBmvrNQ9x4NMLYax8YWwyVUnldYxerF00xmFMyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JXz6RVMIJK+JHZX+7RYvJ62oGvLA1lWYg0h4VNHnSlBA3x5Q0Wv9n37/HuaSsk4VA
	 AtsScPkCEFELwmyiA0oWQgho4JzrOHSWC1HJ3h0Tn67ZzMbrhH2Rc9cPubGmA3RiYd
	 CKVvWIGC+WoIwfxc3+yo4NEAJnuYJaP9HRSDCAiAMFHcZCLPt9OlC0cft8z8Axy3Ou
	 My4Ey+8qpJwzqtqD5BQ4ceW+ndrPmyH5EiOHQ1FS4WAyUVHpb/VhR6AudR1IrYODMh
	 R/fxT814MpYGlVfdc7xhTy7re467rWUnmiVs8GJig7vRtv+e0vu6/rhdPBLU/RWCGX
	 YF17LZgxKVe9g==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 31 Jan 2025 15:08:30 -0600
Subject: [PATCH 6/6] arm64: dts: marvell: Add missing board compatible for
 IEI-Puzzle-M801
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-dt-marvell-fixes-v1-6-55f9f6acd4b1@kernel.org>
References: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
In-Reply-To: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robert.marko@sartura.hr>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_130857_982224_20670493 
X-CRM114-Status: GOOD (  10.57  )
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

The IEI-Puzzle-M801 board is missing a board compatible, so add one.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
index 9c25a88581e4..def25d51c4bf 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
@@ -13,7 +13,7 @@
 
 / {
 	model = "IEI-Puzzle-M801";
-	compatible = "marvell,armada8040", "marvell,armada-ap806-quad", "marvell,armada-ap806";
+	compatible = "iei,puzzle-m801", "marvell,armada8040", "marvell,armada-ap806-quad", "marvell,armada-ap806";
 
 	aliases {
 		ethernet0 = &cp0_eth0;

-- 
2.47.2


