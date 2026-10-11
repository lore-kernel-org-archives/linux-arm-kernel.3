Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80381CA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 06:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kpWFVuY5XtJbp+uc3V3vTe+YgGQCO4l5hutHrkbQsg4=; b=ix2BxEX4reppD+qxY1LKMdfzVm
	+QfrQme7LM6H2SbM/NcXSTp7jkZ3ArOatYwW93NwRd3IqcsYzSYPLTDX1UEkJ/XaUiexLPiF59b/Z
	gkwwwHXUmMCw7SbOW70lH19PcAEV+/1a8apjNysZLaUsiS2AXBPswTamuOwVe2AIqrgvFFjxBCTeT
	mzsy+Kglm8ZfLTktqLTq70TVuWTl9w7CUnnuy2bUmoPtOL3fklD2+H2I5yNErFaFjr1ft1PE+cjGW
	RhtvUJ20iQbW+1Gfw7l31aLUJaOuIT5NOatUDb0I1dSyMj6wzNLAFFg8ngg6nIjuz1htdcM6jlA9E
	E4GuEc8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFn2K-00000008lGQ-1UZT;
	Sun, 11 Oct 2026 06:27:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFn2I-00000008lGG-1evI;
	Sun, 11 Oct 2026 06:27:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A484600AA;
	Sun, 11 Oct 2026 06:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29B42C2BCF5;
	Sun, 11 Oct 2026 06:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791700073;
	bh=+fkuQeaiBzgWlitXbBzzW9cMa5R1QZo/J9S1LpNBoBo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ARsyvieVBL8BG3I4NF1hKrKuNi/8K2gHvGaW9PpSQr+tPZ8xGO4cjzqP7SYCxN/Kl
	 BW2E1H5k3OWNrKtILLQgPiUmGLetdoI8uDnC8Ukk6/xF7BNfvzfMfvDh1thPrK2JGL
	 yhLLAk5UPznmosS77mo0+VopaaFQlZWNPnXDslClf7FFxVyQztaIIxN8CNQ7aQTl1M
	 mAjrnxWhss3wBGnyHPjLBDkRDWJbcNl0DNL1tIK/GbyVxwHWpNHh+0287zb0EmME0x
	 0J+raWsrPSz2QTk9abWNSTP3Y8KlCNAkS9kjYmglI5kYrA1UGF1NG9+M2bFjac8iWj
	 2h1k89joxbSNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03168CA9EC7;
	Sun, 11 Oct 2026 06:27:52 +0000 (UTC)
From: Ryan Leung via B4 Relay <devnull+untilscour.protonmail.com@kernel.org>
Date: Sun, 11 Oct 2026 06:27:42 +0000
Subject: [PATCH] arm64: dts: rockchip: add maskrom and recovery ADC buttons
 to NanoPi M5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-nanopi-m5-adc-v1-1-822edeb1acf4@protonmail.com>
X-B4-Tracking: v=1; b=H4sIAF0sy2oC/yXMTQ5AMBBA4avIrE3S+g1XEYtqByNR0iIScXfF8
 lu8d4Enx+Shji5wdLDnxQbIOAI9KjsQsgmGRCSFFFKiVXZZGeccldFYkEhN1qVVXpYQmtVRz+f
 3a9rffu8m0ts7gft+ABA07nZxAAAA
X-Change-ID: 20261011-nanopi-m5-adc-6e03d4b39577
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ryan Leung <untilscour@protonmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791700071; l=1728;
 i=untilscour@protonmail.com; s=20260906; h=from:subject:message-id;
 bh=kg6KVsnzM/S6c7CrUcQL5EMoEDLITm6RqDphdFMeMKY=;
 b=dV8N2jv8eLKcK6TyO8zkxuVRUG+UslFvJPAxdBtKgxpIlzoMOG0owvnjync47Ne68aflqv4d+
 6Ya5ousvZTsB+1Kv3OOTGPcqR7+KmFswpgy9P3VtuqMtIuZfjsX4/lB
X-Developer-Key: i=untilscour@protonmail.com; a=ed25519;
 pk=eCaNcoQNRWYKZ9D7KbOGKvQVK2YFguJXZxglTtAR7Xk=
X-Endpoint-Received: by B4 Relay for untilscour@protonmail.com/20260906
 with auth_id=1011
X-Original-From: Ryan Leung <untilscour@protonmail.com>
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
Reply-To: untilscour@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ryan Leung <untilscour@protonmail.com>

The FriendlyELEC Nanopi M5 has MASKROM and RECOVERY buttons connected
via SARADC (sheets 6 and 19 of the schematic for both the LPDDR4X [1]
and LPDDR5 [2] versions). Add the two buttons to the device tree.

[1]: https://wiki.friendlyelec.com/wiki/images/1/10/NanoPi_M5_LP4X_2411_SCH.PDF
[2]: https://wiki.friendlyelec.com/wiki/images/9/97/NanoPi_M5_LP5_2411_SCH.pdf

Signed-off-by: Ryan Leung <untilscour@protonmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
index 3a305408fa16..46c88b1ccde7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
@@ -41,6 +41,34 @@ hdmi_con_in: endpoint {
 		};
 	};
 
+	adc-keys-0 {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-maskrom {
+			label = "maskrom";
+			linux,code = <KEY_SETUP>;
+			press-threshold-microvolt = <0>;
+		};
+	};
+
+	adc-keys-1 {
+		compatible = "adc-keys";
+		io-channels = <&saradc 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-recovery {
+			label = "recovery";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <0>;
+		};
+	};
+
 	keys {
 		compatible = "gpio-keys";
 

---
base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
change-id: 20261011-nanopi-m5-adc-6e03d4b39577

Best regards,
--  
Ryan Leung <untilscour@protonmail.com>



