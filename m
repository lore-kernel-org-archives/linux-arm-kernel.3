Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BD5C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 19:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xw4Zn5sAcKJHfUdsW1zQZWmiQHFKoBhORxaaC10bj7s=; b=KLN4odYBVo/SDersqPRWE0djjx
	i7pODTibuPSYvOITPGaXktCtQFXm1WizWNVmk0FjkeQY+RS1H91eho4pzTa3wncsJj7rmtd48rQJ8
	WMPoP1BvmbSShiA3w4SPsLeualYVisGFIVjT+WMpyQO4yTq/C+B4NrosuoRtLc8TQRb6fX03nOzaQ
	O7yevkcDhp1o2LfYcYvaoYAyBrC7rk54QXZZzYRJDcfEE3x9AUdHe/f2OGL9hXHCpbHSg6G0al6Xr
	5phDVPeyrk2qRDaOdSE3BDL61I24nivTlyM+uLY8yFfWvFN4AS3EYyakuhWujxjofU7oXCt09ba35
	HJZrt/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6C41-00000004Vro-0mzl;
	Mon, 14 Sep 2026 19:10:01 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6C3q-00000004VpX-1qqg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 19:09:51 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id B3A7B1FEC8;
	Mon, 14 Sep 2026 21:09:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789412988;
	bh=xw4Zn5sAcKJHfUdsW1zQZWmiQHFKoBhORxaaC10bj7s=; h=From:To:Subject;
	b=ZJUGydrfXRN9ToFrPaMpWORs7i4sGLoq8pTTzcWVitqH484E1bPgXbCgW7xQSMtzV
	 RX+jS1+9zTva+dFiVH7gAHVER1KWRYZYn+hsj/AqvWW0TA64ZUvG5WZsZL4tuVIcf1
	 vzz7Tbn6HDE1aGNa3LlqJw+EVG68RLD4JKwW6lVK+Km4TRn0XK18vsiDEuKAABUXnJ
	 1aC1feO6XJ50aQ34rIYXBAAWvZlV6W8fdDZxclwe1Sn4oBtpfJkLYZvhwzgsue7GcH
	 ODfixdT8YmYIX4bJsXvxy3UBqMZ3tTzAiknaIDA+EvJgZ0px1LjAcOtusdtgaQpfQb
	 r7W1ar24BUQQg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: ti: k3-am62-verdin: fix main_gpio0/main_gpio1 line names size
Date: Mon, 14 Sep 2026 21:09:42 +0200
Message-ID: <20260914190943.50843-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_120950_633823_22D6F56A 
X-CRM114-Status: UNSURE (   7.76  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

gpio-line-names sized main_gpio0/main_gpio1 for 87/88 lines, the SoC's
ti,ngpio values before they were corrected to 92/52 in commit
28c8f2189d80 ("arm64: dts: ti: k3-am62-main: Fix GPIO numbers in DT"),
four months before this file was written. Resize both arrays to match,
keeping every existing label at its original index.

Fixes: 316b80246b16 ("arm64: dts: ti: add verdin am62")
Assisted-by: LLM
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi | 41 +++-------------------
 1 file changed, 5 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
index 895b1b7dcac7..042124828095 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
@@ -1012,6 +1012,11 @@ &main_gpio0 {
 		"",
 		"",
 		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 90 */
 		"";
 };
 
@@ -1068,42 +1073,6 @@ &main_gpio1 {
 		"",
 		"SODIMM_17",
 		"SODIMM_155", /* 50 */
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"", /* 60 */
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"", /* 70 */
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"", /* 80 */
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
 		"";
 };
 
-- 
2.47.3


