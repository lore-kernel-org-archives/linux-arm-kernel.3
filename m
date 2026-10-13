Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9E5CC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 06:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWGxRSF6TsGu8YkPR66UCDbiThQFkRdGV1nPrINMwrA=; b=yda/oGEknDmmp/sAsHlcSuqXIF
	UXe6SR0wS27L9uyZHaH6hK0GaZi1gk0ui9wJnkgqyvhyfUCbG767qFy6i+adQAC/Mt1emw7hLoQs+
	QtwZYfxgUdZo2OGn/Q/l45C9YiQqS9KCXDsHpHa+rqObQJH7O+Z8tf7k6XwdT/7BEQOJ8lQ1oQbIr
	Q4EGCmevnRycRu30OAXvY5WiAS2kQQkXP41HB0CYTT85Qc4ccgFKXkv1bOtT2gpexfCx5dw93pc5P
	t6jEKaka/DDD2awN0ZFMxfwoE4LNhjN/BgJDY7vwfl3TyE2lR3xVBQOBJoUbokExxfp8z9AkNiczr
	CaUMe7gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVeb-0000000C5Pt-3ZpQ;
	Tue, 13 Oct 2026 06:06:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVeH-0000000C5Fc-1W3s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:06:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4F2343DEF;
	Tue, 13 Oct 2026 06:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DC8BC2BD00;
	Tue, 13 Oct 2026 06:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791871564;
	bh=ncEev3AGZKvWWkasRL1X0+uWOAP6NQ4Xwr+gcNBRlgg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WCHAsdOQkZ39XAcNUrYZxcUHfjuubCHFNMymR2FNNbQJ2kL6M+e2A6UVbQeSRlo1b
	 6DlidYyuZfwFV4MWxm39bwBVDlXkXex4uYSjo2Btmots8uT5le3VZj2f6tQhmDR8Fo
	 GgtnQHXuZHwSdequX5nao32nJULHxn7X2vuhXj3NRbc07N4/a/XAtvHjQ3UC995Y5d
	 NvJ7pQ9obs6r/tsdqhEen2yfsHbUz5wdjGpBQUGNMn9iGPapr5RAsUnJoRNo7E8/HZ
	 lyfX8zhS22b9fvvBl7ud4zEY+g2zu2R3m/B/apfNuTwFoor8DY5HE2wbYXw+MSHMtJ
	 d16I+Y2cekltw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBF9CC6B09;
	Tue, 13 Oct 2026 06:06:04 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 13 Oct 2026 09:06:10 +0300
Subject: [PATCH v6 09/10] ARM: multi_v7_defconfig: Enable Cortina Systems
 CS75xx support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-b4-cs75xx-v6-9-37e8f3969b7c@gmail.com>
References: <20261013-b4-cs75xx-v6-0-37e8f3969b7c@gmail.com>
In-Reply-To: <20261013-b4-cs75xx-v6-0-37e8f3969b7c@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 Jason Li <jason.li@cortina-access.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791871561; l=1073;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=6lUn6eCTFyPOKvxFHES2Y+JrDHysCcc0CgLi4Om4C1M=;
 b=kVxdDf62zda7RwL6bbCoV3ymK7Q2Nfnk6YLNCTNAWhecwHYrxOt7vUErNLbo4b3znWGGoVxe6
 jMgUwDhdf72CFoixOuU2n1d5pyFRc69dpGfzdbhbaPgbf6yteugkdx/
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Fil Dunsky <filipp.dunsky@gmail.com>

Enable the Cortina Systems CS75xx platform and its UART driver with
console support, as used on the Securifi Almond+ router.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 069d5a49f..23f144359 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -45,6 +45,7 @@ CONFIG_MACH_BERLIN_BG2CD=y
 CONFIG_MACH_BERLIN_BG2Q=y
 CONFIG_ARCH_DIGICOLOR=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_CORTINA_ACCESS=y
 CONFIG_ARCH_HIGHBANK=y
 CONFIG_ARCH_HISI=y
 CONFIG_ARCH_HI3xxx=y
@@ -396,6 +397,8 @@ CONFIG_SERIAL_FSL_LPUART=y
 CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
 CONFIG_SERIAL_CONEXANT_DIGICOLOR=y
 CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE=y
+CONFIG_SERIAL_CORTINA=y
+CONFIG_SERIAL_CORTINA_CONSOLE=y
 CONFIG_SERIAL_ST_ASC=y
 CONFIG_SERIAL_ST_ASC_CONSOLE=y
 CONFIG_SERIAL_STM32=y

-- 
2.53.0



