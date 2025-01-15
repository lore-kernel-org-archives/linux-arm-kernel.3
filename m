Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBC0C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 21:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knnUrPQKHRkEFTnvLTsr64VowbHDBwE5WIb2t1N/50I=; b=ALSZkn+Dy2qxpowaRFx8yMNJf5
	MchHcHLHC3hKjT4vKGu7bvEcAbKaf7PVCR+PJK1g9291Zyz1mMDNTefk6z6JIZWrse/5GhRJQbIKR
	PTLeTKvoo6LnzaRfkb2kMNuBoEGiNsOBIUlOWGGAWZ8a+yKWt3c08Sq3AhWQR9+vy6ToJkitLTcNB
	yrF37W9UIoR99d3rq1tvYQ2sbiIMWXK39Cg2I9sM6a33rfZuw+xBduaAkwQDH+Wv2fu4RVw5NOzZM
	c/vsWSNpSxExLyCmGkQMaBir+mzTl9Y1qMcs9dZr52cBHilZA5UJrN9hxgzlwqk2vfGyHgrk/B6Rh
	guU9abdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYBEf-0000000DBzV-4B46;
	Wed, 15 Jan 2025 21:47:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAAx-0000000D1Id-2hit
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 20:39:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4359E5C5E69;
	Wed, 15 Jan 2025 20:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24214C4CEE3;
	Wed, 15 Jan 2025 20:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736973582;
	bh=S24MD3SBevIt2dRAtCZr/oqf5iX/z8SjGn56Z9kvxvI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kfB1VNqaqW5d6p3GY4uD4h0fV6AOVnzht+YjMcDpw127QxamIw/9M9T/5+rdI43pH
	 gbk8YrHVGCuE9oBrQhH3uWe6xSZ4FXzUKjdKfBtBInJ1pyau1VCPAftNwnM+ZmaHWS
	 d3rullgOwNlYR3pJDNjMQ9BGLCZ5ylEbdo+14aAlwxCJK53tnE8RFiLOOJe1rtMleq
	 qLKMregN6wTwSphhmA77nuiybUHTu0B2F+t1uaGhIj5Zufr3Trkx+2CSBpmI+O+M7j
	 OT6n2+TJES+tytxKlvOetzUnp2wWgR+Viq+S7rzRzvHGt9QrI1gwrysFEefV4hN7Ov
	 VgyRYMNnXqRMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12265C02187;
	Wed, 15 Jan 2025 20:39:42 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Wed, 15 Jan 2025 21:35:55 +0100
Subject: [PATCH v14 2/4] arm64: Kconfig.platforms: Add config for Marvell
 PXA1908 platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250115-pxa1908-lkml-v14-2-847d24f3665a@skole.hr>
References: <20250115-pxa1908-lkml-v14-0-847d24f3665a@skole.hr>
In-Reply-To: <20250115-pxa1908-lkml-v14-0-847d24f3665a@skole.hr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=911;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=L4rAAiuF3LliFg2oZyZT72q8jatVvRyWRhUILvNsW0w=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDOkdsjyTkp5939WR62SbpmCdF9Wrq5b27kryiieVN3hF/
 mjucK3pKGVhEONikBVTZMn973iN97PI1u3Zywxg5rAygQxh4OIUgIl8OczIsOj4qrOnLybdknZr
 fr9B6u5JloNp7EdOzuPI3z735YRvvlWMDGtEpRiMOn3lOja9C17kY/N2lZOrKZ9MfuOLt8m9Ey4
 y8AEA
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_123943_771070_9AFE752C 
X-CRM114-Status: UNSURE (   8.94  )
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
Reply-To: duje.mihanovic@skole.hr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add ARCH_MMP configuration option for Marvell PXA1908 SoC.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 arch/arm64/Kconfig.platforms | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 370a9d2b6919d24d6c7111b95bb69a51bdf64e5a..ff9e3c3d5dd4636745b8efd79feb6706c76ec989 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -175,6 +175,14 @@ config ARCH_MESON
 	  This enables support for the arm64 based Amlogic SoCs
 	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
 
+config ARCH_MMP
+	bool "Marvell MMP SoC Family"
+	select PINCTRL
+	select PINCTRL_SINGLE
+	help
+	  This enables support for Marvell MMP SoC family, currently
+	  supporting PXA1908 aka IAP140.
+
 config ARCH_MVEBU
 	bool "Marvell EBU SoC Family"
 	select ARMADA_AP806_SYSCON

-- 
2.48.0



