Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD62C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 10:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MCzguZ2VgyYgHmOIRQ6dYHRDQlMI99iWe+pm1t5HaZc=; b=wxumejgQK3LvsEUWCcMliACnvi
	NokEvAudhrBq5ZtdcNsrlePThlCFMKyv7avQJ6/17rRE3Blz9MUPlzWJfG3cYnnS0IZeOzFTA9H/p
	IlDYCOK2+6AwlBhRKzWzF6iOm2BwGtcQxpCvS1YuTIgQEaeqm1p8B6TKDy1yryMaqTPbNJT/qsVjs
	wfUXrIYto7vR6/zIYDCWFGJL+LQdy8BmIjM5gcyTbFfg1YMMMISLsyWzYj17nEgq9hD7FSWPEcvFq
	8EYlR1xZ9EnJCqTnx78rDd54xrSCZs4ufTI/c+BUOb4klfezAAno5Eyvoxft3SCe3xPKeQO3FjMvt
	kMY9+d0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgxi-0000000C35n-1V2S;
	Wed, 19 Feb 2025 10:05:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgSS-0000000BtWC-2EGx;
	Wed, 19 Feb 2025 09:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MCzguZ2VgyYgHmOIRQ6dYHRDQlMI99iWe+pm1t5HaZc=; b=ZMxTfHK3LL/374MHiPUzZPlx2F
	barGkQnwynwgyHGyPaj4UB5v+4Rl0RtTPzjh0uqUFZsfjlo9Pu6Ym3yQmKFyBQMmddcGRFnRAT9Vm
	145fXiC3iPRUsoDS2AN/6pgfpBO5WpdSRKhYXmtSjHmgVqnkAuU1v8D7hepw7pAfOoSRG1afZTIQA
	IaNdimQxhxP25KxKaEIUd0xTzj35xKKlPVN+0WdC+FfaEpExyr3zOy6CPcCuibnOO35Nue//zmLS6
	ZzD21JwJQuNm8TNgg2b1HGP+SX/Faf1/Y8XUEVOio63b8fwW4YgQL+cIQAhCwvGmINCsSDMScBnPq
	qgQr7Y7w==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tkgSQ-0007nl-Qz; Wed, 19 Feb 2025 10:33:30 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lukasz.czechowski@thaumatec.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 1/2] arm64: dts: rockchip: remove supports-cqe from rk3588 jaguar
Date: Wed, 19 Feb 2025 10:33:02 +0100
Message-ID: <20250219093303.2320517-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_013332_595321_41FBD845 
X-CRM114-Status: GOOD (  11.89  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The sdhci controller supports cqe it seems and necessary code also is in
place - in theory.

At this point Jaguar and Tiger are the only boards enabling cqe support
on the rk3588 and we are seeing reliability issues under load.

This can be caused by either a controller-, hw- or driver-issue and
definitly needs more investigation to work properly it seems.

So disable cqe support on Jaguar for now.

Fixes: d1b8b36a2cc5 ("arm64: dts: rockchip: add Theobroma Jaguar SBC")
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 7e8f0a452ca0..be5426b61cac 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -613,7 +613,6 @@ &sdhci {
 	non-removable;
 	pinctrl-names = "default";
 	pinctrl-0 = <&emmc_bus8 &emmc_cmd &emmc_clk &emmc_data_strobe>;
-	supports-cqe;
 	vmmc-supply = <&vcc_3v3_s3>;
 	vqmmc-supply = <&vcc_1v8_s3>;
 	status = "okay";
-- 
2.47.2


