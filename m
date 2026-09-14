Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCE5C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 18:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8R5FilPUkiBmnTtWAelcOCzMoXjc/4kErqArJsMoizQ=; b=avSeeD5HV4i5ADLcl+m3jTjFT9
	JE1baE6rlxsgR+bhnSnZDSsSJpAzxNi1l5aRWTY9ssdxUfNl6Y1A6DY9EwbxwHbtZlRd1gP/LG9tQ
	aUIAwcbFSgpqeZy8lJHllyZq6hVtX5x6On8Uq5Lx3llNi1YyzpXBdLdVtn4xJl6uxwbHFd27RYR+L
	pRzAaSw+LP+emEd17jf6itgzrU/Z5ykSOvPJfVcUkuCfRuRxwCYFfpOxrZuKgbKLy1ZPY2Q2rl0K3
	R1Ntm/FnBVubnop5pDidFmgJzsoeFBHWMfxjeVdfGyZOqOMX+MmSq66G+mkjqTfO/Tr8L52uXZqUY
	wi/s8PvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6BWc-00000004SQ0-1U62;
	Mon, 14 Sep 2026 18:35:30 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6BWX-00000004SP4-2KxB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 18:35:26 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 7E0291FEC8;
	Mon, 14 Sep 2026 20:35:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789410922;
	bh=8R5FilPUkiBmnTtWAelcOCzMoXjc/4kErqArJsMoizQ=; h=From:To:Subject;
	b=Ek0w6Pd4lUc3Msyg2GKRR25cL/Fol52JiCsMJgKHLbzs7Um3iiTq/yp4nBXdGb4/x
	 grL+ucN8Laq6MFBvoOL+sZefCoI8dvP9gs1HDouT1hHH483tGoUCxBlvDz7UB3cgOq
	 jHTYDrJZMPT18cmhk6EZc+uUVbkMFSwJHlY8hSeYr8qPlFIiopzD0mQ9GKf9tQGIRO
	 oZlLOYqSPaAxbdVK1rb4a7pz1sIKF4iQQVWZngVpQQGIh3MLd+WIITcy7a1CLV4VWi
	 UmDN5U9AxYna6i6CdeVNteMl0YL2KxXmoxtKIFm7o5fxE+r0xPnHm3SKpAhHq1diMh
	 sGPDvOwsuwCBQ==
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
Subject: [PATCH] arm64: dts: ti: k3-am69-aquila: fix AQUILA_B73 gpio-line-names typo
Date: Mon, 14 Sep 2026 20:35:15 +0200
Message-ID: <20260914183516.28865-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_113525_753310_D4EA1F17 
X-CRM114-Status: UNSURE (   8.12  )
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

wkup_gpio0's gpio-line-names has "AQUILC_B73" instead of "AQUILA_B73",
inconsistent with every other entry in the array.

Fixes: 39ac6623b1d8 ("arm64: dts: ti: Add Aquila AM69 Support")
Assisted-by: LLM
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
index 5119baf62a4c..b6854acee8fe 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
@@ -1573,7 +1573,7 @@ &wkup_gpio0 {
 		"AQUILA_B70",
 		"AQUILA_B71",
 		"AQUILA_B72",
-		"AQUILC_B73",
+		"AQUILA_B73",
 		"AQUILA_B66",
 		"AQUILA_B62",
 		"AQUILA_C21",
-- 
2.47.3


