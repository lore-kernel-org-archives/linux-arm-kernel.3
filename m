Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DF2C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 17:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDsWWLqPUfRptpzO3WEzv9fzJP/iNkk0NFEAozFtSgI=; b=fk9R/0m34nhqJur0ojd6w3RvlV
	b3e7SXss5mfSXXbnm6JqzSl//FLj5OlXJayMcI6CYQO7w4XfgMRsMvA98iGYnjYm4YSF23h2vVyl4
	RUQUCEBXDyh50Ic7FrI7Ras8U2hU2WI09jcoyOUtjj5HIeFFyznkC2FbF7Z0SHCZ4z1RTMNE9rcck
	mRYKlQU10367hr2tGmbFGlHLTpcCnAbGOsSt7AH576mRAbrGMXad+fSvaBEBbLjwcu0q4nLvaSqJR
	G7fWvRaTWEAxsn+CufCMbarkULC1/e7BsUPl9iZ9K8cyPRud5Zu9TCAJQ5xHRNx/bPHUbHVlHR/jK
	v9cgaXUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPfu-00000000F5G-3FqL;
	Thu, 16 Jul 2026 17:15:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPft-00000000F4P-2Eu2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 17:15:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EEA5341FBA;
	Thu, 16 Jul 2026 17:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2E81C2BCB9;
	Thu, 16 Jul 2026 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784222104;
	bh=xgTRU9NV8KIK7EesLO8Tv+TyYxZkVzU2UTJ6xlZVF6s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eLHDdwfgr5dknIUm1yMt+S08IKZ0HA5mxHIR6WakAvgCHB5Z+hqVMHmxx4n7um/4B
	 w327w3AQonOg2oXjYowClacTtE5DGvQp+3JfnBJjDJWpCHEI7q/KimEDyZ8+8GbOMv
	 9iDFynGsSC2UfCGOGl7pK9zxqveZNJILrjAuDzSoQ2UeAQSB9Prf7Uu3iNK8+oOkas
	 mtwniDw1eTFz9eqPL1qPAH9yfRsLrlSjiqrtsUORBnWZ2+xTl/W8JOrT33zQzLHlDF
	 50Y0jQFkubpLedkEv/oclvrzYB6zeryj3/+RWOVbsphcD2GqLn/EtUH7dxnUr9GYZ0
	 mAevjdJJ8FEGg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5373C44511;
	Thu, 16 Jul 2026 17:15:04 +0000 (UTC)
From: Alexandru Chimac via B4 Relay <devnull+alex.chimac.ro@kernel.org>
Date: Thu, 16 Jul 2026 20:14:56 +0300
Subject: [PATCH v2 2/5] dt-bindings: soc: exynos-sysreg: Add Exynos9610
 SYSREG bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-exynos9610-clocks-v2-2-c13ce8ef1861@chimac.ro>
References: <20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro>
In-Reply-To: <20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alexandru Chimac <alex@chimac.ro>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784222102; l=2259;
 i=alex@chimac.ro; s=20250914; h=from:subject:message-id;
 bh=nBnT0ILRGS71445iQQ/k8sTjno21gC0qcL7Lqu3ZheI=;
 b=eyJL+lvCIrT580llncY2lwuOiTuof9OLLqoKgpcwuIhWUyYPMVEpNiQeXWhVgcCQ5ZEtKHO3Y
 bCDkkfALh/vDE1+A8ws2ga5PCimKgrlxi8lO0hU6xOz9WMyTVG7W4Pn
X-Developer-Key: i=alex@chimac.ro; a=ed25519;
 pk=OKD+X09b7uEsyw05zyuqq14SLGg8B/X4xey5tJeYCig=
X-Endpoint-Received: by B4 Relay for alex@chimac.ro/20250914 with
 auth_id=877
X-Original-From: Alexandru Chimac <alex@chimac.ro>
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
Reply-To: alex@chimac.ro
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Alexandru Chimac <alex@chimac.ro>

Add bindings for SYSREG nodes (required for ACG), compatible with the
standard syscon driver.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index fcdb9ffd2644..eb4194cadcd7 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -35,6 +35,16 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos9610-apm-sysreg
+              - samsung,exynos9610-cam-sysreg
+              - samsung,exynos9610-core-sysreg
+              - samsung,exynos9610-cpucl0-sysreg
+              - samsung,exynos9610-dispaud-sysreg
+              - samsung,exynos9610-fsys-sysreg
+              - samsung,exynos9610-g2d-sysreg
+              - samsung,exynos9610-g3d-sysreg
+              - samsung,exynos9610-peri-sysreg
+              - samsung,exynos9610-usb-sysreg
               - samsung,exynos990-peric0-sysreg
               - samsung,exynos990-peric1-sysreg
               - samsung,exynosautov920-hsi0-sysreg
@@ -107,6 +117,16 @@ allOf:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos9610-apm-sysreg
+              - samsung,exynos9610-cam-sysreg
+              - samsung,exynos9610-core-sysreg
+              - samsung,exynos9610-cpucl0-sysreg
+              - samsung,exynos9610-dispaud-sysreg
+              - samsung,exynos9610-fsys-sysreg
+              - samsung,exynos9610-g2d-sysreg
+              - samsung,exynos9610-g3d-sysreg
+              - samsung,exynos9610-peri-sysreg
+              - samsung,exynos9610-usb-sysreg
               - samsung,exynos990-peric0-sysreg
               - samsung,exynos990-peric1-sysreg
     then:

-- 
2.54.0



