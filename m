Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1B4C79F85
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 13:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrCyWFmiYwRymAsuCmpUC9Btpx9MQaPyy/sjU5qUj3o=; b=Ud2Rc5YO7SSc9IPuct/jaefuaa
	0wrk32ToAj5ZH7RJDbOC7lgymje9s210tn3F/qMZPbQ+qgEE76fXDc0MuXFeQZr4x53XsxSBNPwO4
	sCpOUbfLTR9mew7t08lMQzzR8gu9T/2aTUjqM2hfSwfFOgbQiJVnyP7QhCemxzlF3O+cqb9GZK2sL
	4ZS/g2Bg+vNMmUNawCWNUNGtrsdfnru+01dL2YVaXixeBP4p3me+uPMlQFHZ7IpWLEiWNv6Cyp2Pi
	J/o3rUh1tI8jd/ZolVMmTvYXXKyR2OspdupQfK6WtWYXH66mnaX1uZlMiOvU9IgFSMDfLd5K0yDva
	Uo06BArQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3DO9-0000000543t-0DIv;
	Sun, 06 Sep 2026 13:58:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3DO7-0000000543Z-0Sfp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 13:58:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3973A43F4D;
	Sun,  6 Sep 2026 13:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E8A5C2BCFB;
	Sun,  6 Sep 2026 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788703106;
	bh=GOM8XxqDFjkbB6g2HVCxclX8MgAzz1Zjvu6y5y4pW6E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ad5vPUdlfpJOw/ZZ0rDesF0YXD4LXxGvkTvdC7bGIkmW/hvfcZTyRK3f0euk8K7zM
	 hy9gyZeUCK3Qcic4dZxhKB4CxAlYQKHE5RkdQYjib/dhL2BYdAJ7T0PVLjT02pg8l8
	 gTfCxMs0NOOc5t9uBak+hsmvKSXXCEYWmdH3sAyst0Cf2SXABMJW7juBt5SudlbYxv
	 3v1u60REwYzi4nITapGrn3TVEPTrYJHUzcr5UtW0VXH5vR4UZKLzMYkd+bG7tn0ZUC
	 SZhPDmd2FyoPiJr6mQaxQoefsDxnW0CZwpkicA5DMltOqH0yHKzKStVfDZ4+i2A7d+
	 9vfo9ZA3+KVsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E387CC79F85;
	Sun,  6 Sep 2026 13:58:25 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 06 Sep 2026 15:58:21 +0200
Subject: [PATCH 1/2] arm64: dts: imx93-11x11-frdm-common: fix the rtc
 aliases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-imx93_frdm_rtc-v1-1-3fadbda0bea1@hotmail.com>
References: <20260906-imx93_frdm_rtc-v1-0-3fadbda0bea1@hotmail.com>
In-Reply-To: <20260906-imx93_frdm_rtc-v1-0-3fadbda0bea1@hotmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788703104; l=851;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=BMNbgRGZryoXpTYGm7+rXC+ZV8ZnELNCq8RAs2p09Cg=;
 b=VDqYxWi6vFmns83ATAsUrFlV2oA/mNC2qqZiAY1xgxkD3YU6fdva837VwqbhXk4jFb8f1SOC7
 SZzhYQOxrILDrnIY/X70ZtBMVaHQP4SUd0GSZ3fwMlb8W+6M8L35ERu
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
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
Reply-To: maud_spierings@hotmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maud_spierings@hotmail.com>

pcf2131 has been assigned the rtc0 alias, but if the bbnsm_rtc gets
probed first it will take this name.

Properly assign bbnsm_rtc to rtc1 so that this doesn't happen

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
index 5c8fdd77ec15..97d89288db3c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
@@ -13,6 +13,7 @@ aliases {
 		mmc0 = &usdhc1; /* EMMC */
 		mmc1 = &usdhc2; /* uSD */
 		rtc0 = &pcf2131;
+		rtc1 = &bbnsm_rtc;
 		serial0 = &lpuart1;
 		serial4 = &lpuart5;
 	};

-- 
2.55.0



