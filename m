Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41946D64093
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 21:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DeFUcEytQQ4c8LV8ie2qO31/IIGnq6fqvZcDSyWUxac=; b=g+7Dj35nb9G49JaK8bbNEt2Rpy
	o5EPw9d1rGI/peh6YFgO45zXaRepeEgLH0Az5c7RiswYLIfLh6Ka/W+q9xSUs+rahLQsu7An2fp4d
	nea1T+PJTvHzQqBtskWQM+fxPlYmA0xRp83ug+kqYmHBnyAlX/Fr7Ym5U5KooJFQJAuH+koh+YsRg
	39ahU7I7Po9cMs1tJ6KzLDKHTM/abhzc16oito+ypIDz3PzYFTZ3i4UwkRZPSgW4jva1AE3DOoFtV
	g+c2z2h2ft0oBbnJ4trornIPbPHyOEjLueRCUzLt9FJXp28PLQHeoyCuHh9B/dEZwzgAyIgYb2G3v
	4vls4v2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Wet-0000000C2c3-1IcN;
	Fri, 08 Nov 2024 21:36:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Wd7-0000000C2Rm-0UcP;
	Fri, 08 Nov 2024 21:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731101694;
	bh=CG5O0aBXAGi4FDAzWkIA2qBzxYUOk1Yt2uloAymezk4=;
	h=From:To:Cc:Subject:Date:From;
	b=B0TATyu93JB58fz0X5PBVvGj6TAz+RnFZXLYcJGrAZv3OmxCyTMlmTkFB0OgL4wd1
	 LtS0dpWK16E2zrANDjmgfSgGE6FL+uXGAF5BGP47PFwbI0A66kRAFzz9EWEVp90RjG
	 EEq5oMhrFQpAypIhDuslSOI5LmFelKhtyoNHmT58gFi48OM+gcf6UCpxS+6Rg3AeLq
	 OlNVSesqxy6JN+YXQPxl/34h2QeEn2cE+csbMqT75BI7suDyhPShMGlC3JcpJHqE83
	 ePIfm+1vdYG0jxhyWzqQmlN8ujpWV8e3y3lwMTTaHziVb6hx7n31z2uxj/JI1qbclr
	 4IQTqOoJ3WUDg==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B6A3717E37A4;
	Fri,  8 Nov 2024 22:34:52 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Andy Yan <andyshrk@163.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Weizhao Ouyang <weizhao.ouyang@arm.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] dts: arm64: rk3576-sige5: Remove non-removable flag from sdmmc
Date: Fri,  8 Nov 2024 16:33:57 -0500
Message-ID: <20241108213357.268002-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_133457_362653_57ACAB7F 
X-CRM114-Status: UNSURE (   8.52  )
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

The sdmmc node represents a removable SD card host. Make sure it is
considered removable so that SD cards are detected when inserted.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index a56109b4f071..7c7331936a7f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -646,7 +646,6 @@ &sdmmc {
 	max-frequency = <200000000>;
 	no-sdio;
 	no-mmc;
-	non-removable;
 	sd-uhs-sdr104;
 	vmmc-supply = <&vcc_3v3_s3>;
 	vqmmc-supply = <&vccio_sd_s0>;
-- 
2.47.0


