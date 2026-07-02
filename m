Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5243C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXulqD9IlD9hS/ExIkyaNUgdGu1Ig3SZNQ96GuHk7fc=; b=wdfqgX0kklgsBU+JD4oyGSvPFd
	1MvP1AbMRcELb3H1WjKJ4qDPa39ACBZWhm9t5J7VaqAc8SLvdxZYTHaaUXZd5VFMp8LWEDjJ+ZoDK
	5DiaDUOQvbOMzc1RIxO2IZxaFkRs/okfOrYYG4FzS3egza7k0cAxXp8ef9oiuzxQ89AbveHE41B1N
	I32JcUfkdQYqbI48nwXJ6T5yYFTnZ2ViLOxTQm/psjKzjlDSYYN6pPftFAzM/2rXWlJt58qPWyBTH
	xeuVrVKLgog9rmR2HGQXinrekuH7+E2nuyB3Vm0f9dwIh/uu/45IwHWjby6fw5Ub1gexMXQc1eZ+K
	+uyARgiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHqz-00000004ZX9-3Sii;
	Thu, 02 Jul 2026 13:53:21 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHqx-00000004ZVM-0hdc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 13:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=tXulqD9IlD9hS/ExIkyaNUgdGu1Ig3SZNQ96GuHk7fc=; t=1783000399; x=1784209999; 
	b=ssfH73i4V7538KickVLojRYlj9VlsaKoTMQxGFBvOphd1wqu982b4YeC83WlFB+/azC72G8USVF
	yrMdcAcF26/01o3V7nNFCbETButU18Yt+/2l44CoIsNGXL5MrncmzrbgsYCSq4dtKylBgkv8O++Fr
	ZlEa8/Mb0T6rTqTJW+dDezYKdvvhyZn6B3umnlFWIiQZQ+qQOBi+Hjj204FFGPi+GdxZ352O+U35i
	722q/pjl1IhLvJr177mG2ss8iPag3Vw3jBr+4FcpvrFlD3ug+q7TZ1tEQxNPUn5bQ/QrV+x/0owLw
	vnoKq7DGxY/JavdjkiUZAulXFNTHTKvIAFpQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Thu, 02 Jul 2026 15:52:44 +0200
Subject: [PATCH 2/2] arm: omap2plus_defconfig: Enable multi-LED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-b200multiled-v1-2-c1799ad45c96@kemnade.info>
References: <20260702-b200multiled-v1-0-c1799ad45c96@kemnade.info>
In-Reply-To: <20260702-b200multiled-v1-0-c1799ad45c96@kemnade.info>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=tqYyW/PX6hR7Wv5PgP4YYislXUMPcANlAU7/rHlopZQ=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDFluubYzuw099S6vM9cW2mHZnqab+ixH0ezaQ64dHwKku
 Ddy5EzuKGVhEONikBVTZPllreD2SeVZbvDUCHuYOaxMIEMYuDgFYCIW3xkZnrsV7/gtIl72dv0f
 vyea7l6rI5UOL52w639V72u2JV+9jjMytBVmnXzTxSJh/YnnX8Wk2t0XfDnu/r10kduiQ7GLs2M
 iFwA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_065319_211246_34A56466 
X-CRM114-Status: UNSURE (   7.35  )
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

Enable drivers needed to use RGB LEDs composed of multiple monochromatic
LEDs.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/configs/omap2plus_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index ad5ae1636dee..3a4fb59d3fad 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -602,6 +602,7 @@ CONFIG_MMC_OMAP_HS=y
 CONFIG_MMC_SDHCI_OMAP=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=m
+CONFIG_LEDS_CLASS_MULTICOLOR=m
 CONFIG_LEDS_CPCAP=m
 CONFIG_LEDS_LM3532=m
 CONFIG_LEDS_GPIO=m
@@ -611,6 +612,7 @@ CONFIG_LEDS_PCA963X=m
 CONFIG_LEDS_PWM=m
 CONFIG_LEDS_BD2606MVV=m
 CONFIG_LEDS_TCA6507=m
+CONFIG_LEDS_GROUP_MULTICOLOR=m
 CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=m
 CONFIG_LEDS_TRIGGER_ONESHOT=m

-- 
2.47.3


