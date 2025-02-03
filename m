Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D44BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 20:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYTcezqqMHGsQW1T0r9W+x/nF9+RNpHl4Ek11Ef7Zd8=; b=ZzNgSyzfh5vmanNdNixsUQxJUo
	v2QNx60kRbWTaHsa0Qc+QoClPiJxz3BeqJ/gplPkte+Xl6EpgCfhI3s8OTKOwgUhtANMh2ehXjEl7
	qn/KWr3h33w6b5PmDiLprizA9ysKrXkq9vnflE+k1+gXmkIQSrnx75V9OAJWAWRcxq/QpJAX6E/K2
	9cUiHIppJ25rAYzzV53ZQ/kAlI/9tqXZRRHo4+o01eWn0s93vaQ0fvkit+jVizjfl1VcMAdFke08g
	agGySOvm7ayDdrINAwgWNPR8IOtNQiZb9LHqTz7VLwqdGnyoCp8B7HLvAfY9DwH0YP979yU/W83kd
	8/jRvk8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3OP-0000000GaYJ-0DId;
	Mon, 03 Feb 2025 20:50:05 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3Av-0000000GXyC-2fAL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:36:10 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 54E9C25684;
	Mon,  3 Feb 2025 21:36:07 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zVheoC5DaF4; Mon,  3 Feb 2025 21:36:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614966; bh=pTia+u3Qvys/ex4MXczIOi+zNSqm6TYCEnBUzRrxlgI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MJUesXJw7tSBGYyu5TNIYiieu5RrMS9Yi1nJ7NtBN0Gdr3GLZc8cWGmnr0V/CTOKa
	 TmaCTKsvwM/XD220GxhcvSyWH11lyQRh1L2QIbgQBkrZp9wr+YQ8JQYDQ0XzYhi20S
	 +Adcy784fi8tIX+fRpq7zgV1Y61EVnLUmwXuR4qc0RVlVPNMxtbaEi83QYNHYuXJL3
	 biP+dUE736rv64xUlgWOjTxdDpsbR133JQqXxJac0wgtfXvOpfqvVoXHCzHkQirZys
	 j/XnoOvTvfBsGy8rALer60sIYcY0Lj/GvH4CUMc8rmWd9WJk7gy1Tf3bxQeoRpZq3I
	 +Q/jhDwAwi1lQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:05:44 +0530
Subject: [PATCH 2/3] dt-bindings: pinctrl: samsung: add
 exynos7870-wakeup-eint compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-pinctrl-v1-2-77b9800749b7@disroot.org>
References: <20250204-exynos7870-pinctrl-v1-0-77b9800749b7@disroot.org>
In-Reply-To: <20250204-exynos7870-pinctrl-v1-0-77b9800749b7@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614951; l=1398;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=pTia+u3Qvys/ex4MXczIOi+zNSqm6TYCEnBUzRrxlgI=;
 b=olnP1Y4oI3gf3mGWv3FtPR8yFDUsBNbKiAuekEr3pdxZGdsD/cokxlst0Lnw/9/U3Jv+8nIuj
 QPdt+WU/MMyAkElHwWZCZGcVE719juYukYdQa082WF6X8G9J5+dXEwH
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_123609_806032_5AD30E46 
X-CRM114-Status: UNSURE (   8.95  )
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

Exynos7870's wakeup pin controller is entirely register-compatible with
Exynos7, thus document the node for Exynos7870 appropriately.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 68ed714eb0a178c46228bac142d69bbd6baa6277..bdea42a19a1d32e5e08086032c58e7a1fd9999fb 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -40,6 +40,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos5433-wakeup-eint
+              - samsung,exynos7870-wakeup-eint
               - samsung,exynos7885-wakeup-eint
               - samsung,exynos850-wakeup-eint
               - samsung,exynos8895-wakeup-eint
@@ -104,6 +105,7 @@ allOf:
             - contains:
                 enum:
                   - samsung,exynos5433-wakeup-eint
+                  - samsung,exynos7870-wakeup-eint
                   - samsung,exynos7885-wakeup-eint
                   - samsung,exynos8895-wakeup-eint
     then:

-- 
2.48.1


