Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1EAF43683
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBCBSGp4i+XIDVgXI0jzzBucDSDF7aACMdvtN1KthDk=; b=4hI66xFetzyBGiYe/IXELA0m10
	BmklqJFHlpV3EE1RQtoxLjShvju74jRp6Vqub025bYiZaByMaH58lY6AJh9lLpHDOduAavRHpt6Cy
	rd9oCcMM3gSLOvKki/N43GjQqzw+GOijbbIw9b9CQdewbnnYkP8V7x/zIXMDclXM6zKhuWsvJ9kIl
	D52Zc1+eTMN8snX8AaYpQuliUNbhK8qsUl8GclxWChEmmAwBWTmLAwGV6sIyK44hSpBdFKkUyNNYF
	wylAs1YTm6bvKcJTovPLtRlNJKh/aDSWv1n2cJMrwX1mdxWHhwWJbmwJHIi0EasFBbf5tO/WgoJ5l
	rvJNgEnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfUN-00000003niQ-1Oc8;
	Fri, 17 Apr 2026 09:27:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfSI-00000003l9Y-1MXz;
	Fri, 17 Apr 2026 09:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dBCBSGp4i+XIDVgXI0jzzBucDSDF7aACMdvtN1KthDk=; b=bEGK2R/skheKl3DakKnTOqldle
	KLWmmuKrnPR7OTdf7TyS/V9fwZgYgm0aNSf0xEGLfVZIdXy1QX9w5GNrr5Gf2UHhZHbJAxShuFbUG
	2oLJpzI2YiPNqZshjVBpScHNBI6MidYiCFwes9IvJWiHxeYfC960pGqTeQX6Rerv0lVPsPNDC8BPx
	T8XkuZL+Ch1Fkq9+CSenaf3XJfY9wPVMPJw1v7zA5YM9llnfmYQzC6EtPOkWRc4DAVp0HKj5EHP1t
	T0zKS4DvhLcFCcLmtrOJu1izt+RlP+AtRTBAlYPeb9se164aoN/Z1waB8qPkhwRs/4aGGU7NWrb0E
	DmHctAMg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfSE-000000054RI-3wc5;
	Fri, 17 Apr 2026 09:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417937;
	bh=P0yVaUEKh9DIeSDxsfwe+30iXPlavSU+50fdjCGXCHc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hdijkpvom5pEjNwd5ivfrXSj37autCQM47tUNNPQ3ssA6QbJuJAkPfwUbnWZpmS+6
	 +nKyS711j5gcrtX1p5UguUqoqASRzsrwr+LWhGrpEMPuzpgGw2vsGms46Ch2nsBvyt
	 lNvWyxHAOVQ65l2wvnmip1qbqQuE+GB/A3sJHUCxdiiSERX3xVaRcgycjSGZpWvHI6
	 UxlD4IW9c5oVLEt8jtegrBKDGZ2pRxSXvCWSfvIUdW9ShZhjeaPr40SV2ascuvSh7p
	 qZSYCiyJk9/8Joq8drJnyQ8LiEaNCHv8DruGyjhzfk2Duh2nqbD09whOHDffUNzSr7
	 ILn5h5xIGYN7A==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 51EC517E127F;
	Fri, 17 Apr 2026 11:25:37 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:10 +0300
Subject: [PATCH 36/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-orangepi-cm5-base
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-36-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_102539_196140_1904F20D 
X-CRM114-Status: GOOD (  10.30  )
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

The board exposes the GPIO4_B5 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts
index 06120b2db690..a7b47670195c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts
@@ -147,6 +147,7 @@ &hdmi0 {
 	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
 		     &hdmim0_tx0_scl &hdmim0_tx0_sda
 		     &hdmi_frl_pin>;
+	frl-enable-gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -246,7 +247,7 @@ key1_pin: key1-pin {
 
 	hdmi {
 		hdmi_frl_pin: hdmi-frl-pin {
-			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 

-- 
2.53.0


