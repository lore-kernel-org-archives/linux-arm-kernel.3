Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97617FA372F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 11:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjdFgLhyI2gKa4FyGQgRrvSM1TJIstHiEd/eY+0jaDI=; b=ZBiTpreu9XKW8g5uzXRvRICORl
	ARSICa2SCG9ZDXBlzmjQCTfY1Q9GID2sySnLJSFrfsfOm1NjhLblmTuyJgyU0ZplEMDexEC18sbYl
	EyzxB9JOlT8tmqxqqYiddGggEaEBSGAfJuk33af088HZeh9IJ9YUA+Aayy7KxEPwtrMl6C8SgHYUn
	BwpHDslS6NhIgniEAlLD4DVn2Unkr6i/rkZEZlWtDOIcM4CnhAZndXx2vLDDQ0CD+xknQePdB3J+n
	nDksTDkESSzWvKFmWypttsE0TVMysHkO0eo2HGDV7KfuJ+PL6WaUzSW5lvAYm8Jw8JNQBplzAhf2m
	fkgJsqBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdLx-000000088N9-3hXU;
	Fri, 02 Jan 2026 11:29:57 +0000
Received: from mail-4320.protonmail.ch ([185.70.43.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdLv-000000088MM-3OLb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 11:29:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail2; t=1767353393; x=1767612593;
	bh=sjdFgLhyI2gKa4FyGQgRrvSM1TJIstHiEd/eY+0jaDI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GMlYpKceZo+pkQUh8HthkRuZsxDUuHDCptD7zEFtJdxeWcmsh2jXqQzg2fyUoRSlw
	 Kq6G53sItOUSFBwHA7TgiGbfnC0O5prq4js2x++thLwIjIut9/1GgkLP+05A45z2Jy
	 bC39PMi7xikzIXdt9YNGd3qh1nVwvGqcmisuzBOpeQd598h5OqEEyC+2z7LJGxxT5P
	 7dWE9vGv3bhpH+lpUfDFuZUj/MYyh0Y0H6ykLRIUPUJ7jlQaTp1EOml/0fyFZke/8z
	 xj7LYLs2RUq/YU9oGlNQR76T9B/FoKFXJxUdWYFnSGYK3cFZX0QzNB7lDmfYPX6O+9
	 lluo7jBAk4OtQ==
Date: Fri, 02 Jan 2026 11:29:49 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH v3 2/3] dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
Message-ID: <20260102-exynos9610-pinctrl-v3-2-3f21f2cfb651@chimac.ro>
In-Reply-To: <20260102-exynos9610-pinctrl-v3-0-3f21f2cfb651@chimac.ro>
References: <20260102-exynos9610-pinctrl-v3-0-3f21f2cfb651@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: de7b0ffcfcdd03ed139b527265085e60d44ecdc2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_032955_994364_0B90B18B 
X-CRM114-Status: UNSURE (   6.46  )
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
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml    |=
 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wake=
up-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinct=
rl-wakeup-interrupt.yaml
index f3c433015b12..2b88f25e80a6 100644
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

--=20
2.51.0



