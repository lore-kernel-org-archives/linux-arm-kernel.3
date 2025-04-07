Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4C9C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GA7zQOtY0NZPKydrb8E1yaistejIqiu3v15jSvILsWI=; b=WskYwYkYqEWlpWpuqyBwdlB6Y5
	a12x6+EanCkyP+DQIOVnVqd9jgTiwKspOxQGDplt50o//QMxR8qA7CkJ7OA9XobabcQoDNacW7ra5
	zAmlP/zX+TujGP/Sze/+fY+UrD44fZ8T/KtoDCfNsG0X6dL3ymh6ktBd4PCn6cysH4O2mj5LC2bJK
	DLws26VTJH+3MmLM6yNiac9k7CMVZ6FIP71U0E3+b+uZZoMjsmbgIvi2udvlc1SftSXlamgI3W+2p
	nly/jBeILDd5kgF2lGlToQeygdVfUwVZdL19/hHBE47pGPhTX7ZQtVEfPZUxQ1gJNhEEOwat9Kw4V
	Qt1MiBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uKP-000000026x9-2Hzl;
	Mon, 07 Apr 2025 21:48:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1sgg-00000001uQk-2dBD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 20:03:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8CC72A4859B;
	Mon,  7 Apr 2025 19:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5567C4CEE7;
	Mon,  7 Apr 2025 20:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744056196;
	bh=0dXeYBgh2L/3HBCx8wBbRUEktHByls+slsnYn1cPoLQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tP864Is+ECnZgZN5lojekala04Fer7qjBOnPDavxQp+7o9ne+yo+EvrdQyMXBbZC+
	 4Ku7iEUsKABWuKDoEbLCZoAR7jPtwup/G53VcAy8baYqKhX/8PQFRdJ4MDt8w0KVRD
	 Uaz6eVUHhwIwMy+8YeGjfeK0zt1/NuBaMgNIi5oy63dvGTuLnacZ44Gf0+/hdivceo
	 JkXr41VjV82sPDAnFC/XCjyysAcGUzsmp1WDnlOWONzQDXcwkU/UIO4lEqsXs/o14D
	 AGabdcnnE3ZcOWSfgxuVRMskkYJ+mcldiX38DybpAfbnaLqFmJzIvKUOMvg6d/lSSg
	 qrxW5LwlyPthw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3842C36010;
	Mon,  7 Apr 2025 20:03:16 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Mon, 07 Apr 2025 22:02:13 +0200
Subject: [PATCH v15 2/4] arm64: Kconfig.platforms: Add config for Marvell
 PXA1908 platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250407-pxa1908-lkml-v15-2-e83ef101f944@skole.hr>
References: <20250407-pxa1908-lkml-v15-0-e83ef101f944@skole.hr>
In-Reply-To: <20250407-pxa1908-lkml-v15-0-e83ef101f944@skole.hr>
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
 soc@lists.linux.dev, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=5u1dvhpQmAFJynb0nujG0E7sr3ZjMEE0fab61FCV79A=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDOlf9BufeNXlyz9fOGuOref/9/2XRcx8Z6deTe+0WFb6L
 FGvRb2/o5SFQYyLQVZMkSX3v+M13s8iW7dnLzOAmcPKBDKEgYtTACYS8YeRoX+xnbvEcpaTK6dd
 6bjNdubcbD42l6M7ijLSDa790mRMbmVkmG+5odDxb9Trhas8bvyXUm03UlrzmP1MS/jL6flrVcM
 vMwIA
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_130318_790147_D3DC72D2 
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
Reply-To: duje.mihanovic@skole.hr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add ARCH_MMP configuration option for Marvell PXA1908 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 arch/arm64/Kconfig.platforms | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190fcf5cbb5db3a5de211279c23c2c59..858ccd72eb353ac31164a845cce1e1349e9c996e 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -178,6 +178,14 @@ config ARCH_MESON
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
2.49.0



