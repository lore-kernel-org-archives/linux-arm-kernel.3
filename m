Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA630CA9ECE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 06:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nYroxEDtZGcJ7gqqe/u2YBEyjHBSx2kx7H8An+Sw57I=; b=bMBdpuW/moxMDSv9viPnZvi27M
	ICFBdJghc6Db35uF5k7vU6nEsdZUp4ILsIH6VqErVgCVyIdpwx+/fxgn0u5pCY5UDO+4Rc3yDIfIT
	AowTavsS/OFCzVXjdJDBoBvQhff+sg+CQNFMfx3iSnKd5Rn/thjFdkQ4LvNIjY9iMoASNWSxTjG4Y
	rh9KwGHSlsc+Pgo/VVCI8qIMYn67v6mpI/KVZg3GZBF30wFWewkKdyXROFweCJcjAjPqDYtntep3Q
	f+8ln7SooDYUBJ9+rWeLtFrH2qBilLLQ6bUFi9kSfJwBYnmPhQ4vLlVpnxEz6AOJUlf8JkS2ADCa5
	JzVBH93g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFnSW-00000008mrZ-21Rx;
	Sun, 11 Oct 2026 06:55:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFnSV-00000008mrE-00Gf;
	Sun, 11 Oct 2026 06:54:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E2F53600AA;
	Sun, 11 Oct 2026 06:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94D7DC2BCF5;
	Sun, 11 Oct 2026 06:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791701697;
	bh=ed59V4ed1loSf7pax5eToe0yXAlEA0c7zZHE/k5bFn0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=AbzHUBbkidzRF7WdqXkgBqlw/CxRpGRAMpoR6O9Fp/v82PYnD2lewPpkMFaWhweKH
	 pHdqTgyiZsujUzJ2Zyd/S5RX65lG/+GERe8Ic/D97VDbbIZ6da6UT3i7QqmYARD/e0
	 yNuMLi03fcW7+eigjYV6WpZkh4iLQlUeWNryILVUYMosP7uF5ld63UHjwo2Kc0mcqc
	 tJk8lfEXIKhKgV5soVBqVe1qNnaFb7ilDCGcdQvYxJBliHDVvUhqqTrVG8TUYshMUU
	 FZ+6Jz5yCwrm04D6Q4fcHVEDIRIj8beryaYgW/QtOZhkrXmWbqp/zCWtGRYopHhqPS
	 zYQCVMiuTe82g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DD9CA9EC9;
	Sun, 11 Oct 2026 06:54:57 +0000 (UTC)
From: Ryan Leung via B4 Relay <devnull+untilscour.protonmail.com@kernel.org>
Date: Sun, 11 Oct 2026 06:54:47 +0000
Subject: [PATCH] arm64: dts: rockchip: add maskrom ADC button to NanoPi
 R76S
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-nanopi-r76s-adc-v1-1-392993e7a36e@protonmail.com>
X-B4-Tracking: v=1; b=H4sIALYyy2oC/yXMQQqDMBBG4avIrB0wKU3Aq4iLGP+200WUjIog3
 r3RLr/FewcpskCprQ7K2ERlSgWmrih+QnqDZSwm21hnGmM4hTTNwtk75TBGRhi89e6BpwWVas5
 4yX4fu/5vXYcv4nJt6Dx/vbfNHnMAAAA=
X-Change-ID: 20261011-nanopi-r76s-adc-eab72763e52e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ryan Leung <untilscour@protonmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791701696; l=1321;
 i=untilscour@protonmail.com; s=20260906; h=from:subject:message-id;
 bh=rLOeuuXx3FAnjzW7dZAAyxmysgcJ5FIHHWY+mqfvl84=;
 b=gitg/aFgnqCVWwuKBdhmMpsgSdC+YGCRSlpBzKb7TFeWAKA1JnsUPsIPIUjb2O9MRE5w6P1hv
 l0s4qVfDJz/BPAjFHPn41r1vCbfMopbfC3b0lmN7mtPCUY+GmESiG/z
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

The FriendlyELEC Nanopi R76S has a MASKROM button connected via SARADC
(sheets 5, 19 of the schematic [1]). Add the button to the device tree.

[1]: https://wiki.friendlyelec.com/wiki/images/6/60/NanoPi_R76S_LP4X_2411_SCH.pdf

Signed-off-by: Ryan Leung <untilscour@protonmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
index 7f356fd41574..b6afeb4163d1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
@@ -29,6 +29,20 @@ chosen {
 		stdout-path = "serial0:1500000n8";
 	};
 
+	adc-keys {
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
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";

---
base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
change-id: 20261011-nanopi-r76s-adc-eab72763e52e

Best regards,
--  
Ryan Leung <untilscour@protonmail.com>



