Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D618D1BDCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o57cy0VQNTsNQkz9JZQ7BaEVOyPNSHxwCVeyC0uw/HE=; b=ElOsY7BqRsG9zcrxJJdzHR12u0
	blgHoqpvm2MAYes3Czk0Z01QBZyF9PUpg8Ih+meMlC8w25sbkwgrk15j5qwS47Wh0+x5fDrzw2rlS
	WGOUEiPXI5qoc69ov0ll8q7RGIVpuDouWILGZAS39MPf6EH7HZYf8t0MLV412A1Kdz10q4eLM6VE6
	kYle6FY3yvUJaHYACwGLt5NarXzxvyTYotWHlkSPrAcS+85ToW006+651AqIjyQ6cHpeAuBR18tWl
	FP7WyMkF/RSLDOQCPLJRavNirt9DAW6FukbhyX4DhC8Q+ViLBEmD+vX3jWWFQnIgMz44WiHkVqTJD
	dKXAB5Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t80fF-0000000EUhJ-422k;
	Mon, 04 Nov 2024 17:14:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80Py-0000000ER7O-3Q99
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 16:59:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 25BD15C4C0E;
	Mon,  4 Nov 2024 16:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D4FCC4CEF8;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730739544;
	bh=lbNqtG/m96O1XxfWmwnamE8s0OXTLNk3DYJ8x3TZBJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OzcCOUvZLMo2VGgqdkqnOSzi5y2q96zXYMLeNdqAXYZwJr8IBvq908M9GVmksMm4P
	 zwpPOjlJxFbxfpRqpoZxN+MVu9osbUynUI8Vz+jzvI6YDbyi+BaJ0nBd+YfMMHLhGk
	 G4ai6zUPTqDNw42eyOZmeOuH8Fl2F7WTajzIzOGrCxAnyjD5FFvrnADMojog9M9gz1
	 fEimBNNKtLcYaczC49lHGLB80PrrOTsmJuaCaTHDkSiim0zYKiZj0H9JfFlLwvVF61
	 KAvZzgvMfuzv6mIBsYjPBEnRCe1rKkdCcDHTgsa944RNrS1AAhn/J+ZY+t9GkapiK0
	 Wlq2OwV6mcPQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D06D1BDCC;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Mon, 04 Nov 2024 17:37:14 +0100
Subject: [PATCH RESEND v13 12/12] MAINTAINERS: add myself as Marvell
 PXA1908 maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241104-pxa1908-lkml-v13-12-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr>
In-Reply-To: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=962;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=WJM+jdOH+cWyAFZLAoZ/ZBIMQFxb1HLmL8TqRXOMrF0=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDOkaf0MNPB6lPD7iNKF2s8Rsb+V5SXwSPWseiFx8wBlUV
 96w78GDjlIWBjEuBlkxRZbc/47XeD+LbN2evcwAZg4rE8gQBi5OAZjI1+cM/+z3NQT+mvjB6FRY
 smqTh0/i24+zdqZ+6H19a285Z8N1NUGGfxZSe/q2C+Q/r9+ycP1vvXM1K1a9u3S5fdGCJ86LVwS
 kz+QCAA==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_085906_991731_EBD54342 
X-CRM114-Status: UNSURE (   8.72  )
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

Add myself as the maintainer for Marvell PXA1908 SoC support.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c27f3190737f8b85779bde5489639c8b899f4fd8..8d50cb7457924e3290810eaf7d3c4b145d988ede 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2593,6 +2593,15 @@ F:	drivers/irqchip/irq-mvebu-*
 F:	drivers/pinctrl/mvebu/
 F:	drivers/rtc/rtc-armada38x.c
 
+ARM/Marvell PXA1908 SOC support
+M:	Duje Mihanović <duje.mihanovic@skole.hr>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+T:	git https://gitlab.com/LegoLivesMatter/linux
+F:	arch/arm64/boot/dts/marvell/pxa1908*
+F:	drivers/clk/mmp/clk-pxa1908*.c
+F:	include/dt-bindings/clock/marvell,pxa1908.h
+
 ARM/Mediatek RTC DRIVER
 M:	Eddie Huang <eddie.huang@mediatek.com>
 M:	Sean Wang <sean.wang@mediatek.com>

-- 
2.47.0



