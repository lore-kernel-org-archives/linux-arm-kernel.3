Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7A9CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 20:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=48IVj5CqlyL/NG9D8QI6HlBHg921K6RZAXGHFBjc8Ec=; b=vtLrGkNj3aF4ItBzX28xTx+qRy
	HsqIdJ90/X96TKkTmRmlT1lErF+GyR35+TeD67Nmk+oA+gLZrUmNrvOaQvzJzqznER7OieEaA+FKm
	foRCrfiLvFiHjhGQP8inAh9v/i5g5bCj4nuTUOpm6isXLTxt04ss7V+Ixwu536nYuxWD0eQ8joOj3
	fK8zqbn7H54dzNfql0UtceqH7ht0L/FIakJEuQbk8pYN6KiNycpuVSc08zCv7j6r4nWLaRMdaqcPe
	NgVg7XzRyI3xQCQjv+2bEjgBzjVonXunddFxcvzDuHZ6YDv+3t/mmMOUBelpNEfZTtWnUDWXkHkxE
	9L16xNYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtZp-00000002B80-0qJQ;
	Sun, 14 Sep 2025 20:44:01 +0000
Received: from mail-4317.protonmail.ch ([185.70.43.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtZm-00000002B7X-264g
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 20:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757882633; x=1758141833;
	bh=48IVj5CqlyL/NG9D8QI6HlBHg921K6RZAXGHFBjc8Ec=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=PRuwwEqat2/bq4H/qR19mTbOp2JpcbAyiNXaeyACK4uBTDamAJzizfLCscIL3l8pV
	 Kj/1qUGyu5RHw/9rDv6TU1Q3Fdtx6ZpX92iXIvDqkBzHY7RBnoE6aAXRRRbcv0+V40
	 Kpw6GRaOX1nTsCbsIcJS0xARegl0P07a8JopJCP0E+JQdq/IHKDLLxOjly4EY6eLRc
	 3wS+SmJsx/gDQE7wyhhqS5jgEahnWC2HcemkLPr0N4aeYJBYAHaiviwSHH/emaZzMw
	 r268HycMr5wZwR1JfXFC94rutAQ/ve3Ouoowb7Vqo3nzPARTTp2w4COj4jjeeIrlS4
	 1WrFPEiR5Q11g==
Date: Sun, 14 Sep 2025 20:43:47 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 0/3] arm64: dts: exynos: Add initial support for Exynos9610
Message-ID: <20250914-exynos9610-devicetree-v1-0-2000fc3bbe0b@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: c4ef3fb25bbc20795872882f29db89dd9add1fbf
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_134359_150995_D9208728 
X-CRM114-Status: UNSURE (   7.22  )
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

This patchset adds device trees for Exynos9610 and Galaxy Tab S6 Lite (2020=
).
The primary method to boot mainline is currently via uniLoader (at github.c=
om/ivoszbg/uniLoader).

This patchset depends on the following ones being merged:
 - 20250914-exynos9610-pinctrl-b44cdfaeeed1
 - 20250914-exynos9610-chipid-b7c1600dbb92

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
Alexandru Chimac (3):
      dt-bindings: arm: samsung: Document gta4xl board binding
      arm64: dts: exynos: Add initial support for the Exynos9610 SoC
      arm64: dts: exynos: Add initial support for Samsung Galaxy Tab S6 Lit=
e (gta4xl)

 .../bindings/arm/samsung/samsung-boards.yaml       |    6 +
 arch/arm64/boot/dts/exynos/Makefile                |    1 +
 arch/arm64/boot/dts/exynos/exynos9610-gta4xl.dts   |   97 ++
 arch/arm64/boot/dts/exynos/exynos9610-pinctrl.dtsi | 1180 ++++++++++++++++=
++++
 arch/arm64/boot/dts/exynos/exynos9610.dtsi         |  263 +++++
 5 files changed, 1547 insertions(+)
---
base-commit: 48c4c0b684f394721b7db809e1cc282fccdb33da
change-id: 20250914-exynos9610-devicetree-221da550773a
prerequisite-message-id: <20250914-exynos9610-chipid-v1-0-ade99e09a23c@chim=
ac.ro>
prerequisite-patch-id: eb6590750a81953810a2f29d48131b5da055a2ed
prerequisite-patch-id: 11416958919ddfe096ba3a7c866173ee0b288fe3
prerequisite-message-id: <20250914-exynos9610-pinctrl-v1-0-90eda0c8fa03@chi=
mac.ro>
prerequisite-patch-id: 27e949ada132a43ba3dbf880af3e6168ec94eaf9
prerequisite-patch-id: f446d396d0258709db47aef69e68821eb72582dc
prerequisite-patch-id: e3bf016be9509ee79beb3d51907ef6cd58fb98b1

Best regards,
--=20
Alexandru Chimac <alex@chimac.ro>



