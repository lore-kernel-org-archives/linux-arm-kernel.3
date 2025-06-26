Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91878C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=800AVnoTDZJXoaeCzuF4Dq6C6SOZV4bApOtvi/P3m6I=; b=ec68oMwzsJpdbUPjcLq4YV1Fdy
	UcfU97Pfmy3nQvMaPxnQgS5wS/pgZ9lKUYWcyuMHKLr0NrUcKtax758gMngVlzaFlhpjHG6qXe1+m
	LttEc01WpTPT/HvbnGMi+JXIzMbPnWK6b4nxwfswWMjxv/mgl0snpWjg+v4xYlj2PziviRpMhYjsQ
	EhRr4GmEkEKJWV6a9/DQSntBQWw5MAYKE35k/pU136ysu/g36pXhPTEvMQANu9JHuMuQ5cmjQfFSU
	FwnVKTdQSe6gw4D8PLCbPf9Toovs0NaN1Io7Z1ajRZqjhhj4vjzurGeUabP6Z0yZLNhDvEe1o+g9I
	HgYqxbIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvEB-0000000Cx4m-2We3;
	Thu, 26 Jun 2025 22:37:55 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsz0-0000000Cin7-0kmv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:14:07 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0C64D25EFA;
	Thu, 26 Jun 2025 22:14:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-6oKX8-5Vox; Thu, 26 Jun 2025 22:14:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750968844; bh=epoP2UuyIL+Me+yxNnO2B9jQoJUegkUB4XN42F/6FoQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=X9EEXz7Fd35wNnRobFsiF69crl0b5+vG4zbAb0JyesGxmHRgbKuN4FomFCR9eW6d7
	 gwgAr7YiPwXj/o6ZMaN+lRrtf5yvgHWpudZRMzsKYxipfpjt95hxFSuHGW/y5P20jh
	 aTNRe/FUi8l5nH0IX2jbooy9M53IsLS/ttpM9bR2BThD3tOfgOy82lGCC6+BQ+13Cl
	 6J7DEydQHg89y4VImXxkDlKbkVfa7nPQ/Xv+5YWO2DpL5WxismqW+hl9LyB10S5wN5
	 6Pn4uPjCE+Ul8HBkANIidSFvxGmP9qc2W740YeYUauMzKHJKeY9BYleGOzE/Rvafkq
	 tXEIi1dz5hB7g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:43:25 +0530
Subject: [PATCH v2 2/6] dt-bindings: soc: samsung: exynos-pmu: allow
 mipi-phy subnode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-drm-dts-v2-2-d4a59207390d@disroot.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
In-Reply-To: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750968815; l=899;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=epoP2UuyIL+Me+yxNnO2B9jQoJUegkUB4XN42F/6FoQ=;
 b=6a5UtVFoI+EulxnSYOrC5pd7WAo8VV5EgAn2gaNg1xW/L+QrbcqZibFBUWNAdV4woiBmbUWHP
 dWFu4ApWhW2AjFu0P/fIqb9XtG009qnGVm534tD7+Lyf4PHoQrwRwgc
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_131406_352043_8D3C3379 
X-CRM114-Status: UNSURE (   6.78  )
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

Add Exynos7870's PMU compatible to the list of nodes which allow a MIPI
PHY driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index f0fb24156da9b8980dcfd5339ae75f12a71cf6d6..45acd6a03d761a833cec435302e5190fb50f7a23 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -172,6 +172,7 @@ allOf:
               - samsung,exynos5250-pmu
               - samsung,exynos5420-pmu
               - samsung,exynos5433-pmu
+              - samsung,exynos7870-pmu
     then:
       properties:
         mipi-phy: true

-- 
2.49.0


