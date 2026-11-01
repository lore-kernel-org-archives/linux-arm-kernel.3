Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A224606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 21:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rMy6EmSC;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A261psfU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FExjZH4MzZ0dT06qQAYbP4cG2o7lekDCchPx/UsfTjY=; b=rMy6EmSC4jR2GQzkYW9a+lpRYC
	HbFaEidPMlyZd48ygy+30X0OiYLM2p8qogYOywH9a9ktMGeEEj2tQKhFT32AnPcSlMQo4NriJ2rWK
	VdVnh5f3lyAS7rZfarqj/ex4n/BXWGDnBxv4T/viCkwR1xYXuBaBj1RMWnOCiEIDRtyxKtjmmCLli
	sAznyhnFvUUCzv6JgfVqcXH/qwv7ZKluT2tCosbJfrg91K24RW653mJrTIJ4IKTq0W3ukCgk8eqwu
	cNgz0YqtS6ZOYT18c2W+l+OJ13XiSTlwDwkOJSUTkgEBglvRU9kRsiF5rPrWaNc/7FyJ4hP3PutYe
	Dpu1QFNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdWi-0000000Ew1Y-0HpN;
	Sun, 01 Nov 2026 21:55:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdWf-0000000Evwv-2I6P;
	Sun, 01 Nov 2026 21:55:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CDF46060D;
	Sun,  1 Nov 2026 21:55:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570139;
	b=LTBFbou1i0lMjbnd0M15VCAILTBpvaI06sPJ4Vunj/LawVyUibTgXoovpId7IVWRnNfO
	 TpNlLhCGXE6WJqJZctjIunAxtt97MCyPInGLKmT7FRPG/Oo72x5Nv5oRpaFaUj5WOWMSC
	 vAVyS6EbRIGlJ4WKrFGb3ZyNNOzkJqBKRRIB1VNqhhkcyIgOuvHq2aqywNifzDgKZb4bt
	 yOseCNIPc4aJ4i90wD2w9rQYqVbN0cTzEhSrC+6QDtbVoQe4CMjDjQ6aQRygeHCOE2DbP
	 0GIL+wQW5kupn+wNAwjm9Z2z7EaRixjuq3zarXL+frH6OVlo6wJETU7W65gFJOhkx4A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570139;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FExjZH4MzZ0dT06qQAYbP4cG2o7lekDCchPx/UsfTjY=;
	b=V1TcrQAEAtup2SQwbIVTtBRaUr6QElHqMN8NivIqbTNNx4MgHop0Bzh+jZRYCW7Vjitz
	 r1OtxX9+RVytR/wLeiCYAIREd9//8umKxdS8TwsNUtxCEY8Wl2jkIGXpGNEm7PxpcF9kE
	 xWAIU7s8iFh/97xFA8RSjT/0RW31v7kfUDWHXTZgODDfs21gZuA8bk+7ERGrmNU/c0z7q
	 Uf2JTx5HMnjQ/Q4sEmMdl/Ug7jUxsv2ET5ke3tRFWMF6cSZy8Jkz8ZsMfHuu62VTAUO0R
	 6B+NlxN5R2IzyZM3YddywtEl3lmaz+49vZ6a5CY/xnZHF5UOIwSspD1DHGLr2Z4E+yw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D0D51F00A1E;
	Sun,  1 Nov 2026 21:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570139;
	bh=FExjZH4MzZ0dT06qQAYbP4cG2o7lekDCchPx/UsfTjY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=A261psfUTBmcpxCD3ILpZ0D7F0uj6r5l0nBqBnf82/ay3DyEhMIiFoB7+R202rtX3
	 IbWY7M9ZRfwJ2BMAQsaeLNBBsrUF+Q1RhJ23N9Y6T6Ql/w8s6zAavCMx1VXmBsp7G+
	 NznKiD1fdCGK/oagdZ9QQNMzLOwlILmm8ih8nUn7ZNVc3fkTClHxlajG0XWTuZTonm
	 MX6pqxubBsDVcPugKKgx7zFipeGBNQ/r8T7WMpiHExm0klbE8gy1HqvqCMZ8fxE0dP
	 HBPEtOiHLHYO6l7VmfYw3pvrMbzdvf4JiS7Ee2aHRUnuJuemq5sCAYRPvIpt08AXp7
	 LmBzzweqOrb8g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3D216462A8;
	Sun,  1 Nov 2026 21:55:37 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 22:55:25 +0100
Subject: [PATCH v2 7/9] arm64: dts: rockchip: rk3588s-nanopi: rename gmac1
 reset pin
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-nanopi-m6-improvements-v2-7-a24769efda23@gmail.com>
References: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
In-Reply-To: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570136; l=1477;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=XJH4M711Td8BhQhjF4m0D7hVTEwMJUSDdTRD8WtZ3+Y=;
 b=Sey30AQRYXFdFtXqImpdd5lHIRZ6w4SHLwd+kKzvWsE/wulTI2iWbIhBWP2/hxmmhsIdT23JL
 LvEGR41bTN2AhEh9ZXVLlyAPkg0fuhMgzLJgmoNehxO7n0TZA66m/rU
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Joachim Eastwood <joachim.eastwood@gmail.com>

gmac1_rstn matches the signal name in the schematics, which simplifies
cross-referencing.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 56264ff3b409d..4edf3728e8d17 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -274,7 +274,7 @@ rgmii_phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id001c.c916";
 		reg = <0x1>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&rtl8211f_rst>;
+		pinctrl-0 = <&gmac1_rstn>;
 		reset-assert-us = <20000>;
 		reset-deassert-us = <100000>;
 		reset-gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
@@ -307,6 +307,12 @@ &pd_npu {
 };
 
 &pinctrl {
+	gmac {
+		gmac1_rstn: gmac1-rstn {
+			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hdmi {
 		hdmi0_tx_on_h: hdmi0-tx-on-h {
 			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -344,12 +350,6 @@ usb_host_pwren: usb-host-pwren { /* usb20_host_pwren on M6 */
 			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
-
-	rtl8211f {
-		rtl8211f_rst: rtl8211f-rst {
-			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
 };
 
 &rknn_core_0 {

-- 
2.56.0



