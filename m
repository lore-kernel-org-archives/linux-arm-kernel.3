Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0F2CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWGxRSF6TsGu8YkPR66UCDbiThQFkRdGV1nPrINMwrA=; b=sxeu0LOccX0fjw7nMldpWLnO6q
	u1LA2HLXx7MUK7Xirjwya7Oj5ndEqZkNq8leL5YCalWgT9Gzkc+vmtbMwZ0oFsyI4NNn1Fq/ITW1K
	9wOfc9MWoIvaDvfD+DYbYhYFn8YUI6dUEdvxVeSykwswG6Q/bWiUN96MLhMzO1QxRBGO/ceG+8Joa
	3cP42zDqY2qSC7k4Aw3NvZzypOQsdLjBWGvBZGXmezNvwR9z0XSw4Q+gUjyezDNd3HcJA5CCgB2KD
	CWbEYkxKQJajEfEB96/29/B9cvw6CoG/UWm16CmMiqT7gTNtvkr+aBuDQmlA1uN6Exx5uMX2oug4F
	CojOz0TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9zY-00000009mbV-0emh;
	Mon, 12 Oct 2026 06:58:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9zW-00000009mXN-0ys0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 06:58:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA2A243B98;
	Mon, 12 Oct 2026 06:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A792C2BCF4;
	Mon, 12 Oct 2026 06:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791788313;
	bh=ncEev3AGZKvWWkasRL1X0+uWOAP6NQ4Xwr+gcNBRlgg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DJpO0FmJAr2d/oJ4lCIGayR4cgIcBe/PKmsykqkhnUU+iTp2XcPNUaEZo29t53TL6
	 ORrgwGGJeDC6zwMxlAQXildV89Td0xg52M2augjubtHp+cjE7yWi5orPYq6tzdLslu
	 66VZ28EymBNS8dWtX8eFnhWWXaeJ2gV1aDeqvPHlZcaj7tKKVbG88QkmC11AZImPXS
	 RhnafjtTw80IjL2u8XULQ2F8QVkMN2a4JLuseP9l9parXuSEmdPF1NEKNXbiKQQCrs
	 eODrxQZh2dTrTbNaNtOt9c2y+y/8rV9jGNP6ELb3s02O3kgJVkMQ540dTR95qNXMco
	 meJjARh5hInBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713F8CA9EC5;
	Mon, 12 Oct 2026 06:58:33 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 12 Oct 2026 09:58:39 +0300
Subject: [PATCH RFC v3 09/10] ARM: multi_v7_defconfig: Enable Cortina
 Systems CS75xx support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-b4-cs75xx-v3-9-0e0d17a098cf@gmail.com>
References: <20261012-b4-cs75xx-v3-0-0e0d17a098cf@gmail.com>
In-Reply-To: <20261012-b4-cs75xx-v3-0-0e0d17a098cf@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791788310; l=1073;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=6lUn6eCTFyPOKvxFHES2Y+JrDHysCcc0CgLi4Om4C1M=;
 b=MEoCJUqqWCOTCxisQGAPlTzhZCJ0VJgaqYTfcSYT3dKAmHZ4sM0xt5Vzgz+mSzVqgNf9xl075
 yTsmuiZBLc+BK4wSIJFht2QeEf5xX0GfpHWIw4/8XhU5JnKOUI7PeOA
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



