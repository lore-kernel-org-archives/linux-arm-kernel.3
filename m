Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD34FA372E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 11:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U84g9CNDZRq+0bG0puOFpJgmnKLOVSi6/RBHeipEFfo=; b=aB5WjDBD0rOonnvL0y1L0XGMhN
	ES3WYhvai/NS4M9do+Y7lUN8xIwsrz6kO7Xq3shZwXfD9XQMcpZqQh9PXJJWUj2gU7a3azW0k5Axu
	xeWpuYkdlT2mjv1GAbvfgHrzBqROshz1iDnT/9nRdywJo26pJwyN2lzgTa18lbohqzyESYwdJm8r8
	ofE1iSfLb8L8lLb4+E6qtcJdDTcs8gcjTbneXFK/dqFwZS1nGEg8sAHaa0uSJiSq83dtyMGWND9Qc
	r6DsBCmfdLzuwwcpANvRAduxqJYP0rVn3CNzkJ9MoYdArJfEaZnLBsfoNyEby900bulCE+HzBwCyy
	nbrEt/gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdLr-000000088LB-2SF8;
	Fri, 02 Jan 2026 11:29:51 +0000
Received: from mail-4323.protonmail.ch ([185.70.43.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdLp-000000088KB-0FiS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 11:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail2; t=1767353387; x=1767612587;
	bh=U84g9CNDZRq+0bG0puOFpJgmnKLOVSi6/RBHeipEFfo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=j5kWh/o+0+T62O1HHPuRKqTlWBnZ7T1/yY1NPTZoOWijpYTvujeB1OOaGqdIRTnyP
	 NPL12A+T3OHyLNzV/WHoCsEnqcoSa3WSydSIH3ynL0f5ltGm0IByP38YB/Ye7PZ4O2
	 rjoF2JIgepgFXGR0LrQvyuDsnc6weI7XdGA374ikfVm0CMTU12B37ox0DyXfH1GhMl
	 O77lyvR4DHHKm8ekhaFhyAq+0inHeZDxLZ9Alj2QugYEzWspr8YfXnBDgBfguwxsTw
	 zE0WJFpPj7PvnUd7RpPcC3zKfoUtc67+qrOBQBi+4PMt33FWVJmrLulCQ7BEIFhUN+
	 vSQsttuXzlFiA==
Date: Fri, 02 Jan 2026 11:29:40 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH v3 1/3] dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
Message-ID: <20260102-exynos9610-pinctrl-v3-1-3f21f2cfb651@chimac.ro>
In-Reply-To: <20260102-exynos9610-pinctrl-v3-0-3f21f2cfb651@chimac.ro>
References: <20260102-exynos9610-pinctrl-v3-0-3f21f2cfb651@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: e38b12d8d708fa3d0c650eecc1e5645b0f2af9fd
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_032949_235040_FA36D9E4 
X-CRM114-Status: UNSURE (   6.73  )
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

Document pin controller support on Exynos9610-series SoCs.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml=
 b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index ddc5e2efff21..7b006009ca0e 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -55,6 +55,7 @@ properties:
       - samsung,exynos850-pinctrl
       - samsung,exynos8890-pinctrl
       - samsung,exynos8895-pinctrl
+      - samsung,exynos9610-pinctrl
       - samsung,exynos9810-pinctrl
       - samsung,exynos990-pinctrl
       - samsung,exynosautov9-pinctrl

--=20
2.51.0



