Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738B0C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYTcezqqMHGsQW1T0r9W+x/nF9+RNpHl4Ek11Ef7Zd8=; b=1p48Md76SZMB5j/PpIA2zsP4zE
	Y0EWRFAzQ9pqzBbhpSUklIuBSc0PSObiZimM8t8DndfATLDRy02Cx2xdgJu9FSq9OCJ1OKflSMjTZ
	iDKQ6ngH2rbme82ztT/PhcsG77vAjkD6yd/CMfGoG5gdKCujyvNg1va9/A/dd6K/RlOe6Jv2iaDds
	pEEb5xYFYz5PcPTdIze3UaKSJclP1LSpIRjOGKnm07v9M+iW/ru6hnntjo4C07CpcgWSlOCKJ5CLk
	B6bR1HBASP6VHIhZtgEMy+CRekAO+QKKemhz/FBGmPyDTLJmlga9HWIe8PERuWD5IOxZoeeOxPaf9
	bPviLG4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSxK-00000009VUE-2E49;
	Tue, 18 Feb 2025 19:08:30 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSev-00000009Qc1-14Br
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:49:30 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 113E225F6A;
	Tue, 18 Feb 2025 19:49:28 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fdB9-krv0OKQ; Tue, 18 Feb 2025 19:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904567; bh=pTia+u3Qvys/ex4MXczIOi+zNSqm6TYCEnBUzRrxlgI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NNezTCii/tCr4fzDbucVG6Fizowk/9xj7ZsOygjp77N9wxe758V5015wvJM9GQkaI
	 Kvi6sC/BP4VhR6RUUeqjh7P450VN8eyF0b20XHZBsIG0V73/7ek0B/KBJwrW3+xyur
	 FB/0m6odC5KNFkDvyoz+lEkMlqb/u4fjdLNYmlcOUJvaMy3N8V7rFnyuZlpKwOp2au
	 fOG2f6vMxhC47s0+HO5B4t3mZfLGW8osD2LqarcwbFsI1WAscBAyMETJZLQlOx2rYF
	 SJzef+35a6U2fWWyS1e6S+ktvH9cejhKZ9Avf9H6h8X0pcYkASG8NvX5DyWN9WUmfQ
	 fa9Z7XymyHiqQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:18:58 +0530
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: samsung: add
 exynos7870-wakeup-eint compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-pinctrl-v2-2-1ff9b10bf913@disroot.org>
References: <20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org>
In-Reply-To: <20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904552; l=1398;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=pTia+u3Qvys/ex4MXczIOi+zNSqm6TYCEnBUzRrxlgI=;
 b=PiYEnBJKqw3NKqJJThgBYRA4dMnnXZcSOLjR1fuN4tkAiDfhlBZtk/WDEq5YkzpWmYQmOzsj1
 SAB7f3gU7LFCyev6QgGy6K5pMxj8bhnstAvL1o/y2OuuDTDuUJNa6cS
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_104929_433901_8B2EBF25 
X-CRM114-Status: UNSURE (   8.91  )
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


