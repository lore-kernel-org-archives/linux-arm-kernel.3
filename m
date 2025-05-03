Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA84C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 20:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAwHYojG1aPJfO9Hl6pfdlm+D2vQUm9z2JIU0ErTGKI=; b=FtDDoimoUqvGBnsfgmhZsxyAer
	SfveVLuvRnQynF4L7E2byDb5KCTMQKrkEH0JScK6fagdrZKWxw14WY15Rpv8qAXw2znBLJI8ukGGG
	YqE0msQjL7/X3oTavs+oO5yNZY/ldIHBALvj9BimZA6J85UhGQjhXkdLowrLFYMQjrXJgGZklHxDQ
	/UOlHYeYTQbeMm93U2JiMkAzUV5VaI7wmhvPgUoh0z5AHcoDmDIKUzqacbytKsuFIZQGaEP27fxB+
	anpCZtSAItbu6oDNbGOl+XatZM6m0o2PhwHKuh3+ZhAfhEfiCMjHOlIsR92kUETdgNqcepRm1YpRj
	DNv3NErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBJI2-00000004SN7-1XG3;
	Sat, 03 May 2025 20:16:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBJCK-00000004Rnh-0BYW;
	Sat, 03 May 2025 20:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=kAwHYojG1aPJfO9Hl6pfdlm+D2vQUm9z2JIU0ErTGKI=; b=G8gMw5aE4QiO6nZB5CPEZp+maw
	sU4fp6DCZHj2xclqjB+5g7QeV/WEZ/UTOWA/zVXp/nSoe2a8CZ0yAwLTteMsDmdlGq9CxfyM7O1BC
	t0EXCVUfommdD0hDpdJbUQixKcABOeaCs33wyfO56v4QiI8YlHtb9F3l1GJMALu4LULygPD3JeWPD
	AaTt903pjAdmDDNGoOCSlMOGZWJnk8Nj037YEfCLQUG0BDaPczSlwT4ycIL3h0Xm7kA66RiKSCKyV
	IFiABwBsZRxk0D2kyj0tlIm5SyXSE5fJq96K984MX3dukqgOzHO16R2US3QdMbhIG7fKx3m8XXA5C
	G4PmqULA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJCI-0001e6-BM; Sat, 03 May 2025 22:10:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: rockchip: enable Mali gpu on rk3066 marsboard
Date: Sat,  3 May 2025 22:10:43 +0200
Message-ID: <20250503201043.990933-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503201043.990933-1-heiko@sntech.de>
References: <20250503201043.990933-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_131056_115613_E762ED7B 
X-CRM114-Status: GOOD (  11.96  )
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

The rk3066 contains a Mali400 GPU, so enable it.

There is no individual (or even controllable) supply for the GPU
on the board.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts b/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts
index d2924aca6f2d..de42d1855121 100644
--- a/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts
+++ b/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts
@@ -69,6 +69,10 @@ &cpu1 {
 	cpu-supply = <&vdd_arm>;
 };
 
+&gpu {
+	status = "okay";
+};
+
 &hdmi {
 	status = "okay";
 };
-- 
2.47.2


