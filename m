Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7157CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 03:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POkVfR/b/1RzCnGqW0t5gkMNapGqIQN4P0nRMmAK4No=; b=HvQy+CKr4kCoQB7eb72e0OoNpq
	dLGzI4jLUFi63zatmy6te2oRaqV2+pTyaGsxKyxAA5cK2vHgjMFJYhqhly3O/vDOQcBvsvycg2LWn
	JjHA1QDfq4XGFhtGBsMGlNG2FwEP9ftnl5s/OD1OXKxAkhWtw9NM5FvQ7fEqTpcqddP24+FJpCO+Z
	ubrZmqA6IbERj0qgJrCTSRa2QU8p5IMoG9a39gcs2qe3/JHkhrdZAWkxpPRutSFp+9kdiKEjJD/KM
	SuqnEHaddJrtRCsL7+ONWwYLDFgcZAOPwgFihmKq8StK36+iIqeKVU/hf0ZxAjA3JdpjKDer9v0iP
	bf2M2KxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTTl-0000000Bukn-2LC1;
	Tue, 13 Oct 2026 03:47:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTTh-0000000Buem-3Spz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 03:47:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EC30447CD;
	Tue, 13 Oct 2026 03:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40CC5C2BD04;
	Tue, 13 Oct 2026 03:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791863221;
	bh=fH9Kfvz9BxN/X6lf8vavcMwm5AFooycimNuX17Ck7qg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WpWJ2k66HKa1NPrvoR0ddCRW7UHJzHQFIuEmYl0hf1/tLaaVmiofYT7323NkyKKhh
	 SLWrWljKSPi/g3Eiv1NmqzebWise7uCVP8uGyph+3lAXWWU370Fkf0J09zcTvfliot
	 xu33bwUehdozUi2nc8Aj9a99CCnt1zsWxmqTRQHvV0KY/tbEbUTFQoo4Ifp57r5e44
	 C0XzSzFuCE2qfzbODbWvdT0sGszI10jUSjelkfPiIoZKmwFAi+rlQmwEyk//jCdCFB
	 oa6rKRvkv6FmSNlGTzTzxxB8TPeltZP2IYmB5EefS6kyLM0bBRYJOSHSVWCNxod8mB
	 mZeO18QHDzGTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6C7CC6B0A;
	Tue, 13 Oct 2026 03:47:01 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 13 Oct 2026 06:47:08 +0300
Subject: [PATCH v2 10/11] ARM: multi_v7_defconfig: Enable Cortina Systems
 CS75xx GPIO, I2C and TWD watchdog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-b4-cs75xx-s2-v2-10-94f8c0a90cda@gmail.com>
References: <20261013-b4-cs75xx-s2-v2-0-94f8c0a90cda@gmail.com>
In-Reply-To: <20261013-b4-cs75xx-s2-v2-0-94f8c0a90cda@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>, 
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791863218; l=1224;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=MUeH/IRw5kyuG0JD1ac38OtCmIzMZqOUsJQbjBgyrHs=;
 b=hzhdz9MnRJ7JJp0HaE5KAzO7vNQz+7RUh8c224Bc8guy2XssyleWF4dUfffCXu+cS/d85uXBA
 fc75l3wWCYcAeG+EpSXNpXeBbmEfwGgG3ApeklKtD13rCtuAelomWdF
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

Enable the GPIO and I2C drivers of the Cortina Systems CS75xx SoCs and
the ARM TWD watchdog driver, which is needed on the Securifi Almond+
because its bootloader starts the watchdog.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 23f144359..9a161f8bd 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -423,6 +423,7 @@ CONFIG_I2C_ASPEED=m
 CONFIG_I2C_AT91=m
 CONFIG_I2C_BCM2835=y
 CONFIG_I2C_CADENCE=y
+CONFIG_I2C_CS75XX=y
 CONFIG_I2C_DAVINCI=y
 CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DIGICOLOR=m
@@ -492,6 +493,7 @@ CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
 CONFIG_PINCTRL_RZA2=y
 CONFIG_PINCTRL_RZN1=y
 CONFIG_GPIO_ASPEED_SGPIO=y
+CONFIG_GPIO_CS75XX=y
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_EM=y
@@ -568,6 +570,7 @@ CONFIG_UNIPHIER_THERMAL=y
 CONFIG_DA9063_WATCHDOG=m
 CONFIG_XILINX_WATCHDOG=y
 CONFIG_ARM_SP805_WATCHDOG=y
+CONFIG_ARM_TWD_WATCHDOG=y
 CONFIG_AT91SAM9X_WATCHDOG=y
 CONFIG_SAMA5D4_WATCHDOG=y
 CONFIG_S3C2410_WATCHDOG=m

-- 
2.53.0



