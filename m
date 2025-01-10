Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EF1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 12:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5B4wLPkLltBSKJAduwHttDsybwQuVWByKDMy+iiFWCE=; b=yM4XovPiS5J0qiZCJg8KPAEFh+
	31w3F09oI9dfjYXuvPgJnZCHWiZREOAQ4hivAxABC7B6OyOuEKa8nx2rZsT96et8OCT7FZveALTSR
	WLszesPWKOB+9XLB6TB2SHzKhwsN7MkohpyF81cVbKdkt9uWtT7HJTi+r1bLT3ZCf9vnUOA+5tmD2
	dQIQ0l5VxwhhgfBK4UkqQf7lltZ3h1uQWCfdZI6GSYXovud0p7AwKZYOafwd247fb97xatTGw/P+F
	/tQ6F/aL6N62rHi5dd73tvQv6bx1HhnIB402vTyYKQxWylQ5w+YVS3hNXEkcbdy/Kqd38f1jqiOAA
	dIqH5a+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEIx-0000000FJJj-1DNR;
	Fri, 10 Jan 2025 12:39:59 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEGo-0000000FIfr-3p9v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 12:37:48 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:6c20:7f6a:9256:3ead])
	by albert.telenet-ops.be with cmsmtp
	id zQdc2D00h3H2tNK06Qdc9w; Fri, 10 Jan 2025 13:37:37 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tWEGa-0000000A4nt-2ruU;
	Fri, 10 Jan 2025 13:37:36 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tWCpP-0000000AN7u-2K4u;
	Fri, 10 Jan 2025 12:05:23 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: gray-hawk-single: Restore sort order
Date: Fri, 10 Jan 2025 12:05:09 +0100
Message-ID: <4f3e057b9a73d7ee7ff073f51bb9a4c30bdd0c84.1736506813.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_043747_093042_843C372A 
X-CRM114-Status: UNSURE (   9.52  )
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

Alphabetical by label name.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.15.

 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 18fd52f55de5b75b..d58f64d927feb17b 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -233,25 +233,6 @@ channel1 {
 	};
 };
 
-&dsi0 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			reg = <1>;
-
-			dsi0_out: endpoint {
-				remote-endpoint = <&sn65dsi86_in0>;
-				data-lanes = <1 2 3 4>;
-			};
-		};
-	};
-};
-
-&du {
-	status = "okay";
-};
-
 &csi40 {
 	status = "okay";
 
@@ -292,6 +273,25 @@ csi41_in: endpoint {
 	};
 };
 
+&dsi0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			reg = <1>;
+
+			dsi0_out: endpoint {
+				remote-endpoint = <&sn65dsi86_in0>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
+};
+
 &extal_clk {
 	clock-frequency = <16666666>;
 };
-- 
2.43.0


