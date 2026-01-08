Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A2FD232C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 23:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ihaElZLjX2j3F8xbqemuqObG40MzxUEZujfK9SOAb+E=; b=uVHRpsaFUdIHIE8QreMSy552u2
	Xe8oQMkiRPmi49j5UaoaZLX3B1BEJRk5GoyiMjrDG6+Wdc550dxRa+dVyiBB4pR7bLzdP58I49wWt
	7cbHjH8JhnTyKS2nJaBcCgDZx3xwSk0LFTcP/ozw8LPvFfszJMdqNW3PD73Ggzmpm0SpQu7MR3Zd/
	opjxQlxMf4lhS8vHYE5ebc3jgtS3h0NUclCrZccR+L1MtImJd9gkI9WPlfObxDt2cN4D7G/wpJtPL
	Wm7otCYIbDi9oo7FpQUUs3PTQNmBflRnVaZcv1QWgkZ7HAaAQ6ALaS9hpDwVlJwsEsgYCqgfqbkxA
	smNY+9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdz4y-00000000yOa-3qNL;
	Thu, 08 Jan 2026 23:06:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdz4v-00000000yO4-2XEf;
	Thu, 08 Jan 2026 23:06:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B0C1742BAD;
	Thu,  8 Jan 2026 23:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7074DC116C6;
	Thu,  8 Jan 2026 23:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767913564;
	bh=2IQ4kXPyDAgenTx3hMT0WnQ4Gm8ePKDN1OIlZnJo+nI=;
	h=From:To:Cc:Subject:Date:From;
	b=poVEa1xZ5a9EHXWpyJ4aN2iqOCrwczthJzlj0KeEVVqbPHxtJXPjlARCCWL2Ixbf3
	 Av6itpc5KsuwV0BuNzeqIFgzCROLGKSvEU82ztbFu+pSjtB50x5gVd0D8SIo1J8q+e
	 Ek4Ow3Z+g3TKMlh3UoIi1KOAg7qm0Ri5LTUhntTtgLUjm9g79nCuizquKomBmGaCaW
	 sWHBA6O3AbimJxIq/0M9RtKJEA2I13ijgGZYrMgy9yay+jxmIW3LmUPqpFr5HsLlUF
	 GatoGJrVUpCCL1Ssqxcb4tOOFr+VzpPK1/FreMuD6eo1EKmBibhbwoA9xSK3HYiZj4
	 Ua4LKJUG0bLaA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: rk3568-wolfvision: Drop "sitronix,st7789v" fallback compatible
Date: Thu,  8 Jan 2026 17:05:59 -0600
Message-ID: <20260108230600.1348699-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_150605_686975_3D29C7D0 
X-CRM114-Status: UNSURE (   9.28  )
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

"sitronix,st7789v" is not a defined fallback for
"jasonic,jt240mhqs-hwt-ek-e3", so drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../boot/dts/rockchip/rk3568-wolfvision-pf5-display-vz.dtso    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-display-vz.dtso b/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-display-vz.dtso
index 70c23e1bf14b..d1a906031912 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-display-vz.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-display-vz.dtso
@@ -11,7 +11,6 @@
 #include "rk3568-wolfvision-pf5-display.dtsi"
 
 &st7789 {
-	compatible = "jasonic,jt240mhqs-hwt-ek-e3",
-		     "sitronix,st7789v";
+	compatible = "jasonic,jt240mhqs-hwt-ek-e3";
 	rotation = <270>;
 };
-- 
2.51.0


