Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A73CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 19:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	Date:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lpOnihuzgN8aXgYGmo1vFZZPGJlskHF0+CRgoIdYsg=; b=WdUUzG8IjuX5PXgjLc1Tx1CEVX
	SJpITQw93EQZm+fAUBupLHQ2VJ0GCcJhTM2wr5PvLIQozNGdJTMwAeZjYVJRG7OXjx31Wbqjx2vvb
	2LsSse60iG+lolCScDAyGe/mr57wAY6Ybho+wIPUhCegbI/NMkMlHGn4BREFGYO3fiZxGSRo512HS
	lyVdwJR/FC/oADnNTzoQbvyj+163/U2PISyKZBVeIbH5YZG8YJ5b588Ie7hQTGclbOq+vboJRt/Ak
	nBjsbii3uYhhwi9LMvmN61rcJzhxC2hwAxvrFlVorNc8ysJZ/TmkvDLt67VzA1Iw5vBa01T17r7k4
	l8tAaafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsSL-000000022th-2Tyb;
	Sun, 14 Sep 2025 19:32:13 +0000
Received: from mail-4323.protonmail.ch ([185.70.43.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsSJ-000000022tH-3SO2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 19:32:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757878328; x=1758137528;
	bh=7lpOnihuzgN8aXgYGmo1vFZZPGJlskHF0+CRgoIdYsg=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KYz3YJNCQf7EePMd5eoDtgjn1HULYv4MJteOCyQneSINTVQNMtPI7EMTOBafoovi/
	 IZkvH3E1Xpc9mMNeMBO5Nzh156176PIChR5B/ibkRfHSksXfb8fyZ7jRH9GQydgoLJ
	 j/2gse+ef29E5TqlKkzclMAwiRQCAX+xxpy9YSD2di6KZE/NgUXjzPW7ggwt+lnGQM
	 IehuKetoA9MxXK9LqxYsqt00fjkdTOBcMV1kR1pWqwM+f0x4xO424XEr8nd03QkNU5
	 1TBlUZ6bBctn1APx+XgJq3DSGhckYoyYHbSztLywsiRmz30oiS94k0TFYZSpyn+feU
	 tinHhojYE34BA==
Date: Sun, 14 Sep 2025 19:32:04 +0000
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 1/3] dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
Message-ID: <20250914-exynos9610-pinctrl-v1-1-5b877e9bc982@chimac.ro>
In-Reply-To: <20250914-exynos9610-pinctrl-v1-0-5b877e9bc982@chimac.ro>
References: <20250914-exynos9610-pinctrl-v1-0-5b877e9bc982@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: c2dd42e13741ea2a0c5e007de82694ad671e68a0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_123212_007017_9F7E6488 
X-CRM114-Status: UNSURE (   5.50  )
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
index de846085614166087ef9046cf5d154fb9dad8309..2ebe9353d3bff9f708118a249b5=
e969aa5fc393f 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -56,6 +56,7 @@ properties:
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
       - samsung,exynos8895-pinctrl
+      - samsung,exynos9610-pinctrl
       - samsung,exynos9810-pinctrl
       - samsung,exynos990-pinctrl
       - samsung,exynosautov9-pinctrl

--=20
2.47.3



