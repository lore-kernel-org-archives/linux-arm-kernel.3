Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDB4C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vfK8cCET6M/6AUILdbY6s5+8qRAvPa/xd7rw7DfimU=; b=X7hGlkZEqXjFC4yv2ged6sOh1a
	PMM29XVDgrw3mBfRzFX/QchfJFZigv5Lx8oeEyVErVfZ7h+YdrhjHTqz/JoRQ99vIcTLGXGpwAeQS
	0OLYmfCGrxvEfTGkRkw35ZtreKP2FLmpJ+k5V9Qn4igglEdZdjO0CFX4pskLOIsHjPOAuOehM4Nsr
	cJl8mcK14pZwR9SOIuDRAN1yFbZcpzMRdTwjlFa3h+lYy3A4kzvC4jhrl8iWx+yJiCzc/KvHBJQti
	7ITdDdW6Z22FEV7mR9bqAFSJYK4zZ96mKvbjdbfHM8G7sSiOvDSyeIrR6EFcCXI/6yC9XNDYUXUtU
	fw1fJ9bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92Ng-00000005pGQ-1sjS;
	Tue, 22 Sep 2026 15:26:04 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92Nd-00000005pF0-3dSY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:26:03 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 89D9E22B6F;
	Tue, 22 Sep 2026 17:25:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790090760;
	bh=6vfK8cCET6M/6AUILdbY6s5+8qRAvPa/xd7rw7DfimU=; h=From:To:Subject;
	b=JpVr9wYCWEWr+WEd+YgP7vsAb3N63fOsXtRXKNvhuvO6l5F8w7x0AIutY7zwo+4s4
	 +T3fCg4mo+aHPQlnddQwlGBIiZL4XoDPirZeivmNnLMyjWuZZuZ5uTlNCNMsHN5QAo
	 Qd6Yp/ojG6SLaZyTPMAkhVuT/qCe6vhfCxCgjdI1QEC8iud5H0whm5rRYDOnXjkSZT
	 cYQhFet8JPbPF82x53o5R9cauRzv8w/dwrjbtpuh3Np7aXckpx9UfAmaU7su38iXZB
	 iCO0SJ9cSgBQzEEdEjOMW5UJM8n5631Y8f2bL22FP2kU6SwW8l87o39xP5x86HAmB8
	 TbeRRxApny2lQ==
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
Subject: [PATCH v1 1/2] arm64: dts: ti: k3-am62-verdin-ivy: fix main_gpio0/main_gpio1 line names size
Date: Tue, 22 Sep 2026 17:25:48 +0200
Message-ID: <20260922152551.270845-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922152551.270845-1-francesco@dolcini.it>
References: <20260922152551.270845-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_082602_071552_743CF65C 
X-CRM114-Status: UNSURE (   7.75  )
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

ivy redefines gpio-line-names for main_gpio0/main_gpio1, sized 87/88
entries instead of the SoC's actual 92/52 ti,ngpio. Resize both
arrays to match, keeping every existing label at its original index.

Fixes: 881f5e9d8082 ("arm64: dts: ti: k3-am62-verdin: Add Ivy carrier board")
Assisted-by: LLM
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../arm64/boot/dts/ti/k3-am62-verdin-ivy.dtsi | 41 +++----------------
 1 file changed, 5 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin-ivy.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin-ivy.dtsi
index 844f59f772e1..c99076109a9b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin-ivy.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin-ivy.dtsi
@@ -367,6 +367,11 @@ &main_gpio0 {
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
 
@@ -425,42 +430,6 @@ &main_gpio1 {
 		"",
 		"",
 		"", /* 50 */
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


