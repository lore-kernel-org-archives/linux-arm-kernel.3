Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBB5CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 09:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MvTDqXTt0EdcHFiuBsNVUB7Ja1nA2HkxB7PJxX5JPck=; b=fvyZzWBUVlJ5D/oJbQpqq/oElQ
	HSrQsdD6qVOj4Lr+OHIew5ddTr+NCEV8wW2pKj0KSRkvNGMoHp6v9HsqT39x2GRnI04TwRGpB+a1/
	Uxu0WnAVEi2RvZvY5YO79vPVJRSuIqOTVhf42Pkt/Znnnex7BA5uoP2zUYXV311KgRPJ1h8TwXcii
	w4GkEXEuHZCpf2EsGcQY5l6QiUx9ZxEBRwhSz/BExwPHrivlYxoQYvl8TPGPD/LBtWwPRg/9niQlw
	23wEfSO3FAJUK4+t7sDadUXg8Zp3FeLCDSd1t9nV0J8i3ada8Gg+LfF00V1aFyPrts82OorbWNUPr
	hjlrmKEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64G7-00000001jFp-0cCF;
	Tue, 07 Oct 2025 09:45:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64G3-00000001jDx-3uJA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 09:45:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DCF5B40272;
	Tue,  7 Oct 2025 09:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B648C4CEF1;
	Tue,  7 Oct 2025 09:45:21 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: v3msk: Enable watchdog timer
Date: Tue,  7 Oct 2025 11:45:16 +0200
Message-ID: <e30fb396d73307f2538a638cdda06ca58a1a4e60.1759830182.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_024523_988003_A2077FFA 
X-CRM114-Status: UNSURE (   9.13  )
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

Enable the watchdog timer on the R-Car V3M Starter Kit board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Remote board reboots fine when the watchdog timer expires.

To be queued in renesas-devel for v6.19.
---
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
index 332eb908ca0c1859..0caa514df567d7ea 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -294,6 +294,11 @@ user@1bc0000 {
 	};
 };
 
+&rwdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
+
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
-- 
2.43.0


