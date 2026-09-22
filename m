Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8054BC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNuqR6h7lMBYLpc3OWPx94AN2/jHBwLOhY3RRj1IfnM=; b=np6+dseZ4xucIsB0lMjcxAKT5g
	kMxYZnK6wKYAz9YjE5KSQegzfe1zAeNr1AIAOUCrnIWmy1hy7QaRCOnfvV+6jcCqd3mDJZSeHV7Ss
	g/y7GNa4/snR+8psdaBUd5IVtxcaOtDS8jRaV0dtHw90w+WKW6WBgDzGpY5h78Cijmbh5+WbzTT46
	HRJwIA4nS9HTiDlFp9xwKndvoYPMxp2hmpDMacUzLt6MWdfdae90dQNXOt37gfSVlhNwu/kcq2bll
	v0kgeFyd/kXRDq6iC0LL/BCLk4pbni6ssb/ueH2wA1+Q0VMmHDypB/3xZmSHDQdf3YaWxukf/FJyL
	ZMrZwrDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92Nu-00000005pL1-1Eoo;
	Tue, 22 Sep 2026 15:26:18 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92Ne-00000005pF2-1Jqu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:26:04 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2C01A22B7D;
	Tue, 22 Sep 2026 17:26:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790090760;
	bh=DNuqR6h7lMBYLpc3OWPx94AN2/jHBwLOhY3RRj1IfnM=; h=From:To:Subject;
	b=yEC5MUUO35xVfwfGxJRYp/5MPkNrbAkfOcOqC7PqKuD0hKjjzJGZFM48z2kiDIdAC
	 MiyuYm1BLdUS5C5l8yGnVY7tArv4j0+EvUUJToCGHCYsfXtwCH/FvuYMymbOf0zZaC
	 zx18+kWiQOPyCGJFCIWevoZ2GZadDFJRhVqz1jb3iwGSr9XkDsBk8+CMym85lGre7l
	 qqcJG3S0pM9lHjAJQkFnorqRz72xf7dIBoNs3iWeTkD+rlO331SfvAvf0Yw56dz0Vc
	 LIthRFoNccp+6TPbCfaWvvttbGatuSOj0q6ym6hvgKrfg2gr1vvJqCbSBJsHqXfwTb
	 GUHkgKeXtG80Q==
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
Subject: [PATCH v1 2/2] arm64: dts: ti: k3-am62-verdin-zinnia: fix main_gpio0/main_gpio1 line names size
Date: Tue, 22 Sep 2026 17:25:49 +0200
Message-ID: <20260922152551.270845-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922152551.270845-1-francesco@dolcini.it>
References: <20260922152551.270845-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_082602_515286_345FF2D3 
X-CRM114-Status: UNSURE (   7.65  )
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

zinnia redefines gpio-line-names for main_gpio0/main_gpio1, sized
87/88 entries instead of the SoC's actual 92/52 ti,ngpio. Resize both
arrays to match, keeping every existing label at its original index.

Fixes: 4abc2f22e469 ("arm64: dts: ti: k3-am62-verdin: Add Zinnia")
Assisted-by: LLM
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../boot/dts/ti/k3-am62-verdin-zinnia.dtsi    | 41 +++----------------
 1 file changed, 5 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi
index 0ce8357797ed..f399764b05cf 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi
@@ -274,6 +274,11 @@ &main_gpio0 {
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
 
@@ -330,42 +335,6 @@ &main_gpio1 {
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


