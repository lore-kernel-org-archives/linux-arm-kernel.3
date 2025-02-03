Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838E0C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 20:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZF32yU4bibFPwmKwSPrWaLdfR9Ojo7LC29ZUMRz16A=; b=GnjBnXy7x7bMtMAUsr1i5YjJqK
	IKDWFjuc1LzYmNw277/j1I2h/CfIABhetmFCK89i5rVyon5jm3/9e7LKLRH2L15npoPYgHpOYr8e9
	z0edQ7UiPZgn7Gtv3eYCezVvTDxXiWSD+0grzBl/N/+4SvWNXD+OG9ISUEIk3ONVmdGZnnDm3PmcZ
	6aUv9FsefYybomxFXvdZT+CoGFsJuK2v9Rbt7qGz2gr41CnycpY8q9VYczYRd5FeHmhNU1Gtm1qvn
	OP3vSdFGkSOJZFqt7nTnx7H5O4N68gmOLw3bjBUC7HuNa4D0uSE1FmY1IYogoH2jRvdOJ0UiCcSG+
	17sGk3Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3TW-0000000GawV-3CjO;
	Mon, 03 Feb 2025 20:55:22 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3Cz-0000000GYNA-0RCb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:38:18 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 462BC25A8D;
	Mon,  3 Feb 2025 21:38:15 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5I_KCr3BtRJ; Mon,  3 Feb 2025 21:38:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615094; bh=BM8KTx7qJDDiJNeKHrn26vD1xnuMWeG6T6MPrixeQdM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TVK2qYEOgcBvPnVduuqKO16F+8W2m1ktj9lsZS3Kd4lmOG6N+lQX4Pd/jC+TSEiHy
	 7Z7we9AvNpC4Q+phR8ZXbTsWy1jR6LW/wAHD66HPeN+Hn4EQUxNFVYSDLmOmS0WB0H
	 iwqPkdXmZEeYCpycbfYKlZqswqg+WLpLvojrDghfeglwWkDrneBgHF41DwIFnWpJgV
	 jgfodJEf/L1Zjw9QTHX79MHmTBCXXudzcBJV4M5pWLRUkWqo6eVUm+pDEaxJzFrDud
	 lquSByfpPZNtIWwEPjlwtyFnnV6ZUkUrI1PIv+imiHcAm5JbcdFIlO/wnxelYAfwDj
	 5g3BYPwrlolug==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:07:31 +0530
Subject: [PATCH 3/5] dt-bindings: soc: samsung: exynos-pmu: add
 exynos7870-pmu compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-pmu-clocks-v1-3-a3030ae5bb53@disroot.org>
References: <20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org>
In-Reply-To: <20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615054; l=1048;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=BM8KTx7qJDDiJNeKHrn26vD1xnuMWeG6T6MPrixeQdM=;
 b=OjIsm7aAdxOvTanlynmTqzxSvjLH3a5d92aUfx5++D0nBr0+scRHxrbmOSA3siGz3RNBTVFmc
 1KyMHWBOpu1D/ps528NG78jotKdZ0OsillWdrDtMsKsSaoqorwKBRnC
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_123817_276248_92165826 
X-CRM114-Status: UNSURE (   9.29  )
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

Document the compatible string for the Exynos7870 PMU. It's compatible
with the Exynos7 PMU design. It handles syscon reboot, syscon reboot mode, as
well as other system control registers (i.e registers for the USB PHY).

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 8e6d051d8c97de0c843a91350a5cb9c332b2d6ce..3baee81df54981cb4c6502c1ddf5be3d5e3184c3 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -52,6 +52,7 @@ properties:
           - const: syscon
       - items:
           - enum:
+              - samsung,exynos7870-pmu
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
               - samsung,exynos9810-pmu

-- 
2.48.1


