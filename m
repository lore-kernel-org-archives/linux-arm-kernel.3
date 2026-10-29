Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE5C60A260F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 07:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aubVe+bh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NcAKdYZtTddQxjzrFXtQFy0f32SfgKRx0yegr2UvgLE=; b=aubVe+bhA1KwD+atYHIH7pVunh
	a1/sjqu/aT9e+P2bFuJH6McjFwZqmk2HLwsGMAKodLk0iS5NyDf0yK+j2TMbtbxvRNLggKKQNRuzR
	dOxhgGxHd0j5EyGWh552tjs5u0S/ddDuzUiwqHObr7/fjsH/amwCOwUvoObgatRCJokNFak1htFkN
	8GYz77WJRoQ5RZk/0pg+7185w9Ivah4/f/5QGEH3OhlILe1aaDikmhYGammoMTRS2aRQoCLAwAyOF
	mJr8kkwJxVnddYEYaTZZcXC108w2PHQcucBQ655ySnytsVoL4zj38jHTZVsI3UJL88uP5uHvFrRSS
	Gf42OJUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKWK-00000008XKJ-1kof;
	Thu, 29 Oct 2026 07:25:56 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKWH-00000008XJk-1hHc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 07:25:54 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 15:25:50 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 15:25:50 +0800
From: Cooper Huang <cooper_huang@aspeedtech.com>
Date: Thu, 29 Oct 2026 15:25:48 +0800
Subject: [PATCH] arm64: dts: aspeed: Enlarge AST2700 EVB kernel partition
 to 12 MiB
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261029-ast2700-evb-kernel-part-v1-1-e6f52742c575@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAPv04moC/x3MQQqDMBBG4avIrDsQI6TGq5Quov2rg5LKJIggu
 buhy2/x3kUJKkg0NBcpDknyixXto6FpCXEGy6earLGuNdZzSNk+jWEcI6/QiI33oJldN3aT9z2
 CA9V6V3zl/J9f71JuW81P7WkAAAA=
X-Change-ID: 20261029-ast2700-evb-kernel-part-63b3c998ea6e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Chin-Ting
 Kuo" <chin-ting_kuo@aspeedtech.com>, Cooper Huang
	<cooper_huang@aspeedtech.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_002553_474283_9E4DFDCC 
X-CRM114-Status: GOOD (  13.11  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

The 128 MiB flash layout of the AST2700 EVB reserves 9 MiB for the
kernel FIT image. A FIT image containing an LZMA-compressed kernel,
the DTB and an initramfs is already close to that size, leaving little
room for the kernel to grow.

Grow the kernel partition to 12 MiB and take the 3 MiB from rofs,
which now starts at 0x1020000 and shrinks from 82.875 MiB to
79.875 MiB. rofs still ends at 0x6000000, so the u-boot, u-boot-env
and rwfs partitions are unchanged.

This is the same layout used by the OpenBMC images ASPEED provides
for the EVB [1], so the rofs partition described by the device tree
also matches where those images place the filesystem.

Link: https://github.com/AspeedTech-BMC/openbmc/blob/438e761ed38644b77ba704c984cb607649bf2724/meta-aspeed-sdk/meta-ast2700-sdk/conf/machine/ast2700-default.conf [1]
Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Signed-off-by: Cooper Huang <cooper_huang@aspeedtech.com>
---
Notes:
- "Already close to that size": with mainline at c339f4010dea
  (v7.3-17997), ASPEED's aspeed_g7_defconfig [2] and GCC 13.2, a FIT
  image with the LZMA-compressed kernel, ast2700-evb.dtb and the
  OpenBMC phosphor initramfs is about 8.99 MiB, less than 20 KiB
  below 9 MiB (the exact size varies by a few KiB between builds).
- Upstream OpenBMC's AST2700 machines use the static-norootfs layout
  (no rofs) and are unaffected; the rwfs offset does not change.

[2] https://github.com/AspeedTech-BMC/linux/blob/76457d3afe2bd4022ca82dd9eb8fc48b84f0e9ab/arch/arm64/configs/aspeed_g7_defconfig
---
 arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi b/arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi
index b54915f06efd..f54d53077538 100644
--- a/arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi
+++ b/arch/arm64/boot/dts/aspeed/aspeed-evb-flash-layout-128.dtsi
@@ -16,12 +16,12 @@ u-boot-env@400000 {
 	};
 
 	kernel@420000 {
-		reg = <0x420000 0x900000>; // 9MB
+		reg = <0x420000 0xc00000>; // 12MB
 		label = "kernel";
 	};
 
-	rofs@d20000 {
-		reg = <0xd20000 0x52E0000>; // 82.875MB
+	rofs@1020000 {
+		reg = <0x1020000 0x4fe0000>; // 79.875MB
 		label = "rofs";
 	};
 

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20261029-ast2700-evb-kernel-part-63b3c998ea6e

Best regards,
-- 
Cooper Huang <cooper_huang@aspeedtech.com>


