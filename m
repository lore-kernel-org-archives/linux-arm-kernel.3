Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8217CF55130
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 05:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyQYqF8dm9dm7F4KAv5Bd3+xVsMbty6DU/nWv1RHZ2Y=; b=H/acOJqimUR2sKnzFTLCUEJqJx
	GYjN/oyqKYOXg2JMq3ycHzfcSlUJ0cYpT3PsihR2G4RDcmn0G1LymQ/fDfN8nPkiP+AedlBGXKj83
	6lcN4hJZbZJR5Qe7BVaPYb9FAN8rFkBS/O1535WvyWWHpHtb/O3IWEwsKLoE35lAWA8pE77L6vXIo
	w2MVdJ3v+9t6I19oAra4ColrVGCx1SPjfYVu/EwnZZMkS8cyfEqR6Xqncu3VdGtACXmnRMHutSi1F
	36BNEhvKsltqLHHLV+fWydKSea6VnHq+InjwhQroBOo8o7b4swJYhJFKUxs1fCdn3dN0DYWXcMPfG
	AJuq8zVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz6We-00000005iaC-1TwJ;
	Sun, 08 Mar 2026 05:18:00 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz6WV-00000005iXr-2grr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 05:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HyQYqF8dm9dm7F4KAv5Bd3+xVsMbty6DU/nWv1RHZ2Y=; b=Sypk/RGmy/2OwnJ2n/6Z+dG65n
	y6v+fRnPmZFOzE3mRDOcVFGPjlAUQCK+CXZoLHlzUG8YaJKuV5MKMHuVWsf5+d0lG/mJti0J3t7UB
	kyO0vOXf9CwdSjEfpcYSI7jkZExSV4Hb+4gHYYHISvM+KoTzMdzUpx1RqIgsUpaUVf2wUvvskcgxu
	YQxdroVSytfyVXLcJmPj8bHNOVuXPmtevtBU3sLfJECcUNQdTPFCcUhrasYfaV5Uy/sMl1LPTzHrB
	rrmhYPLjjUpG4yGmj8npSvLTVCjkaVl7/E4iFl9FOYJF7APY3izQnfaIR2oFKaMyd9IBKNVc7mnQp
	7fGz6oAg==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1vz6WS-00000007XHz-3Z9X;
	Sun, 08 Mar 2026 06:17:48 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 08 Mar 2026 06:16:52 +0100
Subject: [PATCH 2/2] arm64: dts: allwinner: orangepi-zero3: fix axp313
 interrupt parrent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-rc2-boot-hang-v1-2-d792d1a78dfd@mmpsystems.pl>
References: <20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl>
In-Reply-To: <20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772947022; l=1582;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=wRlY9EhqdoRo+41ZkIEaclvfQ9HpOHyVOUVlbpFpXv4=;
 b=pbuhMCrHOMEGAFSJbb1V7QGKXHtzhaT91KrYMOK1Yfr+uWNG9ydw6rLmkbfTUUUSU5gkE91BA
 MvPVAonUMA3Al7zj34PPrctkWCcldNR42mfies4N8cZmEt011I+XI2d
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_211752_345418_53D31C05 
X-CRM114-Status: GOOD (  12.78  )
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

The AXP313 PMIC interrupt on Orange Pi Zero 3 is connected to PL bank
GPIO handled by the R_PIO controller. However current dts routes the
interrupts to PIO controller. This causes the kernel to select wrong
pinctrl instance when configuring the interrupt which leads to invalid
register access and a kernel hang during boot.

The problem existed previously but became visible after the commit
01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()"),
which causes gpiolib to call the gpiochip::get_direction() callback
during interrupt setup.

Route the interrupt thrpugh R_PIO so the PL bank GPIO is handled by
correct controller.

Fixes: f1b3ddb3ecc2 ("arm64: dts: allwinner: h616: Add OrangePi Zero 3 board support")

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
Tested-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
index c51d4d9120de..c46ae00aed5c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
@@ -48,7 +48,7 @@ axp313: pmic@36 {
 		reg = <0x36>;
 		#interrupt-cells = <1>;
 		interrupt-controller;
-		interrupt-parent = <&pio>;
+		interrupt-parent = <&r_pio>;
 		interrupts = <2 9 IRQ_TYPE_LEVEL_LOW>;	/* PC9 */
 
 		vin1-supply = <&reg_vcc5v>;

-- 
2.43.0


