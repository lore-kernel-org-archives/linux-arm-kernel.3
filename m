Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F065E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 18:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U84g9CNDZRq+0bG0puOFpJgmnKLOVSi6/RBHeipEFfo=; b=TyCwbppj9gvukgeKyncepbfnCx
	bKgBQ1JpCr0UrDo8lDVDNIrT81cI9vm/RIlpKjtW8XIfJKWKm4OMM2Mll3Zzf5gu3UTcyXpWpFl4X
	bOMh9vvo4TvKZvIx6N3xNuq6DvJrDgXycY4hWFtF4HMVGdEdkSSUCdn+orR1n/7B7KlH5bMa4oBEn
	0oDXwBonFTmiBdp9xCyBQInEfgvZLlWAbqkMkML1uTrf0LR9YEkpoohgKFq/QaluLj0Qxnvmzwcof
	McxYz753nng3GIR9P9MrUZS7oLMX5JD1nxNecRnhLc3W6jm+Ra8l8vqTFSCouQM8cSftF4HIpOXW1
	mKF74k+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZv9T-00000002wgb-2TPK;
	Sun, 28 Dec 2025 18:05:59 +0000
Received: from mail-4317.protonmail.ch ([185.70.43.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZv9Q-00000002wfs-0BGn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 18:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail2; t=1766945153; x=1767204353;
	bh=U84g9CNDZRq+0bG0puOFpJgmnKLOVSi6/RBHeipEFfo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=p4VeRfPnmuwbB/4/t5To9ZAYZkpxLHqjspeB/8+Bf6LRmIr7CX35SkKTfUDOdQckv
	 HCqPRSmX+uCd7bGDw6Grs6gTqBSNv7pz+O4dL/1BmL20z35VQKwZy85ITJVCouQgjX
	 G6dtKVY5dDxzgldrX29hL5qMT9v6q6MFcG/53CNZUjcPdPZRUsS3LFo3aRXMNlseDW
	 WReB/7iLp7VGW88p0FSLsqTYaHVQs33WPFFfwncMBhyVPlgEMoMa1R+3+A2yJYtc3n
	 ce1HQyfq4Uw2xNTh1DGfGdXE960FVsdeSOc8+QJ2tIEZHuIUwLkH5qxmDrz9baMuvr
	 Cj9yOTdYdVQog==
Date: Sun, 28 Dec 2025 18:05:46 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
Message-ID: <20251228-exynos9610-pinctrl-v2-1-c9bbeee4c54b@chimac.ro>
In-Reply-To: <20251228-exynos9610-pinctrl-v2-0-c9bbeee4c54b@chimac.ro>
References: <20251228-exynos9610-pinctrl-v2-0-c9bbeee4c54b@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 828a442cbefb8ebc3891c49265d0673f3cfed4fb
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_100556_668334_A149F867 
X-CRM114-Status: UNSURE (   5.79  )
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



