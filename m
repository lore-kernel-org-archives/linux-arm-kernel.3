Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA46E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 18:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dZPvLSYqsp2e4dvW1UiVkvRzxdy9MDBk95k2d13Ob8=; b=nYkBK/chk45p2Tj7qqjZzOVuO1
	z2Sek+Wk3Q7/OjWJan2pwMocJW4qYnHMu55XE0A7///qhnMHzCxY0/rwSL0QmLrrXBEyiV7DUYFOm
	/mHaXz0tHjZXaXApjLLMys3SFAIo4j+Dc1rI52ximYVi/31m55tKK9lcRmYIy5DId+tjDLF/mLzHz
	F1WHty1LFe6u5shoY8gBT0rTqCIut9xl/SCuZXVeI2oiPVsoBvfi91ogVvxWxKvWETOp7B+I2BjWE
	Qe11f9YyVlGLLw6mbZpF9PPTKruRjNJPHhQaegpgxN7X3Ui995vFpFTe1giW1Abh1szI2o2xUtx6t
	RU5OanCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZv9b-00000002wiU-3r8i;
	Sun, 28 Dec 2025 18:06:07 +0000
Received: from mail-10626.protonmail.ch ([79.135.106.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZv9U-00000002wgU-0AEu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 18:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail2; t=1766945156; x=1767204356;
	bh=1dZPvLSYqsp2e4dvW1UiVkvRzxdy9MDBk95k2d13Ob8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XCYfBBnnYXG+yqqviTYcUFChcL4RopouZEnbMMPXyrEXe8wuc0hn++GbgQccfMUVS
	 b8725CZ6/vsdP6c/Yk1mOBlGQHP40y4imQqLgrKCb10UJnlgmXXpE6WK2o1l2n6Izn
	 zxOBf6S37vka3O8bCjtLjwosLm4msPSKJIdtz+WRLpAR5fwyO6VeDfX04I1PuWUMXH
	 49rrREZLkdsu2d25CX4wk0mPrwAIdGm7Akfqih4KSaQLHyR7chgqcj8O/J6W40S/2O
	 7/AB7TmZl6rX1bNe/yni/dBYv7Irth7for5Asy6krAUVN/cUDcY+3rPg3LDfyq9bk+
	 fGGLyd/LcrZSw==
Date: Sun, 28 Dec 2025 18:05:52 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
Message-ID: <20251228-exynos9610-pinctrl-v2-2-c9bbeee4c54b@chimac.ro>
In-Reply-To: <20251228-exynos9610-pinctrl-v2-0-c9bbeee4c54b@chimac.ro>
References: <20251228-exynos9610-pinctrl-v2-0-c9bbeee4c54b@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 170dc282ea45b580208235a243129e9f8350d46e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_100600_235351_6DDD601F 
X-CRM114-Status: UNSURE (   5.91  )
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

Add a dedicated compatible for the exynos9610-wakeup-eint node,
which is compatbile with Exynos850's implementation (and the
Exynos7 fallback).

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml   | =
2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wake=
up-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinct=
rl-wakeup-interrupt.yaml
index f3c433015b12..deb2730855bd 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-inte=
rrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-inte=
rrupt.yaml
@@ -48,6 +48,7 @@ properties:
           - enum:
               - google,gs101-wakeup-eint
               - samsung,exynos2200-wakeup-eint
+              - samsung,exynos9610-wakeup-eint
               - samsung,exynos9810-wakeup-eint
               - samsung,exynos990-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
@@ -107,6 +108,7 @@ allOf:
           contains:
             enum:
               - samsung,exynos850-wakeup-eint
+              - samsung,exynos9610-wakeup-eint
               - samsung,exynosautov920-wakeup-eint
     then:
       properties:

--=20
2.51.0



