Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F04A606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 21:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WhrWGcMB;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y0iaEfEP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=klsjSa3hT6s1eeHLn0xI4cZIJw2AGOWBnz+Rddcs6eo=; b=WhrWGcMB0+c0SbBGMEcx3NfFwx
	WO3avZZmlzVoWDjH2TjmwTEKL8cUu3XJ0Fr+4Iu3FY4mEn89rfcFqInYx5TX48mHaETDrwPsiYPNa
	u56wle3/TzkfH39L6xgYjl7P+Ik8A1H5I40eviFOnGRGmlx0feuhrbUF+tp2qKGlKoHgy+TKmh8XM
	vtmGq1MtuLHPu8UdfFCN7u8bSMKHBrmh9zusJfSCURselCKmCqIF7bOaGMo+TEjrRS67QbJ8R0aeT
	BoWnyPmDxckubf2pUBwQpBdzULdbCX87Gabl5Tq/XXt29mnUeqH1MqUo6VNUeQthTku3AXUyhtNXT
	X9nnRrog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdWj-0000000Ew4V-2Mh5;
	Sun, 01 Nov 2026 21:55:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdWg-0000000Evxl-2xZf;
	Sun, 01 Nov 2026 21:55:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AC6A443EA5;
	Sun,  1 Nov 2026 21:55:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570140;
	b=dkgpCnTNyYuExxSxRQoO/iCOhRplMg46HvHUAqcpy1ueOuL94tVzeHFs2zXzCCG7Jsdh
	 nHtTXEOuZbx13J2WaIzR4tjQMPIxZDnRhkScZy7ty8Lj0jQCg8QY74QPzR4ptLwJhSEBT
	 99jJmOhQtiFgOjmVcVYdPnDm3xVRaSD+uFgkW3q6ezHx1iw0ppusVpSwHOpCQTTXLEcxI
	 9UhGQo9COUek0J6YITq32kbSk5aGvNciOhKXhMn73IMjREvrF02EzMQpRYjAlCZ+6EoCI
	 0iHMPYMDkdCU3rXyN0MUO9cIsi6XvYI/BP/hXoZ43ZMOwCCqq4yioEPfqQdOD9I23Jg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570140;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=klsjSa3hT6s1eeHLn0xI4cZIJw2AGOWBnz+Rddcs6eo=;
	b=ZYQcfKM4bMq1fYxBNrqLZT/p6C/Eeo3zwpxb/Uv6G4E/5zoR/BFNlFhu3kpD1GtbWtLd
	 Q/RY4PmLjCpWq1f4VOe3zp79tIMwjZtj+xBVwk6Qgekejl6xl81GNtoXxvCthNCL5Lyc/
	 R43cRnTvdb/yv91MBwmMR3W/ydMA9IslPyBriNNJxXeEqNB0K0SSMP8YhOD7GQiYAe37m
	 34Oc7F51siZ7iws53ew+0kdzcoh2JyLVTNc8xZM02KdyoNqUxFXU5Iab9s/I2WZ2YlxHF
	 ZuuDpoyfqiVCYkpNEIsKUTSGUP8raY6zIFRLbylJNqbGytstL5LizP1m2YfsIsef9DQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 418071F00A20;
	Sun,  1 Nov 2026 21:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570140;
	bh=klsjSa3hT6s1eeHLn0xI4cZIJw2AGOWBnz+Rddcs6eo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Y0iaEfEP/uNseSmQxjpGWekAdqg5TWBXdJre0InJLWilkadHerlhJtlKt0AJ8q8+M
	 i+vkwLoy9N3QiaTzgv6tBq8XzOpAtLnME5+09d48ZhTbBMkKb74kv/7oMPUPbS7075
	 FoAReozy/DY0pYRdmTlFX2CR8+B0ImAlK7K8YqLlpcwuSPJy8FcR8t5dFCMWyiwSlf
	 aJgD8/i+qNj4jBTzo68jgOTjqDOJ9i+SZRXZem4VkCni7lv9vl7cdbDeeBw/z5vSqU
	 wclkgYXF2TUZUsAtDz9/NCSv7Q7+saubYNdOOygFfrpTNx2BdBHK0ySk3JxjkLPBvo
	 NQW1FCZrTtuSQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4A28E462AC;
	Sun,  1 Nov 2026 21:55:37 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 22:55:26 +0100
Subject: [PATCH v2 8/9] arm64: dts: rockchip: rk3588s-nanopi-m6: rename
 pcie2 power pin
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-nanopi-m6-improvements-v2-8-a24769efda23@gmail.com>
References: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
In-Reply-To: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570136; l=1202;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=dFYNtM0NWa3tMPUuffDQ8B0o2G7+xC1fDr3vwPQxapw=;
 b=E25IOOPAfliZNBP+twp79Omgb8O1zXtjfZY/f7bFxC0j2cnfE45XS6q06E+lCpeRLAxe7sR0/
 54vvDf21ldLDid/tjmcxF4yeXkhoirF84gm8zgutqdgbiRtvFMkVgvU
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

pcie20x1_2_con_pwren matches the signal name in the schematics, which
simplifies cross-referencing.

Reviewed-by: Shawn Lin <Shawn.lin@rock-chips.com>
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
index 6205a542cd1ab..ca115d8e108a7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
@@ -41,7 +41,7 @@ vcc_3v3_pcie: regulator-vcc-3v3-pcie {
 		enable-active-high;
 		gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pcie2_2_pwren>;
+		pinctrl-0 = <&pcie20x1_2_con_pwren>;
 		regulator-name = "vcc_3v3_pcie";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
@@ -116,7 +116,7 @@ hp_det: hp-det {
 	};
 
 	pcie {
-		pcie2_2_pwren: pcie2-2-pwren {
+		pcie20x1_2_con_pwren: pcie20x1-2-con-pwren {
 			rockchip,pins = <3 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};

-- 
2.56.0



