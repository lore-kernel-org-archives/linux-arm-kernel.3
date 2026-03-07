Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B498F55111
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 22:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:From:To:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ww15vaTJjdZ7MrV/BXZpR/uprbDnj+9QEvykXyyCvbo=; b=JCDFl2xm753N6ppV9yeOdkKycx
	f3KJAPzDDKqe+x3fZ9VtyXHUre6z9oF2uU3klO6+JAK1XDIBLyF79WRNOuadi3kIKefXOrTZyg/Ir
	x1t4fNxIiGe2iVcT5wwdunWO0t0+jmw8lp/UnoSJqB23JCQ00cYT+/znomZWzaeT/YPERe1EZKcOi
	LrR5qyNUkYJQA2/mXCrRv20tu9ZV+PJRikPm5/lSfJgEaJyBZ2NGp0dCvgv8yVAbpAVC+CfyQp9mN
	eILrsag2jRndxvtbUjtZhl0KTDrDkW2RiDK1AOYAkzj0DPsWD8B+RZci+mxv4n4KIakXZ79Q57IaK
	Lo3Eb8rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz09O-00000005YBS-26ob;
	Sat, 07 Mar 2026 22:29:34 +0000
Received: from mail-4323.protonmail.ch ([185.70.43.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz09L-00000005YB6-044V
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 22:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flordal.net;
	s=protonmail; t=1772922562; x=1773181762;
	bh=ww15vaTJjdZ7MrV/BXZpR/uprbDnj+9QEvykXyyCvbo=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=wQKDI2aLIaPjAENuzYajsCNO+yQsG0RO9Jv0tNEXkcUldxfkYXaPTowrzziI8z+C8
	 JGPoSynx1T/tfCxMLmb+RHiKBYakgLvBf4/A+QFqMzCZyRDnFCQM1i43FGDNtEKJfX
	 v09yqnphxPan7UCn56A4kPeJeTiiuRxq/R3jQCtbC1OZy3q+fN7FuFDMPqN18a0Iv+
	 pyXsD2wKss7nyoH/k2/P2v93I0erGYoJAAACfxY6kRLiLHEBqIQ5twYXceCysPOBOR
	 8ncvifYcva65FuV0zJ/58w8O5SErSqOowoL+2/GNbwzfPxHR18dMe5f8dHnzuhMlPh
	 zTB3OhpeOYrkw==
Date: Sat, 07 Mar 2026 22:29:17 +0000
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
From: Axel Flordal <axel@flordal.net>
Subject: [PATCH] arm64: dts: apple: fix spelling error
Message-ID: <2838895.vuYhMxLoTh@fedora>
Feedback-ID: 166586150:user:proton
X-Pm-Message-ID: 9ac85a73064bd3323c4451d6f38cf526ec28ef2f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_142931_960064_76CE190C 
X-CRM114-Status: UNSURE (   7.13  )
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

Change "configiguration" to "configuration".

Signed-off-by: Axel Flordal <axel@flordal.net>
---
 arch/arm64/boot/dts/apple/spi1-nvram.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi b/arch/arm64/boot/dt=
s/apple/spi1-nvram.dtsi
index 9740fbf200f0..d2720b307774 100644
--- a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
+++ b/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
@@ -2,7 +2,7 @@
 //
 // Devicetree include for common spi-nor nvram flash.
 //
-// Apple uses a consistent configiguration for the nvram on all known M1* =
and
+// Apple uses a consistent configuration for the nvram on all known M1* an=
d
 // M2* devices.
 //
 // Copyright The Asahi Linux Contributors
--=20
2.53.0





